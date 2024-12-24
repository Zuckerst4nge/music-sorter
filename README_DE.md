Hier ist die kombinierte README-Datei, die sowohl die Übersicht als auch eine detaillierte Anleitung zur Verwendung des Music Sorters enthält:

---

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

### 1. Ordner erstellen oder wählen
Zuerst musst du den Ordner auswählen, in dem du die Musikdateien organisieren möchtest. Du kannst entweder einen bestehenden Ordner auswählen oder einen neuen Ordner erstellen.

### 2. Im Terminal `cd` Ordnerwahl oder per Drag&Drop reinziehen
Navigiere im Terminal zu deinem Ordner, indem du den Befehl `cd` (change directory) verwendest. Alternativ kannst du den Ordner auch einfach per **Drag&Drop** in das Terminal ziehen, um den Pfad zu übernehmen.

```bash
cd /Pfad/zum/Ordner
```

### 3. Im Terminal das `create_genre_folders` Skript im Ordner ausführen
Nun, da du im richtigen Ordner bist, führe das `create_genre_folders.sh`-Skript aus, um alle notwendigen Genre-Ordner zu erstellen.

```bash
./create_genre_folders.sh
```

<p align="center"> <img src="https://github.com/Zuckerst4nge/music-sorter/blob/main/images/terminal_setup.png?raw=true" alt="Terminal Setup"> </p> 
<p align="center"> <img src="https://github.com/Zuckerst4nge/music-sorter/blob/main/images/folders_created.png?raw=true" alt="Ordner"> </p>
<p align="center"> <img src="https://github.com/Zuckerst4nge/music-sorter/blob/main/images/folders.png?raw=true" alt="Ordnererstellung"> </p>

**Achtung:** Schließe das Terminal nicht, wenn das Skript ausgeführt wurde. Das Terminal muss weiterhin geöffnet bleiben, um die weiteren Schritte auszuführen.

### 4. Terminal NICHT schließen
Wenn du das Terminal schließt, musst du den Ordner erneut mit dem `cd`-Befehl auswählen, um weiterzuarbeiten. Zum Beispiel:

```bash
cd /Pfad/zum/Ordner
```

### 5. In `XtoScan` Ordner zu sortierende Lieder einfügen
Füge nun alle Musikdateien, die du sortieren möchtest, in den Ordner `XtoScan` ein. Dieser Ordner wird vom Skript verwendet, um die Musikdateien zu scannen und zu sortieren.

### 6. Im Terminal das `sort_music.sh` Skript im Ordner ausführen
Führe das `sort_music.sh`-Skript aus, um die Lieder basierend auf ihren Genre-Tags in die entsprechenden Ordner zu verschieben.

```bash
./sort_music.sh
```

<p align="center"> <img src="https://github.com/Zuckerst4nge/music-sorter/blob/main/images/sorted.png?raw=true" alt="Sortiere Tracks"> </p> 

### 7. Fertig
Nachdem das Skript ausgeführt wurde, sollten alle Lieder im richtigen Genre-Ordner sein. Wenn alles richtig funktioniert hat, ist der Vorgang abgeschlossen.

---

## Fehlerbehebung

#### Sollten im `Uncategorized` Ordner Tracks liegen:
Falls Musikdateien im `Uncategorized` Ordner landen, bedeutet dies, dass das Genre des Tracks nicht erkannt werden konnte. In diesem Fall musst du das Skript `sort_music.sh` anpassen, um das Genre korrekt zuzuordnen.

1. Öffne das Skript `sort_music.sh` im Editor.
2. Suche nach der Stelle, an der Genres zugeordnet werden, und passe das Skript an. Zum Beispiel:

   Ändere:
   ```bash
   "Indie Dance"|"Alternative Dance"|"Dance")
       echo "Dance"
       ;;
   ```

   In:
   ```bash
   "Indie Dance"|"Alternative Dance"|"Dance"|"Dance & House")
       echo "Dance"
       ;;
   ```

3. Speichere das Skript und führe es erneut aus:

   ```bash
   ./sort_music.sh
   ```

Jetzt sollten auch die vorher unklassifizierten Dateien korrekt einsortiert werden.

---

## Mitwirken
Beiträge sind willkommen! Bitte reiche einen Pull-Request ein oder eröffne ein Issue, um Verbesserungen vorzuschlagen oder Fehler zu melden.

---

## Lizenz
Dieses Projekt ist unter der MIT-Lizenz lizenziert. Siehe die Datei `LICENSE` für Details.

---

Viel Spaß beim Organisieren deiner Musik! 🎵
