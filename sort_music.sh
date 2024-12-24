#!/bin/bash

# Basispfad (aktueller Ordner)
base_path="./"
music_folder="$base_path"  # Zielordner für sortierte Musik
to_scan_folder="${base_path}XtoScan"  # Ordner mit neuen Tracks zum Scannen
uncategorized_folder="${music_folder}/Uncategorized"  # Ordner für nicht kategorisierte Tracks

# Funktion: Ordner basierend auf Genre zuweisen
assign_genre_folder() {
    genre="$1"
    case "$genre" in
        "Techno"|"Melodic Techno"|"Minimal / Deep Tech"|"Progressive Techno"|"Melodic House & Techno"|"Techno / Minimal"|"Techno (Raw / Deep / Hypnotic)") #Genre
            echo "Techno" #Folder
            ;;
        "Tech House")
            echo "Tech_House"
            ;;
        "Deep House"|"Balearic / Deep House"|"Afro House")
            echo "Deep_House"
            ;;
        "House"|"Funky / Groove / Jackin' House"|"G-House"|"Tribal House"|"Vocal House"|"Bass House"|"Funky House"|"Garage House")
            echo "House"
            ;;
        "Progressive House"|"Big Room"|"Future House"|"Electro House"|"Electro"|"Future Rave"|"Mainstage"|"Electronic")
            echo "Progressive_House"
            ;;
        "Trance"|"Progressive Trance"|"Uplifting Trance"|"Psy-Trance")
            echo "Trance"
            ;;
        "Drum & Bass"|"Jungle")
            echo "Drum_Bass"
            ;;
        "Dubstep")
            echo "Dubstep"
            ;;
        "Disco / Nu-Disco"|"Broken Beat / Nu-Jazz"|"Indie Dance / Nu Disco")
            echo "Disco"
            ;;
        "Breakbeat"|"Electronica / Downtempo"|"Breaks / Breakbeat / UK Bass")
            echo "Breakbeat"
            ;;
        "Indie Dance"|"Alternative Dance"|"Dance")
            echo "Dance"
            ;;
        "Hardstyle"|"Hard Dance"|"Hard House")
            echo "Hardstyle"
            ;;
        "Acapella")
            echo "Acapella"
            ;;
        "Industrial / EBM")
            echo "Industrial"
            ;;
        "Ambient")
            echo "Ambient"
            ;;
        "Anjuna Beats")
            echo "Anjuna_Beats"
            ;;
        "Pop"|"Jazz"|"Rock"|"Alternative")
            echo "Pop"
            ;;
        *)
            echo "Uncategorized"
            ;;
    esac
}

# Funktion: Genre aus Datei auslesen
get_genre() {
    file="$1"
    genre=$(id3v2 -l "$file" 2>/dev/null | grep '^TCON' | sed 's/^TCON.*: //' | sed 's/ (.*)//')
    
    if [ -z "$genre" ]; then
        genre=$(ffmpeg -i "$file" 2>&1 | grep -i "genre" | sed 's/.*genre *: *//' | head -n 1)
    fi

    echo "$genre"
}

# Dateien aus XtoScan und Uncategorized durchgehen
find "$to_scan_folder" "$uncategorized_folder" -type f \( -iname "*.mp3" -o -iname "*.m4a" -o -iname "*.wav" \) -print0 | while IFS= read -r -d '' file; do
    # Genre auslesen
    genre=$(get_genre "$file")

    # Wenn Genre nicht ermittelt werden konnte
    if [ -z "$genre" ]; then
        echo "Genre could not be read: $file"
        genre="Uncategorized"
    fi

    # Ordner basierend auf Genre auswählen
    folder=$(assign_genre_folder "$genre")
    target_folder="$music_folder/$folder"

    # Zielordner erstellen, falls er noch nicht existiert
    mkdir -p "$target_folder"

    # Datei verschieben
    mv "$file" "$target_folder/"
    echo "Moved: $file -> $target_folder"
done

# Abschlussmeldung
echo "Done! Tracks have been sorted."
