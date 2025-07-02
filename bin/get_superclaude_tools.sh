#!/usr/bin/env bash
# Output SuperClaude tool definitions for Gemini CLI
#
# The Gemini CLI invokes this script to discover available tools. We
# allow the tools file location to be overridden via the
# SUPERCLAUDE_TOOLS_FILE environment variable for flexibility.

set -euo pipefail

tools_file="${SUPERCLAUDE_TOOLS_FILE:-$(dirname "$0")/../.gemini/superclaude-tools.json}"

if [[ ! -f "$tools_file" ]]; then
  echo "Error: tools file not found: $tools_file" >&2
  exit 1
fi

cat "$tools_file"
