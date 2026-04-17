import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";
import { parse, HTMLElement } from "node-html-parser";

// ─── Config ──────────────────────────────────────────────

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const DOCS_DIR = path.join(__dirname, "allods-docs", "Docs", "ModdingDocuments", "LuaApi");
const OUT_DIR = path.join(__dirname, "types");
const JSON_DIR = path.join(__dirname, "json");

const CONFIG = {
  generateEnums: true,
  generateFunctions: true,
  generateEvents: true,
  generateWidgets: true,
  generateEventHandlers: true,
  generateJson: true
};

/** Meta-categories to skip (lowercased libName after removing "Category" prefix) */
const META_CATEGORIES = new Set(["luaApi", "function", "event", "enums", "types", "luaApiDeprecated", "coreScripts", "relatedResources"]);

/** Widget categories that have proper link structure (h4 Search header) */
const WIDGET_CATEGORIES: Record<string, string> = {
  CategoryButton: "ButtonSafe",
  CategoryControl3D: "Control3DSafe",
  CategoryEditBase: "EditBase",
  CategoryEditBox: "EditBoxSafe",
  CategoryEditLine: "EditLineSafe",
  CategoryForm: "FormSafe",
  CategoryPanel: "PanelSafe",
  CategoryTextView: "TextViewSafe",
  CategoryScrollableContainer: "ScrollableContainerSafe",
  CategoryTextContainer: "TextContainerSafe",
  CategoryDiscreteSlider: "DiscreteSliderSafe"
};

/** Widget super-categories (giant index pages) - skip from normal processing */
const WIDGET_SUPER_CATEGORIES = new Set(["widget", "widgetEffects", "widgetMembers"]);

/** File prefixes to scan directly for WidgetSafe base methods */
const WIDGET_FILE_PREFIXES = ["FunctionWidget", "FunctionTextView", "FunctionTextContainer"];

/** Widget class hierarchy for Lua @class inheritance */
const WIDGET_HIERARCHY: Record<string, string | null> = {
  WidgetSafe: null,
  ButtonSafe: "WidgetSafe",
  Control3DSafe: "WidgetSafe",
  EditBase: "WidgetSafe",
  EditBoxSafe: "EditBase",
  EditLineSafe: "EditBase",
  FormSafe: "WidgetSafe",
  PanelSafe: "WidgetSafe",
  TextViewSafe: "WidgetSafe",
  ScrollableContainerSafe: "WidgetSafe",
  TextContainerSafe: "WidgetSafe",
  DiscreteSliderSafe: "WidgetSafe"
};

/** Known widget class names for detection in -- класс section */
const KNOWN_WIDGET_CLASSES = new Set(Object.keys(WIDGET_HIERARCHY));

// ─── Types ───────────────────────────────────────────────

type ParamInfo = {
  name: string;
  type: string;
  description: string;
};

type FunctionInfo = {
  name: string;
  library: string;
  description: string;
  params: ParamInfo[];
  returns: string;
  returnsDescription: string;
  example: string;
};

type EnumValue = {
  name: string;
  description: string;
};

type EnumInfo = {
  name: string;
  description: string;
  values: EnumValue[];
};

type EventField = {
  name: string;
  type: string;
  description: string;
};

type EventInfo = {
  name: string;
  eventConstant: string;
  description: string;
  fields: EventField[];
};

type WidgetMethodInfo = {
  name: string;
  widgetClass: string;
  description: string;
  params: ParamInfo[];
  returns: string;
  returnsDescription: string;
  example: string;
  sourceFile: string;
};

type CategoryInfo = {
  name: string;
  libName: string;
  description: string;
  enums: EnumInfo[];
  functions: FunctionInfo[];
  events: EventInfo[];
  isWidgetCategory: boolean;
  widgetClassName?: string;
};

type ParsedData = {
  categories: CategoryInfo[];
  events: EventInfo[];
  widgetMethods: Record<string, WidgetMethodInfo[]>;
};

// ─── Utilities ───────────────────────────────────────────

/** Lowercase first character */
const lowerFirst = (value: string): string => {
  if (!value) return value;
  return value[0].toLowerCase() + value.slice(1);
};

/** Read HTML file from DOCS_DIR */
const readFile = (fileName: string): string => {
  return fs.readFileSync(path.join(DOCS_DIR, fileName), "utf-8");
};

/** Replace Cyrillic "с" (U+0441) in "сommon" with Latin "c" */
const fixCyrillicC = (s: string): string => {
  return s.replace(/\u0441ommon/g, "common");
};

/** Check if library string indicates a builtin function */
const isBuiltin = (lib: string): boolean => {
  return /builtin#\d+/.test(lib);
};

/** Check if library string indicates a global function */
const isGlobalFunction = (lib: string): boolean => {
  return /глобальная функция/i.test(lib);
};

/**
 * Normalize widget class from -- класс section content.
 * Returns widget class name or null if not a widget method.
 */
