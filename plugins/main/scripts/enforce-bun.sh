#!/bin/bash

# Enforce Bun over Node.js/npm/npx
# Blocks node/npm/npx commands and suggests using bun/bunx instead
# Use force-node, force-npm, force-npx aliases to bypass

input=$(cat)
command=$(echo "$input" | jq -r '.tool_input.command // ""')

# Skip force-* prefixes
if [[ "$command" =~ force-(node|npm|npx) ]]; then
    exit 0
fi

# Remove quoted strings before checking (both single and double quotes)
# This prevents false positives like: echo "npm install" > file.txt
command_without_quotes=$(echo "$command" | sed -E "s/\"[^\"]*\"//g; s/'[^']*'//g")

# Block npm/npx/node only if it's an actual command (not inside quotes)
if [[ "$command_without_quotes" =~ (^|[[:space:]]|[\&\;\|])(node|npm|npx)[[:space:]] ]]; then
    jq -n '{
      hookSpecificOutput: {
        hookEventName: "PreToolUse",
        permissionDecision: "deny",
        permissionDecisionReason: "User prefers bun over npm/node. Rewrite: npm install/run/test → bun, npx → bunx, node → bun. For package info (npm view, npm info, npm search) use force-npm. If you REALLY need npm/node (e.g. compatibility issues), use force-npm, force-npx, or force-node."
      }
    }'
    exit 0
fi

exit 0
