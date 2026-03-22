---
name: ship-hf
description: >
  Ship a CQAI tool to GitHub and Hugging Face Spaces in a single workflow.
  Runs pre-flight checks, commits and pushes to GitHub, pushes to HF Spaces,
  waits for build, and verifies the app is live. Use after /qa-streamlit passes.
triggers:
  - /ship-hf
  - ship hugging face
  - deploy HF spaces
  - release CQAI tool
---

# Ship to GitHub + Hugging Face Spaces — CQAI Tools

You are acting as a **Release Engineer** for CQAI nursing education tools.
Your job is to get a finished tool shipped to both GitHub and Hugging Face Spaces
with zero manual steps and zero shortcuts.

**Only ship after `/qa-streamlit` has passed.** If QA hasn't been run, run it first.

---

## Pre-flight Checks

Run all checks before any commit. Stop if any check fails.

```bash
git status
git diff --stat
```

- [ ] Git state is clean OR you understand what you're committing
- [ ] Branch is `main` (or confirm intended branch)
- [ ] `requirements.txt` exists and is complete
- [ ] `streamlit_app.py` is the entry point
- [ ] README.md has valid HF Spaces YAML front matter (see below)
- [ ] Clinical disclaimer present in the app UI
- [ ] `.gitignore` excludes `__pycache__/`, `.venv/`, `.streamlit/secrets.toml`, `*.pyc`
- [ ] No API keys, passwords, or secrets in tracked files

### Required README.md Front Matter

```yaml
---
title: [App Name]
emoji: 🏥
colorFrom: blue
colorTo: green
sdk: streamlit
sdk_version: "1.45.1"
app_file: streamlit_app.py
pinned: false
license: mit
---
```

### Required Clinical Disclaimer (in app UI)
> "This tool supports but does not replace clinical judgment. Always verify with
> authoritative sources (BNF, NICE, local guidelines)."

---

## Ship Sequence

Execute in order. **Stop immediately if any step fails.**

### Step 1: Stage and Commit

```bash
git add [specific files — do not use git add -A blindly]
git status   # confirm what is being committed
git diff --cached --stat

git commit -m "$(cat <<'EOF'
release: [describe what changed — be specific]

[Optional: bullet list of key changes]

Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>
EOF
)"
```

### Step 2: Push to GitHub

```bash
git push origin main
```

Confirm push succeeded. If rejected (branch protection, diverged), investigate
before force-pushing. Never force-push to main without understanding why.

### Step 3: Push to Hugging Face Spaces

```bash
# Check HF remote exists
git remote -v | grep hf

# If not set up yet:
# git remote add hf https://huggingface.co/spaces/NurseCitizenDeveloper/[REPO-NAME]

git push hf main
```

If this is the first push:
```bash
git push hf main --force  # only on first push of a new Space
```

### Step 4: Monitor HF Build

Wait 60–90 seconds for Hugging Face Spaces to rebuild:

```bash
sleep 90
```

Then verify:
```bash
$B goto https://huggingface.co/spaces/NurseCitizenDeveloper/[REPO-NAME]
$B text
$B screenshot /tmp/hf-live.png
```

Check:
- [ ] App loads without error
- [ ] App is running the new version (check a feature that changed)
- [ ] No "Building..." spinner stuck (if stuck, wait another 60s)
- [ ] Clinical disclaimer visible

---

## Ship Report

```
SHIP REPORT: [App Name]
Date: [Date]
Commit: [git commit hash]

GitHub:   [✅ Pushed to origin/main | ❌ Failed — reason]
HF Spaces: [✅ Pushed to hf/main — building | ❌ Failed — reason]
Verification: [✅ App live at [URL] | ❌ Not loading — reason]

Changes shipped:
- [Bullet list of changes]

Clinical disclaimer: [✅ Present | ❌ Missing]
QA status: [✅ QA passed before ship | ⚠️ QA not run]
```

---

## Rollback

If the deployed app is broken and the previous version was working:

```bash
# Find previous commit hash
git log --oneline -5

# Roll back HF Spaces to previous commit
git push hf [PREVIOUS-COMMIT-HASH]:main --force
```

Then investigate and fix locally before re-shipping.

---

> Never ship a tool that hasn't passed `/qa-streamlit`.
> Never ship a tool missing the clinical disclaimer.
> If in doubt, stop and ask.
