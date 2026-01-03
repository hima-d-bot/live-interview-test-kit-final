# Live Interview Test Kit - Candidate Instructions

Welcome to your live interview environment. This repository contains the base skeleton for the task you will be working on. The goal of this initial phase is to ensure your environment is correctly set up and ready for the challenge.

## 1. Prerequisites

You **must** have the following software installed and running on your machine:

1.  **Git:** For cloning the repository.
2.  **Docker and Docker Compose:** The entire application runs inside containers, ensuring a consistent environment.

## 2. Initial Setup and Verification (Pre-Interview)

Follow these steps to set up the environment and verify the skeleton is working.

### Step 2.1: Clone the Repository

```bash
# Replace <REPO_URL> with the actual URL provided by your interviewer
git clone <REPO_URL>
cd live-interview-kit
```

### Step 2.2: Build and Start Services

The `make dev` command will build the Docker images (installing all dependencies like Python packages and Node modules) and start the services in the background.

```bash
make dev
```

**Expected Output:**
The command will confirm the services are running.

-   **API Service:** Running on `http://localhost:8000`
-   **Web Service:** Running on `http://localhost:3000`

You can view the live logs with:
```bash
make logs
```

### Step 2.3: Verify Skeleton Application

1.  **Check API Health:** Open `http://localhost:8000/health` in your browser.
    *   **Expected Result:** A JSON response: `{"status": "ok"}`
2.  **Check Web App:** Open `http://localhost:3000` in your browser.
    *   **Expected Result:** A simple page with the text: **"Interview Environment Ready"** and **"Awaiting challenge patch from interviewer..."**

### Step 2.4: Run Initial Tests

The skeleton includes minimal tests to confirm the environment is functional. All tests **must** pass.

```bash
make test
```

**Expected Result:**
The output will show that both the API and Web tests ran successfully with **0 failures**.

## 3. The Challenge Phase (During Interview)

At the start of the interview, your interviewer will provide a challenge file (`challenge.patch`). This file contains the full application code, including all the bugs you need to fix.

### Step 3.1: Apply the Challenge Patch

You will apply the patch using the following command. **The `FILE` argument can be an absolute or relative path to the patch file.**

```bash
# Example using a relative path (if the patch is in the current directory)
make challenge FILE=challenge.patch

# Example using an absolute path
make challenge FILE=/Users/candidate/Downloads/challenge.patch
```

### Step 3.2: Restart Services

The patch modifies the source code, so you must restart the services to load the new code.

```bash
make dev
```

### Step 3.3: Verify Challenge Activation

1.  **Check Web App:** Open `http://localhost:3000`. It should now show the full Tasks application UI.
2.  **Run Tests:**
    ```bash
    make test
    ```
    **Expected Result:** The tests will now show **multiple failures** across the API and Web components. Your task is to fix these failures and make all tests pass.

## Commands Summary

| Command | Description |
| :--- | :--- |
| `make dev` | Builds (if necessary) and starts the API and Web services in the background. |
| `make logs` | Streams the logs from all running services. |
| `make test` | Runs all backend (Python) and frontend (TypeScript) tests. |
| `make challenge FILE=...` | Applies the patch file from any specified path. |
| `make reset` | Restores the repository to the initial skeleton state, removing all changes and artifacts. |
| `make clean` | Stops and removes Docker containers and volumes. |
