#!/bin/bash

r="resources/HighLevel"
t="tmp"

mkdir -p ${t}

# From https://twitter.com/yegtraffic/status/289108067793113088
curl https://pbs.twimg.com/media/BAMeGoGCAAAFsDm.jpg:large -o ${t}/jan.jpg
# From https://twitter.com/yegtraffic/status/289108067793113088
curl https://pbs.twimg.com/media/BAMeGoGCAAAFsDm.jpg:large -o ${t}/feb.jpg
# http://globalnews.ca/news/2579971/semi-wedged-underneath-overpass-near-alberta-legislature/
curl "https://shawglobalnews.files.wordpress.com/2016/03/img_3375.jpg?quality=70&strip=all&w=1200&h=800&crop=1" -o ${t}/mar.jpg
# http://www.torontosun.com/2012/03/16/a-bridge-too-high
curl "http://storage.torontosun.com/v1/dynamic_resize/sws_path/suns-prod-images/1331120346185_ORIGINAL.jpg?quality=80&size=650x424" -o ${t}/apr.jpg
# From https://twitter.com/yegtraffic/status/289108067793113088
curl https://pbs.twimg.com/media/BAMeGoGCAAAFsDm.jpg:large -o ${t}/may.jpg
# http://www.cbc.ca/news/canada/edmonton/semi-truck-unstuck-at-entrance-to-high-level-bridge-1.3133204
curl https://i.cbc.ca/1.3133214.1435674934!/fileImage/httpImage/image.jpg_gen/derivatives/16x9_620/truck-high-level-bridge.jpg -o ${t}/jun.jpg
# From http://edmontonjournal.com/news/local-news/why-trucks-keep-getting-stuck-under-the-high-level-bridge
curl http://wpmedia.edmontonjournal.com/2015/07/news-edmonton-trucks-keep-getting-stuck-under-hig.jpg -o ${t}/jul.jpg
# From http://www.scoopnest.com/user/edmontonjournal/616003064558792704
curl http://pbs.twimg.com/media/CIx7TmwWoAA79rS.jpg:large -o ${t}/aug.jpg
# From http://www.scoopnest.com/user/edmontonjournal/616003064558792704
curl http://pbs.twimg.com/media/CIx7ToBWwAAjozQ.jpg:large -o ${t}/sep.jpg
# From https://twitter.com/yegtraffic/status/289108067793113088
curl https://pbs.twimg.com/media/BAMeGoGCAAAFsDm.jpg:large -o ${t}/oct.jpg
# From https://twitter.com/yegtraffic/status/289108067793113088
curl https://pbs.twimg.com/media/BAMeGoGCAAAFsDm.jpg:large -o ${t}/nov.jpg
# From https://twitter.com/yegtraffic/status/289108067793113088
curl https://pbs.twimg.com/media/BAMeGoGCAAAFsDm.jpg:large -o ${t}/dec.jpg
# From https://twitter.com/yegtraffic/status/289108067793113088
curl https://pbs.twimg.com/media/BAMeGoGCAAAFsDm.jpg:large -o ${t}/front.jpg
# From https://twitter.com/yegtraffic/status/289108067793113088
curl https://pbs.twimg.com/media/BAMeGoGCAAAFsDm.jpg:large -o ${t}/back.jpg

# Do some conversions
for i in `ls ${t}/*.jpg`; do
    png=$(basename "$i")
    png="${t}/${png%.*}.png"
    echo "i is $i, png is $png"
    # attempting http://www.imagemagick.org/Usage/thumbnails/#square
    convert ${i} -virtual-pixel white -set option:distort:viewport \
     "%[fx:max(w,h)]x%[fx:max(w,h)]-%[fx:max((h-w)/2,0)]-%[fx:max((w-h)/2,0)]" \
     -filter point -distort SRT 0  +repage ${png}
done

# Now finally move in the images to their expected location
cp ${t}/*.png ${r}/
