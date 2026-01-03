# Live Interview Test Kit

Welcome to your live coding interview! This repository contains a base skeleton for a simple Task Management application.

## 1. Prerequisites

Ensure you have the following installed:
- **Docker** and **Docker Compose**
- **Git**

## 2. Getting Started

1.  **Clone the repository**:
    ```bash
    git clone <repo-url>
    cd live-interview-test-kit
    ```

2.  **Start the environment**:
    ```bash
    make dev
    ```
    This will start the backend (FastAPI) at `http://localhost:8000` and the frontend (React) at `http://localhost:3000`.

3.  **Verify the setup**:
    Open `http://localhost:3000` in your browser. You should see a "Waiting for Challenge" message.

## 3. The Challenge

Once the interviewer provides the challenge patch, follow these steps:

1.  **Apply the patch**:
    ```bash
    make challenge FILE=challenge.patch
    ```

2.  **Restart services**:
    ```bash
    make dev
    ```

3.  **Begin Debugging**:
    The application now has several features implemented, but it's riddled with bugs. Your task is to identify and fix them. Some bugs are logic-based, some are state-related, and some might involve the contract between the frontend and backend.

## 4. Available Commands

- `make dev`: Build and start services.
- `make logs`: View logs from all services.
- `make test`: Run backend and frontend tests.
- `make reset`: Revert all changes to the base skeleton.
- `make clean`: Stop services and remove containers.

Good luck!
