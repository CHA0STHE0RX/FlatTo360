# FlatTo360
## Overview
The goal of this project was creating VR footage from a flat video source using ComfyUI.  
<br/>
<img width="1242" height="842" alt="Current State" src="https://github.com/user-attachments/assets/1ec78d6c-f97f-46af-b73b-7c94710edcce" />  
<br/>
## Current state
Although the program runs and creates 360 ready footage there are several temporal anomalies and visual incosistencies. 
The idea is :  
1. Extract the original frames with : <br/> `ffmpeg -i input.mp4 -vsync 0 frames\%%06d.png` into 'frames', create a blurred guide (pad and mask them into a 2:1 equirectangular) and extract keyframes(alternatively use 'select every nth' in the Load Images(Batch) node).  (Look:start.bat)  
2. Run keyframes through the ComfyUI program and place the created frames in frames_360out.  
3. Stich the the video together using end.bat and work from there.  

I've attempted using Seamless Tiling to fix visual inconsistencies to no avail;  
I am yet to try IPAdapter with differential diffusion. I suspect there might be an issue with 'sanbaro_V2.safetensors' or JuggernautXL's model outputs in terms of quality.

How to Run
1. Ensure you have [ComfyUI](https://github.com/comfyanonymous/ComfyUI) installed.
2. Clone this repository.
3. Ensure you have all model and extension dependencies. 
4. Drag and drop the `Converter.json` file into ComfyUI.

Any feedback regarding the topic is appreciated.
This project is currently unfinished.
