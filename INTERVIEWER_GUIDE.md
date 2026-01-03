# Interviewer Guide: Live Interview Test Kit

This guide provides the necessary steps for the interviewer to manage the testing environment during the live interview.

## 1. Pre-Interview Setup

Ensure the candidate has successfully completed the following steps on their machine:

1.  **Clone the repository:**
    ```bash
    git clone <REPO_URL>
    cd live-interview-kit
    ```
2.  **Verify environment:**
    ```bash
    make dev
    ```
    The web app should show the "Tasks App Skeleton" message.
3.  **Run initial tests:**
    ```bash
    make test
    ```
    All tests should pass (minimal skeleton tests).

## 2. Applying the Challenge

At the start of the interview, provide the candidate with the `challenge.patch` file and instruct them to apply it.

1.  **Transfer the patch file** to the candidate (e.g., via chat, email, or a shared drive).
2.  **Instruct the candidate to apply the patch:**
    ```bash
    make challenge FILE=challenge.patch
    ```
    The output should confirm the patch was applied successfully.

3.  **Restart services (if necessary):**
    ```bash
    make dev
    ```
    The web app should now show the full Tasks application, but with several bugs.

4.  **Run challenge tests:**
    ```bash
    make test
    ```
    Confirm that **multiple tests fail** across the API and Web components, indicating the challenge is active.

## 3. Challenge Details and Signals

The applied patch introduces a small Tasks application with the following intentional bugs designed to test debugging and diligence:

| Bug Theme | Location | Description | Signal Tested |
| :--- | :--- | :--- | :--- |
| **Backend Logic** | `api/main.py` (read_tasks) | **Pagination Swap:** `skip` and `limit` parameters are swapped in the SQLAlchemy query. This causes incorrect data fetching and is a subtle logic error. | Debugging, Code Review |
| **Backend Constraint** | `api/main.py` (create_task) | **Silent Failure Trap:** If a task title is "error", the function returns a dummy 200 response without saving to the DB. This tests diligence in checking API responses. | Diligence, API Contract Verification |
| **Integration Mismatch** | `web/src/App.tsx` (toggleTask) | **Incorrect Payload Key:** The frontend sends `status` instead of the expected `completed` boolean in the PUT request. The backend ignores the update due to the wrong key. | Contract Awareness, Full-Stack Debugging |
| **Frontend Logic** | `web/src/App.tsx` (addTask) | **Race Condition/UI Sync:** `fetchTasks()` is commented out after a successful POST, meaning the UI does not refresh automatically after adding a task. | State Management, UI/UX Awareness |
| **Frontend Default** | `web/src/App.tsx` (fetchTasks) | **Default Pagination:** The initial fetch uses hardcoded, incorrect pagination parameters (`skip=10&limit=0`), causing the initial task list to be empty even if tasks exist. | Configuration, Initial State Debugging |

## 4. Suggested Follow-up "Small Change"

If the candidate finishes early, you can ask them to implement a small feature to test their ability to add new, clean code:

> **Task:** Implement a simple filter on the frontend to show only **Completed** or **Pending** tasks. This should be a simple toggle button or dropdown.

## 5. Resetting the Environment

To clean up the environment after the interview, instruct the candidate to run:

```bash
make reset
```
This command uses `git checkout .` and `git clean -fd` to reliably restore the repository to the initial skeleton state, removing all changes and artifacts.
