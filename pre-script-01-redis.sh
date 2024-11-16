cat << EOF > pre-script-01.sh
#!/bin/bash
# Install tree package
dnf install tree -y 
# tao thu muc va configure file redis.conf cho redis master node
sudo mkdir -p /opt/redis-master/conf/
sudo curl -o /opt/redis-master/conf/redis.conf https://raw.githubusercontent.com/lehoatptit/redis-sentinel/main/redis-sample.conf
sudo mkdir -p /opt/redis-master/data
sudo mkdir -p /opt/redis-master/log
sudo chmod -R 755 /opt/redis-master

# tao thu muc va configure file sentinel.conf cho redis master node
sudo mkdir -p /opt/redis-master/redis-sentinel/conf/
sudo curl -o /opt/redis-master/redis-sentinel/conf/sentinel.conf https://raw.githubusercontent.com/lehoatptit/redis-sentinel/main/sentinel.conf
sudo mkdir -p /opt/redis-master/redis-sentinel/data
sudo mkdir -p /opt/redis-master/redis-sentinel/log
sudo chmod -R 755 /opt/redis-sentinel

#hien thi danh sach cac thu muc /opt
echo " cay thu muc vua tao duoc la:"
tree -L 3 /opt
EOF