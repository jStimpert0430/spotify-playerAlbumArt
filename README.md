# spotify-playerAlbumArt
A bash script for spotify-player to display current song's album art in feh

![Preview](screenshot.png?raw=true "Preview Screenshot")

# Dependencies

* spotify-player
* inotify
* feh
* imagemagick


# What does this script do?
* Clears default image cache folder of old files as we will be watching for when a new file is created.

* Make a file called "a.png" and open it in feh scaled to 400x400

* Sets up an inotify loop on the image cache directory which watches for new files created by spotify_player as they're downloaded, and replaces a.png with them and removing the original, keeping the folder clean.

* Feh will automatically display the updated a.png file as the song changes, no need to open a new window.

* Script also grabs song metadeta so you can set the titlebar to the song/album name if you'd like, but I just name it album_art because I like how it looks.
