# 🚀 A Fast Configurable Salesforce Apex Formatter

![Release](https://img.shields.io/github/v/release/xixiaofinland/afmt)
![License](https://img.shields.io/github/license/xixiaofinland/afmt)
![Stars](https://img.shields.io/github/stars/xixiaofinland/afmt?style=social)

<div align="center">
  <img src="md/afmt-logo.png" alt="afmt_logo" width="300"/>
</div>
<br>

## Table of Contents
- [📘 Introduction](#-introduction)
- [🌐 Playground](#-playground)
- [⭐ Features](#-features)
- [✨ vs. Prettier Apex](#-vs-prettier-apex)
- [📥 Installation](#-installation)
- [💻 Usage](#-usage)
- [🔧 Configuration](#-configuration)
- [❓ FAQ](#-faq)
- [🤝 Contribution](#-contribution)

<br>

## 📘 Introduction

`afmt` (Apex formatting tool) is written in Rust 🦀 and leverages the [tree-sitter sfapex parser](https://github.com/aheber/tree-sitter-sfapex).

> [!NOTE]
> We're looking for contributors to help create a VSCode plugin! Feel free to join the [discussion](https://github.com/xixiaofinland/afmt/issues/83)!

<br>

## 🌐 Playground

Try the browser version [playground](https://xixiaofinland.github.io/afmt-web-service/), and its source code [here](https://github.com/xixiaofinland/afmt-web-service).

## ⭐ Features

- **Performant**
- **Configurable:** via `.afmt.toml`.
- **Standalone:** CLI with no dependencies.
- **Open Source**

<br>

## ✨ vs. Prettier Apex

While both `afmt` and Prettier Apex aim to format Salesforce Apex code, they differ fundamentally in their design philosophies:

- **Prettier Apex:** Maintains an opinionated approach with limited customization to ensure consistency.
- **afmt:** Focuses on extensibility, offering more configuration options to cater to diverse user preferences.

This means `afmt` will progressively introduce more configuration options, addressing user customization needs that Prettier's design intentionally avoids.

### Other Highlights:

| Feature          | afmt                      | Prettier Apex               |
|------------------|---------------------------|-----------------------------|
| **Maturity**     | Brand new                 | Battle tested for years     |
| **Dependencies** | N/A (standalone binary)   | Node.js + Prettier package  |
| **Performance**  | Fast (Rust)               | Relatively slower (Node.js) |
| **Parser**       | sfapex (C / Open Source)  | Jorje (Java / Closed Source)|
| **Open Source**  | Yes                       | Yes                         |
<br>

## 📥 Installation

### 1. Script Install

#### For Linux/MacOS

```bash
curl -sL https://raw.githubusercontent.com/xixiaofinland/afmt/main/scripts/install-afmt.sh | bash
```

#### For Windows (PowerShell)

```ps1
iwr -useb https://raw.githubusercontent.com/xixiaofinland/afmt/main/scripts/install-afmt.ps1 | iex
```

> [!NOTE]
> If you see an error like "This script contains malicious content and has been
> blocked by your antivirus software", it means Microsoft Defender flagged it
> for downloading and executing content from the internet. To proceed, either
> lower Defender’s protection or break the script into smaller steps:

```ps1
# Step 1: Review the script manually
Invoke-WebRequest -Uri https://raw.githubusercontent.com/xixiaofinland/afmt/main/scripts/install-afmt.ps1 -OutFile install-afmt.ps1
notepad install-afmt.ps1  # Inspect the content

# Step 2: Run after trust
powershell -ExecutionPolicy Bypass -File install-afmt.ps1
```

<br>

### 2. Cargo Install

`afmt` is published in creates.io [here](https://crates.io/crates/sf-afmt).
Run cmd below if you have the `Cargo` tool.

```bash
cargo install sf-afmt
```

<br>

### 3. Manual Download

Visit the [release page](https://github.com/xixiaofinland/afmt/releases/latest) and download the appropriate binary for your operating system (Linux, macOS, or Windows).

<br>

## 💻 Usage

Create a `file.cls` file with valid Apex code.

### Dry Run:

Run `afmt ./file.cls` to preview the formatting result.

```bash
> afmt ./file.cls
Result 0: Ok
global class PluginDescribeResult {
    {
        [SELECT FIELDS(STANDARD) FROM Organization LIMIT 1];
    }
}
```

### Format and Write:

Run `afmt -w ./file.cls` to format the file and overwrite it with the
   formatted code.

```bash
> afmt -w ./file.cls
Formatted content written back to: ./file.cls
Afmt completed successfully.
```
<br>

## 🔧 Configuration

`afmt` reads configuration from a `.afmt.toml` file passed with the `-c` flag:

```bash
afmt -c .afmt.toml ./file.cls
```

### All options

```toml
# Maximum line width before wrapping (0 = use default of 80)
max_width = 80

# Indentation size in spaces
indent_size = 4

# Preserve developer-chosen vertical layout.
# When true, any argument list, parameter list, array initializer, or map
# initializer that was written multiline in the source stays multiline in the
# output. Only horizontal formatting (spacing, indentation) is corrected.
preserve_newlines = false

# Normalise JavaDoc comments (/** ... */) to standard alignment.
# When false (default), block comment content is preserved verbatim.
# When true, each line is trimmed and prefixed with " * ", the opening
# /** is placed on its own line, and the closing */ is normalised to " */".
format_doc_comments = false
```

### `preserve_newlines`

By default `afmt` (like Prettier) may collapse or reflow multiline constructs
to fit within `max_width`. With `preserve_newlines = true` the formatter
respects the line breaks the developer already placed:

```apex
// source — argument list split across lines
result = someMethod(
    argumentOne,
    argumentTwo,
    argumentThree
);

// preserve_newlines = false → may collapse to one line if it fits
result = someMethod(argumentOne, argumentTwo, argumentThree);

// preserve_newlines = true → multiline layout is kept
result = someMethod(
    argumentOne,
    argumentTwo,
    argumentThree
);
```

Affected constructs: argument lists, parameter lists, array/set/map
initializers, method chains, binary expressions, and `implements` clauses.

### `format_doc_comments`

By default block comment content (including JavaDoc `/**`) is preserved
verbatim — only its position in the file is adjusted. With
`format_doc_comments = true` the formatter normalises JavaDoc comments to
standard alignment:

```apex
// source — non-standard indentation
/**
* @description Does something.
* @param x The value.
*/

// format_doc_comments = false (default) → preserved as-is
/**
* @description Does something.
* @param x The value.
*/

// format_doc_comments = true → normalised
/**
 * @description Does something.
 * @param x The value.
 */
```

### `// afmt:ignore`

Place `// afmt:ignore` on the line immediately before any statement or
declaration to preserve that node's original source text exactly as written,
skipping all formatting for it:

```apex
// afmt:ignore
List<Map<String, String>> defs = new List<Map<String, String>> {
        'key' => builder.listOfRules()
                    .add(builder.rule('A').query(SObjectA.Id).build())
                    .add(builder.rule('B').query(SObjectB.Id).build())
};
```

afmt will format the surrounding code normally but leave the ignored node
untouched. The `// afmt:ignore` comment itself is preserved in the output.

<br>

## ❓ FAQ

- "TLTR, what features afmt has?" Run `afmt -h`.
- "How do I set up afmt in VSCode?"
  [Setup in VSCode](./md/VSCode_Setup.md)

- "Can afmt formats exactly the same as Prettier Apex?"
No.

<br>

## 🤝 Contribution

We greatly value contributions! You can help by reporting [issues](https://github.com/xixiaofinland/afmt/issues) or submitting
PRs.

### PR Contribution Guidelines

Scenarios (e.g., new features, bug fixes) must be covered by tests, and `cargo test` passes.
Refer to `*.in` (before format) and `*.cls` (after format) files in the [test folder](./tests/static).

Also, our CI [pipeline](.github/workflows/pr-ci-merge-main.yml) ensures high-quality contributions.

CI Rules:

1. Use [conventional commit](https://www.conventionalcommits.org/en/v1.0.0/#summary) for commit messages. Example: the project [commit history](https://github.com/xixiaofinland/afmt/commits/)
2. Ensure code passes [rustfmt](https://github.com/rust-lang/rustfmt) and [clippy](https://github.com/rust-lang/rust-clippy): `cargo fmt -- --check` and `cargo clippy`
3. Run and pass all unit tests: `cargo test --all-features`
4. Pass battle tests by running `afmt` on a list of [popular Apex repos](./tests/battle_test/repos.txt)
