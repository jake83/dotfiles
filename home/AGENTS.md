# global agent instructions

- Never use the em dash "—". Use plain dash "-" instead
- When writing commit messages, NEVER auto-add your agent name as co-author
- Never manually modify CHANGELOG.md files or any files that are marked as auto-generated
- When making technical decisions, do not give much weight to development cost.
  Instead, prefer quality, simplicity, robustness, scalability, and long term maintainability.
- When doing bug fixes, always start with reproducing the bug in an E2E setting as closely aligned with how an end user would experience it as possible.
  This makes sure you find the real problem so your fix will actually solve it.
- When end-to-end testing a product, be picky about the UI you see and be obsessed with pixel perfection.
  If something clearly looks off, even if it is not directly related to what you are doing, try to get it fixed along the way.
- Apply that same high standard to engineering excellence: lint, test failures, and test flakiness.
  If you see one, even if it is not caused by what you are working on right now, still get it fixed.
- Explore with a subagent first, don't read the directory into this session.
- Don't re-read files you've already read unless something changed them.
- When a task ends in a PR, stop once the PR is open and CI is green (`gh pr checks <n> --watch`). Don't triage CodeRabbit or other review comments - that happens in a fresh session.
  Before stopping, add the decisions a reviewer would question to the PR body, with the reasoning. The review session will have no other memory of them.
  End with the next step as copy-paste lines: `/clear`, then `/superpowers:receiving-code-review <PR URL>`.
