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
