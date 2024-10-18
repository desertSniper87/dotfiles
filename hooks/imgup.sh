#!/bin/bash

# Configuration
INSTALL_DIR="/usr/local/bin"
SCRIPT_NAME="imgup"
CONFIG_DIR="$HOME/.config/imgup"
CONFIG_FILE="$CONFIG_DIR/config"

# Create installation script
cat > /tmp/imgup << 'EOF'
#!/bin/bash

# Function to show usage
show_usage() {
    echo "Usage: imgup <image_file>"
    echo "Options:"
    echo "  -h, --help     Show this help message"
    echo "  -c, --config   Configure API key"
    echo "  -d, --debug    Enable debug mode"
    exit 1
}

# Function to set configuration
set_config() {
    mkdir -p "$HOME/.config/imgup"
    echo -n "Enter your imgbb API key: "
    read -r api_key
    echo "API_KEY=$api_key" > "$HOME/.config/imgup/config"
    chmod 600 "$HOME/.config/imgup/config"
    echo "Configuration saved!"
    exit 0
}

# Process command line arguments
DEBUG_MODE=0
while [[ $# -gt 0 ]]; do
    case "$1" in
        -h|--help)
            show_usage
            ;;
        -c|--config)
            set_config
            ;;
        -d|--debug)
            DEBUG_MODE=1
            shift
            ;;
        *)
            IMAGE_FILE="$1"
            shift
            ;;
    esac
done

# Check if an image file is provided
if [ -z "$IMAGE_FILE" ]; then
    show_usage
fi

# Load configuration
if [ -f "$HOME/.config/imgup/config" ]; then
    source "$HOME/.config/imgup/config"
else
    echo "Error: Configuration not found. Run 'imgup --config' to set up."
    exit 1
fi

# Check if file exists
if [ ! -f "$IMAGE_FILE" ]; then
    echo "Error: File '$IMAGE_FILE' does not exist"
    exit 1
fi

# Create base64 string without line breaks and strip the mime type prefix
BASE64_STRING=$(base64 -w 0 "$IMAGE_FILE")

if [ $DEBUG_MODE -eq 1 ]; then
    echo "Debug: Sending request to imgbb API..."
    echo "Debug: Image file: $IMAGE_FILE"
    echo "Debug: API Key length: ${#API_KEY}"
    echo "Debug: Base64 string length: ${#BASE64_STRING}"
fi

# Make the API request
if [ $DEBUG_MODE -eq 1 ]; then
    RESPONSE=$(curl --location \
         --verbose \
         --request POST \
         "https://api.imgbb.com/1/upload" \
         --form "key=$API_KEY" \
         --form "image=$BASE64_STRING")
else
    RESPONSE=$(curl --location \
         --silent \
         --request POST \
         "https://api.imgbb.com/1/upload" \
         --form "key=$API_KEY" \
         --form "image=$BASE64_STRING")
fi

# Check if the response contains an error
if echo "$RESPONSE" | grep -q "error"; then
    echo "Error occurred while uploading:"
    if command -v jq >/dev/null 2>&1; then
        echo "$RESPONSE" | jq '.'
    else
        echo "$RESPONSE"
    fi
    exit 1
fi

# Output response
if command -v jq >/dev/null 2>&1; then
    echo "$RESPONSE" | jq '.'
else
    echo "$RESPONSE"
fi
EOF

# Make the script executable
chmod +x /tmp/imgup

# Install the script (requires sudo)
echo "Installing script to $INSTALL_DIR/$SCRIPT_NAME..."
sudo mv /tmp/imgup "$INSTALL_DIR/$SCRIPT_NAME"

echo "Installation completed!"
echo "To configure your API key, run: imgup --config"
