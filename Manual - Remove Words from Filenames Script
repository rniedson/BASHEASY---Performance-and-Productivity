# Remove Words from Filenames Script

This Bash script allows you to rename files in the current directory by removing specified words from their filenames.

## Usage

```sh
./remove_words.sh word1 [word2 ... wordN]
```

### Parameters

- `word1 [word2 ... wordN]`: Words to be removed from the filenames. You can specify one or more words as parameters.

## Examples

### Example 1: Remove a single word from filenames

To remove the word "example" from all filenames in the current directory:

```sh
./remove_words.sh example
```

Before:
```
example_file.txt
example_sample.png
```

After:
```
file.txt
sample.png
```

### Example 2: Remove multiple words from filenames

To remove the words "example" and "test" from all filenames in the current directory:

```sh
./remove_words.sh example test
```

Before:
```
example_test_file.txt
example_sample_test.png
```

After:
```
file.txt
sample.png
```

## Script

```bash
#!/bin/bash

# Check if at least one parameter is provided
if [ $# -eq 0 ]; then
  echo "Usage: $0 word1 [word2 ... wordN]"
  exit 1
fi

# Directory with the files (current directory)
DIR="."

# Navigate to the specified directory (current directory in this case)
cd "$DIR" || exit

# Get the script's name to avoid renaming it
SCRIPT_NAME=$(basename "$0")

# Loop through all files in the directory
for FILE in *; do
  if [ -f "$FILE" ] && [ "$FILE" != "$SCRIPT_NAME" ]; then
    NEW_NAME="$FILE"
    
    # Loop through all words passed as parameters
    for WORD in "$@"; do
      # Remove the word from the filename
      NEW_NAME="${NEW_NAME//$WORD/}"
    done
    
    # Rename the file if the name has changed
    if [ "$NEW_NAME" != "$FILE" ]; then
      mv "$FILE" "$NEW_NAME"
    fi
  fi
done
```

## Notes

- Ensure the script has executable permissions. You can set this with:

  ```sh
  chmod +x remove_words.sh
  ```

- Run the script in the directory containing the files you want to rename. The script processes files in the current directory.
- The script will skip renaming itself to avoid any issues.
