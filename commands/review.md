---
description: Code review with security, performance, and best practices analysis
allowed-tools:
  - Read
  - Grep
  - Glob
  - Task
  - WebSearch
argument-hint: "[file-path or git-diff]"
---

# Code Review

Perform comprehensive code review for: `$ARGUMENTS`

If no argument provided, review staged changes using `git diff --cached` or recent changes.

## Review Checklist

### 1. Security
- [ ] No hardcoded secrets, API keys, or credentials
- [ ] Input validation on user data
- [ ] SQL/NoSQL injection prevention
- [ ] XSS prevention (proper escaping)
- [ ] CSRF protection where needed
- [ ] Proper authentication/authorization checks
- [ ] No sensitive data in logs

### 2. Performance
- [ ] No N+1 query patterns
- [ ] Proper indexing considerations
- [ ] No memory leaks (event listeners, subscriptions)
- [ ] Efficient algorithms (avoid O(n²) where possible)
- [ ] Proper caching where applicable
- [ ] No unnecessary re-renders (React)

### 3. Code Quality
- [ ] Clear naming conventions
- [ ] No dead/unreachable code
- [ ] Proper error handling
- [ ] Type safety (no `any` abuse)
- [ ] Single responsibility principle
- [ ] DRY - no excessive duplication

### 4. Testing
- [ ] Edge cases considered
- [ ] Error paths handled
- [ ] Test coverage adequate

### 5. Documentation
- [ ] Complex logic commented
- [ ] Public APIs documented
- [ ] README updated if needed

## Output Format

```markdown
## Code Review: [file/component name]

### Summary
[1-2 sentence overview]

### Critical Issues
- **[SECURITY]** Description...
- **[BUG]** Description...

### Suggestions
- **[PERF]** Consider...
- **[STYLE]** Recommend...

### Good Practices
- Well-structured error handling
- Clear type definitions

### Verdict
[ ] Ready to merge
[ ] Needs minor changes
[ ] Needs significant changes
```
