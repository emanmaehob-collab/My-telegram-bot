# AGENTS.md — Repository Memory

This file is the persistent memory for this repository. Read it at the start of
every session and update it when you learn something durable (build quirks,
conventions, gotchas). Keep it short and factual.

## Project status

- 🚧 **Scaffolded, awaiting brief.** The environment and agent team are ready.
  The actual product has not been defined yet. Do not build features until the
  user states what the project is.

## Environment

- OS: Debian 13 (trixie), Linux, x86_64.
- Python: 3.13 (system) via `uv` (0.13+). Use `uv run ...` for all Python.
- Node: v24 / npm 12.
- Docker available. `git` available. No Go/Rust/Java installed.
- Working dir: `/workspace/project` (a fresh git repo).

## Commands

| Task | Command |
|---|---|
| Install deps | `make setup` (runs `uv sync --extra dev`) |
| Lint | `make lint` (`uv run ruff check .`) |
| Format | `make format` (`uv run ruff format .` + `--fix`) |
| Test | `make test` (`uv run pytest`) |
| All checks | `make check` (lint + test) |
| Clean caches | `make clean` |

## Conventions

- Python package lives in `src/app/`. Keep it there; `pyproject.toml` maps the
  wheel to `src/app`.
- Line length 100, ruff rules `E,F,I,UP,B`. Type hints expected on public code.
- Tests live in `tests/` and mirror the source structure.
- No secrets in code. Use `.env` (git-ignored); template is `.env.example`.
- Only read-only exchange API keys, ever. Never enable withdrawals.
- Prefer minimal, focused diffs. Match existing style before introducing new.

## Agent team

Defined in `.agents/agents/` (OpenHands file-based agents). The lead agent
delegates to these. Summary:

| Agent | Use when |
|---|---|
| `planner` | Turn a request into an ordered, testable plan (writes `docs/plan-*.md`) |
| `architect` | Decide structure/tech and record ADRs (`docs/adr/`) |
| `researcher` | Research web/docs with citations |
| `coder` | Implement features/fixes with tests |
| `tester` | Write tests, reproduce bugs |
| `reviewer` | Review diffs for correctness/security (read-only) |
| `security-auditor` | Audit for secrets, injection, supply-chain risk |
| `debugger` | Root-cause failures |
| `docs-writer` | Write README/guides/API docs |

> Agents are scanned at conversation start — restart the conversation after
> adding or renaming an agent file.

## Working agreement

1. **Plan before build.** Non-trivial work starts with a plan and, where useful,
   an ADR.
2. **Verify, don't assume.** Run the checks; report real results.
3. **Small diffs.** One logical change at a time.
4. **Security first.** No secrets in git; least-privilege API keys.
5. **Honesty over optimism.** If something is unverified or failing, say so.

## Change log (newest first)

- Scaffolded the repository: structure, `pyproject.toml`, `Makefile`,
  `.gitignore`, `.env.example`, `README.md`, and 9 sub-agents in
  `.agents/agents/`.
