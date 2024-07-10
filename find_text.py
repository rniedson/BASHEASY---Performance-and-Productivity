import os
import re

# Caminho para a pasta onde os arquivos foram extraídos
extracted_folder_path = '.'

# Função para buscar a string dentro dos arquivos
def search_string_in_files(search_string, folder_path):
    matches = {}
    for root, dirs, files in os.walk(folder_path):
        for file in files:
            if file.endswith('.py'):
                file_path = os.path.join(root, file)
                with open(file_path, 'r', encoding='utf-8') as f:
                    content = f.read()
                    if re.search(search_string, content):
                        matches[file_path] = re.findall(search_string, content)
    return matches

# Buscar a string 'PlayerX:1033418837728698459' nos arquivos
search_string = 'PlayerX:1033418837728698459'
matches = search_string_in_files(search_string, extracted_folder_path)

# Exibir os arquivos que contêm a string
print(matches)
