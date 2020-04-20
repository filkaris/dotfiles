#!/bin/sh
base=$(basename "$1")
ext="${base##*.}"
base="${base%.*}"

echo $1
echo $base
echo $ext

# Split a/v
ffmpeg -y -i $1 -c:v copy v-$base.$ext
ffmpeg -y -i $1 -c:a flac $base.flac


# Custom noise profile
ffmpeg -i "$base.flac" -c:a flac -ss 00:00:00.0 -t 00:00:00.5 noise.flac
sox noise.flac -n noiseprof noise.prof

sox $base.flac a-$base.flac noisered noise.prof 0.30

ffmpeg -y -i "v-$base.$ext" -itsoffset 0.500 -i "a-$base.flac" -map 0:v -map 1:a -c:v libx264 -c:a aac $base-clean.$ext

rm "v-$base.$ext" "$base.flac" "a-$base.flac" noise.flac noise.prof
