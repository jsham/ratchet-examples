#/bin/bash

echo "------------------------------"
echo "     Delete Previous Info     "
echo "------------------------------"
echo 
echo "CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES"
#docker volume prune -f
docker ps -a | grep mysql
docker rm -f $(docker ps -a | grep mysql)
sleep 1
echo
echo "------------------------------"
echo "     Start My SQL DB          "
echo "------------------------------"
echo 
docker run --name mysql \
 	-e MYSQL_ROOT_PASSWORD=root123 \
 	-p 13306:3306 \
	-v /Users/Jeongsoo/go/src/github.com/ratchet-examples/example5/schema.sql:/docker-entrypoint-initdb.d/schema.sql \
	-d mysql

# Install VIM on mysql docker container #
#docker exec mysql apt-get update; 
#docker exec mysql apt-get install vim -y;

echo
echo "[ Display Running mysql docker containers ]"
docker ps -a | grep mysql
#echo "docker exec -it mysql bash"
#docker exec -it mysql bash
echo
