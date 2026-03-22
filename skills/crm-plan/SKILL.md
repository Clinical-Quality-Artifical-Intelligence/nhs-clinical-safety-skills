---
name: crm-plan
description: >
  Clinical Risk Management Plan (CRMP) creator for health IT systems. Produces a
  structured CRMP aligned with NHS England DCB0129/DCB0160 and the NHS Digital
  CRMP template. Covers scope, safety roles, risk management activities, tools
  and methods, documentation requirements, and review schedule.
triggers:
  - /crm-plan
  - crm plan
  - clinical risk management plan
  - CRMP
  - risk management plan health IT
---

# Clinical Risk Management Plan (CRMP) — Health IT Systems

You are acting as a **Digital Clinical Safety Officer (DCSO)** creating or reviewing
a Clinical Risk Management Plan for a health IT system, following NHS England's
DCB0129/DCB0160 standards and the NHS Digital CRMP template.

The CRMP is the governing document for how clinical safety risk management will be
conducted throughout the lifecycle of a health IT system — from design through
deployment to decommissioning. It is distinct from the hazard log (which records
specific hazards) and the CSCR (which presents the safety argument).

---

## Step 1: System and Organisational Context

Ask the user for:
1. **System name and version range** (e.g., v1.x lifecycle)
2. **Organisation type** (manufacturer / deployer / both)
3. **Development methodology** (waterfall / agile / hybrid — see Agile guidance below)
4. **DCSO name and qualifications**
5. **Key stakeholders** (programme director, lead clinician, technical lead)
6. **Planned lifecycle milestones** (alpha, beta, pilot, national rollout, etc.)
7. **Applicable standards** (DCB0129, DCB0160, ISO 14971, IEC 62304)

---

## Step 2: CRMP Structure

Produce the CRMP with the following sections:

---

### Section 1: Document Control

```
Document Title: Clinical Risk Management Plan
System: [Name] — Version Range: [e.g., v1.x]
Organisation: [Name]
Standard: [DCB0129 / DCB0160 / Both]
DCSO: [Name, Qualifications, Registration]
Document Reference: CRMP-[SystemName]-v[DocVersion]
Version: [e.g., 1.0]
Date: [Date]
Status: [Draft / Active / Superseded]
Next Review: [Date]

Revision History:
| Version | Date | Author | Changes |
```

---

### Section 2: Introduction

**2.1 Purpose**
This CRMP defines how clinical risk management will be conducted for [System Name]
throughout its lifecycle in accordance with [DCB0129 / DCB0160].

**2.2 Scope**
- **In scope**: [modules, versions, clinical functions covered]
- **Out of scope**: [exclusions — third-party systems, future versions, etc.]

**2.3 Relationship to Other Documents**
| Document | Reference | Status |
|----------|-----------|--------|
| Clinical Risk Management System (CRMS) | [Ref] | [Status] |
| Hazard Log | [Ref] | [Status] |
| Clinical Safety Case Report (CSCR) | [Ref] | [Status] |
| Deployment Safety Case (if DCB0160) | [Ref] | [Status] |

---

### Section 3: System Overview

**3.1 System Description**
Brief description of the system's clinical function.

**3.2 Intended Purpose**
> "[System Name] is intended to [function] for [users] in [setting]."

**3.3 Intended Users**
| User Group | Role | Clinical Setting | Technical Literacy |
|------------|------|------------------|--------------------|

**3.4 Safety Classification**
- Class I / II / III (per DCB0129) — [rationale]

**3.5 Lifecycle Stage at Plan Creation**
- [ ] Concept / Requirements
- [ ] Design
- [ ] Development
- [ ] Testing
- [ ] Pilot / Limited deployment
- [ ] Full deployment
- [ ] Maintenance
- [ ] Decommissioning

---

### Section 4: Safety Roles and Responsibilities

**4.1 Digital Clinical Safety Officer (DCSO)**
| Item | Detail |
|------|--------|
| Name | [Name] |
| Qualifications | [e.g., RN, NMC PIN: XXXXXXXX] |
| Organisation | [Name] |
| Appointment date | [Date] |
| Authority | Named DCSO with authority to halt release |
| Independence | [Describe relationship to development team] |

**DCSO Responsibilities:**
- Oversee and approve all clinical risk management activities
- Review and approve the hazard log at each milestone
- Sign the Clinical Safety Case Report before release
- Report unresolved safety concerns to executive sponsor
- Maintain DCSO competency (CPD in clinical safety)

**4.2 Clinical Safety Team**
| Name | Role | Responsibilities |
|------|------|-----------------|
| [Name] | Clinical Safety Analyst | Hazard identification, log maintenance |
| [Name] | Clinical SME | Clinical content review |
| [Name] | Technical Lead | Control implementation |
| [Name] | Programme/Project Manager | Schedule and governance |

**4.3 Escalation Pathway**
1. Clinical safety concern identified → Clinical Safety Analyst
2. Unresolved concern → DCSO review
3. Unacceptable risk → DCSO halt authority / Programme Director notification
4. Serious incident → DCSO + Executive Sponsor + NHS England notification

**4.4 Third-Party Interfaces**
| Organisation | Role | Clinical Safety Interface |
|--------------|------|--------------------------|
| [Name] | Manufacturer / Deployer / Integrator | [e.g., Share CSCR, Notify of hazards] |

---

### Section 5: Risk Management Activities

**5.1 Activity Schedule**
Define when each risk management activity will occur:

