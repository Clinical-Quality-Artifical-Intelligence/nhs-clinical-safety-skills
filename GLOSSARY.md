# Glossary — Clinical Safety Terms for Digital Health

A plain-English guide to the jargon you'll encounter in NHS clinical safety.
Written for student nurses and anyone new to the Digital Clinical Safety Officer role.

---

## A

**AMLAS**
Assurance of Machine Learning for use in Autonomous Systems. A methodology for
demonstrating that machine learning components are safe to use. NHS England has
published supplementary guidance adapting AMLAS for healthcare contexts.

**AUC (Area Under the Curve)**
A measure of how well a machine learning model distinguishes between outcomes.
An AUC of 1.0 = perfect; 0.5 = no better than chance. Relevant when assessing
AI clinical decision support tools.

---

## C

**CATR — Clinical Authority to Release**
The formal sign-off that a health IT system is clinically safe to be deployed.
Issued after the Clinical Safety Case Report has been reviewed and approved.
Required for nationally specified NHS programmes.

**Class I / II / III**
The clinical safety classification under DCB0129:
- **Class I**: No direct patient risk (e.g., administrative scheduling)
- **Class II**: Low/medium risk — indirect patient impact (e.g., bed management)
- **Class III**: High risk — direct clinical impact (e.g., prescribing, dose calculations, diagnostic support)

**CRMP — Clinical Risk Management Plan**
The document that describes *how* clinical risk management will be conducted
throughout the lifecycle of a health IT system. Created at project start,
updated throughout.

**CRMS — Clinical Risk Management System**
The organisational framework — roles, responsibilities, processes, tools — for
managing clinical risk. The CRMP sits within the CRMS.

**CSCR — Clinical Safety Case Report**
The top-level document presenting the safety argument for a health IT system.
States the safety claim, summarises the hazard log, and demonstrates that
residual risks are acceptable. Must be signed by the DCSO before release.

---

## D

**DCB**
Data Co-ordination Board. The body that assures the quality of NHS Information
Standards. DCB0129 and DCB0160 are Information Standards published under this
process.

