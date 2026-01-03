# Interviewer Guide: Live Interview Test Kit (Secure Workflow)

This guide provides the necessary steps for the interviewer to manage the secure testing environment during the live interview.

## 1. Pre-Interview Setup

Ensure the candidate has successfully completed the following steps on their machine:

1.  **Clone the repository.**
2.  **Verify environment:** `make dev` (Services start cleanly).
3.  **Run initial tests:** `make test` (All tests pass).

**Crucially, the challenge mode is now LOCKED by default.** The candidate cannot apply the patch until you provide the unlock command.

## 2. Applying the Challenge (Live Session)

At the start of the interview, follow these steps to activate the challenge:

### Step 2.1: Provide the Unlock Command

Instruct the candidate to run the following command. This creates a hidden file (`.challenge_locked`) that the `make challenge` command checks for.

```bash
make unlock
```

### Step 2.2: Provide the Patch File

Transfer the `challenge.patch` file to the candidate (e.g., via chat, email, or a shared drive).

### Step 2.3: Instruct Candidate to Apply the Patch

Instruct the candidate to apply the patch using the dynamic path command:

```bash
make challenge FILE=path/to/challenge.patch
```

### Step 2.4: Restart Services

Instruct the candidate to restart the services to load the new application code and bugs:

```bash
make dev
```

### Step 2.5: Verify Challenge Activation

Instruct the candidate to run the tests to confirm the challenge is active:

```bash
make test
```
**Expected Result:** Multiple tests should fail across the API and Web components.

## 3. Resetting the Environment

To clean up the environment after the interview, instruct the candidate to run:

```bash
make reset
```
This command reliably restores the repository to the initial skeleton state, removes all changes, and **re-locks** the challenge mode.
