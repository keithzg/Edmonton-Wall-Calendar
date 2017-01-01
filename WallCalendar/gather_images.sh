#!/bin/bash

r="resources/HighLevel"
t="tmp"

mkdir -p ${t}

# From https://m.facebook.com/story.php?story_fbid=10155280183727580&substory_index=0&id=46081607579
curl "https://scontent.xx.fbcdn.net/v/t31.0-8/fr/cp0/e15/q65/15675963_10155280183727580_497718100356459313_o.jpg?efg=eyJpIjoidCJ9&oh=85c0220163aff9c27e1b1273a89a0bd6&oe=591D5992" -o ${t}/jan.jpg
# From https://twitter.com/yegtraffic/status/289108067793113088
curl https://pbs.twimg.com/media/BAMeGoGCAAAFsDm.jpg:large -o ${t}/feb.jpg
# http://globalnews.ca/news/2579971/semi-wedged-underneath-overpass-near-alberta-legislature/
curl "https://shawglobalnews.files.wordpress.com/2016/03/img_3375.jpg?quality=70&strip=all&w=1200&h=800&crop=1" -o ${t}/mar.jpg
# http://www.torontosun.com/2012/03/16/a-bridge-too-high
curl "http://storage.torontosun.com/v1/dynamic_resize/sws_path/suns-prod-images/1331120346185_ORIGINAL.jpg?quality=80&size=650x424" -o ${t}/apr.jpg
# From http://globalnews.ca/news/2084137/semi-truck-crashes-into-streetcar-overpass-at-edmontons-high-level-bridge/
curl "https://shawglobalnews.files.wordpress.com/2015/06/high-level-bridge-collision3-june-30-15.jpg?quality=70&strip=all&w=640&h=448&crop=1" -o ${t}/may.jpg
# http://www.cbc.ca/news/canada/edmonton/semi-truck-unstuck-at-entrance-to-high-level-bridge-1.3133204
curl https://i.cbc.ca/1.3133214.1435674934!/fileImage/httpImage/image.jpg_gen/derivatives/16x9_620/truck-high-level-bridge.jpg -o ${t}/jun.jpg
# From http://edmontonjournal.com/news/local-news/why-trucks-keep-getting-stuck-under-the-high-level-bridge
curl http://wpmedia.edmontonjournal.com/2015/07/news-edmonton-trucks-keep-getting-stuck-under-hig.jpg -o ${t}/jul.jpg
# From http://www.scoopnest.com/user/edmontonjournal/616003064558792704
curl http://pbs.twimg.com/media/CIx7TmwWoAA79rS.jpg:large -o ${t}/aug.jpg
# From http://www.scoopnest.com/user/edmontonjournal/616003064558792704
curl http://pbs.twimg.com/media/CIx7ToBWwAAjozQ.jpg:large -o ${t}/sep.jpg
# http://globalnews.ca/news/2584287/we-may-need-to-put-an-even-bigger-sign-up-trucks-keep-getting-stuck-by-edmontons-high-level-bridge/
curl "http://i1.wp.com/media.globalnews.ca/videostatic/578/467/2016-03-18T00-14-21.266Z--1280x720.jpg?w=670&quality=70&strip=all" -o ${t}/oct.jpg
# From http://www.cbc.ca/news/canada/edmonton/high-level-bridge-snafu-heralds-bad-day-for-truck-1.1187946
curl "https://i.cbc.ca/1.1690381.1379084307!/httpImage/image.jpg_gen/derivatives/16x9_620/li-high-level-truck.jpg" -o ${t}/nov.jpg
# From http://globalnews.ca/news/2584287/we-may-need-to-put-an-even-bigger-sign-up-trucks-keep-getting-stuck-by-edmontons-high-level-bridge/
curl "https://shawglobalnews.files.wordpress.com/2016/03/bridge4.jpg?quality=100&strip=all&w=672&h=448" -o ${t}/dec.jpg
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
