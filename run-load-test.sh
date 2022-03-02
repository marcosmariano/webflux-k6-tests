
docker-compose up -d influxdb grafana 
echo "--------------------------------------------------------------------------------------"
echo "Load testing with Grafana dashboard http://localhost:3000/d/k6/k6-load-testing-results"
echo "--------------------------------------------------------------------------------------"
docker-compose run --rm k6 run /scripts/findAllPlaylists.js
echo "--------------------------------------------------------------------------------------"

docker-compose run --rm k6 run /scripts/findByIdPlaylists.js
echo "--------------------------------------------------------------------------------------"

docker-compose run --rm k6 run /scripts/mvcEventStreamPlaylist.js
echo "--------------------------------------------------------------------------------------"

docker-compose run --rm k6 run /scripts/webfluxEventStreamPlaylist.js


