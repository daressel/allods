#!/usr/bin/env node
// doc-parser.js — Parses Allods Online Lua API HTML docs into LuaLS @meta annotations
// No external dependencies. Uses node:fs, node:path only.

const fs = require("node:fs");
const path = require("node:path");

const DOCS_DIR = path.join(__dirname, "allods-docs", "Docs", "ModdingDocuments", "LuaApi");
const OUT_DIR = path.join(__dirname, "types");

// ─── HTML Utility Functions ───────────────────────────────────────────────────

function stripTags(html) {
  return html.replace(/<[^>]+>/g, "");
}

function decodeEntities(text) {
  return text
    .replace(/&lt;/g, "<")
    .replace(/&gt;/g, ">")
    .replace(/&amp;/g, "&")
    .replace(/&quot;/g, '"')
    .replace(/&#39;/g, "'")
    .replace(/&nbsp;/g, " ");
}

function extractH2(html) {
  const m = html.match(/<h2[^>]*>([\s\S]*?)<\/h2>/i);
  if (!m) return "";
  return decodeEntities(stripTags(m[1])).trim();
}

function extractAllH2(html) {
  const results = [];
  const re = /<h2[^>]*>([\s\S]*?)<\/h2>/gi;
  let m;
  while ((m = re.exec(html)) !== null) {
    results.push(decodeEntities(stripTags(m[1])).trim());
  }
  return results;
}

function extractPreBlock(html) {
  const m = html.match(/<pre[^>]*>([\s\S]*?)<\/pre>/i);
  if (!m) return null;
  return decodeEntities(stripTags(m[1])).replace(/\r\n/g, "\n").replace(/\r/g, "\n");
}

function extractDescription(html) {
  // Get text from <p> tags between first <h2> and first <pre> (or next <h2>/<h4>/<h3>/<ul>)
  const h2Match = html.match(/<h2[^>]*>[\s\S]*?<\/h2>/i);
  if (!h2Match) return "";
  const afterH2 = html.slice(h2Match.index + h2Match[0].length);

  // Find the end boundary: <pre>, next <h2>, <h4>, <h3>, or <ul>
  const endMatch = afterH2.match(/<(?:pre|h2|h4|h3|ul)[^>]*>/i);
  const section = endMatch ? afterH2.slice(0, endMatch.index) : afterH2;

  const paragraphs = [];
  const pRe = /<p[^>]*>([\s\S]*?)<\/p>/gi;
  let m;
  while ((m = pRe.exec(section)) !== null) {
    const text = decodeEntities(stripTags(m[1])).trim();
    if (text) paragraphs.push(text);
  }
  return paragraphs.join(" ");
}

function extractFooterCategories(html) {
  // Footer categories are between the last two <hr> tags
  const hrPositions = [];
  const hrRe = /<hr\s*\/?>/gi;
  let m;
  while ((m = hrRe.exec(html)) !== null) {
    hrPositions.push(m.index);
  }
  if (hrPositions.length < 2) return [];

  const section = html.slice(hrPositions[hrPositions.length - 2], hrPositions[hrPositions.length - 1]);
  const cats = [];
  const aRe = /<a\s+href="([^"]+)"/gi;
  while ((m = aRe.exec(section)) !== null) {
    const href = m[1].replace(/\.html$/, "");
    if (href.startsWith("Category")) {
      cats.push(href);
    }
  }
  return cats;
}

// ─── Type Mapping ─────────────────────────────────────────────────────────────

