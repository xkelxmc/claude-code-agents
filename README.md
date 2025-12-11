# Claude Code Agents

Personal collection of Claude Code agents and commands for code review, documentation, debugging, and development workflows.

## Installation

### Add marketplace

```bash
/plugin marketplace add xkelxmc/claude-code-agents
```

### Install plugin

```bash
/plugin install xkelxmc-plugin@claude-code-agents
```

### Restart Claude Code

After installation, restart Claude Code to load the new agents and commands.

## Agents

| Agent | Model | Description |
|-------|-------|-------------|
| `api-documenter` | sonnet | OpenAPI specs, Postman collections, SDK documentation |
| `architect-review` | sonnet | Architecture review, DDD, microservices, clean architecture |
| `code-explainer` | sonnet | Explain code, concepts, and architecture |
| `code-reviewer` | sonnet | Security, performance, and code quality review |
| `debugger` | sonnet | Root cause analysis, bug fixing |
| `docs-architect` | sonnet | Long-form technical documentation, ebooks |
| `documentation-expert` | sonnet | Documentation strategy and standards |
| `dx-optimizer` | haiku | Developer experience improvements |
| `svg-diagram-generator` | sonnet | SVG diagrams (flowcharts, architecture, ERD) |
| `task-tracker` | sonnet | Task progress tracking in markdown files |
| `test-automator` | haiku | Test automation, TDD, CI/CD integration |
| `tutorial-engineer` | haiku | Step-by-step tutorials and guides |

## Commands

| Command | Description |
|---------|-------------|
| `/explain [target]` | Explain code, file, function, or concept |
| `/review [target]` | Code review with security and performance checklist |

## Usage Examples

### Agents

Agents are invoked automatically by Claude when appropriate, or you can request them explicitly:

```
Use the code-reviewer agent to check my recent changes
```

```
Use the svg-diagram-generator to visualize the authentication flow
```

```
Use the debugger agent to fix this error: [error message]
```

### Commands

```
/explain src/auth/login.ts
```

```
/review
```
(reviews staged changes)

## Development

### Local Development

After making changes to agents or commands:

```bash
# Uninstall current version
/plugin uninstall xkelxmc-plugin@claude-code-agents

# Install updated version
/plugin install xkelxmc-plugin@claude-code-agents

# Restart Claude Code
```

### Adding New Agents

Create `agents/{name}.md`:

```yaml
---
name: agent-name
description: When to use this agent...
model: sonnet|haiku|opus
color: red|green|blue|yellow|purple|cyan|magenta|orange
---

Agent instructions here...
```

### Adding New Commands

Create `commands/{name}.md`:

```yaml
---
description: What this command does
allowed-tools:
  - Read
  - Grep
  - Glob
argument-hint: "[optional args]"
---

Command prompt here...
```

## Credits

Some agents are based on or inspired by:
- [wshobson/agents](https://github.com/wshobson/agents) (claude-code-workflows)

## License

MIT License - see [LICENSE](LICENSE) for details.
