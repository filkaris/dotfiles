OFFSET=2.500
CUTF=5.000
CUTL=6.700

#!/bin/sh
base=$(basename "$1")
ext="${base##*.}"
base="${base%.*}"

# Split a/v


# Custom noise profile
ffmpeg -i "$base.flac" -c:a flac -ss 00:00:00.0 -t 00:00:00.5 noise.flac
sox noise.flac -n noiseprof noise.prof

sox $base.flac a-$base.flac noisered noise.prof 0.30

ffmpeg -y -i "v-$base.$ext" -itsoffset $OFFSET -i "a-$base.flac" -map 0:v -map 1:a -c:v libx264 -c:a aac $base-clean.$ext

rm "v-$base.$ext" "$base.flac" "a-$base.flac" noise.flac noise.prof

# Ginetai, alla prepei na kopseis apo tin arxi X kai Y deftera sto kathena ksexwrista, opws kai sto telos
# Den kserw tropo na tou peis "stamata tote kai sta dyo"
ffmpeg -y -ss 5 -i c.mkv -ss 2.5 -i c-cast.flac -map 0:v -map 1:a out.mkv

