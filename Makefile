.PHONY: help lint links check install-tools

LYCHEE_VERSION ?= latest
MDLINT = markdownlint-cli2

help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-12s\033[0m %s\n", $$1, $$2}' | \
		sort

check: lint links ## Run all checks (lint + link checker)

lint: ## Check Markdown formatting with markdownlint
	@command -v $(MDLINT) >/dev/null 2>&1 || { \
		echo "markdownlint-cli2 not found. Run: make install-tools"; exit 1; }
	$(MDLINT) '**/*.md'

lint-fix: ## Auto-fix Markdown issues that markdownlint can correct
	@command -v $(MDLINT) >/dev/null 2>&1 || { \
		echo "markdownlint-cli2 not found. Run: make install-tools"; exit 1; }
	$(MDLINT) --fix '**/*.md'

links: ## Check all links with lychee
	@command -v lychee >/dev/null 2>&1 || { \
		echo "lychee not found. Run: make install-tools"; exit 1; }
	lychee --config lychee.toml --cache --verbose --no-progress '**/*.md'

install-tools: ## Install lychee and markdownlint-cli2 locally
	@echo "Installing markdownlint-cli2..."
	npm install -g markdownlint-cli2
	@echo ""
	@echo "Installing lychee..."
	@if command -v brew >/dev/null 2>&1; then \
		brew install lychee; \
	elif command -v cargo >/dev/null 2>&1; then \
		cargo install lychee; \
	else \
		LYCHEE_URL=$$(curl -s https://api.github.com/repos/lycheeverse/lychee/releases/latest \
			| grep "browser_download_url.*x86_64-unknown-linux-gnu.tar.gz" \
			| cut -d '"' -f 4); \
		curl -fsSL "$$LYCHEE_URL" | tar xz; \
		sudo mv lychee /usr/local/bin/; \
		echo "lychee installed to /usr/local/bin/lychee"; \
	fi
	@echo ""
	@echo "All tools installed. Run 'make check' to validate."
