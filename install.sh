#!/usr/bin/env bash
# ==============================================================================
# Kartā (कर्ता) - Instalador Automático para o Antigravity
# ==============================================================================

set -e

DEST_DIR="$HOME/.gemini/config/rules"
DEST_FILE="$DEST_DIR/karta.md"
RAW_URL="https://raw.githubusercontent.com/vlaudimirdm-ship-it/karta-agent/main/AGENTS.md"

echo "🔱 Instalando Kartā (कर्ता) - O Executor Universal no Antigravity..."

mkdir -p "$DEST_DIR"

if [ -f "./AGENTS.md" ]; then
    cp "./AGENTS.md" "$DEST_FILE"
else
    curl -fsSL "$RAW_URL" -o "$DEST_FILE" || {
        echo "❌ Erro ao baixar o arquivo. Verifique sua conexão com a internet."
        exit 1
    }
fi

echo "✅ Sucesso! O Kartā foi instalado como regra global do Antigravity em:"
echo "   $DEST_FILE"
echo ""
echo "Agora o Kartā estará ativo automaticamente em qualquer projeto aberto nesta IDE!"
