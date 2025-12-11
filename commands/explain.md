---
description: Explain code, architecture, or concepts in detail
allowed-tools:
  - Read
  - Grep
  - Glob
  - Task
  - WebSearch
argument-hint: "[file-path, function-name, or concept]"
---

# Code Explanation

Explain: `$ARGUMENTS`

## Analysis Approach

### If file/function provided:
1. Read the code completely
2. Identify the purpose and context
3. Break down into logical sections
4. Explain data flow and dependencies

### If concept/question provided:
1. Research if needed (WebSearch for latest info)
2. Provide clear explanation
3. Show examples from codebase if relevant

## Explanation Structure

```markdown
## [Name/Topic]

### Purpose
What does this code/concept do? Why does it exist?

### How It Works
Step-by-step breakdown:
1. First, it...
2. Then, it...
3. Finally, it...

### Key Components
- **[Component A]**: Description
- **[Component B]**: Description

### Data Flow
```
Input → Processing → Output
```

### Dependencies
- Uses: [library/module]
- Used by: [other modules]

### Example Usage
```typescript
// Example code
```

### Related Files
- `path/to/related.ts` - Description
- `path/to/another.ts` - Description

### Common Patterns
- Pattern used here: [name]
- Why this pattern: [reason]

### Gotchas / Edge Cases
- Watch out for...
- Don't forget to...
```

## Depth Levels

Adjust explanation depth based on context:

- **Quick**: 2-3 sentences, high-level purpose
- **Standard**: Full breakdown with examples
- **Deep**: Include internals, performance considerations, history

Default to **Standard** unless specified.
