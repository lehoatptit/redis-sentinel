#!/bin/bash
# sentinel-entrypoint.sh
#entrypoint chay sau khi hoan thanh build image no su dung de chay container
# dam bao thu muc log va data phai ton tai de chay service sentinel trong container 
mkdir -p /redis-sentinel/data
mkdir -p /redis-sentinel/logs
#chay service sentinel
redis-server /redis/sentinel.conf --sentinel
