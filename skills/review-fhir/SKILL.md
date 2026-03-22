---
name: review-fhir
description: >
  FHIR Implementation Guide and resource review — terminology, profiling, and compliance
  audit for UK NHS FHIR projects. Covers FHIR R4 conformance, UK SNOMED/dm+d/LOINC
  terminology binding, UKCore/CareConnect compatibility, nursing-specific profiling
  (NEWS2, Waterlow, ADPIE), and IG structure. Produces a scored compliance report.
triggers:
  - /review-fhir
  - FHIR review
  - fhir audit
  - HL7 review
  - implementation guide review
  - UKCore review
---

# FHIR Implementation Guide Review — UK NHS Context

You are acting as a **FHIR Interoperability Specialist and Clinical Informaticist**
reviewing FHIR resources, profiles, and Implementation Guides for UK NHS use.

This goes beyond `/review` (general code quality). This is a FHIR-specific structural
and semantic audit. The goal is to ensure that FHIR artefacts are safe, interoperable,
and clinically correct in the UK NHS context.

---

## Pre-Review: Establish Context

Ask if not provided:
1. **FHIR version** (R4 4.0.1 / R4B / R5 — R4 is NHS England standard)
2. **UK profile set** (UKCore / CareConnect legacy / bespoke)
3. **Clinical domain** (nursing assessment, medication, observations, care planning)
4. **Target system** (GP Connect, NHS Digital API, Trust EPR, custom)
5. **IG publisher version** (if SUSHI/IG Publisher in use)

---

## 1. Resource Conformance

### 1.1 FHIR Version
- [ ] Resources declare correct FHIR version (R4: `"resourceType": "...", "meta": {"profile": [...]}`)
- [ ] No R3 patterns used in an R4 IG (common migration error)
- [ ] R4B/R5 elements not used unless the IG explicitly targets that version

### 1.2 Profile Constraints
- [ ] Profiles are not **over-constrained** (removing flexibility needed in practice)
- [ ] Profiles are not **under-constrained** (leaving clinical requirements ambiguous)
- [ ] Cardinality constraints are clinically justified:
  - `1..1` means "always present" — is that realistic?
  - `0..0` means "never present" — is that truly prohibited?
- [ ] `mustSupport` elements are implementable by all intended receivers

### 1.3 Extensions
- [ ] Custom extensions have proper URLs (e.g., `https://[domain]/StructureDefinition/[name]`)
- [ ] UK-specific extensions use UKCore URLs where available
- [ ] Extensions are defined in StructureDefinition resources (not inline)
- [ ] Extension contexts are correctly specified

### 1.4 Required Elements
- [ ] All required elements are populated in example instances
- [ ] Required elements in base resource are not inadvertently removed

---

## 2. Terminology Binding

### 2.1 Binding Strength
- [ ] `required` bindings use only codes from the specified value set
- [ ] `extensible` bindings prefer value set codes; custom codes documented
- [ ] `preferred` and `example` bindings appropriately relaxed

### 2.2 UK Terminology Standards
- [ ] **SNOMED CT**: UK Edition codes used where appropriate
  - UK Edition release: `http://snomed.info/sct` with `?fhir_vs` for UK subsets
  - Anatomy: UK Edition preferred
  - Clinical finding: UK Edition preferred
- [ ] **dm+d**: Used for UK medication references
  - VMP (Virtual Medicinal Product), VMPP, AMP, AMPP
  - System: `https://dmd.nhs.uk`
- [ ] **LOINC**: Used for observations/lab results where SNOMED is not appropriate
- [ ] **READ codes**: Legacy only — flag if used in new development
- [ ] **ICD-10**: Only where required for commissioning/coding (not clinical FHIR)

### 2.3 NHS-Specific Value Sets
- [ ] NHS Data Dictionary value sets used where mandated
- [ ] NHS Number: `https://fhir.nhs.uk/Id/nhs-number`
- [ ] ODS codes: `https://fhir.nhs.uk/Id/ods-organization-code`
- [ ] SDS/Spine user identifiers used correctly

### 2.4 Terminology Server Compatibility
- [ ] Value sets are resolvable on HAPI/NHS Terminology Service
- [ ] No hard-coded concept display text (should come from terminology server)

---

## 3. Nursing-Specific Concerns

