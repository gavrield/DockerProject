#! /bin/bash
X=$(docker ps | grep alpcon)
if [[$X==""]];then
    docker start alpcon
fi
docker exec -d alpcon wget https://raw.githubusercontent.com/gavrield/DockerProject/main/print_and_wait.py
docker exec -d alpcon chmod 777 print_and_wait.py
docker exec -d alpcon ./print_and_wait.py
sleep 10
sudo kill $(docker top alpcon | grep python3 | grep -v grep | awk '{print $2}')
docker stop alpcon
