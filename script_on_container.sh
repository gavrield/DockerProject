#! /bin/bash
X=$(docker ps | grep alpcon)
if [[$X==""]];then
    docker start alpcon
fi

