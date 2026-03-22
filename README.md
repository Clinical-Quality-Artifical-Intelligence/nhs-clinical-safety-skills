# NHS Clinical Safety Skills for Claude Code

Claude Code skills for **Digital Clinical Safety Officers (DCSOs)**, **nurses**, and
**health IT developers** — grounded in NHS England's mandatory clinical safety standards.

Built on the [NHS Digital Clinical Safety Documentation](https://digital.nhs.uk/services/clinical-safety/documentation)
including DCB0129, DCB0160, the NHS clinical safety templates, and the AMLAS ML
supplementary guidance.

---

## Who Is This For?

| Role | Skills to Use |
|------|---------------|
| **Health IT manufacturer / developer** | `/dcb0129`, `/hazard-log`, `/safety-case`, `/crm-plan`, `/ml-safety`, `/review-clinical-safety` |
| **NHS organisation deploying health IT** | `/dcb0160`, `/hazard-log`, `/safety-case` |
| **Digital Clinical Safety Officer (DCSO)** | All skills |
| **Nurse building digital health tools** | `/plan-clinical-review`, `/review-clinical-safety`, `/qa-streamlit`, `/ship-hf` |
| **FHIR developer** | `/review-fhir` |

---

## Skills

### DCB0129 — Manufacturer Clinical Safety
**`/dcb0129`** — Guides health IT manufacturers through DCB0129 compliance: DCSO nomination,
Clinical Risk Management System, hazard identification, risk controls, and Clinical
Safety Case Report preparation.

### DCB0160 — Deployer Clinical Safety
**`/dcb0160`** — Guides NHS organisations deploying health IT through DCB0160 compliance:
deployment hazard identification, manufacturer safety case review, staff training,
downtime procedures, and deployment safety case.

### Hazard Log
**`/hazard-log`** — Interactive FMEA-based hazard log creator. Walks through all hazard
categories (data integrity, UI, decision support, availability, integration, misuse, IG),
produces a structured hazard log with NHS risk matrix (Severity × Likelihood, 1–25 scale),
and control measure documentation.

### Clinical Safety Case Report
**`/safety-case`** — Drafts a complete Clinical Safety Case Report (CSCR) for DCB0129/DCB0160
compliance. Covers system overview, safety claim, hazard summary, clinical content accuracy,
safety argument, and DCSO declaration. Ready for NHS England Clinical Safety Group submission.

### Clinical Risk Management Plan
**`/crm-plan`** — Creates a Clinical Risk Management Plan (CRMP) covering scope, safety roles,
risk management activities, agile development considerations, documentation requirements,
and change management triggers.

### ML/AI Safety Assessment
**`/ml-safety`** — Specialist assessment for health IT systems with AI/ML components.
Covers MHRA SaMD classification, training data bias (demographic, skin tone, geographic,
temporal), explainability requirements, failure mode analysis, LLM-specific hazards
(hallucination, prompt injection), and post-market surveillance for AI.

### Clinical Safety Code Review
**`/review-clinical-safety`** — DCB0129/DCB0160 code-level safety audit. Produces a hazard
register, required mitigations, and release recommendation. For any tool handling clinical
data, calculations, decision support, or patient-facing information.

### Clinical Product Direction Review
**`/plan-clinical-review`** — Reviews a plan from a UK nursing perspective before any
technical work begins. Checks NMC Standards of Proficiency (2018) alignment, patient
safety classification, health equity impact, and the "Ward Test". Use instead of
`/plan-ceo-review` for clinical nursing tools.

### Streamlit QA
**`/qa-streamlit`** — QA testing for Streamlit apps on localhost or Hugging Face Spaces.
Covers startup, UI rendering, Streamlit-specific checks, clinical content accuracy,
HF Spaces compatibility, and accessibility.

### Ship to Hugging Face
**`/ship-hf`** — Release workflow for CQAI tools. Pre-flight checks, GitHub commit/push,
HF Spaces push, build monitoring, and live verification.

### FHIR IG Review
**`/review-fhir`** — FHIR R4 Implementation Guide and resource compliance audit for UK NHS.
Covers UKCore profiles, SNOMED CT UK Edition, dm+d, NHS Number/ODS identifiers,
nursing assessment profiles (NEWS2, Waterlow, ADPIE), and IG structure.

---

## Install

```bash
git clone https://github.com/Clinical-Quality-Artifical-Intelligence/nhs-clinical-safety-skills
cd nhs-clinical-safety-skills
./install.sh
```

Then restart Claude Code. All skills are available as `/skill-name` commands.

### Manual Install

Copy any `skills/[skill-name]/SKILL.md` to `~/.claude/commands/[skill-name].md`.

---

## Recommended Workflow

```
1. /plan-clinical-review    — Is this the right thing to build for nurses?
2. /plan-eng-review         — Is the architecture sound?
3. Build the feature
4. /review                  — General code quality (gstack)
5. /review-clinical-safety  — Clinical safety audit
6. /dcb0129                 — Full manufacturer compliance (for release)
7. /hazard-log              — Document all hazards
8. /safety-case             — Write the Clinical Safety Case Report
9. /review-fhir             — FHIR compliance (FHIR projects only)
10. /ml-safety              — AI/ML safety (if applicable)
11. /qa-streamlit           — Test the Streamlit app
12. /ship-hf                — Push to GitHub + Hugging Face Spaces
```

---

## Standards Reference

| Standard | Description | Applies To |
|----------|-------------|------------|
| [DCB0129](https://digital.nhs.uk/data-and-information/information-standards/information-standards-and-data-collections-including-extractions/publications-and-notifications/standards-and-collections/dcb0129-clinical-risk-management-its-application-in-the-manufacture-of-health-it-systems) | Clinical Risk Management — Manufacture | Health IT developers |
| [DCB0160](https://digital.nhs.uk/data-and-information/information-standards/information-standards-and-data-collections-including-extractions/publications-and-notifications/standards-and-collections/dcb0160-clinical-risk-management-its-application-in-the-deployment-and-use-of-health-it-systems) | Clinical Risk Management — Deployment | NHS organisations |
| [NHS Clinical Safety Documentation](https://digital.nhs.uk/services/clinical-safety/documentation) | Templates and guidance | All |
| [NMC Standards (2018)](https://www.nmc.org.uk/standards/standards-for-nurses/standards-of-proficiency-for-registered-nurses/) | Nursing proficiency standards | Nursing tools |
| [AMLAS Supplementary Guidance](https://digital.nhs.uk/services/clinical-safety/documentation) | ML/AI safety | AI health tools |
| [NICE Evidence Standards Framework](https://www.nice.org.uk/about/what-we-do/our-programmes/evidence-standards-framework-for-digital-health-technologies) | Digital health evidence | All digital tools |

---

## Important Disclaimer

> These skills support clinical safety work but do not replace the professional
> judgment of a qualified Digital Clinical Safety Officer (DCSO). DCB0129 and
> DCB0160 compliance requires a clinically qualified DCSO — Claude Code cannot
> fulfil this role. All safety documentation must be reviewed and signed by a
> nominated DCSO before use in compliance submissions.

For clinical safety queries: [clinical.safety@nhs.net](mailto:clinical.safety@nhs.net)

---

## Part of CQAI

Built by [Clinical Quality Artificial Intelligence](https://github.com/Clinical-Quality-Artifical-Intelligence)
for the UK nursing and digital health community.

All CQAI tools include the mandatory disclaimer:
> *"This tool supports but does not replace clinical judgment."*
