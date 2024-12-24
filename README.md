# Music Sorter

## Overview
Music Sorter is a powerful collection of Bash scripts that automate the organization of your music library. It creates genre-based folders and sorts music files using metadata such as genre tags into the appropriate directories.

The project includes two main scripts:

1. **create_genre_folders.sh**: Ensures that the required genre folders are present.
2. **sort_music.sh**: Scans new music files, determines their genres, and moves them into the corresponding folders.

---

## Features

### Folder Management
- Automatically creates folders for predefined genres.
- Ensures that all required directories are present without creating duplicates.

### Music Sorting
- Reads metadata from music files (using `id3v2` or `ffmpeg`) to identify genres.
- Sorts files into genre-specific folders.
- Handles unknown genres by placing them in an `Uncategorized` folder.
- Processes new files from a defined `XtoScan` folder and rechecks files in the `Uncategorized` folder.

---

## Prerequisites

### Required Tools
- **Bash shell** (standard on Linux and macOS)
- **id3v2** (to read ID3 tags from MP3 files)
- **ffmpeg** (to extract metadata)

### Installing Dependencies
On Debian-based systems (e.g., Ubuntu):
```bash
sudo apt update
sudo apt install id3v2 ffmpeg
```
On macOS (using Homebrew):
```bash
brew install id3v2 ffmpeg
```

---

## Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/music-sorter.git
   cd music-sorter
   ```

2. Make the scripts executable:
   ```bash
   chmod +x create_genre_folders.sh sort_music.sh
   ```

3. Run the folder creation script to set up the required directories:
   ```bash
   ./create_genre_folders.sh
   ```

4. Place new tracks into the `XtoScan` folder for processing.

5. Run the music sorting script:
   ```bash
   ./sort_music.sh
   ```

---

## Folder Structure

The following folders will be created:

| Folder Name       | Description                                   |
|-------------------|-----------------------------------------------|
| `Acapella`        | A cappella or pure vocal tracks               |
| `Ambient`         | Ambient music                                 |
| `Anjuna_Beats`    | Tracks related to Anjuna Beats                |
| `Breakbeat`       | Breakbeat and related genres                  |
| `Dance`           | Dance music                                   |
| `Deep_House`      | Deep house genres                             |
| `Disco`           | Disco and nu-disco tracks                     |
| `Drum_Bass`       | Drum & bass and jungle genres                 |
| `Dubstep`         | Dubstep genres                                |
| `Hardstyle`       | Hardstyle and similar genres                  |
| `House`           | House and related genres                      |
| `Industrial`      | Industrial and EBM music                      |
| `Pop`             | Pop, jazz, rock, and alternative tracks       |
| `Progressive_House`| Progressive house, big room, etc.             |
| `Tech_House`      | Tech house genres                             |
| `Techno`          | Various techno genres                         |
| `Trance`          | Trance and related genres                     |
| `Uncategorized`   | For files with unknown or missing genres      |
| `XtoScan`         | Folder for new files to be processed          |

---

## Usage

### 1. Create or Choose a Folder
First, you need to select the folder where you want to organize your music files. You can either select an existing folder or create a new one.

### 2. Use `cd` in the Terminal to Navigate or Drag & Drop the Folder
Navigate to your folder in the terminal using the `cd` (change directory) command. Alternatively, you can drag and drop the folder into the terminal to automatically take the path.

```bash
cd /path/to/folder
```

### 3. Run the `create_genre_folders.sh` Script in the Folder
Now that you're in the correct folder, run the `create_genre_folders.sh` script to create all the necessary genre folders.

```bash
./create_genre_folders.sh
```

<p align="center"> <img src="https://github.com/Zuckerst4nge/music-sorter/blob/main/images/terminal_setup.png?raw=true" alt="Terminal Setup"> </p>
<p align="center"> <img src="https://github.com/Zuckerst4nge/music-sorter/blob/main/images/folders_created.png?raw=true" alt="Folders Created"> </p>
<p align="center"> <img src="https://github.com/Zuckerst4nge/music-sorter/blob/main/images/folders.png?raw=true" alt="Folders"> </p>

**Warning:** Do not close the terminal once the script has run. The terminal must remain open to execute the next steps.

### 4. DO NOT Close the Terminal
If you close the terminal, you'll need to use the `cd` command to select the folder again in order to continue working. For example:

```bash
cd /path/to/folder
```

### 5. Add Tracks to the `XtoScan` Folder
Next, place all the music files you want to sort into the `XtoScan` folder. This folder is used by the script to scan and sort the music files.

### 6. Run the `sort_music.sh` Script in the Folder
Run the `sort_music.sh` script to move the tracks into the appropriate genre folders based on their genre tags.

```bash
./sort_music.sh
```

<p align="center"> <img src="https://github.com/Zuckerst4nge/music-sorter/blob/main/images/sorted.png?raw=true" alt="Sorted Tracks"> </p>

### 7. Done
Once the script has run, all the tracks should be in the correct genre folder. If everything has worked correctly, the process is complete.

---

## Troubleshooting

#### Tracks in the `Uncategorized` Folder:
If music files end up in the `Uncategorized` folder, it means the genre of the track couldn't be detected. In this case, you need to adjust the `sort_music.sh` script to correctly assign the genre.

1. Open the `sort_music.sh` script in an editor.
2. Find the section where genres are assigned and modify the script. For example:

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
   ./sort_music.sh
   ```

Now, the previously uncategorized files should be correctly sorted.

---

## Contributing
Contributions are welcome! Please submit a pull request or open an issue to suggest improvements or report bugs.

---

## License
This project is licensed under the MIT License. See the `LICENSE` file for details.

---

Enjoy organizing your music effortlessly! 🎵
