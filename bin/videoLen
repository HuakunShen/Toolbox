# !/bin/bash
if [ $# -eq 0 ]
then
    echo 'missing directory argument ($1)'
    exit
fi
videoDir=$1
allLen=$(find $videoDir -iname '*.mp4' -exec ffprobe -v quiet -of csv=p=0 -show_entries format=duration {} \;)
sum=0
for duration in $allLen
do
    sum=`echo $sum + $duration | bc`
done

echo $sum seconds
sum=${sum%.*}
if [ $sum -gt 60 ]
then
    echo 'or around'
    minutes=$(( $sum / 60 ))
    echo $minutes minutes
fi