# Music Sorter

## Übersicht
Music Sorter ist eine leistungsstarke Sammlung von Skripten, die dazu entwickelt wurden, die Organisation deiner Musikbibliothek zu automatisieren. Es erstellt genrebasierte Ordner und sortiert Musikdateien anhand von Metadaten wie Genre-Tags in die entsprechenden Verzeichnisse.

Das Projekt enthält zwei Hauptskripte:

1. **create_genre_folders**: Stellt sicher, dass die erforderlichen Genre-Ordner vorhanden sind.
2. **sort_music**: Scannt neue Musikdateien, bestimmt deren Genres und verschiebt sie in die entsprechenden Ordner.

---

## Funktionen

### Ordnerverwaltung
- Erstellt automatisch Ordner für vordefinierte Genres.
- Stellt sicher, dass alle benötigten Verzeichnisse existieren, ohne Duplikate zu erzeugen.

### Musiksortierung
- Liest Metadaten von Musikdateien (mit `id3v2` oder `ffmpeg`), um Genres zu identifizieren.
- Sortiert Dateien in genre-spezifische Ordner.
- Behandelt unbekannte Genres, indem diese in einen `Uncategorized`-Ordner verschoben werden.
- Verarbeitet neue Dateien aus einem definierten `XtoScan`-Ordner und überprüft Dateien im `Uncategorized`-Ordner.

---

## Voraussetzungen

### Erforderliche Tools
- **Bash Shell** (Standard auf Linux und macOS)
- **PowerShell** (Standard auf Windows)
- **id3v2** (zum Lesen von ID3-Tags aus MP3-Dateien)
- **ffmpeg** (zum Extrahieren von Metadaten)

### Installation der Abhängigkeiten
Für Debian-basierte Systeme (z. B. Ubuntu):
```bash
sudo apt update
sudo apt install id3v2 ffmpeg
```
Für macOS (mit Homebrew):
```bash
brew install id3v2 ffmpeg
```

