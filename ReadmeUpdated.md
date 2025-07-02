# Gemini CLI Integration Guide

This guide explains how to incorporate the provided SuperClaude files so that the [Gemini CLI](https://github.com/google-gemini/gemini-cli) can discover and use them automatically.

## 1. Place Files in Your Project

Copy the following files and directories into the root of your project (the same location where you run `gemini`):

```
.gemini/settings.json
.gemini/superclaude-tools.json
GEMINI.md
bin/get_superclaude_tools.sh
bin/run_superclaude_tool.sh
```

The `.gemini` directory holds project settings and the tool specification. The `bin` scripts implement discovery and execution for SuperClaude commands.

## 2. Verify Script Permissions

Ensure both scripts are executable:

```bash
chmod +x bin/get_superclaude_tools.sh bin/run_superclaude_tool.sh
```

## 3. How It Works

- `settings.json` tells the Gemini CLI where to find the context file and which scripts to use for tool discovery and execution.
- `superclaude-tools.json` lists all available tools in [OpenAI function](https://platform.openai.com/docs/guides/function-calling) format.
- `get_superclaude_tools.sh` outputs this JSON so the CLI can load it.
- `run_superclaude_tool.sh` is invoked when Gemini chooses a tool. It executes the local `superclaude` command (or the command specified in the `SUPERCLAUDE_CLI` environment variable) and returns the result as JSON.
- `GEMINI.md` contains project context that will be loaded by the CLI.

## 4. Optional Environment Variables

- `SUPERCLAUDE_TOOLS_FILE` – override the location of `superclaude-tools.json`.
- `SUPERCLAUDE_CLI` – specify an alternate command for running SuperClaude tools.

## 5. Running Gemini

With the files in place, start the CLI from your project root:

```bash
gemini
```

The CLI will read `.gemini/settings.json`, load `GEMINI.md` as context, discover the SuperClaude tools via `bin/get_superclaude_tools.sh`, and call tools through `bin/run_superclaude_tool.sh` when needed.

## 6. Updating Tools

If you add or modify SuperClaude commands, update `superclaude-tools.json` accordingly. The discovery script simply outputs this file, so the CLI will pick up changes the next time it runs.

