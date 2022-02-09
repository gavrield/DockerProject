#! /bin/bash
X=$(docker ps -a | grep alpcon); # checks if the container exists
Y=$(docker ps | grep alpcon); # checks if the container running
Z=$(docker images | grep myalp); # checks if the image exists
if [[ -z $Z ]]; then
    docker build -t myalp ~ ;
    docker run --name alpcon -di -v ~/shared-volume:/data myalp;
elif [[ -z $Y ]]; then
    if [[ ! -z $X ]]; then
        docker start alpcon;
    else
        docker run --name alpcon -di -v ~/shared-volume:/data myalp;
    fi
fi

docker exec -d alpcon git clone https://github.com/gavrield/DockerProject.git;
sleep 2;
docker exec -d alpcon python3 /DockerProject/print_and_wait.py;
sleep 10;
PID=$(docker top alpcon | grep python3 | awk '{print $2}');
if [[ ! -z $PID ]]; then
    sudo kill ${PID};
    echo "failed test";
fi
docker stop alpcon;
