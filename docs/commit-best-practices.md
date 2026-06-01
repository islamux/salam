# Commit Best Practices Guide

## What Makes a Good Commit

### 1. Clear, Descriptive Messages
**Good:** `docs(refactor): add architecture refactoring status tracker`
**Why:** 
- Uses type prefix (`docs()`) to categorize the change
- Describes what was added (status tracker)
- Specifies the context (architecture refactoring)
- Follows imperative mood ("add" not "added")

**Bad:** `fixed stuff` or `update`
**Why:** Too vague, no context, unclear what changed

### 2. Atomic Changes
Each commit should do **one logical thing**:
- ✅ Good: One commit for adding documentation
- ✅ Good: One commit for updating existing documentation  
- ❌ Bad: Mixing documentation changes with code changes

### 3. Proper Scope
- Small, focused commits are easier to review and revert
- Large commits should be broken into logical parts
- Aim for 1-3 files changed per commit (unless it's a major refactor)

### 4. Detailed Commit Messages
Use the extended commit message format:
```
<type>(<scope>): <short summary>

<blank line>
<detailed explanation>
- Bullet points for key changes
- Context about why the change was made
- Impact on the codebase
- Any breaking changes or migration notes
```

### 5. Type Prefixes
Use consistent prefixes to categorize commits:
- `feat()`: New feature
- `fix()`: Bug fix
- `docs()`: Documentation changes
- `style()`: Formatting, missing semicolons, etc.
- `refactor()`: Code refactoring (no functional changes)
- `test()`: Adding or modifying tests
- `chore()`: Build process, dependency updates
- `perf()`: Performance improvements

### 6. Good Examples from This Project

#### Example 1: Documentation Addition
```
docs(refactor): add architecture refactoring status tracker

This commit adds comprehensive documentation about the current state
of the Phase E architecture refactoring:

- Documents that 4 out of 35 khatira pages have been converted
- Shows 31 pages remain to be converted  
- Provides clear guidance on how to continue the work
- Includes verification commands and expected benefits
- Estimates ~2,800 lines of code reduction when complete

The documentation serves as both a status tracker and a guide for
continuing the refactoring work.
```

#### Example 2: Documentation Update
```
docs(refactor): update Phase E architecture plan with current progress

This commit updates the Phase E architecture refactoring plan to reflect
current progress:

- Marks completed tasks with ✅
- Shows in-progress tasks with ⏳
- Updates time estimates
- Provides clear status indicators
```

### 7. Commit Message Structure
```
<type>(<scope>): <summary>
<BLANK LINE>
<detailed explanation>
<BLANK LINE>
<footer (if needed)>
```

### 8. Scope Examples
- `docs(refactor)` - documentation about refactoring
- `feat(auth)` - authentication feature
- `fix(api)` - API bug fix
- `style(ui)` - UI formatting changes

### 9. Writing Good Summaries
- Use imperative mood: "add feature" not "added feature"
- Keep under 50 characters when possible
- Be specific: "add user profile page" not "add page"
- Reference issues when applicable: "fix #123"

### 10. Writing Good Descriptions
- Explain **what** changed
- Explain **why** it changed
- Explain **how** it affects the codebase
- Mention any breaking changes
- Reference related issues or commits

## Benefits of Good Commits

1. **Easier Code Review** - Reviewers understand changes quickly
2. **Better History** - `git log` and `git blame` are more useful
3. **Simpler Debugging** - Easy to find when/why something changed
4. **Better Collaboration** - Team members understand context
5. **Easier Reverting** - Small, focused commits are safer to revert
6. **Automated Tools** - Better integration with CI/CD and wiki tools

## Tools to Help

```bash
# View commit history
git log --oneline -10

# View detailed commit
git show <commit-hash>

# Write good commit messages
git commit -v  # Opens editor with diff

# Amend last commit (for small fixes)
git commit --amend
```

## Common Anti-Patterns

❌ **Vague messages**: "update", "fix", "changes"
❌ **Multiple changes**: Mixing docs, code, and tests in one commit
❌ **Giant commits**: Changing 50+ files at once
❌ **No explanation**: Empty commit messages
❌ **Past tense**: "fixed bug" instead of "fix bug"

## Following These Practices

This project follows these commit best practices. When contributing:
1. Write clear, descriptive commit messages
2. Keep commits small and focused
3. Use the extended message format for significant changes
4. Reference related issues when applicable
5. Follow the type prefix conventions

Good commits make the project easier to maintain and collaborate on!