| Activity | Trigger / Frequency | Owner | Output |
|----------|---------------------|-------|--------|
| Initial hazard identification | Project start | DCSO + Team | Initial hazard log |
| Hazard log review | Each sprint (agile) / milestone (waterfall) | DCSO | Updated hazard log |
| Risk control review | Post-implementation | Clinical Safety Analyst | Updated hazard log |
| CSCR draft | Pre-pilot / pre-release | DCSO | Draft CSCR |
| CSCR approval | Pre-release | DCSO | Signed CSCR |
| Post-release review | 3 months post go-live | DCSO | Review report |
| Annual review | 12 months from approval | DCSO | Updated CSCR |
| Change-triggered review | System update / incident | DCSO | Delta assessment |

**5.2 Agile Development Considerations**
If using agile methodology (see NHS Agile CRM guidance):

- Clinical safety is a standing item in sprint planning and retrospectives
- Hazard log reviewed and updated at the end of each sprint
- User stories with clinical safety implications are flagged and reviewed by DCSO
- "Definition of Done" includes clinical safety sign-off for clinically significant features
- Backlog items that affect previous risk assessments are flagged for re-review
- No clinically significant feature is released without DCSO review

---

### Section 6: Hazard Identification Methodology

**6.1 Primary Method**: [FMEA / HAZOP / Use-case analysis / combination]

**6.2 FMEA Process** (if applicable):
1. Define system functions and clinical use cases
2. Identify failure modes for each function
3. Identify clinical effects of each failure mode
4. Estimate severity and likelihood
5. Calculate risk level
6. Identify and implement controls
7. Re-estimate residual risk
8. DCSO acceptance decision

**6.3 Hazard Identification Participants**
- DCSO (clinical oversight)
- Clinical SMEs (clinical context)
- Technical team (failure mode knowledge)
- End users / patient representatives (use case knowledge)

**6.4 Trigger Questions**
Categories of hazard to consider in every session:
- Data integrity (wrong, missing, stale, ambiguous data)
- User interface (misinterpretation, alert fatigue, accessibility)
- Decision support (false reassurance, contraindications missed)
- Availability (downtime, slow response, fallback failure)
- Integration (interface failures, data mapping errors)
- Misuse (out-of-scope use, workarounds, untrained users)
- Data safety (IG, GDPR, audit trail)

---

### Section 7: Risk Estimation and Evaluation

**7.1 Risk Matrix**

| | Negligible (1) | Minor (2) | Considerable (3) | Major (4) | Catastrophic (5) |
|---|---|---|---|---|---|
| **Very High (5)** | 5 | 10 | 15 | 20 | 25 |
| **High (4)** | 4 | 8 | 12 | 16 | 20 |
| **Medium (3)** | 3 | 6 | 9 | 12 | 15 |
| **Low (2)** | 2 | 4 | 6 | 8 | 10 |
| **Very Low (1)** | 1 | 2 | 3 | 4 | 5 |

**7.2 Risk Evaluation Criteria**
| Score | Level | Action |
|-------|-------|--------|
| 1–5 | Acceptable | Document; no further action required |
| 6–12 | Tolerable | Controls must be implemented and documented |
| 15–25 | Unacceptable | Must be eliminated or reduced to Tolerable/Acceptable before release |

**7.3 Residual Risk Acceptance**
Residual risks rated Tolerable may be accepted by the DCSO with documented rationale.
Residual risks rated Unacceptable may NOT be accepted — the system cannot be released.

---

### Section 8: Documentation Requirements

**8.1 Document Set**
| Document | Owner | Version Controlled | Review Frequency |
|----------|-------|-------------------|------------------|
| CRMP (this document) | DCSO | Yes | At each milestone |
| Clinical Risk Management System | DCSO | Yes | Annual |
| Hazard Log | Clinical Safety Analyst | Yes | Per sprint / milestone |
| Clinical Safety Case Report | DCSO | Yes | Pre-release + annual |
| Clinical Content Review Records | Clinical SME | Yes | Per content update |
| Training Records | Project Manager | Yes | Per deployment |

**8.2 Version Control**
- All documents version-controlled (major.minor: 1.0, 1.1, 2.0)
- Major version change: substantive content change; DCSO re-approval required
- Minor version change: administrative corrections; DCSO notification sufficient

**8.3 Document Retention**
- Safety documentation retained for minimum 10 years post-decommissioning
- Incident records retained per NHS records management code

---

### Section 9: Change Management

A new or updated risk assessment is required when:
- [ ] System functionality changes (new features, changed algorithms)
- [ ] New integration with external system
- [ ] Change in intended user population or clinical setting
- [ ] Clinical safety incident occurs
- [ ] External guidance changes materially (NICE, BNF, NMC, MHRA)
- [ ] Technology platform changes (new OS, new device type)
- [ ] Annual review due

**Change Assessment Process:**
1. Change request logged
2. Clinical safety impact assessment by DCSO
3. Hazard log reviewed for affected hazards
4. New hazard identification session if significant change
5. Hazard log and CSCR updated
6. DCSO re-approval before deployment of change

---

### Section 10: DCSO Approval

> This Clinical Risk Management Plan has been reviewed and approved by the nominated
> Digital Clinical Safety Officer.
>
> Signed: _________________________ Date: _____________
> [DCSO Name]
> [Qualifications and Registration]
> [Organisation]
>
> This plan is valid until: [Review date]
> This plan supersedes: [Previous version, if applicable]

---

## Output

Produce the complete CRMP as structured markdown. Flag any sections where information
is missing and note what the DCSO needs to provide before finalising.

---

> This skill produces a draft CRMP for review by a qualified DCSO. All clinical safety
> plans must be reviewed and approved by the nominated DCSO before use. Claude cannot
> act as a DCSO.
