#!/bin/bash

# Diretório com os arquivos sem extensão (diretório atual)
DIR="."

# Navega para o diretório especificado (nesse caso, o diretório atual)
cd "$DIR" || exit

# Loop através de todos os arquivos no diretório
for FILE in *; do
  if [ -f "$FILE" ]; then
    # Obtém o tipo de arquivo usando o comando `file`
    TYPE=$(file --mime-type -b "$FILE")
    
    # Define a extensão com base no tipo MIME
    case "$TYPE" in
      image/jpeg)
        EXT="jpg"
        ;;
      image/png)
        EXT="png"
        ;;
      image/gif)
        EXT="gif"
        ;;
      video/mp4)
        EXT="mp4"
        ;;
      audio/mpeg)
        EXT="mp3"
        ;;
      video/x-matroska)
        EXT="mkv"
        ;;
      application/pdf)
        EXT="pdf"
        ;;
      text/plain)
        EXT="txt"
        ;;
      *)
        EXT="unknown"
        ;;
    esac

    # Renomeia o arquivo adicionando a extensão
    if [ "$EXT" != "unknown" ]; then
      mv "$FILE" "$FILE.$EXT"
    fi
  fi
done
