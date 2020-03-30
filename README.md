# Screencasting


beginning here
```
DIR="$HOME/Screencasts"
NAME="$(date +Screencast_%Y-%m-%d_%H-%M-%S).mp4"

ffmpeg -f x11grab -video_size 1280x800 -framerate 25 -i $DISPLAY -f alsa -i hw:1 -c:v libx264 -crf 0 -preset ultrafast -c:a aac "$DIR/$NAME"
```

record camera
```
ffmpeg -f v4l2 -i /dev/video0 -framerate 25 -f alsa -i hw:0 -c:v libx264 -crf 0 -preset ultrafast -c:a flac "$DIR/$NAME"
```


## Lossless Recording

If your CPU is not fast enough, the encoding process might take too long. To speed up the encoding process, you can use lossless encoding and disable advanced encoder options, e.g.:

```
ffmpeg -video_size 1920x1080 -framerate 30 -f x11grab -i :0.0 -c:v libx264 -crf 0 -preset ultrafast output.mkv
```

-crf 0 tells x264 to encode in lossless mode; -preset ultrafast advises it to do so fast.

The encoder should be fast enough on most modern hardware to record without any framedrop, and even leave enough CPU headroom for other applications.

If you're going to archive the recording or are concerned about file size, re-encode it losslessly again, but with a slower preset. Note that since the initial recording was lossless, and the re-encode is lossless too, no quality loss is introduced in this process in any way.

```
ffmpeg -i output.mkv -c:v libx264 -crf 0 -preset veryslow output-smaller.mkv
```

## SOX

Remove noise
```
sox noise.flac -n noiseprof noise_c920
sox Screencast_2020-03-30_18-14-28.mp4 out.mp4 noisered noise_c920 0.20
```

NEED to remove flac from mp4 first and then add to it again
