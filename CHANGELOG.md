# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.2.1] - 2026-01-18

### Changed
- **Improved enforce-bun hook** with new Claude Code hooks API
  - Now uses JSON output with `permissionDecision: "deny"` instead of exit code 2
  - Ignores npm/node/npx inside quoted strings (fixes false positives like `echo "npm install"`)
  - Better guidance message for agents: suggests `force-npm` for package info instead of curl
- Removed `ts-lsp` plugin (use official `typescript-lsp@claude-plugins-official` instead)

### Fixed
- Hook no longer blocks commands that just mention npm in strings

## [1.1.0] - 2025-12-23

### Added
- **New plugin: `ts-lsp`** - TypeScript/JavaScript LSP support
  - Uses [vtsls](https://github.com/yioneko/vtsls) (faster than typescript-language-server)
  - Wraps VS Code's TypeScript extension for identical experience
  - Supports `.ts`, `.tsx`, `.js`, `.jsx`, `.mts`, `.cts`, `.mjs`, `.cjs`
  - Install: `/plugin install ts-lsp@claude-code-agents`
  - Note: Requires [tweakcc](https://github.com/Piebald-AI/tweakcc) patch due to Claude Code [LSP bug](https://github.com/anthropics/claude-code/issues/14803)

### Changed
- Refactored to multi-plugin repository structure
  - `plugins/main/` - xkelxmc-plugin (agents, commands, hooks)
  - `plugins/ts-lsp/` - TypeScript LSP plugin
  - Marketplace now supports multiple plugins from single repository
- Updated plugin metadata with author info, homepage, keywords
- Bumped xkelxmc-plugin version to 1.1.0

## [1.0.0] - 2025-12-11

### Added
- Initial plugin setup with marketplace configuration
- 12 custom agents:
  - `api-documenter` - API documentation specialist (OpenAPI, Postman collections)
  - `architect-review` - Software architecture reviewer (DDD, microservices, clean architecture)
  - `code-explainer` - Code and concept explainer
  - `code-reviewer` - Unified code review expert (security, performance, quality)
  - `debugger` - Debugging specialist for errors and test failures
  - `docs-architect` - Technical documentation architect (long-form docs, ebooks)
  - `documentation-expert` - General documentation specialist
  - `dx-optimizer` - Developer Experience optimizer
  - `svg-diagram-generator` - SVG diagram creator (flowcharts, architecture diagrams)
  - `task-tracker` - Task documentation and progress tracking
  - `test-automator` - Test automation engineer (TDD, CI/CD integration)
  - `tutorial-engineer` - Tutorial and educational content creator
- 2 slash commands:
  - `/explain` - Explain code, architecture, or concepts
  - `/review` - Code review with security and performance analysis
- Color coding for all agents

### Sources
- User agents migrated from `~/.claude/agents/`
- Plugin agents forked from [wshobson/agents](https://github.com/wshobson/agents) (claude-code-workflows marketplace)
- Commands migrated from `~/.claude/commands/`

### Changed
- Merged two `code-reviewer` agents into one unified version
- Removed duplicate `debugger` agents (kept sonnet model version)
- Flattened directory structure (removed subdirectories in `agents/`)
