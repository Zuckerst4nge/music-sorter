# Music Sorter

## Übersicht
Music Sorter ist eine leistungsstarke Sammlung von Bash-Skripten, die die Organisation deiner Musikbibliothek automatisieren. Es erstellt genrebasierte Ordner und sortiert Musikdateien mithilfe von Metadaten wie Genre-Tags in die entsprechenden Verzeichnisse.

Das Projekt umfasst zwei Hauptskripte:

1. **create_genre_folders.sh**: Stellt sicher, dass die benötigten Genre-Ordner vorhanden sind.
2. **sort_music.sh**: Scannt neue Musikdateien, bestimmt deren Genres und verschiebt sie in die passenden Ordner.

---

## Funktionen

### Ordnerverwaltung
- Erstellt automatisch Ordner für vordefinierte Genres.
- Stellt sicher, dass alle benötigten Verzeichnisse vorhanden sind, ohne doppelte zu erstellen.

### Musiksortierung
- Liest Metadaten aus Musikdateien (mit `id3v2` oder `ffmpeg`), um Genres zu identifizieren.
- Sortiert Dateien in genre-spezifische Ordner.
- Handhabt unbekannte Genres, indem diese in einem `Uncategorized`-Ordner abgelegt werden.
- Verarbeitet neue Dateien aus einem definierten `XtoScan`-Ordner und überprüft Dateien im `Uncategorized`-Ordner erneut.

---

## Voraussetzungen

### Erforderliche Tools
- **Bash-Shell** (Standard unter Linux und macOS)
- **id3v2** (zum Lesen von ID3-Tags aus MP3-Dateien)
- **ffmpeg** (zum Extrahieren von Metadaten)

### Installation der Abhängigkeiten
Auf Debian-basierten Systemen (z. B. Ubuntu):
```bash
sudo apt update
sudo apt install id3v2 ffmpeg
```
Auf macOS (mit Homebrew):
```bash
brew install id3v2 ffmpeg
```

---

## Einrichtung

1. Repository klonen:
   ```bash
   git clone https://github.com/your-username/music-sorter.git
   cd music-sorter
   ```

2. Skripte ausführbar machen:
   ```bash
   chmod +x create_genre_folders.sh sort_music.sh
   ```

3. Skript zur Ordnererstellung ausführen, um die benötigten Verzeichnisse einzurichten:
   ```bash
   ./create_genre_folders.sh
   ```

4. Neue Titel in den `XtoScan`-Ordner zur Verarbeitung legen.

5. Musiksortierskript ausführen:
   ```bash
   ./sort_music.sh
   ```

---

## Ordnerstruktur

Die folgenden Ordner werden erstellt:

| Ordnername        | Beschreibung                              |
|-------------------|-------------------------------------------|
| `Acapella`        | A capella oder reine Vokalstücke          |
| `Ambient`         | Ambient-Musik                            |
| `Anjuna_Beats`    | Titel im Zusammenhang mit Anjuna Beats    |
| `Breakbeat`       | Breakbeat und verwandte Genres            |
| `Dance`           | Dance-Musik                              |
| `Deep_House`      | Deep-House-Genres                        |
| `Disco`           | Disco und Nu-Disco-Titel                 |
| `Drum_Bass`       | Drum & Bass und Jungle-Genres            |
| `Dubstep`         | Dubstep-Genres                           |
| `Hardstyle`       | Hardstyle und ähnliche Genres            |
| `House`           | House und verwandte Genres               |
| `Industrial`      | Industrial- und EBM-Musik                |
| `Pop`             | Pop, Jazz, Rock und Alternative-Titel    |
| `Progressive_House`| Progressive House, Big Room, usw.         |
| `Tech_House`      | Tech-House-Genres                        |
| `Techno`          | Verschiedene Techno-Genres               |
| `Trance`          | Trance und verwandte Genres              |
| `Uncategorized`   | Für Dateien mit unbekannten oder fehlenden Genres |
| `XtoScan`         | Ordner für neue Dateien zur Verarbeitung |

---

## Verwendung

### Skript: `create_genre_folders.sh`
Dieses Skript stellt sicher, dass alle notwendigen Ordner für die Musiksortierung erstellt werden. Es prüft das Vorhandensein jedes Ordners in der vordefinierten Liste und erstellt ihn bei Bedarf.

Skript ausführen:
```bash
./create_genre_folders.sh
```

### Skript: `sort_music.sh`
Dieses Skript verarbeitet Musikdateien im `XtoScan`- und `Uncategorized`-Ordner, bestimmt deren Genres und verschiebt sie in die entsprechenden genrebasierten Verzeichnisse.

Skript ausführen:
```bash
./sort_music.sh
```

---

## Anpassungen

### Hinzufügen neuer Genres
Um zusätzliche Genres zu unterstützen, aktualisiere die Funktion `assign_genre_folder` im Skript `sort_music.sh`, indem du das neue Genre in den entsprechenden Case-Block einfügst. Beispiel:

```bash
"New Genre")
    echo "New_Genre_Folder"
    ;;
```

Du solltest außerdem den entsprechenden Ordnernamen zum Array `genres` im Skript `create_genre_folders.sh` hinzufügen.

### Änderung des Basisverzeichnisses
Standardmäßig werden alle Operationen im aktuellen Verzeichnis (`./`) durchgeführt. Um dieses Verhalten zu ändern, passe die Variable `base_path` in beiden Skripten an.

---

## Beispielausgabe

### Ausgabe der Ordnererstellung
```bash
Ordner erstellt: ./Techno
Ordner existiert bereits: ./House
Ordner erstellt: ./Drum_Bass
Alle Ordner wurden überprüft und bei Bedarf erstellt.
```

### Ausgabe der Musiksortierung
```bash
Genre erkannt: Techno
Verschoben: ./XtoScan/track1.mp3 -> ./Techno
Genre konnte nicht gelesen werden: ./XtoScan/unknown.mp3
Verschoben: ./XtoScan/unknown.mp3 -> ./Uncategorized
```

---

## Mitwirken
Beiträge sind willkommen! Bitte reiche einen Pull-Request ein oder eröffne ein Issue, um Verbesserungen vorzuschlagen oder Fehler zu melden.

---

## Lizenz
Dieses Projekt ist unter der MIT-Lizenz lizenziert. Siehe die Datei `LICENSE` für Details.

---

Viel Spaß beim mühelosen Organisieren deiner Musik! 🎵