**DCB0129**
The mandatory NHS England standard for clinical risk management in the
*manufacture* of health IT systems. Applies to any organisation that develops
or significantly modifies health IT used in NHS care.
→ [Read more](https://digital.nhs.uk/data-and-information/information-standards)

**DCB0160**
The mandatory NHS England standard for clinical risk management in the
*deployment and use* of health IT systems. Applies to NHS trusts, GP practices,
ICBs, and other organisations that deploy health IT.
→ [Read more](https://digital.nhs.uk/data-and-information/information-standards)

**DCSO — Digital Clinical Safety Officer**
The clinically qualified professional responsible for clinical risk management
of a health IT system. Must be nominated in writing, hold a clinical
qualification (e.g., NMC registration), and have authority to halt deployment
if safety concerns arise. Cannot be a non-clinician.

---

## F

**False Negative**
When a clinical tool *misses* something it should have detected. For example:
an AI that fails to flag a dangerous drug interaction. In clinical contexts,
false negatives can be more dangerous than false positives.

**False Positive**
When a clinical tool *incorrectly flags* something as a problem. For example:
an allergy alert that fires for a drug the patient is not actually allergic to.
Too many false positives cause *alert fatigue*.

**FMEA — Failure Mode and Effects Analysis**
A structured method for identifying hazards by asking: "In what way could
this system fail, and what would be the clinical effect?" The primary hazard
identification method in NHS clinical safety work.

---

## H

**Hazard**
A potential source of harm. Not the same as a risk. A hazard is the *thing*
that could go wrong (e.g., "wrong drug dose displayed"). A risk is the
*likelihood × severity* of harm resulting from the hazard.

**Hazard Log**
The document that records all identified hazards, their risk scores, the
controls implemented, and the residual risk. Must be maintained throughout
the system lifecycle. See `/hazard-log`.

**HAZOP — Hazard and Operability Study**
An alternative to FMEA for hazard identification. Uses guide words ("No",
"More", "Less", "Other Than") applied to system functions to identify
failure modes. Common in process safety; sometimes used in health IT.

---

## I

**Information Standard**
A formal standard published by NHS England (via the DCB) that organisations
in the health and care sector must comply with. DCB0129 and DCB0160 are
Information Standards.

---

## L

**Likelihood**
How probable it is that a hazard will result in harm. Rated 1–5 in the NHS
risk matrix: 1=Very Low, 2=Low, 3=Medium, 4=High, 5=Very High.

**LASA — Look-Alike, Sound-Alike**
Medications with similar names, spellings, or appearances that are easily
confused. A major source of medication errors. Relevant in medication safety
tool design.

---

## M

**MHRA — Medicines and Healthcare products Regulatory Agency**
The UK regulator for medicines, medical devices, and blood components.
Responsible for regulating *Software as a Medical Device* (SaMD) in the UK.

**ML Distribution Shift**
When an AI/ML model is trained on data from one population or time period,
but deployed in a different context. Can cause the model to perform poorly
without warning.

---

## N

**NMC — Nursing and Midwifery Council**
The professional regulator for nurses and midwives in the UK. Publishes the
Standards of Proficiency for Registered Nurses (2018) which map to digital
health competencies.

---

## O

**OGL — Open Government Licence**
The licence under which NHS England publishes most of its content (including
documentation that informs this resource). Allows free use, copying, and
adaptation with attribution.
→ [OGL v3](https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/)

---

## P

**Post-Market Surveillance**
The ongoing monitoring of a health IT system after it has been released to
detect safety issues that weren't identified pre-release. Required by DCB0129
and analogous to medical device post-market surveillance.

---

## R

**Residual Risk**
The risk that remains *after* controls have been applied. The DCSO must
formally accept all residual risks in the hazard log before signing the CSCR.
Unacceptable residual risks cannot be accepted — the system must not be released.

**Risk**
The combination of the probability that a hazard will occur and the severity
of the harm it would cause. Risk = Severity × Likelihood (NHS 1–25 matrix).

**Risk Control**
A measure that reduces the likelihood or severity of a hazard. Controls are
applied in this order of preference: Design → Protective/Technical → Informational → Procedural.

---

## S

**SaMD — Software as a Medical Device**
Software intended for medical purposes that meets the definition of a medical
device under UK law. Regulated by the MHRA. If a health IT tool makes or
influences a clinical decision, it may be SaMD.

**Severity**
How serious the harm would be if a hazard occurred. Rated 1–5 in the NHS
risk matrix: 1=Negligible, 2=Minor, 3=Considerable, 4=Major, 5=Catastrophic.

**SNOMED CT**
Systematized Nomenclature of Medicine Clinical Terms. The standard clinical
terminology system used in NHS England FHIR implementations. NHS England uses
the UK Edition.

---

## T

**Tolerable Risk**
A risk that cannot be eliminated entirely but has been reduced to a level
that is acceptable given the benefits. Residual risk scores of 6–12 on the
NHS matrix. Must have documented controls before the DCSO can accept.

---

## U

**Unacceptable Risk**
A risk level (score 15–25 on the NHS matrix) that must be eliminated or
reduced before a system can be released. Cannot be accepted by the DCSO
under any circumstances.

---

## Further Reading

- NHS Digital Clinical Safety Documentation: https://digital.nhs.uk/services/clinical-safety/documentation
- NMC Standards of Proficiency: https://www.nmc.org.uk/standards/standards-for-nurses/
- MHRA SaMD guidance: https://www.gov.uk/government/publications/software-and-ai-as-a-medical-device-change-programme-roadmap
- NHS England Clinical Safety team: clinical.safety@nhs.net

---

<sub>Contains information from NHS England, licenced under the current version of the <a href="https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/">Open Government Licence</a>. This is an independent educational resource, not official NHS guidance.</sub>
