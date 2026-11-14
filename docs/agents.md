# The Agent Team

This project uses **file-based sub-agents** (OpenHands SDK format). Each agent is
a Markdown file in `.agents/agents/` with YAML frontmatter and a system prompt.
The lead agent (me) delegates tasks to them.

> Agents are loaded at **conversation start**. After adding or renaming an agent
> file, start a new conversation for it to be picked up.

## Team

| Agent | Role | Tools | Writes |
|---|---|---|---|
| `planner` | Turns requests into ordered, testable plans | file_editor, terminal | `docs/plan-*.md` |
| `architect` | Technical decisions + ADRs | file_editor, terminal | `docs/adr/*.md` |
| `researcher` | Web/doc research with citations | browser, file_editor | notes |
| `coder` | Implements features and fixes | file_editor, terminal | `src/`, `tests/` |
| `tester` | Tests and bug reproduction | file_editor, terminal | `tests/` |
| `reviewer` | Reviews diffs (read-only) | file_editor, terminal | reports |
| `security-auditor` | Security audit (read-only) | file_editor, terminal | reports |
| `debugger` | Root-cause analysis | terminal, file_editor | fixes |
| `docs-writer` | README/guides/API docs | file_editor, terminal | `docs/`, `README.md` |

## How work flows

```
request
  └─ planner      → plan + open questions
       └─ architect   → design + ADRs
            └─ coder / tester  → implementation + tests
                 └─ reviewer / security-auditor  → findings
                      └─ debugger / docs-writer  → fixes + docs
```

## Adding an agent

1. Create `.agents/agents/<name>.md`.
2. `name` must match the filename. Include ≥2 `<example>` tags in `description`.
3. Restart the conversation to load it.

See the official spec: <https://docs.openhands.dev/sdk/guides/agent-file-based>
