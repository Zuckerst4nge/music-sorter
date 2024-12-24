#!/bin/bash

# Basispfad für die Ordner -> kein extra Ordner
base_path="./"

# Ordnererstellung basierend auf den Genres
create_genre_folders() {
    # Liste der Genres
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

    # Schleife, um alle Ordner zu erstellen
    for genre in "${genres[@]}"; do
        target_folder="$base_path/$genre"
        
        # Überprüfen, ob der Ordner bereits existiert, und erstellen, falls nicht
        if [ ! -d "$target_folder" ]; then
            mkdir -p "$target_folder"
            echo "Folder created: $target_folder"
        else
            echo "Folder already exists: $target_folder"
        fi
    done
}

# Aufruf der Funktion zur Ordnererstellung
create_genre_folders

echo "All folders have been checked and created (if necessary)."
