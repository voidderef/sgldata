.DEFAULT_GOAL := help

ROOT_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

DATA_REPO_SCRIPTS ?= data-repo # Path to data-repo (sync) scripts

# -----------------------------------------------------------------------------
# Targets
# -----------------------------------------------------------------------------

.PHONY: check-game-assets-all # Check if the game assets of all distribution sets are matching the given checksums
check-game-assets-all:
	$(ROOT_DIR)/scripts/check-all-game-assets.sh

.PHONY: check-game-assets-% # Check if the game assets of a specific distribution set is matching the given checksums
check-game-assets-%:
	$(ROOT_DIR)/scripts/check-game-assets.sh $*

.PHONY: create-checksum-game-assets-% # Create checksums for the game assets of one set of the distribution data
create-checksum-game-assets-%:
	$(ROOT_DIR)/scripts/create-checksum-game-assets.sh $*

.PHONY: clean-logs # Cleanup any download/upload logs
clean-logs:
	rm -f data-repo-sync-*.log

.PHONY: up-real # Upload any data changes, no dry run
up-real:
	$(DATA_REPO_SCRIPTS)/data-repo-sync.sh data-repo.idx up 1

.PHONY: up # Upload any data changes, DRY RUN
up:
	$(DATA_REPO_SCRIPTS)/data-repo-sync.sh data-repo.idx up

.PHONY: down-real # Download any data changes, no dry run
down-real:
	$(DATA_REPO_SCRIPTS)/data-repo-sync.sh data-repo.idx down 1

.PHONY: down # Download any data changes, DRY RUN
down:
	$(DATA_REPO_SCRIPTS)/data-repo-sync.sh data-repo.idx down

.PHONY: up-real-public # Upload any data changes, no dry run (public)
up-real-public:
	$(DATA_REPO_SCRIPTS)/data-repo-sync.sh data-repo-public.idx up 1

.PHONY: up-public # Upload any data changes, DRY RUN (public)
up-public:
	$(DATA_REPO_SCRIPTS)/data-repo-sync.sh data-repo-public.idx up

.PHONY: down-real-public # Download any data changes, no dry run (public)
down-real-public:
	$(DATA_REPO_SCRIPTS)/data-repo-sync.sh data-repo-public.idx down 1

.PHONY: down-public # Download any data changes, DRY RUN (public)
down-public:
	$(DATA_REPO_SCRIPTS)/data-repo-sync.sh data-repo-public.idx down


# -----------------------------------------------------------------------------
# Utility, combo and alias targets
# -----------------------------------------------------------------------------

# Help screen note:
# Variables that need to be displayed in the help screen need to strictly
# follow the pattern "^[A-Z_]+ \?= .* # .*".
# Targets that need to be displayed in the help screen need to add a separate
# phony definition strictly following the pattern "^\.PHONY\: .* # .*".

.PHONY: help # Print help screen
help:
	@echo "Simple Game Loader (SGL) data management tool."
	@echo
	@echo "Environment variables:"
	@grep -E '^[A-Z_]+ \?\= .* #' Makefile | gawk 'match($$0, /([A-Z_]+) \?= [$$\(]*([^\)]*)[\)]{0,1} # (.*)/, a) { printf("  \033[0;35m%-25s \033[0;0m%-45s [%s]\n", a[1], a[3], a[2]) }'
	@echo ""
	@echo "Targets:"
	@grep '^.PHONY: .* #' Makefile | gawk 'match($$0, /\.PHONY: (.*) # (.*)/, a) { printf("  \033[0;32m%-25s \033[0;0m%s\n", a[1], a[2]) }'
