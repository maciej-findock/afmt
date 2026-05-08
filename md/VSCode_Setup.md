# Setting up afmt in VSCode

Two approaches are available. The first integrates with VSCode's built-in
**Format Document** command; the second uses VSCode **Tasks** for an explicit
trigger.

---

## Approach 1: Format Document (recommended)

This approach hooks `afmt` into VSCode's standard formatter so that
**Shift+Alt+F** (or **Format Document** from the Command Palette) formats the
current Apex file in place.

### Prerequisites

1. **Download the afmt binary** for your OS from the
   [releases page](https://github.com/maciej-findock/afmt/releases/latest).

2. **Make `afmt` available on your `PATH`** by creating a symlink in a
   directory that is already on your `PATH`, for example:
   ```bash
   ln -s /path/to/downloaded/afmt ~/.local/bin/afmt
   ```
   Confirm it works:
   ```bash
   afmt --version
   ```

3. **Install the [Custom Local Formatters](https://marketplace.visualstudio.com/items?itemName=jkillian.custom-local-formatters)
   VSCode extension.**

### Configure the formatter

Place an `.afmt.toml` config file in your project root (see
[Configuration](../README.md#-configuration)), then open your VSCode
**settings.json** (`Ctrl+Shift+P` → *Preferences: Open User Settings (JSON)*)
and add:

```json
"customLocalFormatters.formatters": [
  {
    "command": "afmt -c .afmt.toml -",
    "languages": ["apex"]
  }
],
"[apex]": {
  "editor.defaultFormatter": "jkillian.custom-local-formatters"
}
```

The extension runs commands from the workspace root, so `.afmt.toml` resolves
correctly as a relative path.

### Verify

Open any `.cls` file and press **Shift+Alt+F**. The file should be formatted
in place.

---

## Approach 2: VSCode Task (manual trigger)

Use this if you prefer an explicit keybinding or do not want to install an
additional extension.

### Define a task

Create or edit `.vscode/tasks.json` in your project:

```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Format with afmt",
      "type": "shell",
      "command": "afmt -w ${file}",
      "presentation": {
        "reveal": "never",
        "panel": "dedicated"
      },
      "problemMatcher": []
    }
  ]
}
```

> **Note:** Add `-c /absolute/path/to/.afmt.toml` if you use a config file.

### Run the task

Open the Command Palette (`Ctrl+Shift+P` / `Cmd+Shift+P`) and select
**Tasks: Run Task** → **Format with afmt**.

### Assign a keybinding (optional)

Add to `keybindings.json` (`Ctrl+Shift+P` → *Preferences: Open Keyboard
Shortcuts (JSON)*):

```json
{
  "key": "ctrl+alt+f",
  "command": "workbench.action.tasks.runTask",
  "args": "Format with afmt"
}
```
