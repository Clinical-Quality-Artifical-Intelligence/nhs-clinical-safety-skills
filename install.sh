#!/bin/bash
# NHS Clinical Safety Skills — Install Script
# Copies skills to Claude Code user commands directory

set -e

SKILLS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/skills" && pwd)"
COMMANDS_DIR="$HOME/.claude/commands"

echo "NHS Clinical Safety Skills — Installer"
echo "======================================="
echo ""

# Create commands directory if it doesn't exist
mkdir -p "$COMMANDS_DIR"

# Install each skill as a Claude Code user command
INSTALLED=0
SKIPPED=0

for skill_dir in "$SKILLS_DIR"/*/; do
    skill_name="$(basename "$skill_dir")"
    source="$skill_dir/SKILL.md"
    dest="$COMMANDS_DIR/$skill_name.md"

    if [ ! -f "$source" ]; then
        continue
    fi

    if [ -f "$dest" ]; then
        read -r -p "  ⚠️  $skill_name.md already exists. Overwrite? [y/N] " response
        if [[ "$response" != "y" && "$response" != "Y" ]]; then
            echo "  ↩  Skipped $skill_name"
            SKIPPED=$((SKIPPED + 1))
            continue
        fi
    fi

    cp "$source" "$dest"
    echo "  ✅ Installed: /$skill_name"
    INSTALLED=$((INSTALLED + 1))
done

echo ""
echo "Done! Installed $INSTALLED skills, skipped $SKIPPED."
echo ""
echo "Available commands in Claude Code:"
echo "  /dcb0129              — DCB0129 manufacturer compliance walkthrough"
echo "  /dcb0160              — DCB0160 deployer compliance walkthrough"
echo "  /hazard-log           — Clinical safety hazard log creator"
echo "  /safety-case          — Clinical Safety Case Report writer"
echo "  /crm-plan             — Clinical Risk Management Plan creator"
echo "  /ml-safety            — ML/AI health IT safety assessment"
echo "  /review-clinical-safety — DCB0129/DCB0160 code safety audit"
echo "  /plan-clinical-review   — UK nursing product direction review"
echo "  /qa-streamlit           — Streamlit + HF Spaces QA testing"
echo "  /ship-hf               — Ship to GitHub + Hugging Face Spaces"
echo "  /review-fhir           — FHIR IG and resource compliance audit"
echo ""
echo "Restart Claude Code to load the new commands."
