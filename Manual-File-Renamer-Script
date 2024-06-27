
# File Renamer Script

This Bash script allows you to shorten filenames by removing a specified number of characters from the beginning or the end of the filenames in the current directory, without affecting their extensions.

## Usage

```sh
./shorten_filenames.sh -d <inicio|fim> -n <quantidade>
```

### Parameters

- `-d <inicio|fim>`: Direction from which to remove characters. Use `inicio` to remove characters from the beginning of the filename, and `fim` to remove characters from the end of the filename.
- `-n <quantidade>`: Number of characters to remove from the specified direction.

## Examples

### Example 1: Remove characters from the beginning

To remove the first 5 characters from the beginning of the filenames in the current directory:

```sh
./shorten_filenames.sh -d inicio -n 5
```

Before:
```
12345example.txt
12345sample.png
```

After:
```
example.txt
sample.png
```

### Example 2: Remove characters from the end

To remove the last 3 characters (excluding the extension) from the filenames in the current directory:

```sh
./shorten_filenames.sh -d fim -n 3
```

Before:
```
example123.txt
sample123.png
```

After:
```
example.txt
sample.png
```

## Script

```bash
#!/bin/bash

# Function to display usage information
function usage() {
  echo "Usage: $0 -d <inicio|fim> -n <quantidade>"
  exit 1
}

# Check if enough arguments are provided
if [ $# -lt 4 ]; then
  usage
fi

# Process the arguments
while getopts "d:n:" opt; do
  case $opt in
    d) DIRECTION="$OPTARG" ;;
    n) QUANTITY="$OPTARG" ;;
    *) usage ;;
  esac
done

# Validate the arguments
if [[ "$DIRECTION" != "inicio" && "$DIRECTION" != "fim" ]]; then
  usage
fi

if ! [[ "$QUANTITY" =~ ^[0-9]+$ ]]; then
  usage
fi

# Directory with the files (current directory)
DIR="."

# Get the script's name to avoid renaming it
SCRIPT_NAME=$(basename "$0")

# Navigate to the specified directory (current directory in this case)
cd "$DIR" || exit

# Loop through all files in the directory
for FILE in *; do
  if [ -f "$FILE" ] && [ "$FILE" != "$SCRIPT_NAME" ]; then
    # Get the file extension
    EXT="${FILE##*.}"
    # Get the file name without the extension
    BASENAME="${FILE%.*}"

    if [ "$DIRECTION" == "inicio" ]; then
      # Remove the first N characters
      NEW_BASENAME="${BASENAME:$QUANTITY}"
    elif [ "$DIRECTION" == "fim" ]; then
      # Remove the last N characters without affecting the extension
      LEN=${#BASENAME}
      if [ $QUANTITY -ge $LEN ]; then
        NEW_BASENAME=""
      else
        NEW_BASENAME="${BASENAME:0:$(($LEN - $QUANTITY))}"
      fi
    fi

    # Rename the file by adding the extension
    mv "$FILE" "$NEW_BASENAME.$EXT"
  fi
done
```

## Notes

- Ensure the script has executable permissions. You can set this with:

  ```sh
  chmod +x shorten_filenames.sh
  ```

- Run the script in the directory containing the files you want to rename. The script processes files in the current directory.
- The script will skip renaming itself to avoid any issues.
