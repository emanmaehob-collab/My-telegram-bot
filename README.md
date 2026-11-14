# Project

> Status: 🚧 Environment scaffolded — awaiting project brief.

This repository is a clean workspace prepared by OpenHands. The environment,
tooling, and a team of specialized sub-agents are ready. The actual product is
not defined yet.

## Quick start

```bash
make setup    # create venv + install dev deps (uv)
make check    # lint + tests
```

## Layout

```
.agents/agents/   Sub-agent definitions (Markdown, OpenHands SDK format)
src/app/          Application source code
tests/            Test suite
scripts/          One-off / automation scripts
data/             Local data (git-ignored)
docs/             Documentation
```

## Conventions

See `AGENTS.md` for repository memory, conventions, and the working agreement.
