# File Extension Renamer Script

This Bash script helps you rename files in the current directory by adding the appropriate extension based on the file type, even if the files are missing their extensions.

## Usage

```sh
./file_extension.sh
```

## Script

```bash
#!/bin/bash

# Directory with the files (current directory)
DIR="."

# Navigate to the specified directory (current directory in this case)
cd "$DIR" || exit

# Loop through all files in the directory
for FILE in *; do
  if [ -f "$FILE" ]; then
    # Get the MIME type of the file using the `file` command
    TYPE=$(file --mime-type -b "$FILE")
    
    # Set the extension based on the MIME type
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

    # Rename the file by adding the extension
    if [ "$EXT" != "unknown" ]; then
      mv "$FILE" "$FILE.$EXT"
    fi
  fi
done
```

## Examples

### Example 1: Rename files with missing extensions

To rename all files in the current directory by adding the appropriate extension based on their MIME type:

```sh
./file_extension.sh
```

Before:
```
file1
file2
file3
```

After:
```
file1.jpg
file2.png
file3.txt
```

## Notes

- Ensure the script has executable permissions. You can set this with:

  ```sh
  chmod +x file_extension.sh
  ```

- Run the script in the directory containing the files you want to rename. The script processes files in the current directory.
- The script uses the `file` command to determine the MIME type of each file and renames it by adding the appropriate extension.