const normalizeWidgetClass = (classLine: string): string | null => {
  const trimmed = classLine.trim();

  // "метод имеется у всех типов виджетов (WidgetSafe)" or "метод доступен для всех типов виджетов"
  if (/всех типов виджетов/i.test(trimmed) || /для всех типов/i.test(trimmed)) {
    return "WidgetSafe";
  }

  // Direct class name: "ButtonSafe", "Control3DSafe", etc.
  for (const cls of KNOWN_WIDGET_CLASSES) {
    if (trimmed === cls || trimmed.startsWith(cls + " ") || trimmed.includes(cls)) {
      return cls;
    }
  }

  return null;
};

/**
 * Map raw doc type string to Lua annotation type.
 */
const mapType = (raw: string): string => {
  let t = raw.trim();

  // "table of X" → X[]
  const tableOfMatch = t.match(/^table\s+of\s+(.+)$/i);
  if (tableOfMatch) {
    return mapType(tableOfMatch[1]) + "[]";
  }

  // "hash_map<K,V>" → table<K,V>
  const hashMapMatch = t.match(/^hash_map\s*<\s*(.+?)\s*,\s*(.+?)\s*>$/i);
  if (hashMapMatch) {
    return `table<${mapType(hashMapMatch[1])}, ${mapType(hashMapMatch[2])}>`;
  }

  // "X or nil" → X|nil
  if (/\s+or\s+nil$/i.test(t)) {
    const base = t.replace(/\s+or\s+nil$/i, "").trim();
    return mapType(base) + "|nil";
  }

  // "number (int)" or "number (int64)" or "Number(int64)" → integer
  if (/^number\s*\(?int(?:64)?\)?/i.test(t)) return "integer";
  // "number (int), millisec" etc → integer
  if (/^number\s*\(int\)\s*,/.test(t)) return "integer";
  // "number (enum ...)" or "Number(ENUM_...)" → integer
  if (/^number\s*\(?enum\b/i.test(t)) return "integer";
  // "string (enum)" or "string (enum ...)" → string
  if (/^string\s*\(enum\b/.test(t)) return "string";
  // "Number(ObjectId)" or "Number(SomeType)" → the inner type
  const numberTypeMatch = t.match(/^Number\s*\((\w+)\)/i);
  if (numberTypeMatch) {
    const inner = numberTypeMatch[1];
    if (/^int/i.test(inner)) return "integer";
    if (/^enum/i.test(inner)) return "integer";
    return inner; // e.g., ObjectId
  }

  const lower = t.toLowerCase();
  if (lower === "number") return "number";
  if (lower === "string") return "string";
  if (lower === "boolean" || lower === "bool") return "boolean";
  if (lower === "table" || lower === "таблица") return "table";
  if (lower === "function") return "function";
  if (lower === "nil") return "nil";
  if (lower === "userdata") return "userdata";
  if (lower === "any" || lower === "any type" || lower === "any value") return "any";
  if (/^таблиц/i.test(t)) return "table";

  // Custom types: take first word only to strip trailing noise
  return t.split(/\s/)[0];
};

/**
 * Extract a Lua return type from a free-text return description line.
 */
const extractReturnType = (line: string): string => {
  const t = line.trim();

  // "name: Type - desc" pattern
  const namedMatch = t.match(/^(\w+)\s*:\s*(.+?)(?:\s+[-–—]\s+|$)/);
  if (namedMatch) {
    return mapType(namedMatch[2].trim());
  }

  // "Type or nil" patterns
  const orNilMatch = t.match(/^(\w[\w<>,\s]*?)\s+or\s+nil\b/i);
  if (orNilMatch) {
    return mapType(orNilMatch[1].trim()) + "|nil";
  }

  // "Type - desc" at line start (known types)
  const typeDescMatch = t.match(
    /^(number\s*\(int(?:64)?\)|number\s*\(enum[^)]*\)|string\s*\(enum[^)]*\)|boolean|number|string|table|nil|function|userdata|WString|ObjectId|SpellId|BuffId|AbilityId|ItemId|ResourceId|CharacterClassId|CharacterFormId|GamePosition|UniqueId|ActionGroupId|WidgetSafe|ButtonSafe|FormSafe|PanelSafe|TextViewSafe|ScrollableContainerSafe|Control3DSafe|WidgetDesc)\b/i
  );
  if (typeDescMatch) {
    return mapType(typeDescMatch[1].trim());
  }

  // Russian keywords
  if (/^таблиц/i.test(t)) return "table";
  if (/^bool\b/i.test(t)) return "boolean";
  if (/^int\b/i.test(t) || /^int\s*[-–—,]/i.test(t)) return "integer";
  if (/^light\s+userdata/i.test(t)) return "userdata";
  if (/^Нет\.?$/i.test(t)) return "void";

  // "varName - Type, desc"
  const varTypeMatch = t.match(/^\w+\s*[-–—]\s*(boolean|number|string|table|integer|int|nil|userdata)\b/i);
  if (varTypeMatch) {
    const mapped = varTypeMatch[1].toLowerCase();
    if (mapped === "int") return "integer";
    return mapType(varTypeMatch[1]);
  }

  // Capitalized custom type
  const customTypeMatch = t.match(/^([A-Z]\w+)\s*(?:[-–—,\s]|or\s|$)/);
  if (customTypeMatch) {
    return mapType(customTypeMatch[1]);
  }

  return "any";
};

