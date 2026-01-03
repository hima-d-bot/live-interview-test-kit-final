.PHONY: dev test challenge reset clean help unlock

# Default mode is base (skeleton)
MODE ?= base
PROJECT_NAME = live-interview-kit
LOCK_FILE = .challenge_locked

help:
	@echo "Usage:"
	@echo "  make dev              - Build and start services in the background"
	@echo "  make logs             - Follow logs from all services"
	@echo "  make test             - Run all backend and frontend tests"
	@echo "  make unlock           - Unlock the challenge mode (Interviewer only)"
	@echo "  make challenge FILE=  - Apply a challenge patch (Only after unlock)"
	@echo "  make reset            - Restore repository to skeleton state and relock"
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

unlock:
	@echo "Unlocking challenge mode..."
	@touch $(LOCK_FILE)
	@echo "Challenge mode UNLOCKED. You can now run 'make challenge FILE=...'"

challenge:
	@if [ ! -f "$(LOCK_FILE)" ]; then \
		echo "Error: Challenge mode is LOCKED."; \
		echo "Please wait for your interviewer to provide the unlock command."; \
		exit 1; \
	fi
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
	rm -f $(LOCK_FILE)
	docker compose down -v
	@echo "Repository reset and LOCKED."

clean:
	docker compose down -v
	rm -rf api/__pycache__ web/node_modules
	rm -f $(LOCK_FILE)
