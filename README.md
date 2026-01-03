# Live Interview Test Kit - Candidate Instructions

Welcome to your live interview environment. This repository contains the base skeleton for the task you will be working on.

## 1. Prerequisites

You **must** have the following software installed and running on your machine:

1.  **Git:** For cloning the repository.
2.  **Docker and Docker Compose:** The entire application runs inside containers.

## 2. Initial Setup and Verification (Pre-Interview)

### Step 2.1: Clone and Start

```bash
git clone <REPO_URL>
cd live-interview-kit
make dev
```

### Step 2.2: Verify Skeleton

-   **API:** `http://localhost:8000/health` -> `{"status": "ok"}`
-   **Web:** `http://localhost:3000` -> **"Interview Environment Ready"**

### Step 2.3: Test the Mechanism (Optional)

You can verify that the patching mechanism works by using the provided `dummy_test.patch`.

```bash
make challenge FILE=dummy_test.patch
make dev
```
After running this, `http://localhost:8000/` should show "Dummy Patch Applied Successfully!".

**Important:** Before the actual interview, please run `make reset` to return to the clean skeleton state.

## 3. The Live Interview

At the start of the interview, your interviewer will provide the **real** challenge patch file.

1.  **Apply:** Run `make challenge FILE=path/to/real_challenge.patch`.
2.  **Restart:** Run `make dev`.
3.  **Solve:** Run `make test` and start fixing the bugs!

## Commands Summary

| Command | Description |
| :--- | :--- |
| `make dev` | Starts the API and Web services. |
| `make challenge FILE=...` | Applies the provided patch file. |
| `make test` | Runs all backend and frontend tests. |
| `make reset` | Restores the repository to the initial skeleton state. |
