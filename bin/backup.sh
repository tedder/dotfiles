cd /mnt/readynas/
mtglacier sync --dir pictures/ --config glacier.cfg --filter "-.AppleDouble -.picasa* -.DS_Store -.thumbcache -Thumbs.db -Picasa.ini -*.thm -pspbrwse.jbf -*.noindex -pspbrwse.jbf -*.tmp +.picasaoriginals"
