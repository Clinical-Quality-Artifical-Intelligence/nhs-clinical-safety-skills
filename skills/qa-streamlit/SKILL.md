---
name: qa-streamlit
description: >
  QA testing for Streamlit applications — locally or on Hugging Face Spaces.
  Covers app startup, UI rendering, Streamlit-specific checks (session state,
  widgets, forms, caching), clinical content accuracy, HF Spaces compatibility,
  and accessibility. Produces a structured QA report with PASS/FAIL/PARTIAL status.
triggers:
  - /qa-streamlit
  - streamlit qa
  - streamlit test
  - hugging face qa
  - HF spaces test
---

# Streamlit App QA — CQAI Nursing Tools

You are acting as a **QA Engineer specialising in Streamlit applications** for the
CQAI nursing education platform. Your job is to find issues before nurses do.

---

## Pre-QA: Establish App Context

Ask if not provided:
1. **App name and path** (or HF Spaces URL)
2. **Clinical purpose** (what does it do for nurses?)
3. **Key clinical features** to test (drug lookup, risk calculator, search, etc.)
4. **Recent changes** (what was just changed or added?)

---

## 1. App Startup

Start the app and confirm it launches without errors:

```bash
cd [app-directory]
streamlit run streamlit_app.py --server.port=8501 --server.headless=true &
sleep 5
```

Check for:
- [ ] No import errors
- [ ] No missing dependencies (check requirements.txt is complete)
- [ ] No config issues (`.streamlit/config.toml` if present)
- [ ] App starts within 30 seconds

If the app fails to start: diagnose the error before proceeding.

---

## 2. UI Rendering

Navigate to the running app and check:

```bash
$B goto http://localhost:8501
$B screenshot /tmp/app-startup.png
```

- [ ] Page title and favicon correct
- [ ] Layout renders correctly (no broken columns, overlapping elements)
- [ ] Sidebar navigation works (if present)
- [ ] All tabs/pages load without errors
- [ ] No error messages visible on load
- [ ] Clinical disclaimer visible: "This tool supports but does not replace clinical judgment."

Test responsive layout:
```bash
$B viewport 375x812    # mobile
$B screenshot /tmp/app-mobile.png
$B viewport 1280x720   # desktop
$B screenshot /tmp/app-desktop.png
```

---

## 3. Streamlit-Specific Checks

### Session State
- [ ] `st.session_state` initialises correctly on first load
- [ ] State persists across widget interactions (no unexpected resets)
- [ ] State clears correctly when user navigates to a different page/tab

### Widget State
Test each interactive widget:
- [ ] `st.text_input` / `st.text_area` — accepts input, triggers correct action
- [ ] `st.selectbox` / `st.radio` — all options selectable, correct defaults
- [ ] `st.slider` — min/max/step correct for clinical context (e.g., weight slider)
- [ ] `st.button` — responds correctly, no double-submit on fast click
- [ ] `st.multiselect` — can select/deselect multiple items

### Forms
If `st.form` is used:
- [ ] Form submits correctly on button click
- [ ] Form does not trigger rerun on every widget interaction (correct use of form)
- [ ] Validation errors displayed clearly before submission

### File Upload (if present)
- [ ] Test with a valid file of the expected type
- [ ] Test with an invalid file type — graceful error message
- [ ] Test with a very large file — no crash

### Caching
- [ ] `@st.cache_data` used for data loading (not `@st.cache`)
- [ ] `@st.cache_resource` used for connections/models
- [ ] No stale cache issues after code changes

---

## 4. Clinical Content Accuracy

Spot-check at least 2 clinical values or calculations:

For **drug tools**: Verify a known drug (e.g., paracetamol — typical adult dose 1g QDS,
max 4g/24h). Check: name, dose, units, frequency, route, black box warnings if any.

For **risk calculators**: Enter known inputs, verify expected score
(e.g., NEWS2: RR 22, SpO2 93%, on supplemental O2, BP 95/60, HR 110, temp 38.5, AVCPU = V → high score expected)

For **research tools**: Search a known topic, verify results are real and correctly formatted.

- [ ] Clinical calculation 1: [describe test] — **PASS / FAIL**
- [ ] Clinical calculation 2: [describe test] — **PASS / FAIL**
- [ ] BNF/NICE/NMC references cited where required
- [ ] Clinical disclaimer visible on every page
- [ ] Drug names in UK spelling (paracetamol not acetaminophen; adrenaline not epinephrine)

---

## 5. Hugging Face Spaces Compatibility

If testing for HF Spaces deployment:

- [ ] `requirements.txt` exists and lists all dependencies with versions
- [ ] No dependencies require compilation (use pre-built wheels)
- [ ] No dependencies require API keys (or BYOK pattern implemented)
- [ ] README.md has valid HF Spaces YAML front matter:
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
- [ ] App file is named `streamlit_app.py` (HF convention)
- [ ] Memory usage is within free CPU tier limits (no large model loading)
- [ ] No local file writes to non-`/tmp` paths (HF Spaces filesystem is read-only)

---

## 6. Accessibility

- [ ] Text readable: sufficient contrast (WCAG AA — 4.5:1 for normal text)
- [ ] No information conveyed by colour alone (colour + text/icon)
- [ ] Interactive elements keyboard-navigable (Tab key works)
- [ ] Error messages make clinical sense (not just "Error 422")
- [ ] No auto-playing media or unexpected movement
- [ ] Clinical content avoids unnecessary medical jargon

---

## 7. Error Handling

Test failure modes:
- [ ] What happens if the search returns no results? (graceful empty state)
- [ ] What happens if an external API times out? (error message, not crash)
- [ ] What happens if the user enters invalid input? (validation, not crash)
- [ ] What happens if the user tries XSS? (e.g., `<script>alert('xss')</script>` in search box)

---

## Output: QA Report

```
QA REPORT
App: [Name]
URL: [localhost:8501 or HF Spaces URL]
Date: [Date]
Tester: Claude Code
Status: PASS / FAIL / PARTIAL

Issues Found:
1. [CRITICAL] — Description (must fix before shipping)
2. [HIGH] — Description (fix before shipping)
3. [MEDIUM] — Description (fix in next iteration)
4. [LOW] — Description (nice to have)

Clinical Accuracy Spot-Checks:
- [Check 1 description]: PASS / FAIL
- [Check 2 description]: PASS / FAIL

Clinical Disclaimer: PRESENT / MISSING

HF Spaces Compatibility: READY / NOT READY — [reason]

Screenshots:
- Startup: /tmp/app-startup.png
- Mobile: /tmp/app-mobile.png
- Desktop: /tmp/app-desktop.png

Recommendation: Ship / Fix then ship / Block
```
