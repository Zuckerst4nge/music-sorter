# How To Use Music Sorter

Diese Anleitung hilft dir, den Music Sorter zu verwenden, um deine Musikbibliothek zu organisieren.

---

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

### **Fehlerbehebung:**

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

### Viel Spaß beim Organisieren deiner Musik! 🎵
