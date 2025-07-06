#!/usr/bin/env bash
# Execute SuperClaude tools for the Gemini CLI.
#
# The CLI calls this script with the tool name as the first argument and
# a JSON payload on stdin containing any parameters. This implementation
# attempts to invoke a local `superclaude` command (or the command
# specified via the SUPERCLAUDE_CLI environment variable) and returns the
# command output as a JSON object for Gemini to process.

set -euo pipefail

tool_name="${1:-}"
if [[ -z "$tool_name" ]]; then
  echo "Usage: $0 <tool-name>" >&2
  exit 1
fi

# Read parameters from stdin. We try to parse an `arguments` string using jq
# if available, otherwise fall back to a basic regex.
stdin_payload="$(cat)"

if command -v jq >/dev/null 2>&1; then
  tool_args="$(printf '%s' "$stdin_payload" | jq -r '.arguments // ""')"
else
  tool_args="$(printf '%s' "$stdin_payload" | sed -n 's/.*"arguments"[[:space:]]*:[[:space:]]*"\(.*\)".*/\1/p')"
fi

cli_cmd="${SUPERCLAUDE_CLI:-superclaude}"

if ! command -v "$cli_cmd" >/dev/null 2>&1; then
  printf '{"error":"%s not found"}\n' "$cli_cmd"
  exit 127
fi

# Split the argument string respecting quotes
IFS=' ' read -r -a extra_args <<<"$tool_args"

set +e
cmd_output=$("$cli_cmd" "$tool_name" "${extra_args[@]}" 2>&1)
exit_code=$?
set -e

# Escape output as JSON string using Python for reliability
json_output=$(python3 -c 'import json,sys; print(json.dumps(sys.stdin.read()))' <<<"$cmd_output")

printf '{"exitCode":%d,"output":%s}\n' "$exit_code" "$json_output"
exit $exit_code
