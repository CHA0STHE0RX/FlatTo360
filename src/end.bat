@echo off
ffmpeg -framerate 30 -i out360\%%06d.png -i input.mp4 -map 0:v -map 1:a? -c:v libx264 -crf 18 -preset slow -pix_fmt yuv420p -c:a aac -b:a 192k -shortest output_360.mp4
echo DONE!
pause