function mapType(docType) {
  if (!docType) return "any";
  let t = docType.trim();

  // hash_map<K,V>
  const hashMapMatch = t.match(/^hash_map\s*<\s*(.+?)\s*,\s*(.+?)\s*>$/);
  if (hashMapMatch) {
    return `table<${mapType(hashMapMatch[1])}, ${mapType(hashMapMatch[2])}>`;
  }

  // table of X
  const tableOfMatch = t.match(/^table\s+of\s+(.+)$/i);
  if (tableOfMatch) {
    return `${mapType(tableOfMatch[1])}[]`;
  }

  // X or nil
  const orNilMatch = t.match(/^(.+?)\s+or\s+nil$/i);
  if (orNilMatch) {
    return `${mapType(orNilMatch[1])}|nil`;
  }

  // X or Y (not nil)
  const orMatch = t.match(/^(.+?)\s+or\s+(.+)$/i);
  if (orMatch && orMatch[2].toLowerCase() !== "nil") {
    return `${mapType(orMatch[1])}|${mapType(orMatch[2])}`;
  }

  // int (enum XxxYyy) or int (ENUM_XxxYyy)
  const enumMatch = t.match(/^int\s*\(\s*(?:enum\s+)?(\w+)\s*\)$/i);
  if (enumMatch) {
    let enumName = enumMatch[1];
    // Normalize: if it doesn't start with ENUM_ but looks like an enum name, keep as-is
    return enumName;
  }

  // number (int), number (int32_t), number (int64_t ...), int
  if (/^(?:number\s*\(\s*int(?:32_t|64_t[^)]*)?\s*\)|int(?:\d+_t)?)$/i.test(t)) {
    return "integer";
  }

  // number (integer)
  if (/^number\s*\(\s*integer\s*\)$/i.test(t)) {
    return "integer";
  }

  // number (double), number ([...])
  if (/^number\s*\(/.test(t)) {
    return "number";
  }

  // Plain types
  const lower = t.toLowerCase();
  if (lower === "string") return "string";
  if (lower === "wstring") return "string";
  if (lower === "number") return "number";
  if (lower === "int") return "integer";
  if (lower === "boolean" || lower === "bool") return "boolean";
  if (lower === "table") return "table";
  if (lower === "function") return "function";
  if (lower === "nil") return "nil";
  if (lower === "userdata") return "userdata";

  // ["TypeName"] bracket reference
  const bracketMatch = t.match(/^\["?(\w+)"?\]$/);
  if (bracketMatch) return bracketMatch[1];

  // Custom type — return as-is (ObjectId, BuffId, GamePosition, etc.)
  // Strip any parenthetical notes
  const parenClean = t.replace(/\s*\(.*\)$/, "").trim();
  if (/^\w+$/.test(parenClean)) return parenClean;

  return t;
}

// ─── Field Line Parser ────────────────────────────────────────────────────────

function parseFieldLine(line) {
  // Format: name: type - description
  // or:     name: type
  const m = line.match(/^\s*(\w+)\s*:\s*(.+?)(?:\s+-\s+(.*))?$/);
  if (!m) return null;

  const name = m[1];
  let rawType = m[2].trim();
  let description = (m[3] || "").trim();

  // If description got caught in type due to no " - " separator, try to split
  // Sometimes type ends and description follows without proper separator
  if (!m[3] && rawType.includes(" - ")) {
    const idx = rawType.indexOf(" - ");
    description = rawType.slice(idx + 3).trim();
    rawType = rawType.slice(0, idx).trim();
  }

  return { name, type: mapType(rawType), rawType, description };
}

// ─── Pre Block Section Parser ─────────────────────────────────────────────────

function parsePreSections(text) {
  if (!text) return {};
  const lines = text.replace(/\r\n/g, "\n").replace(/\r/g, "\n").split("\n");
  const sections = {};
  let currentSection = "_preamble";
  sections[currentSection] = [];

  // Known section headers (lowercase, without trailing colon)
  const knownSections = new Set([
    "библиотека",
    "класс",
    "объявление",
    "семантика",
    "параметры",
    "входные параметры",
    "входные параметры отсутствуют",
    "возвращаемые значения",
    "возвращаемое значение",
    "возвращаемое значение отсутствует",
    "возвращаемые значения отсутствуют",
    "пример",
    "примеры",
    "система",
    "описание типа"
  ]);

  for (const rawLine of lines) {
    const line = rawLine.trimEnd();
    const sectionMatch = line.match(/^--\s*(.+)/);
    if (sectionMatch) {
      const candidate = sectionMatch[1]
        .replace(/:?\s*$/, "")
        .trim()
        .toLowerCase();
      if (knownSections.has(candidate)) {
        currentSection = candidate;
        sections[currentSection] = [];
      } else {
        // Not a known section header — treat as content (e.g. "-- Общая часть")
        if (!sections[currentSection]) sections[currentSection] = [];
        sections[currentSection].push(line);
      }
    } else {
      if (!sections[currentSection]) sections[currentSection] = [];
      sections[currentSection].push(line);
    }
  }

  // Clean up: trim empty lines at start/end of each section
  for (const key of Object.keys(sections)) {
    const lines = sections[key];
    while (lines.length && !lines[0].trim()) lines.shift();
    while (lines.length && !lines[lines.length - 1].trim()) lines.pop();
  }

  return sections;
}

