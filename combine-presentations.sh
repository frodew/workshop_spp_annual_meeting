#!/bin/bash

# Script to combine individual presentation QMD files into a single combined presentation
# Run this script before quarto render to create presentation_slides_combined.qmd

echo "======================================"
echo "Combining presentations..."
echo "======================================"

# Create combined presentation file
echo "Creating combined presentation file..."

# Extract YAML header from file 1 (between first and second ---)
awk 'BEGIN { count=0 }
     /^---$/ { count++; print; if (count==2) { print ""; exit }; next }
     count>=1 { print }' \
     01_intro_digital_trace_data.qmd > presentation_slides_combined.qmd

# Extract content from file 1 (after YAML, before References)
# Skip only the YAML --- delimiters at the beginning
awk 'BEGIN { yaml_count=0; printing=0; content_started=0 }
     /^---$/ && !content_started { yaml_count++; if (yaml_count==2) printing=1; next }
     printing { content_started=1 }
     printing && /^## References/ { exit }
     printing { print }' \
     01_intro_digital_trace_data.qmd >> presentation_slides_combined.qmd

echo "" >> presentation_slides_combined.qmd

# Extract content from file 2 (after YAML, before References)
# Skip only the YAML --- delimiters at the beginning
awk 'BEGIN { yaml_count=0; printing=0; content_started=0 }
     /^---$/ && !content_started { yaml_count++; if (yaml_count==2) printing=1; next }
     printing { content_started=1 }
     printing && /^## References/ { exit }
     printing { print }' \
     02_data_donation_participant_perspective.qmd >> presentation_slides_combined.qmd

echo "" >> presentation_slides_combined.qmd

# Extract content from file 3 (after YAML, before References)
# Skip only the YAML --- delimiters at the beginning
awk 'BEGIN { yaml_count=0; printing=0; content_started=0 }
     /^---$/ && !content_started { yaml_count++; if (yaml_count==2) printing=1; next }
     printing { content_started=1 }
     printing && /^## References/ { exit }
     printing { print }' \
     03_data_donation_researcher_perspective.qmd >> presentation_slides_combined.qmd

# Add combined references section at the end
cat >> presentation_slides_combined.qmd << 'EOF'

## References {style="font-size: 0.30em;"}

::: {#refs style="column-count: 2; column-gap: 1em;"}
:::
EOF

echo "✓ Created presentation_slides_combined.qmd"
echo ""
echo "Now run 'quarto render' to render all presentations including the combined one."
