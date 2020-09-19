# Common ffmpeg commands

## Video Info

### Examples

`ffprobe -v error -show_format -show_streams output.mp4`

## Video Conversion

- `-r`: frame rate

### Examples

- [h264 to mp4](https://trac.ffmpeg.org/wiki/Encode/H.264)
  - `ffmpeg -i video.h264.mp4 -c:v libx264 -r 15 -preset ultrafast -crf 0 output.mp4`
