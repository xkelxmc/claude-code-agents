# Claude Code Agents Plugin

Personal collection of Claude Code agents and commands.

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
| api-documenter | sonnet | blue | OpenAPI specs, Postman collections, SDK docs |
| architect-review | sonnet | purple | Architecture review, DDD, microservices |
| code-explainer | sonnet | cyan | Explain code and concepts |
| code-reviewer | sonnet | red | Security, performance, code quality review |
| debugger | sonnet | yellow | Root cause analysis, bug fixing |
| docs-architect | sonnet | blue | Long-form technical documentation |
| documentation-expert | sonnet | magenta | General documentation strategy |
| dx-optimizer | haiku | green | Developer experience improvements |
| svg-diagram-generator | sonnet | cyan | SVG diagrams (flowcharts, architecture) |
| task-tracker | sonnet | green | Task progress tracking in .md files |
| test-automator | haiku | orange | Test automation, TDD, CI/CD |
| tutorial-engineer | haiku | cyan | Step-by-step tutorials |

## Commands

- `/explain [target]` - Explain code, file, or concept
- `/review [target]` - Code review with checklist

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
   description: When to use this agent...
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
