# Music Sorter

## Overview
Music Sorter is a powerful collection of scripts designed to automate the organization of your music library. It creates genre-based folders and sorts music files into the appropriate directories based on metadata such as genre tags.

The project includes two main scripts:

1. **create_genre_folders**: Ensures that the required genre folders are present.
2. **sort_music**: Scans new music files, determines their genres, and moves them into the appropriate folders.

---

## Features

### Folder Management
- Automatically creates folders for predefined genres.
- Ensures that all necessary directories exist without creating duplicates.

### Music Sorting
- Reads metadata from music files (using `id3v2` or `ffmpeg`) to identify genres.
- Sorts files into genre-specific folders.
- Handles unknown genres by placing them into an `Uncategorized` folder.
- Processes new files from a defined `XtoScan` folder and re-checks files in the `Uncategorized` folder.

---

## Prerequisites

### Required Tools
- **Bash Shell** (default on Linux and macOS)
- **PowerShell** (default on Windows)
- **id3v2** (for reading ID3 tags from MP3 files)
- **ffmpeg** (for extracting metadata)

### Installing Dependencies
For Debian-based systems (e.g., Ubuntu):
```bash
sudo apt update
sudo apt install id3v2 ffmpeg
```
For macOS (using Homebrew):
```bash
brew install id3v2 ffmpeg
```

For Windows:
- Install **ffmpeg**: Download from [FFmpeg.org](https://ffmpeg.org/download.html).
- Install **id3v2** via a package manager like `choco` (Chocolatey), or manually via a Windows binary.

---

## Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/music-sorter.git
   cd music-sorter
   ```

2. Make the scripts executable:
   ```bash
   chmod +x create_genre_folders sort_music
   ```

3. Run the script to create genre folders:
   ```bash
   ./create_genre_folders
   ```

4. Place new tracks in the `XtoScan` folder for processing.

5. Run the music sorting script:
   ```bash
   ./sort_music
   ```

---

## Folder Structure

The following folders will be created:

| Folder Name        | Description                                  |
|--------------------|----------------------------------------------|
| `Acapella`         | A capella or vocal-only tracks               |
| `Ambient`          | Ambient music                                |
| `Anjuna_Beats`     | Tracks related to Anjuna Beats               |
| `Breakbeat`        | Breakbeat and related genres                 |
| `Dance`            | Dance music                                  |
| `Deep_House`       | Deep House genres                            |
| `Disco`            | Disco and Nu-Disco tracks                    |
| `Drum_Bass`        | Drum & Bass and Jungle genres                |
| `Dubstep`          | Dubstep genres                               |
| `Hardstyle`        | Hardstyle and similar genres                 |
| `House`            | House and related genres                     |
| `Industrial`       | Industrial and EBM music                     |
| `Pop`              | Pop, Jazz, Rock, and Alternative tracks      |
| `Progressive_House`| Progressive House, Big Room, etc.            |
| `Tech_House`       | Tech House genres                            |
| `Techno`           | Various Techno genres                        |
| `Trance`           | Trance and related genres                    |
| `Uncategorized`    | For files with unknown or missing genres     |
| `XtoScan`          | Folder for new files to be processed         |

---

## Usage

### 1. Create or Choose Folder
First, select the folder where you want to organize your music files. You can either choose an existing folder or create a new one.

### 2. Use `cd` Command in Terminal or Drag & Drop
Navigate to your folder in the terminal using the `cd` command. Alternatively, you can drag and drop the folder into the terminal to auto-fill the path.

```bash
cd /path/to/your/folder
```

### 3. Run `create_genre_folders` Script in the Folder
Now that you're in the correct folder, run the `create_genre_folders` script to create all necessary genre folders.

```bash
./create_genre_folders
```

<p align="center"> <img src="https://github.com/Zuckerst4nge/music-sorter/blob/main/images/terminal_setup.png?raw=true" alt="Terminal Setup"> </p> 
<p align="center"> <img src="https://github.com/Zuckerst4nge/music-sorter/blob/main/images/folders_created.png?raw=true" alt="Folders Created"> </p>
<p align="center"> <img src="https://github.com/Zuckerst4nge/music-sorter/blob/main/images/folders.png?raw=true" alt="Folder Creation"> </p>

**Note:** Keep the terminal open after running the script. The terminal must remain open for further steps.

### 4. Do Not Close the Terminal
If you close the terminal, you'll need to navigate to the folder again using the `cd` command to continue working.

```bash
cd /path/to/your/folder
```

### 5. Add Files to the `XtoScan` Folder
Place all the music files you want to sort in the `XtoScan` folder. This folder is used by the script to scan and sort music files.

### 6. Run the `sort_music` Script
Execute the `sort_music` script to move the files based on their genre tags.

```bash
./sort_music
```

<p align="center"> <img src="https://github.com/Zuckerst4nge/music-sorter/blob/main/images/sorted.png?raw=true" alt="Sorted Tracks"> </p> 

### 7. Done
Once the script runs, all your tracks should be in the appropriate genre folder. If everything works correctly, the process is complete.

---

## Troubleshooting

### Files in the `Uncategorized` Folder
If files end up in the `Uncategorized` folder, it means the genre of the track couldn't be identified. You may need to modify the scripts to properly categorize these files.

#### For **Linux/macOS (Bash)**:
1. Open the `sort_music` script in a text editor.
2. Find the section where genres are assigned and modify it as needed. For example:

   Change:
   ```bash
   "Indie Dance"|"Alternative Dance"|"Dance")
       echo "Dance"
       ;;
   ```

   To:
   ```bash
   "Indie Dance"|"Alternative Dance"|"Dance"|"Dance & House")
       echo "Dance"
       ;;
   ```

3. Save the script and run it again:

   ```bash
   ./sort_music
   ```

#### For **Windows (PowerShell)**:
1. Open the `sort_music.ps1` script in a text editor.
2. Locate the part of the script that maps genres to folders and modify it as needed. For example:

   Change:
   ```powershell
   switch ($genre.ToLower()) {
       "indie dance" { return "Dance" }
       "alternative dance" { return "Dance" }
       "dance" { return "Dance" }
   }
   ```

   To:
   ```powershell
   switch ($genre.ToLower()) {
       "indie dance" { return "Dance" }
       "alternative dance" { return "Dance" }
       "dance" { return "Dance" }
       "dance & house" { return "Dance" }
   }
   ```

3. Save the script and run it again:

   ```powershell
   .\sort_music.ps1
   ```

Now the previously uncategorized files should be properly sorted.

---

## Contributing
Contributions are welcome! Please submit a pull request or open an issue to suggest improvements or report bugs.

---

## License
This project is licensed under the MIT License. See the `LICENSE` file for details.

---

Happy organizing your music! 🎵

---
