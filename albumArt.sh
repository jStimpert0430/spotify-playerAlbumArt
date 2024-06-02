#!/bin/bash
album_art="$HOME/.cache/spotify-player/image"
metadata_file="$HOME/.local/tmp/spotify.txt"
rm -r $HOME/.cache/spotify-player/image
mkdir $HOME/.cache/spotify-player/image
magick -size 400x400 xc:black $HOME/.cache/spotify-player/image/a.png
feh -g 400x400+0+0 --auto-zoom --scale-down --title album_art "$album_art/a.png" &


inotifywait -m -e create "$album_art" | 
while read -r dir action file; do
	if [ "$file" = "a.png" ]; then
		echo "This file is a.png"
	else
		echo "album_art: renaming album art..."
		magick "$dir$file" $dir/a.png
		echo "album_art: removing original cache image..."
		rm "$dir$file"
    fi
done
