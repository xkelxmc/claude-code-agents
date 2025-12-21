#!/bin/bash

# Enforce Bun over Node.js/npm/npx
# Blocks node/npm/npx commands and suggests using bun/bunx instead
# Use force-node, force-npm, force-npx aliases to bypass

# Read JSON input from stdin
input=$(cat)

# Extract the command from tool_input
command=$(echo "$input" | jq -r '.tool_input.command // ""')

# Check for node/npm/npx anywhere in command (including chained commands)
# Matches: node script.js, npm install, cd foo && npm install
# Ignores: force-node, force-npm, force-npx
if [[ "$command" =~ (^|[[:space:]]|[\&\;])node[[:space:]] ]] || \
   [[ "$command" =~ (^|[[:space:]]|[\&\;])npm[[:space:]] ]] || \
   [[ "$command" =~ (^|[[:space:]]|[\&\;])npx[[:space:]] ]]; then
    echo "Use 'bun' or 'bunx' instead. If you REALLY need node/npm/npx, use 'force-node', 'force-npm', or 'force-npx'." >&2
    exit 2  # block
fi

exit 0
