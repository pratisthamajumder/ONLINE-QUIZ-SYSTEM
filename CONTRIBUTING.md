# Team Workflow

1. Pick an issue assigned to you on the Project board and move it to **In Progress**.
2. Create a branch from `main`: `feature/m<number>-<item>` (e.g. `feature/m2-login`).
3. Commit often with clear messages: `FR-02: add login endpoint`.
4. Push and open a Pull Request. Fill in the PR template and write `Closes #<issue>`.
5. The repo owner (M1) reviews and merges. M1's own PRs are reviewed by M2.
6. CI (GitHub Actions) must pass before merging.
7. If your work differs from the SRS/SAD/Test Plan, add a row to `docs/DEVIATIONS.md`.

## Rules
- Never push directly to `main`.
- One PR per issue.
- Keep PRs small and focused.
