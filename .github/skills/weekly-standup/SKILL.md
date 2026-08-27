---
name: weekly-standup
description: Generates a formatted weekly standup update by analyzing git commits
allowed-tools:
  - bash
  - read
---

# Weekly Standup Generator

This skill analyzes git commits from the repository and generates a formatted weekly standup update based on a template.

## Workflow

1. **Fetch Commits**: Run the `./scripts/fetch-commits.sh` script to get a structured list of commits.
   - You can specify the time period (e.g., `--since="last Monday"`).
   - If the user doesn't specify a period, default to `--since="1 week ago"`.

2. **Read Template**: Read the `./references/standup-template.md` file to understand the required format.

3. **Analyze and Categorize**: 
   - Parse the output of `fetch-commits.sh` (format: `hash|subject|body`).
   - Categorize each commit into one of the following:
     - **Features**: New functionality or enhancements.
     - **Bug Fixes**: Fixes for existing issues.
     - **Refactoring**: Code improvements, cleanups, or structural changes.
   - Detect potential **Blockers** by looking for keywords like "BLOCKED", "TODO", "WIP", or "WAITING" in commit messages.

4. **Format Output**:
   - Use the template from `./references/standup-template.md`.
   - Replace `{{developer_name}}` with the current user's name (can be retrieved via `git config user.name`).
   - Replace `{{date}}` with today's date.
   - Fill in the categorized commit lists.
   - Infer **Next steps** based on the most recent work or common project patterns.

## Guidelines
- Sprints start and end every wednesday
- Exclude merge commits (handled by the script).
- Ensure the tone is professional yet concise.
- If multiple commits relate to the same task, group them together in the final output.
- If no commits are found for the period, inform the user instead of generating an empty report.

## Examples
- "Generate my standup for this week"
- "Create a standup update since last Wednesday"
- "What have I worked on in the last 7 days? Format it as a standup."
