# Author Notes: Live Interview Test Kit Design Rationale

## Goal

The primary goal of this test kit is to evaluate a candidate's **aptitude and diligence** in a full-stack environment, specifically focusing on debugging, verification habits, reasoning, and careful use of AI tools. It is designed to be a 60-minute live challenge.

## Design Philosophy

1.  **Skeleton-First:** The candidate receives a clean, passing skeleton to validate their environment (Docker, Node, Python) *before* the interview. This eliminates time wasted on setup during the live session.
2.  **Patch-Based Injection:** The entire application logic, including the bugs, is injected via a single `patch` file. This ensures the interviewer has full control, the process is deterministic, and the candidate starts with a clean slate. The `make challenge FILE=...` command enforces a clean, non-manual application process.
3.  **Complex, Non-Obvious Bugs:** The bugs are designed to be subtle and require cross-layer investigation (frontend, backend, database). They are not simple syntax errors.
    *   **Logic Swap (Pagination):** Tests deep code review and understanding of API contracts.
    *   **Silent Failure (Title "error"):** Tests diligence and verification habits (checking database state, not just HTTP status codes).
    *   **Contract Mismatch (status vs. completed):** Tests full-stack debugging skills and the ability to trace data flow between the two services.
    *   **UI Sync (addTask):** Tests understanding of React state management and side effects.
4.  **Constraint Trap:** The bugs are intentionally placed in a way that a naive AI prompt (e.g., "fix this error") might suggest a solution that breaks the overall architecture (e.g., changing the API contract on the backend without updating the frontend, or vice-versa). This forces the candidate to use AI as a *tool* for suggestion, not a *solution* for the entire problem, requiring manual verification and integration.

## Signals Tested

| Signal | How It's Tested |
| :--- | :--- |
| **Debugging Skills** | Tracing the flow of data across the React frontend, the FastAPI backend, and the SQLite database to find the root cause of the failures. |
| **Diligence/Verification** | The need to check the database state (e.g., after the "error" task is added) and verify API payloads (e.g., the `status` vs `completed` mismatch). |
| **Code Review** | Identifying the subtle logic error in the pagination swap (`limit` and `skip` being used incorrectly). |
| **Full-Stack Awareness** | The contract mismatch and the need to understand how the frontend's API calls interact with the backend's data models. |
| **AI Usage** | The complexity of the bugs requires the candidate to carefully phrase their AI prompts and critically evaluate the AI's suggestions, as a simple "fix" will likely only solve one part of the problem or introduce a new one. |
