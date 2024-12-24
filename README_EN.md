# Music Sorter

## Overview
Music Sorter is a powerful set of Bash scripts designed to automate the organization of your music library. It creates genre-based folders and sorts music files into the appropriate directories using metadata such as genre tags.

The project comprises two key scripts:

1. **create_genre_folders.sh**: Ensures that the required genre folders exist.
2. **sort_music.sh**: Scans new music files, determines their genres, and moves them into the correct folders.

---

## Features

### Folder Management
- Automatically creates folders for predefined genres.
- Ensures that all required directories are present without duplicating existing ones.

### Music Sorting
- Reads metadata from music files (using `id3v2` or `ffmpeg`) to identify genres.
- Sorts files into genre-specific folders.
- Handles unknown genres by placing them in an `Uncategorized` folder.
- Processes new files from a designated `XtoScan` folder and rechecks files in `Uncategorized`.

---

## Prerequisites

### Tools Required
- **Bash Shell** (default on Linux and macOS)
- **id3v2** (for reading ID3 tags from MP3 files)
- **ffmpeg** (for extracting metadata)

### Installation of Dependencies
On Debian-based systems (like Ubuntu):
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

4. Place new tracks in the `XtoScan` folder for processing.

5. Run the music sorting script:
   ```bash
   ./sort_music.sh
   ```

---

## Folder Structure

The following folders will be created:

| Folder Name       | Description                                |
|-------------------|--------------------------------------------|
| `Acapella`        | A capella or vocal-only tracks            |
| `Ambient`         | Ambient music                             |
| `Anjuna_Beats`    | Tracks related to Anjuna Beats            |
| `Breakbeat`       | Breakbeat and related genres              |
| `Dance`           | Dance music                               |
| `Deep_House`      | Deep house genres                         |
| `Disco`           | Disco and Nu-Disco tracks                 |
| `Drum_Bass`       | Drum & Bass and Jungle genres             |
| `Dubstep`         | Dubstep genres                            |
| `Hardstyle`       | Hardstyle and similar genres              |
| `House`           | House and related genres                  |
| `Industrial`      | Industrial and EBM music                  |
| `Pop`             | Pop, Jazz, Rock, and Alternative tracks   |
| `Progressive_House`| Progressive house, Big Room, etc.         |
| `Tech_House`      | Tech house genres                         |
| `Techno`          | Various techno genres                     |
| `Trance`          | Trance and related genres                 |
| `Uncategorized`   | For files with unknown or missing genres  |
| `XtoScan`         | Folder for new tracks to be processed     |

---

## Usage

### Script: `create_genre_folders.sh`
This script ensures that all necessary folders for music sorting are created. It checks the existence of each folder in the predefined list and creates it if necessary.

Run the script:
```bash
./create_genre_folders.sh
```

### Script: `sort_music.sh`
This script processes music files in the `XtoScan` and `Uncategorized` folders, determines their genres, and moves them to the appropriate genre-based directories.

Run the script:
```bash
./sort_music.sh
```

---

## Customization

### Adding New Genres
To support additional genres, update the `assign_genre_folder` function in the `sort_music.sh` script by adding the new genre to the appropriate case block. For example:

```bash
"New Genre")
    echo "New_Genre_Folder"
    ;;
```

You should also add the corresponding folder name to the `genres` array in `create_genre_folders.sh`.

### Changing the Base Path
By default, all operations are performed in the current directory (`./`). To change this behavior, update the `base_path` variable in both scripts.

---

## Example Output

### Folder Creation Output
```bash
Folder created: ./Techno
Folder already exists: ./House
Folder created: ./Drum_Bass
All folders have been checked and created (if necessary).
```

### Music Sorting Output
```bash
Genre identified: Techno
Moved: ./XtoScan/track1.mp3 -> ./Techno
Genre could not be read: ./XtoScan/unknown.mp3
Moved: ./XtoScan/unknown.mp3 -> ./Uncategorized
```

---

## Contributing
Contributions are welcome! Please submit a pull request or open an issue to suggest improvements or report bugs.

---

## License
This project is licensed under the MIT License. See the `LICENSE` file for details.

---

Enjoy organizing your music effortlessly! 🎵

