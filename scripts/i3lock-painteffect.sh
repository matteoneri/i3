#!/bin/bash

image=/tmp/i3lock.png
screenshot="scrot $image"
$screenshot
#~/.config/i3/scripts/im-painteffect -p 1 -e 0 -t yes $image $image
#~/.config/i3/scripts/im-turbolence -s 300 -d 200 -c together $image $image
#~/.config/i3/scripts/im-spots  -s 10x10 -t circle -B 20 -C 20 $image $image
#convert $image -blur "8x4" $image
~/.config/i3/scripts/im-spots -s 17x17 -t square -B 20 -C 10 $image $image

i3lock_cmd=(i3lock --beep -i $image -t -p win -e)

text="Введите пароль"
font=$(convert -list font | awk "{ a[NR] = \$2 } /family: $(fc-match sans -f "%{family}\n")/ { print a[NR-1]; exit }")
hue=(-level "0%,100%,0.6")

# value="60" #brightness value to compare to
# color=$(convert "$image" -gravity center -crop 100x100+0+0 +repage -colorspace hsb \
#     -resize 1x1 txt:- | awk -F '[%$]' 'NR==2{gsub(",",""); printf "%.0f\n", $(NF-1)}');
# if [[ $color -gt $value ]]; then #white background image and black text
#     bw="black"
#     icon="/home/matteo/.config/i3/scripts/icons/lockdark.png"
#     param=("--insidecolor=0000001c" "--ringcolor=0000003e" \
#         "--linecolor=00000000" "--keyhlcolor=ffffff80" "--ringvercolor=ffffff00" \
#         "--separatorcolor=22222260" "--insidevercolor=ffffff1c" \
#         "--ringwrongcolor=ffffff55" "--insidewrongcolor=ffffff1c" \
#         "--verifcolor=ffffff00" "--wrongcolor=ff000000" "--timecolor=ffffff00" \
#         "--datecolor=ffffff00" "--layoutcolor=ffffff00")
# else #black
#     bw="white"
#     icon="/home/matteo/.config/i3/scripts/icons/lock.png"
#     param=("--insidecolor=ffffff1c" "--ringcolor=ffffff3e" \
#         "--linecolor=ffffff00" "--keyhlcolor=00000080" "--ringvercolor=00000000" \
#         "--separatorcolor=22222260" "--insidevercolor=0000001c" \
#         "--ringwrongcolor=00000055" "--insidewrongcolor=0000001c" \
#         "--verifcolor=00000000" "--wrongcolor=ff000000" "--timecolor=00000000" \
#         "--datecolor=00000000" "--layoutcolor=00000000")
# fi
# convert "$image" "${hue[@]}" -font "$font" -pointsize 46 -fill "$bw" -gravity center \
#    -annotate +0+160 "$text" "$icon" -gravity center -composite "$image"

param=("--force-clock"
    "--insidevercolor=FFFFFF17" \
    "--insidewrongcolor=FFFFFF55" "--ringwrongcolor=FFBA63FF" \
    "--insidecolor=00000077" "--ringcolor=FFFFFFFF" \
    "--linecolor=ffffff00" "--bshlcolor=00000000" \
    "--separatorcolor=000000FF" \
    "--verifcolor=00000000" "--wrongcolor=ff000000" \
    "--datecolor=00000000" "--layoutcolor=00000000"
    '--indpos="x 100:y 100"'
    "--timesize=30" "--timecolor=FFFFFFFF")
#    '--vertext="Drinking verification can..."' '--wrongtext="Nope!"')
#    "--textsize=20" "--modsize=10")


# try to use i3lock with prepared parameters
if ! LC_TIME=ru_RU.UTF-8 ${i3lock_cmd[@]} \
    -k --force-clock --indicator \
    --insidecolor=00000077 --ringcolor=96F7C800 \
    --timecolor=ffffffff --datecolor=ffffffff \
    --datestr="%A %d %B" \
    --keyhlcolor=FFFFFF99 \
    --insidewrongcolor=00000055 --ringwrongcolor=FFBA63FF \
    --insidevercolor=00000055 --ringvercolor=96F7C8FF \
    --radius=110 \
    --veriftext="" --wrongtext="" \
    --noinputtext="" --greetertext="" \
    --locktext="" --lockfailedtext="" \
    >/dev/null 2>&1; then
    # We have failed, lets get back to stock one
    echo "failed" #"${i3lock_cmd[@]}"
fi


#i3lock -i $image -t -f -p win -e
rm $image