Für Windows:
- Installiere **ffmpeg**: Lade es von [FFmpeg.org](https://ffmpeg.org/download.html) herunter.
- Installiere **id3v2** über einen Paketmanager wie `choco` (Chocolatey) oder manuell via eine Windows-Binärdatei.

---

## Einrichtung

1. Klone das Repository:
   ```bash
   git clone https://github.com/your-username/music-sorter.git
   cd music-sorter
   ```

2. Mache die Skripte ausführbar:
   ```bash
   chmod +x create_genre_folders sort_music
   ```

3. Führe das Skript aus, um die Genre-Ordner zu erstellen:
   ```bash
   ./create_genre_folders
   ```

4. Lege neue Tracks in den `XtoScan`-Ordner zum Verarbeiten.

5. Führe das Musik-Sortierskript aus:
   ```bash
   ./sort_music
   ```

---

## Ordnerstruktur

Die folgenden Ordner werden erstellt:

| Ordnername         | Beschreibung                                  |
|--------------------|----------------------------------------------|
| `Acapella`         | A capella oder nur Gesangs-Tracks             |
| `Ambient`          | Ambient-Musik                                |
| `Anjuna_Beats`     | Tracks, die mit Anjuna Beats zu tun haben     |
| `Breakbeat`        | Breakbeat und verwandte Genres                |
| `Dance`            | Tanzmusik                                    |
| `Deep_House`       | Deep House Genres                            |
| `Disco`            | Disco und Nu-Disco-Tracks                    |
| `Drum_Bass`        | Drum & Bass und Jungle Genres                |
| `Dubstep`          | Dubstep Genres                               |
| `Hardstyle`        | Hardstyle und verwandte Genres               |
| `House`            | House und verwandte Genres                   |
| `Industrial`       | Industrielle und EBM-Musik                   |
| `Pop`              | Pop, Jazz, Rock und Alternative Tracks        |
| `Progressive_House`| Progressive House, Big Room, etc.             |
| `Tech_House`       | Tech House Genres                            |
| `Techno`           | Verschiedene Techno Genres                   |
| `Trance`           | Trance und verwandte Genres                  |
| `Uncategorized`    | Für Dateien mit unbekannten oder fehlenden Genres |
| `XtoScan`          | Ordner für neue Dateien, die verarbeitet werden sollen |

---

## Nutzung

### 1. Ordner erstellen oder auswählen
Wähle zuerst den Ordner aus, in dem du deine Musikdateien organisieren möchtest. Du kannst entweder einen bestehenden Ordner auswählen oder einen neuen erstellen.

### 2. Benutze den `cd` Befehl im Terminal oder ziehe den Ordner hinein
Wechsle in deinen Ordner im Terminal mit dem `cd` Befehl. Alternativ kannst du den Ordner auch ins Terminal ziehen, um den Pfad automatisch auszufüllen.

```bash
cd /pfad/zum/ordner
```

### 3. Führe das Skript `create_genre_folders` im Ordner aus
Jetzt, da du im richtigen Ordner bist, führe das Skript `create_genre_folders` aus, um alle benötigten Genre-Ordner zu erstellen.

```bash
./create_genre_folders
```

<p align="center"> <img src="https://github.com/Zuckerst4nge/music-sorter/blob/main/images/terminal_setup.png?raw=true" alt="Terminal Setup"> </p> 
<p align="center"> <img src="https://github.com/Zuckerst4nge/music-sorter/blob/main/images/folders_created.png?raw=true" alt="Ordner erstellt"> </p>
<p align="center"> <img src="https://github.com/Zuckerst4nge/music-sorter/blob/main/images/folders.png?raw=true" alt="Ordner erstellt"> </p>

**Hinweis:** Lasse das Terminal offen, nachdem du das Skript ausgeführt hast. Das Terminal muss für die weiteren Schritte offen bleiben.

### 4. Schließe das Terminal nicht
Wenn du das Terminal schließt, musst du erneut mit dem `cd` Befehl zum Ordner navigieren, um weiterzuarbeiten.

```bash
cd /pfad/zum/ordner
```

### 5. Füge Dateien in den `XtoScan` Ordner ein
Lege alle Musikdateien, die du sortieren möchtest, in den `XtoScan` Ordner. Dieser Ordner wird vom Skript verwendet, um Musikdateien zu scannen und zu sortieren.

### 6. Führe das Skript `sort_music` aus
Führe das Skript `sort_music` aus, um die Dateien basierend auf ihren Genre-Tags zu verschieben.

```bash
./sort_music
```

<p align="center"> <img src="https://github.com/Zuckerst4nge/music-sorter/blob/main/images/sorted.png?raw=true" alt="Sortierte Tracks"> </p> 

### 7. Fertig
Sobald das Skript ausgeführt wurde, sollten alle deine Tracks im entsprechenden Genre-Ordner sein. Wenn alles korrekt funktioniert, ist der Vorgang abgeschlossen.

---

## Fehlerbehebung

### Dateien im `Uncategorized` Ordner
Wenn Dateien im `Uncategorized` Ordner landen, bedeutet das, dass das Genre der Datei nicht identifiziert werden konnte. Du musst möglicherweise die Skripte anpassen, um diese Dateien richtig zu kategorisieren.

#### Für **Linux/macOS (Bash)**:
1. Öffne das Skript `sort_music` in einem Texteditor.
2. Suche den Abschnitt, in dem Genres zugewiesen werden, und passe ihn nach Bedarf an. Zum Beispiel:

   Ändere:
   ```bash
   "Indie Dance"|"Alternative Dance"|"Dance")
       echo "Dance"
       ;;
   ```

   Zu:
   ```bash
   "Indie Dance"|"Alternative Dance"|"Dance"|"Dance & House")
       echo "Dance"
       ;;
   ```

3. Speichere das Skript und führe es erneut aus:

   ```bash
   ./sort_music
   ```

#### Für **Windows (PowerShell)**:
1. Öffne das Skript `sort_music.ps1` in einem Texteditor.
2. Suche den Teil des Skripts, der Genres den Ordnern zuweist, und passe es nach Bedarf an. Zum Beispiel:

   Ändere:
   ```powershell
   switch ($genre.ToLower()) {
       "indie dance" { return "Dance" }
       "alternative dance" { return "Dance" }
       "dance" { return "Dance" }
   }
   ```

   Zu:
   ```powershell
   switch ($genre.ToLower()) {
       "indie dance" { return "Dance" }
       "alternative dance" { return "Dance" }
       "dance" { return "Dance" }
       "dance & house" { return "Dance" }
   }
   ```

3. Speichere das Skript und führe es erneut aus:

   ```powershell
   .\sort_music.ps1
   ```

Jetzt sollten die zuvor nicht kategorisierten Dateien korrekt sortiert werden.

---

## Mitwirken
Beiträge sind willkommen! Bitte stelle einen Pull-Request oder öffne ein Issue, um Verbesserungen vorzuschlagen oder Fehler zu melden.

---

## Lizenz
Dieses Projekt ist unter der MIT-Lizenz lizenziert. Siehe die `LICENSE`-Datei für Details.

---

Viel Spaß beim Organisieren deiner Musik! 🎵

--- 