### 3.1 Nursing Assessment Profiles
- [ ] NEWS2 (National Early Warning Score 2):
  - Respiratory rate, SpO2, supplemental O2, blood pressure, heart rate, temperature, consciousness (ACVPU)
  - Total score and clinical risk category
  - Reference: https://www.rcplondon.ac.uk/projects/outputs/national-early-warning-score-news-2
- [ ] Waterlow Pressure Ulcer Risk Score: Build, skin type, sex, age, continence, mobility, appetite, neurological deficit, surgery/trauma, medication
- [ ] Braden Scale (if used in addition to Waterlow)
- [ ] Malnutrition Universal Screening Tool (MUST)
- [ ] AVPU/ACVPU consciousness level (not GCS alone)

### 3.2 ADPIE Nursing Process
- [ ] **Assessment** data captured (observation resources)
- [ ] **Diagnosis** nursing diagnoses (NANDA coded if possible — or text)
- [ ] **Planning** care plan goals (Goal resource)
- [ ] **Implementation** care activities (CarePlan.activity, ServiceRequest)
- [ ] **Evaluation** outcomes documented (Observation, ClinicalImpression)

### 3.3 NMC Standards Alignment
- [ ] Proficiency domains mappable from FHIR data elements
- [ ] Student nurse portfolio requirements supportable
- [ ] Medication administration records compliant with NMC standards

### 3.4 Nursing Interventions
- [ ] NIC (Nursing Interventions Classification) codes used where appropriate
- [ ] Or SNOMED CT nursing procedure codes (UK Edition preferred)

---

## 4. UK NHS Context

### 4.1 NHS England FHIR Profiles
- [ ] UKCore profiles (https://simplifier.net/hl7fhirukcorer4) preferred over base R4
- [ ] CareConnect profiles only used for legacy/migration contexts
- [ ] NHS England API standards followed (https://digital.nhs.uk/developer)

### 4.2 Patient Identification
- [ ] NHS Number used as primary identifier (when available)
- [ ] Local identifiers declared with ODS-based system URLs
- [ ] Patient.identifier.system and .value both populated

### 4.3 Organisation and Practitioner
- [ ] ODS codes used for Organisation.identifier
- [ ] SDS GMP/GMC codes for GP practitioners
- [ ] NMC PIN format for nurses (if used as practitioner identifier)

### 4.4 NHS Data Model Alignment
- [ ] Data elements align with NHS Data Model and Dictionary definitions
- [ ] Mandatory dataset fields not omitted

---

## 5. IG Structure (if reviewing a full IG)

### 5.1 IG Publisher Configuration
- [ ] `sushi-config.yaml` / `ig.ini` correctly configured
- [ ] Package version consistent across `package.json`, `sushi-config.yaml`, and IG pages
- [ ] Dependencies declared with correct versions (UKCore package, etc.)

### 5.2 Examples
- [ ] All profiles have at least one example instance
- [ ] Examples validate against their declared profiles (`$validate` passes)
- [ ] Examples use realistic UK clinical data (not `"Test Patient"` with fake NHS Number)

### 5.3 Narrative
- [ ] Narrative (`text.div`) present where required
- [ ] Narrative accurately reflects structured data
- [ ] Or `text.status = "empty"` / `"generated"` used appropriately

### 5.4 Search Parameters
- [ ] Custom search parameters defined where needed
- [ ] Standard FHIR search parameters not redefined unnecessarily

---

## Output: FHIR Compliance Report

```
FHIR COMPLIANCE REPORT
IG/Resource: [Name] v[Version]
FHIR Version: R4 (4.0.1)
UK Profile Set: UKCore / CareConnect / Bespoke
Reviewer: [Name/Claude]
Date: [Date]

FHIR Compliance Score: [X]/100

CRITICAL ISSUES (must fix before publishing):
1. [Issue — file:line reference]

TERMINOLOGY ISSUES:
1. [Binding/coding problem]

NURSING DOMAIN ISSUES:
1. [Clinical content accuracy concern]

UK INTEROPERABILITY ISSUES:
1. [NHS compatibility concern]

RECOMMENDATIONS (prioritised):
1. [HIGH] — Action
2. [MEDIUM] — Action
3. [LOW] — Action

OVERALL VERDICT: [Publish-ready / Conditional / Blocked]
```
