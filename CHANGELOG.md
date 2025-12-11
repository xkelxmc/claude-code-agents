# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
