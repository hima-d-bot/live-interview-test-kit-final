# Interviewer Guide: Secure Live Interview Test Kit

This document outlines the security enhancements and the new workflow for conducting the live coding interview using the \`live-interview-test-kit-final\` repository.

## 1. Security Enhancements

The following guardrails have been implemented to ensure a fair and controlled interview environment:

| Security Feature | Implementation Detail | Student Impact |
| :--- | :--- | :--- |
| **Conditional File Access** | All challenge-related files (patches, solutions, internal notes) are now stored in the **\`interviewer_assets/\`** directory. This directory is excluded from the student's view via the main \`.gitignore\` file. | The student will not see the challenge files upon initial clone. |
| **Patching Guardrail** | The \`make challenge\` command in the \`Makefile\` now explicitly checks the source of the patch file. It will **reject** any attempt to apply a patch directly from the \`interviewer_assets/\` directory. | Prevents the student from prematurely applying the challenge patch before the interviewer is ready. |
| **Interviewer-Only Files** | The \`interviewer_assets/\` directory is not part of the main repository structure visible to the student. The student will only receive the necessary files when the interviewer manually moves them. | The student only gets the minimal skeleton code upon cloning. |

## 2. New Interview Workflow

The process for starting the challenge has been updated to incorporate the new security measures.

### Step 2.1: Pre-Interview Setup (Interviewer)

1.  Ensure your challenge patch file (e.g., \`challenge_1.patch\`) is placed inside the \`interviewer_assets/\` directory.
2.  **Crucially**, ensure the student has cloned the latest version of the repository.

### Step 2.2: Starting the Challenge (Interviewer Action)

When you are ready to begin the challenge, you must run the \`unlock_challenge.sh\` script from the \`interviewer_assets/\` directory.

\`\`\`bash
cd interviewer_assets
chmod +x unlock_challenge.sh
./unlock_challenge.sh challenge_1.patch
cd ..
\`\`\`

**What this script does:**
*   It copies the specified patch file (\`challenge_1.patch\`) from the secure \`interviewer_assets/\` directory to the root of the repository.
*   The student can now see and access the patch file.

### Step 2.3: Student Action

The student can now proceed with the standard challenge application steps:

1.  **Apply Patch:** \`make challenge FILE=challenge_1.patch\`
2.  **Restart Services:** \`make dev\`
3.  **Begin Work:** \`make test\` and start fixing the bugs.

## 3. Post-Interview Cleanup

To reset the repository for the next interview, the student should run:

\`\`\`bash
make reset
\`\`\`

This command uses \`git checkout .\` and \`git clean -fd\` to revert all changes and remove untracked files, including the challenge patch file that was moved to the root.

## 4. Access Restriction Verification

To confirm the guardrail is working, you can ask the student to try and apply the patch directly from the \`interviewer_assets/\` directory before you run the unlock script.

\`\`\`bash
# This command should fail with an "Access Denied" error
make challenge FILE=interviewer_assets/challenge_1.patch
\`\`\`

This ensures that the student cannot bypass the controlled release of the challenge.
