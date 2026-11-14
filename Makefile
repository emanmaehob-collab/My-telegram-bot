.PHONY: help setup lint format test check clean

help: ## Show available targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-12s\033[0m %s\n", $$1, $$2}'

setup: ## Create the environment and install dependencies
	uv sync --extra dev

lint: ## Run the linter
	uv run ruff check .

format: ## Auto-format the code
	uv run ruff format .
	uv run ruff check --fix .

test: ## Run the test suite
	uv run pytest

check: lint test ## Run all checks

clean: ## Remove caches and build artifacts
	find . -type d -name __pycache__ -prune -exec rm -rf {} +
	rm -rf .pytest_cache .ruff_cache .mypy_cache build dist
