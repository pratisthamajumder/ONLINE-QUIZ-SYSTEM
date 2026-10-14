#!/usr/bin/env bash
# Creates labels and all backlog issues in one go using GitHub CLI.
# Setup: install gh (https://cli.github.com), run `gh auth login`, then run this
# from inside your cloned repo:  bash scripts/create_backlog.sh
# Edit the four usernames below first.

M1="username1"; M2="username2"; M3="username3"; M4="username4"

for l in sprint-1 sprint-2 FR NFR setup docs testing; do
  gh label create "$l" --force >/dev/null
done

mk() { # id title points sprint labels owner
  gh issue create --title "[$1] $2" \
    --body "**Requirement:** $1
**Story points:** $3
**Sprint:** $4

**Acceptance criteria**
- [ ] Implemented as per SRS
- [ ] Follows SAD design
- [ ] Covered by Test Plan cases
- [ ] PR reviewed and merged" \
    --label "$5" --assignee "$6"
}

# Sprint 1
mk SETUP  "Project skeleton, DB schema, CI"        3 1 "sprint-1,setup" "$M1"
mk FR-01  "User registration"                      3 1 "sprint-1,FR"    "$M2"
mk FR-02  "Login / logout"                         3 1 "sprint-1,FR"    "$M2"
mk FR-03  "Admin creates quiz and questions"       5 1 "sprint-1,FR"    "$M3"
mk FR-04  "Student attempts quiz"                  5 1 "sprint-1,FR"    "$M4"
mk FR-05  "Auto-evaluation and score"              3 1 "sprint-1,FR"    "$M1"
# Sprint 2
mk FR-06  "View results and history"               3 2 "sprint-2,FR"    "$M4"
mk FR-07  "Admin reports / analytics"              5 2 "sprint-2,FR"    "$M3"
mk FR-08  "Edit / delete quiz"                     3 2 "sprint-2,FR"    "$M1"
mk NFR-01 "Performance (response time)"            2 2 "sprint-2,NFR"   "$M2"
mk NFR-02 "Security (hashing, input validation)"   3 2 "sprint-2,NFR"   "$M2"
mk TEST   "Test cases from Test Plan"              3 2 "sprint-2,testing" "$M4"
mk DOC    "Final documentation, deviations, v1.0"  2 2 "sprint-2,docs"  "$M1"
