#!/bin/bash

echo "============================================="
echo " 🐍 Impacket Like a Kali - Setup iniciado"
echo "============================================="

# Passo 1: Perguntar (ou usar padrão) onde clonar o Impacket
read -p "[?] Em qual diretório deseja instalar o Impacket? (padrão: ~/Tools) " TOOLS_DIR
TOOLS_DIR=${TOOLS_DIR:-$HOME/Tools}

echo "[*] Usando diretório: $TOOLS_DIR"
mkdir -p "$TOOLS_DIR"
cd "$TOOLS_DIR" || {
    echo "[-] Erro ao acessar $TOOLS_DIR"
    exit 1
}

# Passo 2: Clonar Impacket se não existir
if [ ! -d "impacket" ]; then
    echo "[*] Clonando Impacket..."
    git clone https://github.com/fortra/impacket.git impacket
else
    echo "[*] Diretório Impacket já existe. Pulando clone."
fi

cd impacket || {
    echo "[-] Erro ao acessar impacket/"
    exit 1
}

# Passo 3: Criar e ativar o venv
if [ ! -d "venv" ]; then
    echo "[*] Criando virtualenv..."
    python3 -m venv venv
fi

echo "[*] Ativando virtualenv..."
source venv/bin/activate

# Passo 4: Instalar dependências
echo "[*] Instalando dependências..."
pip install -U pip
pip install .

# Passo 5: Criar diretório de wrappers
echo "[*] Criando diretório de wrappers: ~/bin/impacket"
mkdir -p ~/bin/impacket

cd examples || {
    echo "[-] Diretório examples não encontrado!"
    exit 1
}

# Passo 6: Gerar wrappers
echo "[*] Gerando wrappers com prefixo 'impacket-'..."
for script in *.py; do
    name=$(basename "$script" .py)
    wrapper="$HOME/bin/impacket/impacket-$name"
    cat <<EOF > "$wrapper"
#!/bin/bash
source ${TOOLS_DIR}/impacket/venv/bin/activate
exec python3 "${TOOLS_DIR}/impacket/examples/$script" "\$@"
EOF
    chmod +x "$wrapper"
    echo "[+] Wrapper criado: impacket-$name"
done

# Passo 7: Adicionar ao PATH se necessário
if ! grep -q 'bin/impacket' ~/.zshrc; then
    echo 'export PATH="$HOME/bin/impacket:$PATH"' >> ~/.zshrc
    echo "[+] PATH atualizado no ~/.zshrc"
else
    echo "[*] PATH já contém ~/bin/impacket. Nenhuma alteração no ~/.zshrc."
fi

# Passo 8: Orientação ao usuário
echo "============================================="
echo "[✔] Setup concluído!"
echo "[ℹ] Abra um novo terminal ou execute: source ~/.zshrc"
echo "[ℹ] Teste: impacket-secretsdump -h"
echo "============================================="
