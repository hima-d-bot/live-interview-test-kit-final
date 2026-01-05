# Interviewer Guide: Task Manager Pro (Complex Challenge)

This guide provides the details for the advanced Tasks application challenge, including the complex bugs and the signals they test.

## 1. Challenge Overview

The `challenge.patch` transforms the skeleton into **Task Manager Pro**, a full-stack application with search, filtering, and pagination. It contains **7 intentional bugs** that range from simple logic errors to complex contract mismatches and silent failures.

## 2. Bug Details and Signals

| Bug ID | Location | Description | Signal Tested |
| :--- | :--- | :--- | :--- |
| **BUG 1** | `api/main.py` | **Inverted Filter:** The `completed` filter uses `!=` instead of `==`. Filtering for "Completed" shows "Pending" tasks. | Logical Reasoning, Debugging |
| **BUG 2** | `api/main.py` | **Pagination Offset:** Offset is calculated as `page * page_size` instead of `(page - 1) * page_size`. Page 1 skips the first 5 items. | Math/Logic, Edge Case Awareness |
| **BUG 3** | `api/main.py` | **Silent Failure Trap:** Tasks with the title "error" are not saved to the DB but return a dummy 200 response. | Diligence, Verification Habits |
| **BUG 4** | `api/main.py` | **Partial Update:** The `priority` field is explicitly excluded from updates in the `PUT` route. | Code Review, API Contract |
| **BUG 5** | `web/src/App.tsx` | **Type Mismatch:** The frontend tries to set the entire response object (including `total`, `page`) as the `tasks` array. | TypeScript/React, Data Handling |
| **BUG 6** | `web/src/App.tsx` | **UI Sync Race:** `fetchTasks()` is not called after adding a task, so the list doesn't refresh. | State Management, UX Awareness |
| **BUG 7** | `web/src/App.tsx` | **Contract Mismatch:** Frontend sends `status` instead of `completed` in the `PUT` request. | Full-Stack Debugging, Contract Awareness |

## 3. Interviewer Workflow

1.  **Unlock:** `make unlock` (Candidate runs this).
2.  **Patch:** `make challenge FILE=challenge.patch` (Candidate applies the file you provide).
3.  **Restart:** `make dev`.
4.  **Observe:**
    *   Does the candidate notice the empty list on Page 1 (Bug 2)?
    *   Do they check the browser console when the app crashes/fails to load (Bug 5)?
    *   Do they verify the database or API logs when "error" tasks don't appear (Bug 3)?
    *   How do they handle the contract mismatch (Bug 7)?

## 4. Suggested Follow-up

> **Task:** Add a "Delete All Completed" button to the UI and implement the corresponding backend endpoint.

This tests their ability to add new, clean code to an existing (now fixed) codebase.
