#!/usr/bin/env bash
# ==============================================================================
# Kartā (कर्ता) - Instalador Automático para o Antigravity
# ==============================================================================

set -e

DEST_DIR="$HOME/.gemini/config/rules"
DEST_FILE="$DEST_DIR/karta.md"

echo "🔱 Instalando Kartā (कर्ता) - O Executor Universal no Antigravity..."

mkdir -p "$DEST_DIR"

# Se o script estiver sendo executado via curl/pipe, baixa do GitHub
if [ -n "$REPO_URL" ]; then
    curl -fsSL "$REPO_URL" -o "$DEST_FILE"
elif [ -f "./AGENTS.md" ]; then
    cp "./AGENTS.md" "$DEST_FILE"
else
    # URL pública padrão (será atualizada com seu usuário do GitHub)
    RAW_URL="https://raw.githubusercontent.com/vlaudimird/karta-agent/main/AGENTS.md"
    curl -fsSL "$RAW_URL" -o "$DEST_FILE" 2>/dev/null || {
        echo "❌ Não foi possível baixar diretamente. Certifique-se de que o arquivo AGENTS.md existe no diretório atual."
        exit 1
    }
fi

echo "✅ Sucesso! O Kartā foi instalado como regra global do Antigravity em:"
echo "   $DEST_FILE"
echo ""
echo "Agora o Kartā estará ativo automaticamente em qualquer projeto aberto nesta IDE!"

