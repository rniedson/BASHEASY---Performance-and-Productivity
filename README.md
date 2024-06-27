# File Management Scripts

This repository contains three Bash scripts designed to help with various file management tasks. Each script has a specific purpose and comes with detailed usage instructions.

## Scripts

1. **File Extension Renamer Script (`file_extension.sh`)**
   - **Description:** This script renames files in the current directory by adding the appropriate extension based on the file type, even if the files are missing their extensions.
   - **Usage:** 
     ```sh
     ./file_extension.sh
     ```
   
   - **Manual:** [File Extension Renamer Script Manual](#Manual%20%3A%20Remove%20Words%20from%20Filenames%20Script)

2. **Shorten Filenames Script (`shorten_filenames.sh`)**
   - **Description:** This script allows you to shorten filenames by removing a specified number of characters from the beginning or the end of the filenames in the current directory, without affecting their extensions.
   - **Usage:** 
     ```sh
     ./shorten_filenames.sh -d <inicio|fim> -n <quantidade>
     ```
   - **Manual:** [Shorten Filenames Script Manual](Manual%20%3A%20File%20Extension%20Renamer%20Script)

3. **Remove Words from Filenames Script (`remove_words.sh`)**
   - **Description:** This script renames files in the current directory by removing specified words from their filenames.
   - **Usage:** 
     ```sh
     ./remove_words.sh word1 [word2 ... wordN]
     ```
   - **Manual:** [Remove Words from Filenames Script Manual](#Manual-Remove-Words-from-Filenames-Script)


