.PHONY: dev test challenge reset clean help

# Default mode is base (skeleton)
MODE ?= base
PROJECT_NAME = live-interview-kit

help:
	@echo "Usage:"
	@echo "  make dev              - Build and start services in the background"
	@echo "  make logs             - Follow logs from all services"
	@echo "  make test             - Run all backend and frontend tests"
	@echo "  make challenge FILE=  - Apply a challenge patch (Provided by interviewer)"
	@echo "  make reset            - Restore repository to skeleton state"
	@echo "  make clean            - Stop services and remove all containers/volumes"

dev:
	docker compose up --build -d
	@echo "Services started. API: http://localhost:8000, Web: http://localhost:3000"

logs:
	docker compose logs -f

test:
	@echo "Running API tests..."
	docker compose run --rm api pytest
	@echo "Running Web tests..."
	docker compose run --rm web npm test -- --watchAll=false

challenge:
	@if [ -z "$(FILE)" ]; then \
		echo "Error: FILE argument is missing."; \
		exit 1; \
	fi
	@ABS_FILE=$$(realpath $(FILE)); \
	if [ ! -f "$$ABS_FILE" ]; then \
		echo "Error: File $$ABS_FILE not found."; \
		exit 1; \
	fi; \
	echo "Applying patch from: $$ABS_FILE"; \
	patch -p1 < "$$ABS_FILE"
	@echo "Challenge applied successfully. Please run 'make dev' to restart services."

reset:
	@echo "Resetting repository to skeleton state..."
	git checkout .
	git clean -fd
	docker compose down -v
	@echo "Repository reset."

clean:
	docker compose down -v
	rm -rf api/__pycache__ web/node_modules
