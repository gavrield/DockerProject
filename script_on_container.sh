#! /bin/bash
X=$(docker ps | grep alpcon);
if [[ -z $X ]]; then
    docker start alpcon;
fi
docker exec -d alpcon wget https://raw.githubusercontent.com/gavrield/DockerProject/main/print_and_wait.py;
docker exec -d alpcon chmod 711 print_and_wait.py;
docker exec -d alpcon ./print_and_wait.py;
sleep 10;
PID=$(docker top alpcon | grep python3 | grep -v grep | awk '{print $2}');
if [[ ! -z $PID ]]; then
    echo 123 | sudo kill ${PID};
    echo "failed test";
fi
docker stop alpcon;
