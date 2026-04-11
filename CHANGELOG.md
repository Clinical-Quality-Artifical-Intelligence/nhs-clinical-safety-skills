# Changelog

All notable changes to this project are documented here.

Clinical content changes are marked with ⚕️. Breaking changes to skill format are marked with ⚠️.

---

## [1.2.0] — 2026-04-11

### Added
- `CODE_OF_CONDUCT.md` — Contributor Covenant adapted with clinical accuracy provisions
- `CITATION.cff` — Machine-readable citation metadata for academic and clinical publications
- `.github/CODEOWNERS` — PR review routing for clinical content vs. tooling
- `.github/FUNDING.yml` — GitHub Sponsors configuration
- `.github/workflows/validate.yml` — CI workflow: validates SKILL.md frontmatter, translation
  completeness, community health files, install script integrity, and internal links

### Changed
- ⚠️ `install.sh` — Now installs skills to `~/.claude/skills/<name>/SKILL.md` (modern format)
  instead of legacy `~/.claude/commands/<name>.md`. Enables autonomous skill invocation.
- ⚠️ `install.sh` — Automatically cleans up legacy command files during upgrade.
- `README.md` — Install instructions updated; added Citing section, Code of Conduct reference,
  and expanded Repository Contents table.

### Removed
- `.github/workflows/blank.yml` — Replaced placeholder CI with real validation workflow.

### Fixed
- `.gitignore` already excluded macOS `._*` resource fork files, confirmed no metadata
  artefacts were tracked in git.

---

## [1.1.0] — 2026-03-22

### Added
- `GLOSSARY.md` — Plain-English definitions of clinical safety jargon for student nurses
- `RESOURCES.md` — Curated free learning resources (NMC, NICE, MHRA, NHS Digital, FHIR)
- `CONTRIBUTING.md` — Contribution guidelines with clinical content standards
- `ATTRIBUTION.md` — Full OGL copyright attribution and no-endorsement statement
- `DISCLAIMER.md` — Educational resource disclaimer; DCSO role caveat
- `LICENSE` — MIT licence with OGL attribution note
- `.github/ISSUE_TEMPLATE/` — Three templates: clinical content error, skill request, general bug
- `.github/PULL_REQUEST_TEMPLATE.md` — PR template enforcing clinical source citation

### Changed
- `README.md` — Complete overhaul: student nurse learning path, risk matrix table,
  skills table with links, usage examples, badges, recommended workflow
- All 8 clinical safety skills — OGL attribution footer added

### Security / Legal
- Added mandatory OGL attribution to all skill files and repo-level documents
- Confirmed skills are original educational works (not reproductions of DCB standards)
- Added explicit no-endorsement statement (no NHS England / NMC / NICE affiliation)

---

## [1.0.0] — 2026-03-22

### Added
- Initial release: 11 Claude Code skills for clinical safety and nursing practice

**New skills (based on NHS Digital Clinical Safety Documentation):**
- ⚕️ `/dcb0129` — DCB0129 manufacturer compliance walkthrough
- ⚕️ `/dcb0160` — DCB0160 deployer compliance walkthrough
- ⚕️ `/hazard-log` — FMEA-based clinical hazard log creator
- ⚕️ `/safety-case` — Clinical Safety Case Report (CSCR) writer
- ⚕️ `/crm-plan` — Clinical Risk Management Plan (CRMP) creator
- ⚕️ `/ml-safety` — ML/AI health IT safety assessment (AMLAS supplementary, MHRA SaMD)

**CQAI skills (enhanced from existing CQAI commands):**
- ⚕️ `/review-clinical-safety` — DCB0129/DCB0160 code-level safety audit
- ⚕️ `/plan-clinical-review` — UK nursing product direction review (NMC Standards 2018)
- `/qa-streamlit` — Streamlit + Hugging Face Spaces QA testing
- `/ship-hf` — Release workflow: GitHub + Hugging Face Spaces
- `/review-fhir` — FHIR R4 UK compliance audit (UKCore, SNOMED UK, dm+d)

- `install.sh` — One-command installer for all skills

---

## Clinical Content Review Schedule

Clinical content is reviewed when:
- NHS England updates DCB0129/DCB0160
- NICE publishes relevant guideline updates
- NMC Standards are revised
- A clinical content error is reported via GitHub Issues

Next scheduled review: March 2027

---

<sub>Contains information from NHS England, licenced under the current version of the Open Government Licence.</sub>
