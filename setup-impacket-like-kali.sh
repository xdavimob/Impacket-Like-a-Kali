#!/bin/bash

echo "============================================="
echo " 🐍 Impacket Like a Kali - Setup started"
echo "============================================="

# Step 1: Ask or use default directory
read -p "[?] Which directory should Impacket be installed in? (default: ~/Tools) " TOOLS_DIR
TOOLS_DIR=${TOOLS_DIR:-$HOME/Tools}

echo "[*] Using directory: $TOOLS_DIR"
mkdir -p "$TOOLS_DIR"
cd "$TOOLS_DIR" || {
    echo "[-] Error accessing $TOOLS_DIR"
    exit 1
}

# Step 2: Clone Impacket if it doesn't exist
if [ ! -d "impacket" ]; then
    echo "[*] Cloning Impacket..."
    git clone https://github.com/fortra/impacket.git impacket
else
    echo "[*] Impacket directory already exists. Skipping clone."
fi

cd impacket || {
    echo "[-] Error accessing impacket/"
    exit 1
}

# Step 3: Create and activate the virtual environment
if [ ! -d "venv" ]; then
    echo "[*] Creating virtualenv..."
    python3 -m venv venv
fi

echo "[*] Activating virtualenv..."
source venv/bin/activate

# Step 4: Install dependencies
echo "[*] Installing dependencies..."
pip install -U pip
pip install .

# Step 5: Create wrapper directory
echo "[*] Creating wrapper directory: ~/bin/impacket"
mkdir -p ~/bin/impacket

cd examples || {
    echo "[-] examples/ directory not found!"
    exit 1
}

# Step 6: Generate wrappers
echo "[*] Generating wrappers with 'impacket-' prefix..."
for script in *.py; do
    name=$(basename "$script" .py)
    wrapper="$HOME/bin/impacket/impacket-$name"
    cat <<EOF > "$wrapper"
#!/bin/bash
source ${TOOLS_DIR}/impacket/venv/bin/activate
exec python3 "${TOOLS_DIR}/impacket/examples/$script" "\$@"
EOF
    chmod +x "$wrapper"
    echo "[+] Wrapper created: impacket-$name"
done

# Step 7: Add to PATH if needed
SHELL_RC=""
if [[ "$SHELL" =~ zsh ]] && [ -f "$HOME/.zshrc" ]; then
    SHELL_RC="$HOME/.zshrc"
elif [[ "$SHELL" =~ bash ]] && [ -f "$HOME/.bashrc" ]; then
    SHELL_RC="$HOME/.bashrc"
elif [ -f "$HOME/.zshrc" ]; then
    SHELL_RC="$HOME/.zshrc"
elif [ -f "$HOME/.bashrc" ]; then
    SHELL_RC="$HOME/.bashrc"
fi

if [ -n "$SHELL_RC" ]; then
    if ! grep -q 'bin/impacket' "$SHELL_RC"; then
        echo 'export PATH="$HOME/bin/impacket:$PATH"' >> "$SHELL_RC"
        echo "[+] PATH updated in $SHELL_RC"
    else
        echo "[*] PATH already contains ~/bin/impacket. No changes made to $SHELL_RC."
    fi
else
    echo "[!] Could not detect a shell configuration file to update PATH. Please add the following line manually to your shell configuration:"
    echo 'export PATH="$HOME/bin/impacket:$PATH"'
fi


# Step 8: Final instructions
echo "============================================="
echo "[✔] Setup complete!"
echo "[ℹ] Open a new terminal or run: source ~/.zshrc"
echo "[ℹ] Test it: impacket-secretsdump -h"
echo "============================================="