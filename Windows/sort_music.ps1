# Function: Assign folder based on genre
function assign-genre-folder {
    param($genre)

    # Clean the genre value by removing any number and parentheses
    $genre = $genre -replace '\s*\(\d+\)', ''

    # Convert genre to lowercase to avoid case-sensitivity issues
    $genre = $genre.ToLower()

    # Check the genre and return the corresponding folder name
    switch ($genre) {
        "techno" {
            return "Techno"
        }
        "melodic techno" {
            return "Techno"
        }
        "melodic house & techno" {
            return "Techno"
        }
        "techno / minimal" {
            return "Techno"
        }
        "minimal / deep tech" {
            return "Techno"
        }
        "progressive techno" {
            return "Techno"
        }
        "tech house" {
            return "Tech_House"
        }
        "deep house" {
            return "Deep_House"
        }
        "balearic / deep house" {
            return "Deep_House"
        }
        "afro house" {
            return "Deep_House"
        }
        "house" {
            return "House"
        }
        "funky / groove / jackin' house" {
            return "House"
        }
        "g-house" {
            return "House"
        }
        "tribal house" {
            return "House"
        }
        "vocal house" {
            return "House"
        }
        "bass house" {
            return "House"
        }
        "funky house" {
            return "House"
        }
        "garage house" {
            return "House"
        }
        "progressive house" {
            return "Progressive_House"
        }
        "trance" {
            return "Trance"
        }
        "drum & bass" {
            return "Drum_Bass"
        }
        "dubstep" {
            return "Dubstep"
        }
        "disco" {
            return "Disco"
        }
        "breakbeat" {
            return "Breakbeat"
        }
        "indie dance" {
            return "Dance"
        }
        "hardstyle" {
            return "Hardstyle"
        }
        "acapella" {
            return "Acapella"
        }
        "industrial" {
            return "Industrial"
        }
        "ambient" {
            return "Ambient"
        }
        "pop" {
            return "Pop"
        }
        default {
            return "Uncategorized"
        }
    }
}
# Need more genres? Just add them, by copying the structure:
#"genre" {
#return "Genrefolder"
#}

# Function to extract the genre from the file (using ID3v2 and FFmpeg)
function get-genre {
    param($file)

    # Try first to read the genre with id3v2
    $genre = (id3v2 -l "$file" | Select-String "^TCON" | ForEach-Object { $_.Line -replace '^TCON.*: ', '' })

    # If genre not found, try reading with ffmpeg
    if (-not $genre) {
        $genre = (ffmpeg -i "$file" 2>&1 | Select-String -Pattern "genre\s*:\s*(.*)" | ForEach-Object { $_.Matches.Groups[1].Value })
    }

    # If still no genre found, return 'Uncategorized'
    if (-not $genre) {
        Write-Host "Could not read genre for the file $($file)."
        return "Uncategorized"
    }

    return $genre
}

# Base path (current directory)
$base_path = Get-Location
$music_folder = $base_path  # Target folder for sorted music
$to_scan_folder = "$base_path\XtoScan"  # Folder containing new tracks to scan
$uncategorized_folder = "$base_path\Uncategorized"  # Folder for uncategorized tracks

# Process files from both "XtoScan" and "Uncategorized" folders
Get-ChildItem -Path $to_scan_folder, $uncategorized_folder -Recurse -File -Include *.mp3, *.m4a, *.wav | ForEach-Object {
    $file = $_.FullName
    $genre = get-genre -file $file

    # Clean the genre by removing parentheses and numbers
    $genre = $genre -replace '\s*\(\d+\)', ''

    # Output for debugging to check the genre value
    Write-Host "Genre for $($file): $genre"

    # Assign the folder based on the genre
    $folder = assign-genre-folder -genre $genre
    $target_folder = "$music_folder\$folder"

    # Create the target folder if it doesn't exist
    if (-not (Test-Path -Path $target_folder)) {
        New-Item -ItemType Directory -Path $target_folder | Out-Null
    }

    # Move the file to the corresponding folder
    $destination = Join-Path -Path $target_folder -ChildPath $_.Name
    Move-Item -Path $file -Destination $destination
    Write-Host "Moved: $($file) -> $destination"
}

Write-Host "Done! The tracks have been sorted."
