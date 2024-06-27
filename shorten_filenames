#!/bin/bash

# Define o comprimento máximo permitido para o nome do arquivo (sem contar a extensão)
MAX_LENGTH=20

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
    
    # Verifica se o comprimento do nome do arquivo é maior que o permitido
    if [ ${#BASENAME} -gt $MAX_LENGTH ]; then
      # Trunca o nome do arquivo para o comprimento máximo permitido
      NEW_BASENAME="${BASENAME:0:$MAX_LENGTH}"
      # Renomeia o arquivo com o novo nome truncado e mantém a extensão
      mv "$FILE" "$NEW_BASENAME.$EXT"
    fi
  fi
done
