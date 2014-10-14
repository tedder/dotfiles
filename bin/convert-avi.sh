find . -iname "*avi" -type f -exec ffmpeg -i {} -acodec libfaac -b:a 128k -vcodec mpeg4 -b:v 1200k -flags +aic+mv4 {}.mp4 \;