// ─── Function Page Parser ─────────────────────────────────────────────────────

function parseFunctionPage(html, filename) {
  const h2 = extractH2(html);
  if (!h2) return null;

  const description = extractDescription(html);
  const preText = extractPreBlock(html);
  const categories = extractFooterCategories(html);

  if (!preText) return null;

  const sections = parsePreSections(preText);

  // Determine library/class
  let library = null;
  let className = null;
  let isMethod = false;

  // Check for class (widget method)
  const classSection = sections["класс"] || sections["класс:"];
  const libSection = sections["библиотека"] || sections["библиотека:"];

  if (classSection && classSection.length > 0) {
    className = classSection[0].trim();
    isMethod = true;
  } else if (libSection && libSection.length > 0) {
    library = libSection[0].trim();
  }

  // Parse function name from h2
  // Formats: "common.GetAddonInfo( addonName )" or "ButtonSafe:SetVariant( self, variant )"
  let funcName = "";
  const methodMatch = h2.match(/(\w+):(\w+)/);
  const dotMatch = h2.match(/(\w+)\.(\w+)/);
  if (methodMatch) {
    if (!className) className = methodMatch[1];
    funcName = methodMatch[2];
    isMethod = true;
  } else if (dotMatch) {
    if (!library) library = dotMatch[1];
    funcName = dotMatch[2];
  } else {
    funcName = h2.replace(/\(.*\)/, "").trim();
  }

  // Parse parameters
  const params = [];
  const paramSection = sections["параметры"] || sections["параметры:"] || sections["входные параметры"] || sections["входные параметры:"];

  if (paramSection) {
    for (const line of paramSection) {
      if (!line.trim()) continue;
      if (/отсутствуют/i.test(line)) break;
      const field = parseFieldLine(line);
      if (field && field.name !== "self") {
        params.push(field);
      }
    }
  }

  // Parse return values
  let returns = null;
  const retSection =
    sections["возвращаемые значения"] ||
    sections["возвращаемые значения:"] ||
    sections["возвращаемое значение"] ||
    sections["возвращаемое значение:"];

  const retAbsent =
    sections["возвращаемое значение отсутствует"] !== undefined || sections["возвращаемые значения отсутствуют"] !== undefined;

  if (!retAbsent && retSection && retSection.length > 0) {
    returns = parseReturnSection(retSection, library, className, funcName);
  }

  return {
    library: library || className,
    className,
    funcName,
    isMethod,
    params,
    returns,
    description,
    categories,
    filename
  };
}

function parseReturnSection(lines, library, className, funcName) {
  const fullText = lines.join("\n");

  // Check for "table - таблица с полями:" pattern — return is a named result type with fields
  const returnFields = [];
  let returnType = null;
  let hasFields = false;

  // First line often contains the return type info
  const firstLine = lines[0].trim();

  // "table or nil" pattern
  const tableOrNilMatch = firstLine.match(/^(table\s+or\s+nil)/i);
  // "table - описание" pattern
  const tableDescMatch = firstLine.match(/^(table)\b/i);
  // Simple type return
  const simpleTypeMatch = firstLine.match(/^(\w[\w\s()[\],.|]+?)(?:\s+-\s+|$)/);

  // Check for indented field lines (return table fields)
  for (let i = 1; i < lines.length; i++) {
    const line = lines[i];
    if (/^\s{1,}/.test(line) && line.trim()) {
      const field = parseFieldLine(line);
      if (field) {
        returnFields.push(field);
        hasFields = true;
      }
    }
  }

  // Also check for non-indented field lines that look like fields after the first line
  if (!hasFields) {
    for (let i = 1; i < lines.length; i++) {
      const line = lines[i].trim();
      if (!line) continue;
      // Skip comment lines
      if (line.startsWith("--")) continue;
      const field = parseFieldLine(line);
      if (field) {
        returnFields.push(field);
        hasFields = true;
      }
    }
  }

  if (hasFields) {
    // Generate a result type name
    const owner = className || library || "Global";
    const typeName = capitalize(owner) + capitalize(funcName) + "Result";
    return { type: typeName, fields: returnFields, isCustom: true };
  }

  // Parse simple return type from first line
  if (firstLine) {
    // Handle "Если ... false, если найден: table - ..." pattern
    const complexMatch = firstLine.match(/(?:false|nil)[^:]*:\s*(.+)/i);
    if (complexMatch) {
      const innerType = complexMatch[1].replace(/\s*-\s+.*/, "").trim();
      const owner = className || library || "Global";
      const typeName = capitalize(owner) + capitalize(funcName) + "Result";
      // Has indented fields after?
      if (returnFields.length > 0) {
        return { type: `${typeName}|false`, fields: returnFields, isCustom: true, typeName };
      }
      return { type: `${mapType(innerType)}|false`, fields: [], isCustom: false };
    }

    // Simple return type
    let rawType = firstLine.replace(/\s*-\s+.*/, "").trim();
    // Remove trailing comma or period
    rawType = rawType.replace(/[,.]$/, "").trim();
    // Remove "(только при ошибке)" and similar parenthetical notes in Russian
    rawType = rawType.replace(/\s*\([^)]*ошибк[^)]*\)/i, "").trim();
    rawType = rawType.replace(/,?\s*поля:?\s*$/i, "").trim();

    if (rawType) {
      return { type: mapType(rawType), fields: returnFields, isCustom: false };
    }
  }

  return null;
}

