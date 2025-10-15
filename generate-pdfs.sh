#!/bin/bash

# Script to generate PDFs from rendered HTML presentations using decktape
# This script is automatically called after quarto render

echo "======================================"
echo "Generating PDFs from presentations..."
echo "======================================"

# Create pdf directory if it doesn't exist
mkdir -p docs/pdf

# Define the presentations to convert
presentations=(
    "01_intro_digital_trace_data"
    "02_data_donation_participant_perspective"
    "03_data_donation_researcher_perspective"
)

# Check if HTML files exist
if [ ! -f "docs/index.html" ]; then
    echo "ERROR: docs/index.html not found. Run 'quarto render' first."
    exit 1
fi

# Find an available port
PORT=8888
while lsof -Pi :$PORT -sTCP:LISTEN -t >/dev/null 2>&1; do
    PORT=$((PORT + 1))
done

# Start a simple HTTP server in the background
echo "Starting local HTTP server on port $PORT..."
cd docs
python3 -m http.server $PORT > /dev/null 2>&1 &
SERVER_PID=$!
cd ..

# Wait for server to start
echo "Waiting for server to be ready..."
sleep 3

# Check if server is running
if ! kill -0 $SERVER_PID 2>/dev/null; then
    echo "ERROR: Failed to start HTTP server"
    exit 1
fi

echo "Server started (PID: $SERVER_PID)"
echo ""

# Generate PDFs
for presentation in "${presentations[@]}"; do
    echo "Converting ${presentation}.html to PDF (this may take a few minutes)..."

    # Run decktape with specified options
    decktape reveal \
        "http://localhost:$PORT/${presentation}.html" \
        "docs/pdf/${presentation}.pdf" \
        --fragments=true \
        --progress=true \
        --size=1920x1080 \
        2>&1 | grep -E "(Loading|Printed|Saving)" || true

    if [ -f "docs/pdf/${presentation}.pdf" ]; then
        file_size=$(du -h "docs/pdf/${presentation}.pdf" | cut -f1)
        echo "✓ Created ${presentation}.pdf (${file_size})"
    else
        echo "✗ Failed to create ${presentation}.pdf"
    fi
    echo ""
done

# Stop the HTTP server
echo "Stopping HTTP server..."
kill $SERVER_PID 2>/dev/null || true
wait $SERVER_PID 2>/dev/null || true

echo "======================================"
echo "PDF generation complete!"
echo "PDFs saved to: docs/pdf/"
echo "======================================"
echo ""
ls -lh docs/pdf/*.pdf 2>/dev/null || echo "No PDFs found"
