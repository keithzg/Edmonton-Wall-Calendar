#!/bin/bash

r="resources/HighLevel"
t="tmp"

mkdir -p ${t}

# From https://twitter.com/yegtraffic/status/289108067793113088
curl https://pbs.twimg.com/media/BAMeGoGCAAAFsDm.jpg:large -o ${t}/jan.png
# From https://twitter.com/yegtraffic/status/289108067793113088
curl https://pbs.twimg.com/media/BAMeGoGCAAAFsDm.jpg:large -o ${t}/feb.png
# http://globalnews.ca/news/2579971/semi-wedged-underneath-overpass-near-alberta-legislature/
curl "https://shawglobalnews.files.wordpress.com/2016/03/img_3375.jpg?quality=70&strip=all&w=1200&h=800&crop=1" -o ${t}/mar.png
# http://www.torontosun.com/2012/03/16/a-bridge-too-high
curl "http://storage.torontosun.com/v1/dynamic_resize/sws_path/suns-prod-images/1331120346185_ORIGINAL.jpg?quality=80&size=650x424" -o ${t}/apr.pngs 
# From https://twitter.com/yegtraffic/status/289108067793113088
curl https://pbs.twimg.com/media/BAMeGoGCAAAFsDm.jpg:large -o ${t}/may.png
# http://www.cbc.ca/news/canada/edmonton/semi-truck-unstuck-at-entrance-to-high-level-bridge-1.3133204
curl https://i.cbc.ca/1.3133214.1435674934!/fileImage/httpImage/image.jpg_gen/derivatives/16x9_620/truck-high-level-bridge.jpg -o ${t}/jun.png
# From http://edmontonjournal.com/news/local-news/why-trucks-keep-getting-stuck-under-the-high-level-bridge
curl http://wpmedia.edmontonjournal.com/2015/07/news-edmonton-trucks-keep-getting-stuck-under-hig.jpg -o ${t}/jul.png
# From http://www.scoopnest.com/user/edmontonjournal/616003064558792704
curl http://pbs.twimg.com/media/CIx7TmwWoAA79rS.jpg:large -o ${t}/aug.png
# From http://www.scoopnest.com/user/edmontonjournal/616003064558792704
curl http://pbs.twimg.com/media/CIx7ToBWwAAjozQ.jpg:large -o ${t}/sep.png
# From https://twitter.com/yegtraffic/status/289108067793113088
curl https://pbs.twimg.com/media/BAMeGoGCAAAFsDm.jpg:large -o ${t}/oct.png
# From https://twitter.com/yegtraffic/status/289108067793113088
curl https://pbs.twimg.com/media/BAMeGoGCAAAFsDm.jpg:large -o ${t}/nov.png
# From https://twitter.com/yegtraffic/status/289108067793113088
curl https://pbs.twimg.com/media/BAMeGoGCAAAFsDm.jpg:large -o ${t}/dec.png
# From https://twitter.com/yegtraffic/status/289108067793113088
curl https://pbs.twimg.com/media/BAMeGoGCAAAFsDm.jpg:large -o ${t}/front.png
# From https://twitter.com/yegtraffic/status/289108067793113088
curl https://pbs.twimg.com/media/BAMeGoGCAAAFsDm.jpg:large -o ${t}/back.png

# Before we do this, we *should* probably be converting/resizing/etc these images, but . . .
cp ${t}/*.png ${r}/
