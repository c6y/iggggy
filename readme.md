# IGGGGY

Shell scripts that optimize image files for [rainbow](https://github.com/c6y/rainbow) database. Writes proper eBoy EXIF and compresses PNGs. Script will optimize all PNG image files within directory.

Needs [exiftool](http://www.sno.phy.queensu.ca/~phil/exiftool/) and [zopfli](https://github.com/google/zopfli).

On MacOS, if starting from scratch, do this:

- Get exiftool at https://exiftool.org/

- Get Zopfli  
`$ git clone https://github.com/google/zopfli.git`  
(or use the GitHub Desktop App)  

- Compile Zopfli  
`$ cd zopfli`  
`$ make zopflipng`  

- Copy the `zoplifpng` executable to an executable directory:  
Check for existing paths: `$ echo PATH`  
For example `/usr/local/bin` (use the Finder)  


- Get IGGGGY  
`$ git clone https://github.com/c6y/iggggy.git`  
(or use the GitHub Desktop App)  

- Make IGGGGY executable:  
`$ cd iggggy` (go to IGGGGY directory)  
`$ chmod 755 iggggy.sh`

- Run IGGGGY within the directory containing the images or image directories  
`$ cd ~/my_directory_with_images` (cd to image directory)  
`$ ~/Git/iggggy/iggggy.sh` (run IGGGGY shell script)  
- For easier usage, add this alias line to `.bash_profile`, in your home directory:  
`alias iggggy="~/Git/iggggy/iggggy.sh"`
