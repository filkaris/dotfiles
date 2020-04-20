percentage=$(awk -v type=$1 '
/^MemTotal:/ {
	mem_total=$2
}
/^MemFree:/ {
	mem_free=$2
}
/^Buffers:/ {
	mem_free+=$2
}
/^Cached:/ {
	mem_free+=$2
}
/^SwapTotal:/ {
	swap_total=$2
}
/^SwapFree:/ {
	swap_free=$2
}
END {
	if (type == "swap") {
		free=swap_free/1024/1024
		used=(swap_total-swap_free)/1024/1024
		total=swap_total/1024/1024
	} else {
		free=mem_free/1024/1024
		used=(mem_total-mem_free)/1024/1024
		total=mem_total/1024/1024
	}

	pct=0
	if (total > 0) {
		pct=used/total*100
	}

	printf("%.f", pct)
}
' /proc/meminfo)

reset="\x01"
green="\x03"
yellow="\x04"
orange="\x05"
red="\x06"
color="\x01"

if [ "$percentage" -ge 80 ]; then
	color=$red
elif [ "$percentage" -ge 60 ]; then
	color=$orange
elif [ "$percentage" -ge 40 ]; then
	color=$yellow
else
	color=$green
fi

echo "$color$percentage%$reset"
