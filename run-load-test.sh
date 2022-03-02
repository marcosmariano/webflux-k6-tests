
docker-compose up -d influxdb grafana 
echo "--------------------------------------------------------------------------------------"
echo "Load testing with Grafana dashboard http://localhost:3000/d/k6/k6-load-testing-results"
echo "--------------------------------------------------------------------------------------"
<<<<<<< HEAD
k6 run ./scripts/findByIdPlaylists.js -o influxdb=http://localhost:8086/k6 

k6 run ./scripts/findAllPlaylists.js -o influxdb=http://localhost:8086/k6 

k6 run ./scripts/mvcEventStreamPlaylist.js -o influxdb=http://localhost:8086/k6 

k6 run ./scripts/webfluxEventStreamPlaylist.js -o influxdb=http://localhost:8086/k6 
=======
docker-compose run --rm k6 run /scripts/findAllPlaylists.js
echo "--------------------------------------------------------------------------------------"

docker-compose run --rm k6 run /scripts/findByIdPlaylists.js
echo "--------------------------------------------------------------------------------------"

docker-compose run --rm k6 run /scripts/mvcEventStreamPlaylist.js
echo "--------------------------------------------------------------------------------------"

docker-compose run --rm k6 run /scripts/webfluxEventStreamPlaylist.js


>>>>>>> 2e10b6868d82810df00eab5e914b08d7005ddf19
