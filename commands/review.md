---
description: Code review with security, performance, and best practices analysis
allowed-tools:
  - Read
  - Grep
  - Glob
  - Bash
  - Task
argument-hint: "[file-path or git-diff]"
---

# Code Review

Perform comprehensive code review for: `$ARGUMENTS`

If no argument provided, review staged changes using `git diff --cached` or recent changes.

## How to Get the Code

- **File path given**: Read the file
- **"staged changes"**: Run `git diff --cached`
- **"recent changes"**: Run `git diff HEAD~1`
- **PR number**: Run `gh pr diff {number}`

## Dependency Audit

If dependencies changed (package.json, lockfiles), run security audit:

| Lockfile | Command |
|----------|---------|
| `pnpm-lock.yaml` | `pnpm audit` |
| `package-lock.json` | `npm audit` |
| `yarn.lock` | `yarn audit` |

Report any critical/high vulnerabilities as CRITICAL issues.

## Review Checklist

### Security (CRITICAL)
- [ ] No hardcoded secrets, API keys, or credentials
- [ ] Input validation on user data
- [ ] SQL/NoSQL injection prevention
- [ ] XSS prevention (proper escaping)
- [ ] CSRF protection where needed
- [ ] Proper authentication/authorization checks
- [ ] No sensitive data in logs
- [ ] OWASP Top 10 compliance

### Performance
- [ ] No N+1 query patterns
- [ ] Proper indexing considerations
- [ ] No memory leaks (event listeners, subscriptions)
- [ ] Efficient algorithms (avoid O(n²) where possible)
- [ ] Proper caching where applicable
- [ ] No unnecessary re-renders (React)
- [ ] Async patterns where appropriate

### Robustness
- [ ] Edge cases handled (null, undefined, empty arrays, 0, negative)
- [ ] Boundary conditions checked
- [ ] No infinite recursion/loop risks
- [ ] Race conditions considered
- [ ] Graceful handling of concurrent access

### Code Quality
- [ ] Clear naming conventions
- [ ] No dead/unreachable code
- [ ] Proper error handling
- [ ] Type safety (no `any` abuse)
- [ ] Single responsibility principle
- [ ] DRY - no excessive duplication

### Accessibility (Frontend)
- [ ] Semantic HTML elements
- [ ] ARIA labels where needed
- [ ] Keyboard navigation support
- [ ] Color contrast considerations

### Testing
- [ ] Edge cases considered
- [ ] Error paths handled
- [ ] Test coverage adequate

## Severity Levels

- **CRITICAL**: Security vulnerabilities, data loss, crashes
- **ERROR**: Bugs, incorrect logic, missing error handling
- **WARNING**: Performance issues, code smells
- **INFO**: Style, minor improvements

## Output Format

```markdown
## Code Review: [file/component name]

### Summary
[1-2 sentence overview]

### Critical Issues
- **[CRITICAL]** Line X: Issue and fix

### Errors
- **[ERROR]** Line X: Issue and fix

### Warnings
- **[WARNING]** Line X: Issue and fix

### Suggestions
- **[INFO]** Line X: Suggestion

### Good Practices
- What's done well

### Verdict
**READY** | **MINOR CHANGES** | **SIGNIFICANT CHANGES** | **DO NOT MERGE**
```
