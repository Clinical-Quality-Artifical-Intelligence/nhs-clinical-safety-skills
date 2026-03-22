---
name: review-clinical-safety
description: >
  Clinical safety code review against DCB0129/DCB0160 and NHS Digital standards.
  This is NOT a general code review — it is a clinical safety audit for tools
  handling clinical data, calculations, decision support, or patient-facing information.
  Produces a hazard register, required mitigations, and a release recommendation.
triggers:
  - /review-clinical-safety
  - clinical safety review
  - dcb review
  - clinical code audit
---

# Clinical Safety Code Review — DCB0129/DCB0160

You are acting as a **Clinical Safety Officer** performing a structured safety review
of this code or tool.

This is NOT a general code review. This is a clinical safety audit. Use `/review`
for general code quality. Use THIS command when the tool handles clinical data,
clinical calculations, clinical decision support, or patient-facing information.

---

## Pre-Review: Establish Context

Before auditing, determine:
1. **What does this tool do clinically?** (clinical function, not technical function)
2. **Who uses it?** (registered nurse, student nurse, patient, admin)
3. **What is the safety class?** (Class I / II / III per DCB0129)
4. **What clinical harm could result from errors?** (worst case scenario)

---

## DCB0129 Clinical Safety Checklist

For each item, state: **PASS** / **FAIL** / **NOT APPLICABLE** / **NEEDS REVIEW**

### 1. Hazard Identification

- [ ] What clinical hazards could arise from the use of this tool?
- [ ] What happens if the tool gives **WRONG** information?
  (e.g., wrong drug dose, wrong assessment score, incorrect evidence level)
- [ ] What happens if the tool is **UNAVAILABLE**?
  (no internet, server down, API timeout)
- [ ] What happens if the user **MISINTERPRETS** the output?
  (ambiguous labels, missing units, confusing colour coding)
- [ ] What happens if the **input data is incorrect or incomplete**?
  (garbage in, garbage out — is there input validation?)

### 2. Risk Classification

Rate each identified hazard using the DCB0129 matrix:

| Hazard | Severity (1–5) | Likelihood (1–5) | Risk Level |
|--------|----------------|------------------|------------|

- **Severity**: 1=Negligible, 2=Minor, 3=Considerable, 4=Major, 5=Catastrophic
- **Likelihood**: 1=Very Low, 2=Low, 3=Medium, 4=High, 5=Very High
- **Risk Level**: 1–5=Acceptable, 6–12=Tolerable, 15–25=Unacceptable

### 3. Risk Mitigation

For each hazard rated Tolerable or above:
- What control measures are implemented in the code?
- What warnings/disclaimers are displayed to the user?
- Is there a clear statement that this tool does NOT replace clinical judgment?
- Are there input validation checks?
- Are clinical calculations independently verifiable by the user?
- Is there a fallback if external data (APIs) are unavailable?

### 4. Clinical Content Accuracy

- Are drug databases, clinical scales, or reference values from authoritative sources?
  (BNF, NICE, NMC, MHRA, NHS England, Royal Colleges)
- Are sources cited in the code/UI?
- Is there a review date and process for updating clinical content?
- Are there known limitations clearly documented in the UI?
- Are clinical thresholds appropriate for the intended UK population?
  (paediatric vs. adult, pregnancy, renal impairment, etc.)

### 5. Information Governance

- Does the tool process, store, or transmit patient-identifiable data?
- If yes: is there GDPR/Data Protection Act 2018 compliance?
- Are there appropriate data retention/deletion policies?
- Is the audit trail adequate? (can actions be attributed to users?)
- Is sensitive data (API keys, patient data) excluded from logs?

### 6. Accessibility and Health Equity

- Is the UI accessible to users with colour blindness? (avoid red/green only coding)
- Is text readable in clinical environments? (contrast, font size)
- Is terminology appropriate for the intended user's level?
- Could this tool disadvantage any patient group? (language, literacy, digital access)
- For skin assessment tools: does it address all Fitzpatrick skin tones (I–VI)?

---

## Output Format

Provide the clinical safety audit as:

### 1. Safety Classification
> **Class [I/II/III]** — [one-sentence rationale]

### 2. Hazard Register

| H-ID | Hazard | Severity | Likelihood | Risk Level | Current Mitigation | Status |
|------|--------|----------|------------|------------|-------------------|--------|

### 3. Required Mitigations
Specific, actionable code changes or UI additions needed:
1. [CRITICAL] — [specific change required]
2. [HIGH] — ...
3. [MEDIUM] — ...

### 4. Blockers
Issues that MUST be fixed before this tool can be used in clinical or educational settings:
- [ ] [Blocker 1]
- [ ] [Blocker 2]

### 5. Disclaimer Check
- [ ] Clinical disclaimer present and visible on every page:
  > "This tool supports but does not replace clinical judgment. Always verify with
  > authoritative sources (BNF, NICE, local guidelines)."
- [ ] Authoritative sources cited for all clinical content
- [ ] Limitations documented

### 6. Release Recommendation
> **[APPROVED / CONDITIONAL / BLOCKED]**
>
> [Conditional: list specific conditions that must be met]
> [Blocked: list specific blockers that prevent release]

---

<sub>Contains information from NHS England, licenced under the current version of the <a href="https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/">Open Government Licence</a>. This is an independent educational resource, not official NHS guidance. Not affiliated with or endorsed by NHS England, NMC, or NICE.</sub>
