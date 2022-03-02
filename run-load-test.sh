
docker-compose up -d influxdb grafana 
echo "--------------------------------------------------------------------------------------"
echo "Load testing with Grafana dashboard http://localhost:3000/d/k6/k6-load-testing-results"
echo "--------------------------------------------------------------------------------------"
k6 run ./scripts/findByIdPlaylists.js -o influxdb=http://localhost:8086/k6 

k6 run ./scripts/findAllPlaylists.js -o influxdb=http://localhost:8086/k6 

k6 run ./scripts/mvcEventStreamPlaylist.js -o influxdb=http://localhost:8086/k6 

k6 run ./scripts/webfluxEventStreamPlaylist.js -o influxdb=http://localhost:8086/k6 
