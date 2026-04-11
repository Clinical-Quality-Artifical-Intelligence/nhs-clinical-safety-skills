#!/bin/bash
# NHS Clinical Safety Skills — Install Script
# Copies skills to Claude Code user skills directory (modern format)
# Supports both ~/.claude/skills/ (modern) and ~/.claude/commands/ (legacy)

set -e

SKILLS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/skills" && pwd)"
SKILLS_DEST="$HOME/.claude/skills"
LEGACY_DEST="$HOME/.claude/commands"

echo "NHS Clinical Safety Skills — Installer"
echo "======================================="
echo ""

# Create skills directory if it doesn't exist
mkdir -p "$SKILLS_DEST"

# Install each skill to the modern ~/.claude/skills/<name>/SKILL.md location
INSTALLED=0
SKIPPED=0

for skill_dir in "$SKILLS_DIR"/*/; do
    skill_name="$(basename "$skill_dir")"
    source="$skill_dir/SKILL.md"
    dest_dir="$SKILLS_DEST/$skill_name"
    dest="$dest_dir/SKILL.md"

    if [ ! -f "$source" ]; then
        continue
    fi

    if [ -f "$dest" ]; then
        read -r -p "  ⚠️  $skill_name already exists. Overwrite? [y/N] " response
        if [[ "$response" != "y" && "$response" != "Y" ]]; then
            echo "  ↩  Skipped $skill_name"
            SKIPPED=$((SKIPPED + 1))
            continue
        fi
    fi

    mkdir -p "$dest_dir"
    cp "$source" "$dest"
    echo "  ✅ Installed: /$skill_name"
    INSTALLED=$((INSTALLED + 1))
done

# Clean up legacy commands if they exist
LEGACY_CLEANED=0
if [ -d "$LEGACY_DEST" ]; then
    for skill_dir in "$SKILLS_DIR"/*/; do
        skill_name="$(basename "$skill_dir")"
        legacy_file="$LEGACY_DEST/$skill_name.md"
        if [ -f "$legacy_file" ]; then
            rm "$legacy_file"
            LEGACY_CLEANED=$((LEGACY_CLEANED + 1))
        fi
    done
fi

echo ""
echo "Done! Installed $INSTALLED skills, skipped $SKIPPED."

if [ "$LEGACY_CLEANED" -gt 0 ]; then
    echo "Cleaned $LEGACY_CLEANED legacy commands from ~/.claude/commands/."
fi

echo ""
echo "Installed to: ~/.claude/skills/<name>/SKILL.md (modern format)"
echo "Skills support both manual (/name) and autonomous invocation."
echo ""
echo "Available skills in Claude Code:"
echo "  /dcb0129                — DCB0129 manufacturer compliance walkthrough"
echo "  /dcb0160                — DCB0160 deployer compliance walkthrough"
echo "  /hazard-log             — Clinical safety hazard log creator"
echo "  /safety-case            — Clinical Safety Case Report writer"
echo "  /crm-plan               — Clinical Risk Management Plan creator"
echo "  /ml-safety              — ML/AI health IT safety assessment"
echo "  /review-clinical-safety — DCB0129/DCB0160 code safety audit"
echo "  /plan-clinical-review   — UK nursing product direction review"
echo "  /qa-streamlit           — Streamlit + HF Spaces QA testing"
echo "  /ship-hf                — Ship to GitHub + Hugging Face Spaces"
echo "  /review-fhir            — FHIR IG and resource compliance audit"
echo ""
echo "Restart Claude Code to load the new skills."
