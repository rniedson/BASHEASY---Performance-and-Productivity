#!/bin/bash

# Função de ajuda para exibir como usar o script
function usage() {
  echo "Uso: $0 -d <inicio|fim> -n <quantidade>"
  exit 1
}

# Verifica se o número de argumentos é suficiente
if [ $# -lt 4 ]; then
  usage
fi

# Processa os argumentos
while getopts "d:n:" opt; do
  case $opt in
    d) DIRECTION="$OPTARG" ;;
    n) QUANTITY="$OPTARG" ;;
    *) usage ;;
  esac
done

# Verifica se os argumentos são válidos
if [[ "$DIRECTION" != "inicio" && "$DIRECTION" != "fim" ]]; then
  usage
fi

if ! [[ "$QUANTITY" =~ ^[0-9]+$ ]]; then
  usage
fi

# Diretório com os arquivos (diretório atual)
DIR="."

# Navega para o diretório especificado (nesse caso, o diretório atual)
cd "$DIR" || exit

# Loop através de todos os arquivos no diretório
for FILE in *; do
  if [ -f "$FILE" ]; then
    # Obtém a extensão do arquivo
    EXT="${FILE##*.}"
    # Obtém o nome do arquivo sem a extensão
    BASENAME="${FILE%.*}"

    if [ "$DIRECTION" == "inicio" ]; then
      # Remove os primeiros N caracteres
      NEW_BASENAME="${BASENAME:$QUANTITY}"
    elif [ "$DIRECTION" == "fim" ]; then
      # Remove os últimos N caracteres
      NEW_BASENAME="${BASENAME:0:-$QUANTITY}"
    fi

    # Renomeia o arquivo adicionando a extensão
    mv "$FILE" "$NEW_BASENAME.$EXT"
  fi
done
