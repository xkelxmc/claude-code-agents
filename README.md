# Claude Code Agents

Personal collection of Claude Code agents and commands for code review, documentation, debugging, and development workflows. Focused on JavaScript/TypeScript development.

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

After installation, restart Claude Code to load the plugins.

## Agents

| Agent | Model | Description |
|-------|-------|-------------|
| `api-documenter` | sonnet | OpenAPI specs, Postman collections, gRPC, WebSocket, webhooks |
| `architect-review` | sonnet | Architecture review with risk assessment, DDD, microservices |
| `code-explainer` | sonnet | Explain code with multiple depth levels, ASCII diagrams |
| `code-reviewer` | sonnet | Security, performance, robustness, accessibility review |
| `debugger` | sonnet | JS/TS debugging, React/Node errors, async issues |
| `docs-architect` | sonnet | Long-form technical documentation, onboarding guides |
| `docs-strategist` | sonnet | Documentation strategy, README, CHANGELOG, style guides |
| `dx-optimizer` | haiku | Developer experience improvements, tooling |
| `svg-diagram-generator` | sonnet | SVG diagrams (flowcharts, architecture, ERD) |
| `task-tracker` | sonnet | Task progress tracking in markdown files |
| `test-automator` | haiku | Jest, Vitest, Playwright, Testing Library |
| `tutorial-engineer` | haiku | Step-by-step tutorials and guides |

## Commands

| Command | Description |
|---------|-------------|
| `/explain [target]` | Explain code, file, function, or concept |
| `/review [target]` | Code review with security, performance, robustness checklist |

## Hooks

### Enforce Bun

This plugin includes a hook that enforces using Bun instead of Node.js/npm/npx:

- Blocks `node`, `npm`, `npx` commands and suggests `bun`/`bunx` alternatives
- Ignores npm/node mentions inside quoted strings (no false positives on `echo "npm install"`)
- Guides agents to use `force-npm` for package info (`npm view`, `npm search`) instead of curl

**Setup:** Add these aliases to your `~/.zshrc` or `~/.bashrc`:

```bash
alias force-node="node"
alias force-npm="npm"
alias force-npx="npx"
```

When Claude needs npm/node (e.g., `npm view react`, `npm publish`), it uses `force-npm`/`force-node`/`force-npx` to bypass the hook.

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

Create `plugins/main/agents/{name}.md`:

```yaml
---
name: agent-name
description: One-line description with **Use when** triggers and **DO NOT use for** exclusions
model: sonnet|haiku|opus
color: red|green|blue|yellow|purple|cyan|magenta|orange
---

Agent instructions here...
```

### Adding New Commands

Create `plugins/main/commands/{name}.md`:

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
