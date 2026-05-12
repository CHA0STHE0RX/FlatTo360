@echo off
echo Get frames
mkdir frames
ffmpeg -i input.mp4 -vsync 0 frames\%%06d.png
echo Blurred guide
mkdir guide360
ffmpeg -framerate 30 -i frames\%%06d.png -filter_complex "split=2[fg][bg];[bg]scale=2048:1024,gblur=sigma=25[bg];[fg]scale=1024:576[fg];[bg][fg]overlay=512:224:format=auto" guide360\%%06d.png
echo Generate mask
ffmpeg -f lavfi -i color=c=white:s=2048x1024 -vf "drawbox=x=512:y=224:w=1024:h=576:color=#333333:t=fill,gblur=sigma=64" -frames:v 1 mask.png
echo Extract keyframes
mkdir keys
powershell -Command "$i=0; Get-ChildItem guide360\*.png | Sort-Object Name | ForEach-Object { if ($i %% 30 -eq 0) { Copy-Item $_.FullName ('keys\' + $_.Name) }; $i++ }"

echo DONE!
pause