/**
 * Split <pre> text into named sections by `-- sectionName` headers.
 * Returns a map of sectionKey -> lines (without the header).
 */
const extractPreSections = (preText: string): Map<string, string[]> => {
  const sections = new Map<string, string[]>();
  const lines = preText.split("\n");
  let currentSection = "_preamble";
  sections.set(currentSection, []);

  for (const line of lines) {
    const trimmed = line.trim();
    // Detect section headers like "-- библиотека:", "-- класс", "-- семантика"
    const headerMatch = trimmed.match(/^--\s+(.+)/);
    if (headerMatch) {
      const headerText = headerMatch[1].toLowerCase().replace(/:$/, "").trim();
      currentSection = headerText;
      if (!sections.has(currentSection)) {
        sections.set(currentSection, []);
      }
      continue;
    }
    sections.get(currentSection)!.push(line);
  }

  return sections;
};

/**
 * Get meaningful content lines from a section (non-empty, non-comment).
 */
const getContentLines = (sections: Map<string, string[]>, ...keys: string[]): string[] => {
  for (const key of keys) {
    const lines = sections.get(key);
    if (lines) {
      return lines.map((l) => l.trim()).filter((l) => l && !l.startsWith("--"));
    }
  }
  return [];
};

/**
 * Extract first <p> text after <h2> as description.
 */
const extractDescription = (root: ReturnType<typeof parse>): string => {
  let pastH2 = false;
  for (const el of root.querySelectorAll("*")) {
    if (el.tagName === "H2") {
      pastH2 = true;
      continue;
    }
    if (pastH2 && el.tagName === "P") {
      const text = el.innerText.trim();
      if (text && !text.startsWith("На главную") && !text.startsWith("См.") && !text.startsWith("см.")) {
        return text;
      }
    }
  }
  return "";
};

/**
 * Parse parameter lines from sections.
 * Format: "name: Type - description" or "name: Type (details) - description"
 */
const parseParamLines = (lines: string[]): ParamInfo[] => {
  const params: ParamInfo[] = [];
  for (const line of lines) {
    const trimmed = line.trim();
    if (!trimmed || trimmed === "нет" || /отсутствуют/i.test(trimmed)) continue;

    // Handle "params: table, поля:" style header - skip it
    if (/^params\s*:\s*table/i.test(trimmed)) continue;

    const paramMatch = trimmed.match(/^(\w+)\s*:\s*(.+?)(?:\s+[-–—]\s+(.*))?$/);
    if (paramMatch) {
      const rawType = paramMatch[2].replace(/\s*[-–—]\s*$/, "").trim();
      params.push({
        name: paramMatch[1],
        type: mapType(rawType),
        description: paramMatch[3]?.trim() || ""
      });
    }
  }
  return params;
};

/**
 * Parse return info from section lines.
 * Returns { type, description }.
 */
const parseReturnLines = (lines: string[]): { type: string; description: string } => {
  const contentLines = lines.map((l) => l.trim()).filter((l) => l && !l.startsWith("--"));
  if (contentLines.length === 0) return { type: "void", description: "" };

  const firstLine = contentLines[0];
  if (/^нет\.?$/i.test(firstLine) || /отсутствует/i.test(firstLine)) {
    return { type: "void", description: "" };
  }

  const type = extractReturnType(firstLine);
  const description = contentLines.join(" ").trim();
  return { type, description };
};

// ─── HTML Parsers ────────────────────────────────────────

/**
 * Extract own links from a Category page (not footer duplicates).
 * Walks body children after the second <h1> (category name),
 * collects links until <hr>.
 */
const parseCategoryLinks = (fileContent: string): { enumLinks: string[]; functionLinks: string[]; eventLinks: string[] } => {
  const root = parse(fileContent);
  const h1s = root.querySelectorAll("h1");
  if (h1s.length < 2) return { enumLinks: [], functionLinks: [], eventLinks: [] };

  const body = root.querySelector("body");
  if (!body) return { enumLinks: [], functionLinks: [], eventLinks: [] };

  const categoryH1 = h1s[1];
  const children = body.childNodes;

  let pastCategory = false;
  let pastSearchHeader = false;

  const enumLinks: string[] = [];
  const functionLinks: string[] = [];
  const eventLinks: string[] = [];

  for (const child of children) {
    if (child === categoryH1) {
      pastCategory = true;
      continue;
    }
    if (!pastCategory) continue;

    // Links come after h4 "Связанные страницы" / "Search" or h2 "BlurpSearch"
    if (child instanceof HTMLElement && (child.tagName === "H2" || child.tagName === "H4")) {
      pastSearchHeader = true;
      continue;
    }

    if (!pastSearchHeader) continue;

    // Stop at <hr> after the links section
    if (child instanceof HTMLElement && child.tagName === "HR") {
      break;
    }

    // Collect links
    if (child instanceof HTMLElement) {
      const links = child.tagName === "A" ? [child] : child.querySelectorAll("a");
      for (const link of links) {
        const href = link.getAttribute("href") || "";
        if (href.startsWith("Enum")) enumLinks.push(href);
        else if (href.startsWith("Function")) functionLinks.push(href);
        else if (href.startsWith("Event")) eventLinks.push(href);
      }
    }
  }

  return { enumLinks: [...new Set(enumLinks)], functionLinks: [...new Set(functionLinks)], eventLinks: [...new Set(eventLinks)] };
};

