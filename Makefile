.PHONY: dev test challenge reset clean

# Default mode is base (skeleton)
MODE ?= base

dev:
	docker compose up --build

test:
	docker compose run --rm api pytest
	docker compose run --rm web npm test -- --watchAll=false

challenge:
	@if [ -z "$(FILE)" ]; then \
		echo "Error: FILE argument is missing. Usage: make challenge FILE=path/to/challenge.patch"; \
		exit 1; \
	fi
	@if [ ! -f "$(FILE)" ]; then \
		echo "Error: File $(FILE) not found."; \
		exit 1; \
	fi
	patch -p1 < $(FILE)
	@echo "Challenge applied successfully."

reset:
	git checkout .
	git clean -fd
	docker compose down -v
	@echo "Repository reset to base mode."

clean:
	docker compose down -v
	rm -rf api/__pycache__ web/node_modules
