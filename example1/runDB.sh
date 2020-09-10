#/bin/bash

echo "------------------------------"
echo "     Delete Previous Info     "
echo "------------------------------"
echo 
echo "CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES"
#docker volume prune -f
docker ps -a | grep mysql
docker rm -f $(docker ps -a | grep mysql)
#docker rm -f $(docker ps -a | grep mysql-leader)
#docker rm -f $(docker ps -a | grep mysql-follower)
sleep 1
echo
echo "------------------------------"
echo "     Start My SQL DB          "
echo "------------------------------"
echo 
docker run --name mysql \
 	-e MYSQL_ROOT_PASSWORD=root123 \
 	-p 13306:3306 \
	-d mysql
# docker run --name mysql-leader \
# 	-e MYSQL_ROOT_PASSWORD=root123 \
# 	-v /Users/Jeongsoo/01_Develop/01_ETL_Demo/cdc_mysql/_volumes/leader:/var/lib/mysql \
# 	-v /Users/Jeongsoo/01_Develop/01_ETL_Demo/cdc_mysql/cfg/my.cnf.leader:/etc/mysql/my.cnf \
# 	-p 13306:3306 \
# 	-d mysql 
# sleep 2

# docker run --name mysql-follower \
# 	-e MYSQL_ROOT_PASSWORD=root123 \
# 	-v /Users/Jeongsoo/01_Develop/01_ETL_Demo/cdc_mysql/_volumes/follower:/var/lib/mysql \
# 	-v /Users/Jeongsoo/01_Develop/01_ETL_Demo/cdc_mysql/cfg/my.cnf.follower:/etc/mysql/my.cnf \
# 	-p 23306:3306 \
# 	-d mysql 

echo
echo "[ Display Running mysql docker containers ]"
/usr/local/bin/ls_docker  | grep mysql
echo
#docker exec -it mysql-leader /opt/