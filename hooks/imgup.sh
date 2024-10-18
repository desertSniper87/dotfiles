#!/bin/bash

# Configuration
INSTALL_DIR="/usr/local/bin"
SCRIPT_NAME="imgup"

# Create temporary Python script
TMP_SCRIPT=$(mktemp)

# Copy the Python script content
cat > "$TMP_SCRIPT" << 'PYTHON_EOF'
#!/usr/bin/env python3

import os
import sys
import json
import argparse
import configparser
from pathlib import Path
import requests
from typing import Optional, Dict, Any

class ImgBBUploader:
    def __init__(self):
        self.config_dir = Path.home() / '.config' / 'imgup'
        self.config_file = self.config_dir / 'config.ini'
        self.api_key = self._load_config()

    def _load_config(self) -> Optional[str]:
        """Load API key from config file."""
        if not self.config_file.exists():
            return None

        config = configparser.ConfigParser()
        config.read(self.config_file)
        return config.get('imgbb', 'api_key', fallback=None)

    def configure(self) -> None:
        """Configure the API key."""
        self.config_dir.mkdir(parents=True, exist_ok=True)

        api_key = input("Enter your ImgBB API key: ").strip()

        config = configparser.ConfigParser()
        config['imgbb'] = {'api_key': api_key}

        with open(self.config_file, 'w') as f:
            config.write(f)

        # Set file permissions to user-only
        self.config_file.chmod(0o600)
        print("Configuration saved!")

    def upload(self, image_path: str, debug: bool = False) -> Dict[str, Any]:
        """Upload an image to ImgBB."""
        if not self.api_key:
            raise ValueError("API key not configured. Run 'imgup --config' first.")

        if not os.path.exists(image_path):
            raise FileNotFoundError(f"Image file not found: {image_path}")

        if debug:
            print(f"Debug: Uploading file: {image_path}")
            print(f"Debug: API key length: {len(self.api_key)}")

        url = "https://api.imgbb.com/1/upload"

        with open(image_path, 'rb') as image_file:
            files = {'image': image_file}
            data = {'key': self.api_key}

            if debug:
                print("Debug: Sending request to ImgBB API...")

            response = requests.post(url, files=files, data=data)

            if debug:
                print(f"Debug: Response status code: {response.status_code}")

            response_data = response.json()

            if not response.ok:
                raise Exception(f"Upload failed: {json.dumps(response_data, indent=2)}")

            return response_data

def main():
    parser = argparse.ArgumentParser(description='Upload images to ImgBB')
    parser.add_argument('image', nargs='?', help='Image file to upload')
    parser.add_argument('-c', '--config', action='store_true', help='Configure API key')
    parser.add_argument('-d', '--debug', action='store_true', help='Enable debug output')
    args = parser.parse_args()

    uploader = ImgBBUploader()

    try:
        if args.config:
            uploader.configure()
            return

        if not args.image:
            parser.print_help()
            return

        result = uploader.upload(args.image, args.debug)
        print(json.dumps(result, indent=2))

    except Exception as e:
        print(f"Error: {str(e)}", file=sys.stderr)
        sys.exit(1)

if __name__ == '__main__':
    main()
PYTHON_EOF

# Make the script executable
chmod +x "$TMP_SCRIPT"

# Check Python dependencies
echo "Checking Python dependencies..."
python3 -c "import requests" 2>/dev/null || {
    echo "Installing required Python package: requests"
    pip3 install requests
}

# Install the script
echo "Installing script to $INSTALL_DIR/$SCRIPT_NAME..."
sudo mv "$TMP_SCRIPT" "$INSTALL_DIR/$SCRIPT_NAME"

echo "Installation completed!"
echo "To configure your API key, run: imgup --config"