/**
 * Parse a regular library function page.
 * Returns null for builtins, widget methods, or unparseable pages.
 */
const parseFunctionPage = (fileContent: string): FunctionInfo | null => {
  const root = parse(fileContent);
  const h2 = root.querySelector("h2");
  if (!h2) return null;

  const signature = h2.innerText.trim();
  const description = extractDescription(root);

  const preBlocks = root.querySelectorAll("pre");
  if (preBlocks.length === 0) return null;

  const sections = extractPreSections(preBlocks[0].innerText);

  // Get library
  const libLines = getContentLines(sections, "библиотека");
  const libraryRaw = libLines[0] || "";
  const library = fixCyrillicC(libraryRaw.trim());

  // Skip builtins
  if (isBuiltin(library)) return null;

  // Skip widget methods (they have -- класс instead of -- библиотека)
  if (sections.has("класс")) return null;

  // Get function name from -- объявление section
  const declLines = getContentLines(sections, "объявление");
  let funcName = "";
  for (const line of declLines) {
    const match = line.match(/^function\s+(\w+)\s*\(/);
    if (match) {
      funcName = match[1];
      break;
    }
  }

  // Fallback: extract from h2 signature
  if (!funcName) {
    const sigMatch = signature.match(/\.(\w+)\s*\(/);
    if (sigMatch) funcName = sigMatch[1];
    else {
      const globalMatch = signature.match(/^(\w+)\s*\(/);
      if (globalMatch) funcName = globalMatch[1];
    }
  }

  if (!funcName) return null;

  // Parse params
  const paramLines = getContentLines(sections, "параметры");
  const params = parseParamLines(paramLines);

  // Parse return
  const returnLines = getContentLines(sections, "возвращаемые значения", "возвращаемое значение");
  const { type: returns, description: returnsDescription } = parseReturnLines(returnLines);

  // Parse example
  const exampleLines = sections.get("примеры") || sections.get("пример") || [];
  const example = exampleLines.join("\n").trim();

  // Determine effective library name
  let effectiveLib = library;
  if (isGlobalFunction(library) || !library || library === "нет") {
    effectiveLib = "_G";
  }

  return {
    name: funcName,
    library: effectiveLib,
    description,
    params,
    returns,
    returnsDescription,
    example
  };
};

/**
 * Parse a widget method page.
 * Returns null if not a widget method or unparseable.
 */
const parseWidgetMethodPage = (fileContent: string, sourceFile: string): WidgetMethodInfo | null => {
  const root = parse(fileContent);
  const h2 = root.querySelector("h2");
  if (!h2) return null;

  const signature = h2.innerText.trim();
  const description = extractDescription(root);

  const preBlocks = root.querySelectorAll("pre");
  if (preBlocks.length === 0) return null;

  const sections = extractPreSections(preBlocks[0].innerText);

  // Must have -- класс section
  const classLines = getContentLines(sections, "класс");
  if (classLines.length === 0) return null;

  const widgetClass = normalizeWidgetClass(classLines.join(" "));
  if (!widgetClass) return null;

  // Get method name from -- семантика
  let methodName = "";
  const semLines = getContentLines(sections, "семантика", "объявление");
  for (const line of semLines) {
    const match = line.match(/^function\s+(\w+)\s*\(/);
    if (match) {
      methodName = match[1];
      break;
    }
  }

  // Fallback: extract from h2 "Widget:GetName()" or "ButtonSafe:GetVariant( self )"
  if (!methodName) {
    const colonMatch = signature.match(/:(\w+)\s*\(/);
    if (colonMatch) {
      methodName = colonMatch[1];
    } else {
      const plainMatch = signature.match(/^(\w+)\s*\(/);
      if (plainMatch) methodName = plainMatch[1];
    }
  }

  if (!methodName) return null;

  // Parse params (excluding self)
  const paramLines = getContentLines(sections, "входные параметры", "параметры");
  const allParams = parseParamLines(paramLines);
  const params = allParams.filter((p) => p.name !== "self");

  // Parse return
  const returnLines = getContentLines(sections, "возвращаемое значение", "возвращаемые значения");
  const { type: returns, description: returnsDescription } = parseReturnLines(returnLines);

  // Parse example
  const exampleLines = sections.get("пример") || sections.get("примеры") || [];
  const example = exampleLines.join("\n").trim();

  return {
    name: methodName,
    widgetClass,
    description,
    params,
    returns,
    returnsDescription,
    example,
    sourceFile
  };
};

/**
 * Parse an enum page. Returns null if no valid values or all nil.
 */
const parseEnumPage = (fileContent: string): EnumInfo | null => {
  const root = parse(fileContent);
  const h2 = root.querySelector("h2");
  if (!h2) return null;

  const enumTitle = h2.innerText.trim();

  // Description
  let description = "";
  for (const el of root.querySelectorAll("*")) {
    if (el.tagName === "H2") continue;
    if (el.tagName === "P") {
      const text = el.innerText.trim();
      if (text && !text.startsWith("На главную") && !text.startsWith("См.") && !text.startsWith("см.")) {
        description = text;
        break;
      }
    }
  }

  const preBlocks = root.querySelectorAll("pre");
  const values: EnumValue[] = [];

  for (const pre of preBlocks) {
    const lines = pre.innerText.split("\n");
    for (const line of lines) {
      const trimmed = line.trim();
      if (!trimmed || trimmed.startsWith("--")) continue;
      // Skip header lines with "..."
      if (trimmed.includes("...")) continue;
      // Skip lines with "= nil" values
      if (/=\s*nil\b/.test(trimmed)) continue;

      // Enum value with optional description: VALUE - description or "VALUE" - description
      const stripped = trimmed.replace(/^"/, "").replace(/"$/, "");
      const dashMatch = stripped.match(/^(.+?)\s+[-–—]\s+(.*)$/);
      if (dashMatch) {
        const name = dashMatch[1].replace(/"/g, "").replace(/,\s*$/, "").trim();
        if (name && /^[A-Z_]/.test(name) && !name.includes(" ")) {
          values.push({ name, description: dashMatch[2].trim() });
        }
      } else {
        const name = stripped.replace(/"/g, "").replace(/,\s*$/, "").trim();
        if (name && /^[A-Z_]/.test(name) && !name.includes(" ")) {
          values.push({ name, description: "" });
        }
      }
    }
  }

  if (values.length === 0) return null;

  // Derive clean enum name
  let enumName = enumTitle
    .replace(/^enum\s+/i, "")
    .replace(/"/g, "")
    .replace(/\.\.\./g, "")
    .trim();

  return { name: enumName, description, values };
};

/**
 * Parse an event page.
 */
const parseEventPage = (fileContent: string): EventInfo | null => {
  const root = parse(fileContent);
  const h2 = root.querySelector("h2");
  if (!h2) return null;

  const eventConstant = h2.innerText.trim();
  const description = extractDescription(root);

  const preBlocks = root.querySelectorAll("pre");
  const fields: EventField[] = [];

  if (preBlocks.length > 0) {
    const lines = preBlocks[0].innerText.split("\n");
    for (const line of lines) {
      const trimmed = line.trim();
      if (!trimmed || trimmed.startsWith("--") || /^"ENUM_/.test(trimmed)) continue;

      const fieldMatch = trimmed.match(/^(\w+)\s*:\s*(.+?)(?:\s+[-–—]\s+(.*))?$/);
      if (fieldMatch) {
        fields.push({
          name: fieldMatch[1],
          type: mapType(fieldMatch[2].replace(/\s*[-–—]\s*$/, "").trim()),
          description: fieldMatch[3]?.trim() || ""
        });
      }
    }
  }

  // Deduplicate fields by name (keep first occurrence)
  const seenFields = new Set<string>();
  const uniqueFields: EventField[] = [];
  for (const field of fields) {
    if (!seenFields.has(field.name)) {
      seenFields.add(field.name);
      uniqueFields.push(field);
    }
  }

  return {
    name: eventConstant.replace(/\s+/g, ""),
    eventConstant: eventConstant.trim(),
    description,
    fields: uniqueFields
  };
};

// ─── Data Collection ─────────────────────────────────────

/**
 * Determine category name from HTML content.
 */
const getCategoryName = (content: string): string | null => {
  const root = parse(content);
  const h1s = root.querySelectorAll("h1");
  const name = h1s[1]?.innerText?.trim();
  if (!name?.startsWith("Category")) return null;
  return name;
};

/**
 * Get description from category page.
 */
const getCategoryDescription = (content: string): string => {
  const root = parse(content);
  const paragraphs = root.querySelectorAll("p");
  for (const p of paragraphs) {
    const text = p.innerText.trim();
    if (text && !text.startsWith("На главную") && !text.includes("BlurpSearch") && !text.includes("Связанные")) {
      return text;
    }
  }
  return "";
};

/**
 * Main data collection function.
 */
const collectAllData = (): ParsedData => {
  console.log("Scanning", DOCS_DIR);

  if (!fs.existsSync(DOCS_DIR)) {
    console.error("Error: Docs directory not found at", DOCS_DIR);
    process.exit(1);
  }

  const files = fs.readdirSync(DOCS_DIR).filter((f) => f.endsWith(".html"));
  console.log(`Found ${files.length} HTML files`);

  const categoryFiles = files.filter((f) => f.startsWith("Category"));
  console.log(`Found ${categoryFiles.length} category files`);

  const categories: CategoryInfo[] = [];
  const allEvents: EventInfo[] = [];
  const widgetMethods: Record<string, WidgetMethodInfo[]> = {};
  const widgetMethodSeen = new Set<string>(); // "WidgetClass.MethodName" for dedup

  let parseErrors = 0;
  let skipped = 0;

  // Initialize widget method arrays
  for (const cls of KNOWN_WIDGET_CLASSES) {
    widgetMethods[cls] = [];
  }

  for (const fileName of categoryFiles) {
    const content = readFile(fileName);
    const categoryName = getCategoryName(content);
    if (!categoryName) {
      skipped++;
      continue;
    }

    const libName = lowerFirst(categoryName.replace("Category", "").trim());

    // Skip meta-categories and widget super-categories
    if (META_CATEGORIES.has(libName) || WIDGET_SUPER_CATEGORIES.has(libName)) {
      console.log(`  Skipping meta-category: ${categoryName}`);
      skipped++;
      continue;
    }

    const isWidgetCategory = categoryName in WIDGET_CATEGORIES;
    const widgetClassName = WIDGET_CATEGORIES[categoryName];
    const description = getCategoryDescription(content);

    const { enumLinks, functionLinks, eventLinks } = parseCategoryLinks(content);

    console.log(
      `  ${categoryName} → ${isWidgetCategory ? `widget:${widgetClassName}` : libName}: ` +
        `${enumLinks.length}e ${functionLinks.length}f ${eventLinks.length}ev`
    );

    const category: CategoryInfo = {
      name: categoryName,
      libName,
      description,
      enums: [],
      functions: [],
      events: [],
      isWidgetCategory,
      widgetClassName
    };

    // Parse enums
    if (CONFIG.generateEnums) {
      for (const link of enumLinks) {
        try {
          const enumContent = readFile(link);
          const enumInfo = parseEnumPage(enumContent);
          if (enumInfo) category.enums.push(enumInfo);
        } catch (e) {
          console.error(`    Error parsing enum ${link}:`, (e as Error).message);
          parseErrors++;
        }
      }
    }

    // Parse functions / widget methods
    if (CONFIG.generateFunctions || CONFIG.generateWidgets) {
      for (const link of functionLinks) {
        try {
          const funcContent = readFile(link);

          if (isWidgetCategory) {
            // Try parsing as widget method first
            const method = parseWidgetMethodPage(funcContent, link);
            if (method) {
              const key = `${method.widgetClass}.${method.name}`;
              if (!widgetMethodSeen.has(key)) {
                widgetMethodSeen.add(key);
                if (!widgetMethods[method.widgetClass]) {
                  widgetMethods[method.widgetClass] = [];
                }
                widgetMethods[method.widgetClass].push(method);
              }
              continue;
            }
            // If not a widget method, try as regular function (some category pages link to both)
          }

          const funcInfo = parseFunctionPage(funcContent);
          if (funcInfo) {
            category.functions.push(funcInfo);
          }
        } catch (e) {
          console.error(`    Error parsing function ${link}:`, (e as Error).message);
          parseErrors++;
        }
      }
    }

    // Parse events
    if (CONFIG.generateEvents) {
      for (const link of eventLinks) {
        try {
          const eventContent = readFile(link);
          const eventInfo = parseEventPage(eventContent);
          if (eventInfo) {
            category.events.push(eventInfo);
            allEvents.push(eventInfo);
          }
        } catch (e) {
          console.error(`    Error parsing event ${link}:`, (e as Error).message);
          parseErrors++;
        }
      }
    }

    categories.push(category);
  }

  // Direct filesystem scan for WidgetSafe base methods
  // CategoryWidget/WidgetEffects/WidgetMembers are giant index pages, so we scan files directly
  console.log("\n  Scanning FunctionWidget*.html files for WidgetSafe methods...");
  const widgetFuncFiles = files.filter((f) => {
    for (const prefix of WIDGET_FILE_PREFIXES) {
      if (f.startsWith(prefix)) return true;
    }
    return false;
  });

  for (const fileName of widgetFuncFiles) {
    try {
      const funcContent = readFile(fileName);
      const method = parseWidgetMethodPage(funcContent, fileName);
      if (method) {
        const key = `${method.widgetClass}.${method.name}`;
        if (!widgetMethodSeen.has(key)) {
          widgetMethodSeen.add(key);
          if (!widgetMethods[method.widgetClass]) {
            widgetMethods[method.widgetClass] = [];
          }
          widgetMethods[method.widgetClass].push(method);
        }
      }
    } catch (e) {
      console.error(`    Error parsing widget file ${fileName}:`, (e as Error).message);
      parseErrors++;
    }
  }
  console.log(`  Found ${widgetFuncFiles.length} widget function files`);

  // Deduplicate events by name
  const eventMap = new Map<string, EventInfo>();
  for (const ev of allEvents) {
    if (!eventMap.has(ev.name)) {
      eventMap.set(ev.name, ev);
    }
  }

  console.log(`\nParsed ${categories.length} categories (${skipped} skipped, ${parseErrors} errors)`);

  return {
    categories,
    events: Array.from(eventMap.values()),
    widgetMethods
  };
};

// ─── Lua Generation ──────────────────────────────────────

/**
 * Generate Lua enum annotation block.
 */
const generateEnumBlock = (enumInfo: EnumInfo): string[] => {
  const lines: string[] = [];
  if (enumInfo.description) {
    lines.push(`--- ${enumInfo.description}`);
  }

  for (const val of enumInfo.values) {
    if (val.description) {
      lines.push(`--- ${val.description}`);
    }
    // String enums (ENUM_ prefix)
    if (val.name.startsWith("ENUM_")) {
      lines.push(`${val.name} = "${val.name}"`);
    } else {
      // Numeric enums - declare as typed global
      lines.push(`---@type integer`);
      lines.push(`${val.name} = nil`);
    }
  }
  lines.push("");
  return lines;
};

/**
 * Generate Lua annotation for a single function.
 */
const generateFunctionBlock = (func: FunctionInfo, libPrefix: string): string[] => {
  const lines: string[] = [];

  if (func.description) {
    lines.push(`--- ${func.description}`);
  }
  for (const param of func.params) {
    const desc = param.description ? ` ${param.description}` : "";
    lines.push(`---@param ${param.name} ${param.type}${desc}`);
  }
  if (func.returns !== "void") {
    lines.push(`---@return ${func.returns}`);
  }

  const paramNames = func.params.map((p) => p.name).join(", ");

  if (libPrefix === "_G") {
    lines.push(`function ${func.name}(${paramNames}) end`);
  } else {
    lines.push(`function ${libPrefix}.${func.name}(${paramNames}) end`);
  }
  lines.push("");
  return lines;
};

/**
 * Generate Lua annotations for a library category.
 */
const generateLibraryLua = (category: CategoryInfo): string => {
  const lines: string[] = [];
  lines.push("---@meta");
  lines.push("");

  if (category.description) {
    lines.push(`--- ${category.name}`);
    lines.push(`--- ${category.description}`);
    lines.push("");
  }

  // Enums
  if (CONFIG.generateEnums && category.enums.length > 0) {
    for (const enumInfo of category.enums) {
      lines.push(...generateEnumBlock(enumInfo));
    }
  }

  // Library class declaration (skip for widget-only categories)
  const libName = category.libName;
  const globalFunctions: FunctionInfo[] = [];
  const libFunctions: FunctionInfo[] = [];

  for (const func of category.functions) {
    if (func.library === "_G") {
      globalFunctions.push(func);
    } else {
      libFunctions.push(func);
    }
  }

  // Declare library if there are library functions
  if (libFunctions.length > 0) {
    lines.push(`---@class ${libName}Lib`);
    lines.push(`${libName} = {}`);
    lines.push("");

    for (const func of libFunctions) {
      lines.push(...generateFunctionBlock(func, libName));
    }
  }

  // Global functions
  for (const func of globalFunctions) {
    lines.push(...generateFunctionBlock(func, "_G"));
  }

  // Events (as string constants for reference)
  if (CONFIG.generateEvents && category.events.length > 0) {
    lines.push("-- Events");
    lines.push("");
    for (const event of category.events) {
      if (event.description) {
        lines.push(`--- ${event.description}`);
      }
      lines.push(`${event.name} = "${event.eventConstant}"`);
      lines.push("");
    }
  }

  return lines.join("\n");
};

/**
 * Generate Lua annotation for a widget method.
 */
const generateWidgetMethodBlock = (method: WidgetMethodInfo, className: string): string[] => {
  const lines: string[] = [];

  if (method.description) {
    lines.push(`--- ${method.description}`);
  }
  for (const param of method.params) {
    const desc = param.description ? ` ${param.description}` : "";
    lines.push(`---@param ${param.name} ${param.type}${desc}`);
  }
  if (method.returns !== "void") {
    lines.push(`---@return ${method.returns}`);
  }

  const paramNames = method.params.map((p) => p.name).join(", ");
  lines.push(`function ${className}:${method.name}(${paramNames}) end`);
  lines.push("");
  return lines;
};

/**
 * Generate widgets.lua with all widget classes and inheritance.
 */
const generateWidgetsLua = (widgetMethods: Record<string, WidgetMethodInfo[]>): string => {
  const lines: string[] = [];
  lines.push("---@meta");
  lines.push("");
  lines.push("--- Widget types for Allods Online Lua API");
  lines.push("--- Each widget class inherits from WidgetSafe (base type)");
  lines.push("");

  // Order: WidgetSafe first, then children sorted alphabetically
  const classOrder = ["WidgetSafe", "EditBase"];
  const remaining = Object.keys(WIDGET_HIERARCHY)
    .filter((c) => !classOrder.includes(c))
    .sort();
  classOrder.push(...remaining);

  for (const className of classOrder) {
    const parent = WIDGET_HIERARCHY[className];
    const methods = widgetMethods[className] || [];

    // Skip classes with no methods (unless base)
    if (methods.length === 0 && className !== "WidgetSafe") continue;

    if (parent) {
      lines.push(`---@class ${className} : ${parent}`);
    } else {
      lines.push(`---@class ${className}`);
    }
    lines.push(`local ${className} = {}`);
    lines.push("");

    for (const method of methods) {
      lines.push(...generateWidgetMethodBlock(method, className));
    }
  }

  return lines.join("\n");
};

/**
 * Generate _event_handlers.lua with RegisterEventHandler overloads.
 * Each event gets an inline data class + overload.
 */
const generateEventHandlersLua = (events: EventInfo[]): string => {
  const lines: string[] = [];
  lines.push("---@meta");
  lines.push("");
  lines.push("--- Event handler overloads for common.RegisterEventHandler");
  lines.push("--- Each overload specifies the exact event data type for a given event name");
  lines.push("");

  // Sort events alphabetically for consistency
  const sorted = [...events].sort((a, b) => a.name.localeCompare(b.name));

  // Generate data classes for events with fields
  for (const event of sorted) {
    const className = `${event.name}_Data`;

    if (event.description) {
      lines.push(`--- ${event.description}`);
    }
    lines.push(`---@class ${className}`);
    for (const field of event.fields) {
      const desc = field.description ? ` ${field.description}` : "";
      lines.push(`---@field ${field.name} ${field.type}${desc}`);
    }
    lines.push("");
  }

  // Generate overloads
  lines.push("--- Registers an event handler for the specified event.");
  lines.push("--- The handler function receives event-specific data as its first parameter.");
  for (const event of sorted) {
    const className = `${event.name}_Data`;
    lines.push(
      `---@overload fun(handler: fun(params: ${className}), event: "${event.eventConstant}", filter?: table, registerPersonal?: boolean)`
    );
  }

  // Base function declaration
  lines.push("---@param eventFunction function handler function");
  lines.push("---@param sysEventName string event name");
  lines.push("---@param filter? table event filter or nil");
  lines.push("---@param registerPersonal? boolean auto-activate personalEvents (default true)");
  lines.push("function common.RegisterEventHandler(eventFunction, sysEventName, filter, registerPersonal) end");
  lines.push("");

  // Also add UnRegisterEventHandler with matching overloads
  lines.push("--- Unregisters an event handler. Parameters must match those used during registration.");
  lines.push("---@param eventFunction function handler function to unregister");
  lines.push("---@param sysEventName string event name");
  lines.push("---@param filter? table event filter or nil");
  lines.push("function common.UnRegisterEventHandler(eventFunction, sysEventName, filter) end");
  lines.push("");

  return lines.join("\n");
};

// ─── JSON Generation ─────────────────────────────────────

const generateJson = (data: ParsedData): void => {
  const jsonPath = path.join(JSON_DIR, "categories.json");
  fs.writeFileSync(jsonPath, JSON.stringify(data, null, 2), "utf-8");
  console.log(`Written JSON: ${jsonPath}`);
};

// ─── Main ────────────────────────────────────────────────

const main = () => {
  const data = collectAllData();

  fs.mkdirSync(OUT_DIR, { recursive: true });
  fs.mkdirSync(JSON_DIR, { recursive: true });

  // JSON
  if (CONFIG.generateJson) {
    generateJson(data);
  }

  // Library Lua files
  let libCount = 0;
  for (const category of data.categories) {
    if (category.isWidgetCategory) continue;

    // Skip empty categories
    if (category.functions.length === 0 && category.enums.length === 0 && category.events.length === 0) {
      continue;
    }

    const luaContent = generateLibraryLua(category);
    const luaPath = path.join(OUT_DIR, `${category.libName}.lua`);
    fs.writeFileSync(luaPath, luaContent, "utf-8");
    libCount++;
  }
  console.log(`Written ${libCount} library Lua files to ${OUT_DIR}/`);

  // Widgets Lua
  if (CONFIG.generateWidgets) {
    const widgetContent = generateWidgetsLua(data.widgetMethods);
    const widgetPath = path.join(OUT_DIR, "widgets.lua");
    fs.writeFileSync(widgetPath, widgetContent, "utf-8");
    console.log(`Written widgets.lua`);
  }

  // Event handlers Lua
  if (CONFIG.generateEventHandlers) {
    const eventContent = generateEventHandlersLua(data.events);
    const eventPath = path.join(OUT_DIR, "_event_handlers.lua");
    fs.writeFileSync(eventPath, eventContent, "utf-8");
    console.log(`Written _event_handlers.lua with ${data.events.length} event overloads`);
  }

  // Summary
  let totalEnums = 0,
    totalFunctions = 0,
    totalEvents = 0,
    totalWidgetMethods = 0;
  for (const cat of data.categories) {
    totalEnums += cat.enums.length;
    totalFunctions += cat.functions.length;
    totalEvents += cat.events.length;
  }
  for (const [cls, methods] of Object.entries(data.widgetMethods)) {
    totalWidgetMethods += methods.length;
  }
  console.log(`\nTotal: ${totalEnums} enums, ${totalFunctions} functions, ${totalEvents} events, ${totalWidgetMethods} widget methods`);
};

main();
