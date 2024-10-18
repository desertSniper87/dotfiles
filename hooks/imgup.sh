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
case "$1" in
    -h|--help)
        show_usage
        ;;
    -c|--config)
        set_config
        ;;
esac

# Check if an image file is provided
if [ $# -eq 0 ]; then
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
if [ ! -f "$1" ]; then
    echo "Error: File '$1' does not exist"
    exit 1
fi

# Convert image to base64
BASE64_IMAGE=$(base64 "$1")

# Make the API request
RESPONSE=$(curl --location \
     --silent \
     --request POST \
     "https://api.imgbb.com/1/upload?expiration=600&key=$API_KEY" \
     --form "image=$BASE64_IMAGE")

# Check if jq is available
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
