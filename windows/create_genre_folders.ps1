# List of genres
$genres = @(
    "Acapella", "Ambient", "Anjuna_Beats", "Breakbeat", "Dance",
    "Deep_House", "Disco", "Drum_Bass", "Dubstep", "Hardstyle",
    "House", "Industrial", "Pop", "Progressive_House", "Tech_House",
    "Techno", "Trance", "Uncategorized", "XtoScan"
)
# Need more folders? Just add them, but remember to keep the "Uncategorized" and "XtoScan" folders!
# Also check the sort_music.ps1 file to adjust it to the newly added folders...


# Folder creation
foreach ($genre in $genres) {
    $path = Join-Path -Path (Get-Location) -ChildPath $genre
    if (-Not (Test-Path -Path $path)) {
        New-Item -ItemType Directory -Path $path | Out-Null
        Write-Host "Folder created: $genre"
    } else {
        Write-Host "Folder already exists: $genre"
    }
}
