# Interviewer Guide

This branch contains the challenge patch and the problem design for the live interview.

## 1. Preparation

1.  Ensure the candidate has cloned the `master` branch.
2.  The `master` branch contains only the base skeleton.

## 2. Starting the Challenge

When you are ready to start the challenge:

1.  **Share the patch**: The candidate can pull the patch directly from the `interviewer` branch without switching branches.
2.  **Instruct the candidate** to run the following command:
    ```bash
    git show interviewer:interviewer_assets/challenge.patch > challenge.patch
    ```
    This command extracts the patch file from the `interviewer` branch and saves it to their current directory on the `master` branch.

3.  **Apply the patch**:
    ```bash
    make challenge FILE=challenge.patch
    ```

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
