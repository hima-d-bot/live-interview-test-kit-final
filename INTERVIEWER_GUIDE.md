# Interviewer Guide

This branch contains the challenge patch and the problem design for the live interview.

## 1. Preparation

1.  Ensure the candidate has cloned the `master` branch.
2.  The `master` branch contains only the base skeleton.

## 2. Starting the Challenge

When you are ready to start the challenge:

1.  Provide the `interviewer_assets/challenge.patch` file to the candidate.
2.  You can do this by:
    -   Sending the file directly.
    -   If you have access to their machine, run:
        ```bash
        cp interviewer_assets/challenge.patch .
        ```
    -   Or instruct them to run the `make challenge` command if you've already placed the file in their root directory.

## 3. The Problems

The patch injects several bugs designed to test different skills:

| Bug | Type | Description | Manual Intervention Required |
| :--- | :--- | :--- | :--- |
| **Pagination Swap** | Backend Logic | `skip` and `limit` are swapped in the DB query. | Candidate must trace why the list is empty or wrong. |
| **Invisible Constraint** | DB/Validation | Unique title constraint causes silent failure. | Candidate must check DB logs or add error handling. |
| **Stale State Sync** | React State | Optimistic updates without functional state or ID sync. | Candidate must fix React state update patterns. |
| **Broken Contract** | API/Types | Frontend sends Unix timestamp, backend expects ISO/Date. | Candidate must align the data format between FE and BE. |

## 4. Evaluation Criteria

-   **Debugging Skills**: Can they use browser dev tools and backend logs?
-   **System Understanding**: Do they understand how data flows from FE to BE to DB?
-   **React Proficiency**: Do they understand state updates and keys?
-   **Attention to Detail**: Do they notice the silent failures and contract mismatches?