function capitalize(s) {
  if (!s) return "";
  return s[0].toUpperCase() + s.slice(1);
}

// ─── Enum Page Parser ─────────────────────────────────────────────────────────

function parseEnumPage(html, filename) {
  const h2 = extractH2(html);
  if (!h2) return null;

  const description = extractDescription(html);
  const preText = extractPreBlock(html);
  const categories = extractFooterCategories(html);

  if (!preText) return null;

  const lines = preText
    .split("\n")
    .map((l) => l.trim())
    .filter((l) => l && !l.startsWith("--"));

  // Determine if string enum (has ENUM_ prefix or quotes) or numeric
  const isString = lines.some((l) => l.startsWith('"ENUM_') || l.startsWith("ENUM_"));

  // Extract enum prefix name from h2
  // h2 formats: "AFCT_..." or 'enum "ENUM_AccessionResult_..."' or '"ENUM_ActionFailCause_..."'
  let enumName = "";
  const enumPrefixMatch = h2.match(/(?:enum\s+)?"?(ENUM_\w+?)_/i);
  const numericPrefixMatch = h2.match(/^(\w+?)_/);

  if (isString && enumPrefixMatch) {
    enumName = enumPrefixMatch[1];
  } else if (numericPrefixMatch) {
    enumName = numericPrefixMatch[1];
  } else {
    // Fallback: use filename
    enumName = filename.replace(/^Enum/, "").replace(/\.html$/, "");
  }

  // Parse values
  const values = [];
  for (const line of lines) {
    let value = line;
    // Remove trailing comma
    value = value.replace(/,\s*$/, "");
    // Remove description after value for string enums: "ENUM_Foo_Bar" - description
    const descMatch = value.match(/^("?[\w]+"?)\s+-\s+/);
    if (descMatch) {
      value = descMatch[1];
    }
    // Remove surrounding quotes
    value = value.replace(/^"(.*)"$/, "$1");
    if (value && /^\w+$/.test(value)) {
      values.push(value);
    }
  }

  return {
    name: enumName,
    values,
    isString,
    description,
    categories,
    filename
  };
}

// ─── Event Page Parser ────────────────────────────────────────────────────────

function parseEventPage(html, filename) {
  const h2 = extractH2(html);
  if (!h2) return null;

  const description = extractDescription(html);
  const preText = extractPreBlock(html);
  const categories = extractFooterCategories(html);

  const eventName = h2.trim();
  const fields = [];

  if (preText) {
    const lines = preText.split("\n");
    for (const line of lines) {
      const trimmed = line.trim();
      if (!trimmed || trimmed.startsWith("--")) continue;
      if (/не содержит полей/i.test(trimmed)) break;
      // "таблица TypeName" pattern
      const tableMatch = trimmed.match(/^таблица\s+(\w+)/i);
      if (tableMatch) {
        fields.push({ name: "params", type: tableMatch[1], rawType: tableMatch[1], description: "" });
        continue;
      }
      const field = parseFieldLine(trimmed);
      if (field) fields.push(field);
    }
  }

  return {
    name: eventName,
    fields,
    description,
    categories,
    filename
  };
}

// ─── Widget Page Parser ───────────────────────────────────────────────────────

function parseWidgetPage(html, filename) {
  const h2 = extractH2(html);
  if (!h2) return null;

  const categories = extractFooterCategories(html);

  // Widget name from h2: "Button. Описание виджета кнопки." -> "Button"
  // or "Widget. Описание виджета." -> "Widget"
  const nameMatch = h2.match(/^(\w+)/);
  if (!nameMatch) return null;
  let widgetName = nameMatch[1];

  // The actual class name used in code has "Safe" suffix for some, but in types we use
  // the base name. For Widget pages the class is Widget<Name> or just Widget.
  // From the h2 "Button" -> class is "WidgetButton" (but methods use "ButtonSafe")
  // We'll store the short name and map later

  // Detect parent from inheritance prose
  let parent = null;
  const inheritMatch = html.match(/наследованный от базового типа\s*<a[^>]*>\s*(\w+)/i);
  if (inheritMatch) {
    parent = inheritMatch[1];
  }
  // Also check "наследован от"
  const inheritMatch2 = html.match(/наследован\w* от[^<]*<a[^>]*>\s*(\w+)/i);
  if (!parent && inheritMatch2) {
    parent = inheritMatch2[1];
  }

  // Parse fields from <ul><li><p> items under field <h4> headers
  const fields = [];
  const reactions = [];

  // Find all <h4> sections
  const h4Re = /<h4[^>]*>([\s\S]*?)<\/h4>/gi;
  let h4Match;
  const h4Sections = [];

  while ((h4Match = h4Re.exec(html)) !== null) {
    const title = decodeEntities(stripTags(h4Match[1])).trim().toLowerCase();
    const startIdx = h4Match.index + h4Match[0].length;
    h4Sections.push({ title, startIdx });
  }

  // For each h4 section, find the content until the next h4 or h2 or h3 or hr
  for (let i = 0; i < h4Sections.length; i++) {
    const start = h4Sections[i].startIdx;
    const title = h4Sections[i].title;

    // Skip search/related pages sections
    if (title.includes("связанные страницы") || title.includes("search:")) continue;

    // Find end of section
    let end = html.length;
    const nextSectionRe = /<(?:h[234]|hr)[^>]*>/gi;
    nextSectionRe.lastIndex = start;
    const nextMatch = nextSectionRe.exec(html);
    if (nextMatch) end = nextMatch.index;

    const sectionHtml = html.slice(start, end);

    // Is this a reactions section?
    const isReaction = title.includes("реакци");

    // Parse <ul><li><p> items
    const liRe = /<li><p>\s*([\s\S]*?)<\/p><\/li>/gi;
    let liMatch;
    while ((liMatch = liRe.exec(sectionHtml)) !== null) {
      const text = decodeEntities(stripTags(liMatch[1])).trim();
      const field = parseFieldLine(text);
      if (field) {
        if (isReaction) {
          reactions.push(field);
        } else {
          fields.push(field);
        }
      }
    }
  }

  return {
    name: widgetName,
    parent,
    fields,
    reactions,
    categories,
    filename
  };
}

// ─── Type/ID Page Parser ──────────────────────────────────────────────────────

function parseTypePage(html, filename) {
  const h2 = extractH2(html);
  if (!h2) return null;

  const description = extractDescription(html);
  const preText = extractPreBlock(html);
  const categories = extractFooterCategories(html);

  const typeName = h2.trim();
  const fields = [];

  if (preText) {
    const lines = preText.split("\n");
    for (const line of lines) {
      const trimmed = line.trim();
      if (!trimmed) continue;
      // Skip comment lines and descriptive text
      if (trimmed.startsWith("--")) continue;
      if (/^(Таблица|Пример|local\s|pos\.|Описание|Массив|Строка|Число|Значение)/i.test(trimmed)) continue;
      const field = parseFieldLine(trimmed);
      if (field) fields.push(field);
    }
  }

  return {
    name: typeName,
    fields,
    description,
    categories,
    filename
  };
}

// ─── LuaLS Output Generators ─────────────────────────────────────────────────

function escapeDescription(desc) {
  if (!desc) return "";
  return desc.replace(/\n/g, " ").trim();
}

function generateLibraryFile(libName, functions) {
  const lines = ["---@meta", ""];

  // Library class declaration
  lines.push(`---@class ${libName}Lib`);
  lines.push(`${libName} = {}`);
  lines.push("");

  // Generate return type classes first
  for (const fn of functions) {
    if (fn.returns && fn.returns.isCustom && fn.returns.fields.length > 0) {
      const typeName = fn.returns.typeName || fn.returns.type.replace(/\|.*$/, "");
      lines.push(`---@class ${typeName}`);
      for (const f of fn.returns.fields) {
        const desc = f.description ? ` ${escapeDescription(f.description)}` : "";
        lines.push(`---@field ${f.name} ${f.type}${desc}`);
      }
      lines.push("");
    }
  }

  // Generate function signatures
  for (const fn of functions) {
    if (fn.description) {
      lines.push(`---${escapeDescription(fn.description)}`);
    }
    for (const p of fn.params) {
      const desc = p.description ? ` ${escapeDescription(p.description)}` : "";
      lines.push(`---@param ${p.name} ${p.type}${desc}`);
    }
    if (fn.returns) {
      lines.push(`---@return ${fn.returns.type}`);
    }
    const paramList = fn.params.map((p) => p.name).join(", ");
    lines.push(`function ${libName}.${fn.funcName}(${paramList}) end`);
    lines.push("");
  }

  return lines.join("\n");
}

function generateClassFile(className, methods) {
  const lines = ["---@meta", ""];

  // We need to figure out the safe class name
  // Methods reference "ButtonSafe" but the widget type page says "Button"
  // Use the className as-is (it comes from the pre block "-- класс" section)
  lines.push(`---@class ${className}`);
  lines.push(`local ${className} = {}`);
  lines.push("");

  // Generate return type classes first
  for (const fn of methods) {
    if (fn.returns && fn.returns.isCustom && fn.returns.fields.length > 0) {
      const typeName = fn.returns.typeName || fn.returns.type.replace(/\|.*$/, "");
      lines.push(`---@class ${typeName}`);
      for (const f of fn.returns.fields) {
        const desc = f.description ? ` ${escapeDescription(f.description)}` : "";
        lines.push(`---@field ${f.name} ${f.type}${desc}`);
      }
      lines.push("");
    }
  }

  // Generate method signatures
  for (const fn of methods) {
    if (fn.description) {
      lines.push(`---${escapeDescription(fn.description)}`);
    }
    for (const p of fn.params) {
      const desc = p.description ? ` ${escapeDescription(p.description)}` : "";
      lines.push(`---@param ${p.name} ${p.type}${desc}`);
    }
    if (fn.returns) {
      lines.push(`---@return ${fn.returns.type}`);
    }
    const paramList = fn.params.map((p) => p.name).join(", ");
    lines.push(`function ${className}:${fn.funcName}(${paramList}) end`);
    lines.push("");
  }

  return lines.join("\n");
}

function generateEnumsFile(enums) {
  const lines = ["---@meta", ""];

  for (const en of enums) {
    if (en.isString) {
      // String enum -> @alias with literal strings
      lines.push(`---@alias ${en.name}`);
      for (const v of en.values) {
        lines.push(`---| "${v}"`);
      }
    } else {
      // Numeric enum -> @enum
      lines.push(`---@enum ${en.name}`);
      lines.push(`${en.name} = {`);
      for (let i = 0; i < en.values.length; i++) {
        lines.push(`  ${en.values[i]} = ${i},`);
      }
      lines.push("}");
    }
    lines.push("");
  }

  return lines.join("\n");
}

function generateEventsFile(events) {
  const lines = ["---@meta", ""];

  for (const ev of events) {
    // Convert EVENT_FOO_BAR to EventFooBarParams
    const className = eventNameToClassName(ev.name);

    if (ev.description) {
      lines.push(`---${escapeDescription(ev.description)}`);
    }
    lines.push(`---@class ${className}`);

    for (const f of ev.fields) {
      if (f.name === "params") {
        // Table reference: just alias it
        lines.push(`---@field [any] ${f.type}`);
      } else {
        const desc = f.description ? ` ${escapeDescription(f.description)}` : "";
        lines.push(`---@field ${f.name} ${f.type}${desc}`);
      }
    }
    lines.push("");
  }

  // Also generate a mapping table for event name -> params type
  lines.push("---@alias EventName");
  for (const ev of events) {
    lines.push(`---| "${ev.name}"`);
  }
  lines.push("");

  return lines.join("\n");
}

function eventNameToClassName(eventName) {
  // EVENT_FOO_BAR -> EventFooBar + Params
  const parts = eventName.split("_");
  const camel = parts.map((p) => p[0] + p.slice(1).toLowerCase()).join("");
  return camel + "Params";
}

function generateWidgetsFile(widgets) {
  const lines = ["---@meta", ""];

  for (const w of widgets) {
    const parentClause = w.parent ? ` : ${w.parent}` : "";
    lines.push(`---@class ${w.name}${parentClause}`);

    for (const f of w.fields) {
      const desc = f.description ? ` ${escapeDescription(f.description)}` : "";
      lines.push(`---@field ${f.name} ${f.type}${desc}`);
    }

    lines.push(`local ${w.name} = {}`);
    lines.push("");
  }

  return lines.join("\n");
}

function generateTypesFile(types) {
  const lines = ["---@meta", ""];

  for (const t of types) {
    if (t.description) {
      lines.push(`---${escapeDescription(t.description)}`);
    }

    if (t.fields.length > 0) {
      lines.push(`---@class ${t.name}`);
      for (const f of t.fields) {
        const desc = f.description ? ` ${escapeDescription(f.description)}` : "";
        lines.push(`---@field ${f.name} ${f.type}${desc}`);
      }
    } else {
      // No fields — just declare as a class (opaque type)
      lines.push(`---@class ${t.name}`);
    }
    lines.push("");
  }

  return lines.join("\n");
}

// ─── Main Orchestration ──────────────────────────────────────────────────────

function main() {
  console.log("Scanning", DOCS_DIR);

  if (!fs.existsSync(DOCS_DIR)) {
    console.error("Error: Docs directory not found at", DOCS_DIR);
    process.exit(1);
  }

  const files = fs.readdirSync(DOCS_DIR).filter((f) => f.endsWith(".html"));
  console.log(`Found ${files.length} HTML files`);

  // Classify files
  const functionFiles = [];
  const enumFiles = [];
  const eventFiles = [];
  const widgetFiles = [];
  const categoryFiles = [];
  const otherFiles = [];

  for (const f of files) {
    if (f.startsWith("Category")) categoryFiles.push(f);
    else if (f.startsWith("Function")) functionFiles.push(f);
    else if (f.startsWith("Event")) eventFiles.push(f);
    else if (f.startsWith("Enum")) enumFiles.push(f);
    else if (f.startsWith("Widget")) widgetFiles.push(f);
    else otherFiles.push(f);
  }

  console.log(
    `Classification: ${functionFiles.length} functions, ${enumFiles.length} enums, ${eventFiles.length} events, ${widgetFiles.length} widgets, ${categoryFiles.length} categories (skipped), ${otherFiles.length} other/types`
  );

  // Parse all pages
  const functions = [];
  const enums = [];
  const events = [];
  const widgets = [];
  const types = [];

  let parseErrors = 0;

  // Parse functions
  for (const f of functionFiles) {
    try {
      const html = fs.readFileSync(path.join(DOCS_DIR, f), "utf-8");
      const result = parseFunctionPage(html, f);
      if (result) functions.push(result);
    } catch (e) {
      parseErrors++;
      if (parseErrors <= 5) console.warn(`  Warning: Failed to parse ${f}: ${e.message}`);
    }
  }
  console.log(`Parsed ${functions.length}/${functionFiles.length} functions`);

  // Parse enums
  for (const f of enumFiles) {
    try {
      const html = fs.readFileSync(path.join(DOCS_DIR, f), "utf-8");
      const result = parseEnumPage(html, f);
      if (result) enums.push(result);
    } catch (e) {
      parseErrors++;
      if (parseErrors <= 5) console.warn(`  Warning: Failed to parse ${f}: ${e.message}`);
    }
  }
  console.log(`Parsed ${enums.length}/${enumFiles.length} enums`);

  // Parse events
  for (const f of eventFiles) {
    try {
      const html = fs.readFileSync(path.join(DOCS_DIR, f), "utf-8");
      const result = parseEventPage(html, f);
      if (result) events.push(result);
    } catch (e) {
      parseErrors++;
      if (parseErrors <= 5) console.warn(`  Warning: Failed to parse ${f}: ${e.message}`);
    }
  }
  console.log(`Parsed ${events.length}/${eventFiles.length} events`);

  // Parse widgets
  for (const f of widgetFiles) {
    try {
      const html = fs.readFileSync(path.join(DOCS_DIR, f), "utf-8");
      const result = parseWidgetPage(html, f);
      if (result) widgets.push(result);
    } catch (e) {
      parseErrors++;
      if (parseErrors <= 5) console.warn(`  Warning: Failed to parse ${f}: ${e.message}`);
    }
  }
  console.log(`Parsed ${widgets.length}/${widgetFiles.length} widgets`);

  // Parse type/ID pages
  for (const f of otherFiles) {
    try {
      const html = fs.readFileSync(path.join(DOCS_DIR, f), "utf-8");
      const result = parseTypePage(html, f);
      if (result) types.push(result);
    } catch (e) {
      parseErrors++;
      if (parseErrors <= 5) console.warn(`  Warning: Failed to parse ${f}: ${e.message}`);
    }
  }
  console.log(`Parsed ${types.length}/${otherFiles.length} type pages`);

  // ─── Grouping ─────────────────────────────────────────────────────────────

  // Group functions by library (free functions) vs class (methods)
  const libraryFunctions = {}; // library name -> functions[]
  const classMethods = {}; // class name -> functions[]

  for (const fn of functions) {
    if (fn.isMethod && fn.className) {
      if (!classMethods[fn.className]) classMethods[fn.className] = [];
      classMethods[fn.className].push(fn);
    } else if (fn.library) {
      if (!libraryFunctions[fn.library]) libraryFunctions[fn.library] = [];
      libraryFunctions[fn.library].push(fn);
    }
  }

  console.log(`\nGrouped into ${Object.keys(libraryFunctions).length} libraries, ${Object.keys(classMethods).length} class method groups`);

  // ─── Generate Output ──────────────────────────────────────────────────────

  // Ensure output directory exists
  if (!fs.existsSync(OUT_DIR)) {
    fs.mkdirSync(OUT_DIR, { recursive: true });
  }

  let filesWritten = 0;

  // Generate per-library files
  for (const [libName, fns] of Object.entries(libraryFunctions)) {
    const content = generateLibraryFile(libName, fns);
    const outPath = path.join(OUT_DIR, `${libName}.lua`);
    fs.writeFileSync(outPath, content, "utf-8");
    filesWritten++;
  }

  // Generate per-class method files
  for (const [className, methods] of Object.entries(classMethods)) {
    const content = generateClassFile(className, methods);
    const outPath = path.join(OUT_DIR, `${className}.lua`);
    fs.writeFileSync(outPath, content, "utf-8");
    filesWritten++;
  }

  // Generate enums file
  if (enums.length > 0) {
    const content = generateEnumsFile(enums);
    fs.writeFileSync(path.join(OUT_DIR, "_enums.lua"), content, "utf-8");
    filesWritten++;
  }

  // Generate events file
  if (events.length > 0) {
    const content = generateEventsFile(events);
    fs.writeFileSync(path.join(OUT_DIR, "_events.lua"), content, "utf-8");
    filesWritten++;
  }

  // Generate widgets file
  if (widgets.length > 0) {
    const content = generateWidgetsFile(widgets);
    fs.writeFileSync(path.join(OUT_DIR, "_widgets.lua"), content, "utf-8");
    filesWritten++;
  }

  // Generate types file
  if (types.length > 0) {
    const content = generateTypesFile(types);
    fs.writeFileSync(path.join(OUT_DIR, "_types.lua"), content, "utf-8");
    filesWritten++;
  }

  console.log(`\nGenerated ${filesWritten} files in ${OUT_DIR}`);
  if (parseErrors > 0) {
    console.log(`(${parseErrors} parse warnings total)`);
  }
  console.log("Done!");
}

main();
