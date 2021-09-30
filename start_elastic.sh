#!/bin/bash

docker network create elastic

docker run -d --name elastic1 --net elastic -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" amazon/opendistro-for-elasticsearch-no-security:latest
docker run -d --name kibana1 --net elastic -p 5601:5601 -e "ELASTICSEARCH_HOSTS=http://elastic1:9200" amazon/opendistro-for-elasticsearch-kibana-no-security:latest

