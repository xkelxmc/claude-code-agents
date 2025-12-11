# Claude Code Agents Plugin

Personal collection of Claude Code agents and commands. Focused on JavaScript/TypeScript development.

## Structure

```
claude-code-agents/
├── .claude-plugin/
│   ├── marketplace.json    # Marketplace: claude-code-agents
│   └── plugin.json         # Plugin: xkelxmc-plugin
├── agents/                 # 12 custom agents
├── commands/               # 2 slash commands
├── CHANGELOG.md
└── CLAUDE.md
```

## Agents

| Agent | Model | Color | Purpose |
|-------|-------|-------|---------|
| api-documenter | sonnet | blue | OpenAPI specs, Postman, gRPC, WebSocket, webhooks |
| architect-review | sonnet | purple | Architecture review with risk assessment, DDD |
| code-explainer | sonnet | cyan | Explain code with depth levels, ASCII diagrams |
| code-reviewer | sonnet | red | Security, performance, robustness, accessibility |
| debugger | sonnet | yellow | JS/TS debugging, React/Node errors, async issues |
| docs-architect | sonnet | blue | Long-form technical documentation, onboarding |
| docs-strategist | sonnet | magenta | Documentation strategy, README, CHANGELOG |
| dx-optimizer | haiku | green | Developer experience improvements |
| svg-diagram-generator | sonnet | cyan | SVG diagrams (flowcharts, architecture, ERD) |
| task-tracker | sonnet | green | Task progress tracking in .md files |
| test-automator | haiku | orange | Jest, Vitest, Playwright, Testing Library |
| tutorial-engineer | haiku | cyan | Step-by-step tutorials |

## Commands

- `/explain [target]` - Explain code, file, or concept
- `/review [target]` - Code review with security, performance, robustness checklist

## Development Workflow

After making changes to agents or commands:

```bash
# Uninstall current version
/plugin uninstall xkelxmc-plugin@claude-code-agents

# Install updated version
/plugin install xkelxmc-plugin@claude-code-agents

# Restart Claude Code to apply changes
```

## Adding New Agents

1. Create `agents/{name}.md` with frontmatter:
   ```yaml
   ---
   name: agent-name
   description: One-line description with **Use when** triggers and **DO NOT use for** exclusions
   model: sonnet|haiku|opus
   color: red|green|blue|yellow|purple|cyan|magenta|orange
   ---
   ```
2. Add agent prompt/instructions below frontmatter
3. Reinstall plugin

## Adding New Commands

1. Create `commands/{name}.md` with frontmatter:
   ```yaml
   ---
   description: What this command does
   allowed-tools:
     - Read
     - Grep
     - Glob
   argument-hint: "[optional args description]"
   ---
   ```
2. Add command prompt below frontmatter
3. Reinstall plugin

## Sources

- Original user agents from `~/.claude/agents/`
- Forked plugin agents from [wshobson/agents](https://github.com/wshobson/agents)
