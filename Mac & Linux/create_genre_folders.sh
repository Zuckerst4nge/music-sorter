#!/bin/bash

# Base path for the folders -> no extra folder
base_path="./"

# Folder creation based on the genres
create_genre_folders() {
    # List of genres
    genres=(
        "Acapella"
        "Ambient"
        "Anjuna_Beats"
        "Breakbeat"
        "Dance"
        "Deep_House"
        "Disco"
        "Drum_Bass"
        "Dubstep"
        "Hardstyle"
        "House"
        "Industrial"
        "Pop"
        "Progressive_House"
        "Tech_House"
        "Techno"
        "Trance"
        "Uncategorized"
        "XtoScan"
        # Need more folders? Just add them, but remember to keep the "Uncategorized" and "XtoScan" folders!
        # Also check the sort_music.sh file to adjust it to the newly added folders...
    )

    # Loop to create all folders
    for genre in "${genres[@]}"; do
        target_folder="$base_path/$genre"
        
        # Check if the folder already exists, and create it if not
        if [ ! -d "$target_folder" ]; then
            mkdir -p "$target_folder"
            echo "Folder created: $target_folder"
        else
            echo "Folder already exists: $target_folder"
        fi
    done
}

# Call the folder creation function
create_genre_folders

echo "All folders have been checked and created (if necessary)."
