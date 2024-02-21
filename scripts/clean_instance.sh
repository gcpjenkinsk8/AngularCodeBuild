#!/bin/bash

# Define the source directory
SOURCE_DIR="/abc"

# Define the backup directory
BACKUP_DIR="/bkp"

# Create the backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Generate timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Create a new folder in the backup directory with the timestamp
BACKUP_FOLDER="$BACKUP_DIR/backup_$TIMESTAMP"
mkdir "$BACKUP_FOLDER"

# Copy data from source directory to the backup directory
cp -r "$SOURCE_DIR"/* "$BACKUP_FOLDER"

# Delete data from the source directory
rm -rf "$SOURCE_DIR"/*

# Verify deletion
if [ "$(ls -A $SOURCE_DIR)" ]; then
    echo "Failed to delete files from $SOURCE_DIR"
else
    echo "Backup and deletion successful!"
fi
