#!/bin/bash

# Nome do próprio script
script_name=$(basename "$0")

# Verificar se um diretório foi fornecido como argumento, caso contrário, usar o diretório atual
if [ -z "$1" ]; then
    echo "Atenção: Nenhum diretório foi fornecido. O diretório atual será usado e os arquivos neste diretório serão renomeados."
    directory="."
else
    directory="$1"
fi

# Verificar se um prefixo foi fornecido
prefix="$2"

echo "Nome do script: $script_name"
echo "Diretório em uso: $(cd "$directory" && pwd)"

# Mudar para o diretório fornecido
cd "$directory" || exit

# Obter uma lista de extensões únicas no diretório
extensoes=$(find . -maxdepth 1 -type f | sed -n 's/.*\.//p' | sort | uniq)
echo "Extensões encontradas: $extensoes"

# Iterar sobre cada extensão
for ext in $extensoes; do
    echo "Processando extensão: $ext"
    # Contador para os novos nomes dos arquivos
    counter=1

    # Encontrar todos os arquivos com a extensão atual, ordenar pela data de modificação (do mais antigo para o mais novo)
    find . -maxdepth 1 -type f -name "*.$ext" -print0 | while IFS= read -r -d '' file; do
        # Obter o nome base do arquivo
        base_name=$(basename "$file")

        # Ignorar o próprio script
        if [ "$base_name" == "$script_name" ]; then
            echo "Ignorando o próprio script: $base_name"
            continue
        fi

        # Construir o novo nome do arquivo
        if [ -n "$prefix" ]; then
            new_name="${prefix}$(printf "%03d" $counter).${ext}"
        else
            new_name="$(printf "%02d" $counter).${ext}"
        fi

        echo "Renomeando '$base_name' para '$new_name'"

        # Renomear o arquivo
        mv "$file" "$new_name" && echo "Arquivo '$base_name' renomeado para '$new_name'" || echo "Falha ao renomear '$base_name'"

        # Incrementar o contador
        counter=$((counter + 1))
    done

    # Exibir a lista de arquivos após processar cada extensão
    echo "Arquivos no diretório após processar extensão .$ext:"
    ls -l
done

echo "Renomeação concluída."
