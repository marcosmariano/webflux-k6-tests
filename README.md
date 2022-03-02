# Intro
Load test of our Spring Webflux API

you can run the api with the following command:
```
java -jar webflux.jar
```

after you can Ramp-up the docker using *docker-compose*
```
docker compose up -d
```

# API Endpoints

### GET v1/playlist/events
MVC Events Stream to compare with Reactive Events Stream
```
curl --location --request GET 'localhost:8080/v1/playlist/events'
```

## Reactive Endpoints 

### GET v2/playlist/events
Reactive Events Stream
```
curl --location --request GET 'localhost:8080/v2/playlist/events'
```

### POST v2/playlist
Create new playlist
```
curl --location --request POST 'http://localhost:8080/v2/playlist' \
--header 'Content-Type: application/json' \
--data-raw '{
    "nome":"Teste"
}'
```

### GET v2/playlist
Find all playlists
```
curl --location --request GET 'http://localhost:8080/v1/playlist'
```

### GET v2/playlist/{id}
Find playlist by Id
```
curl --location --request GET 'http://localhost:8080/v1/playlist/{id}'
```


# K6
Install K6 in your machine at first!
https://k6.io/docs/

#### Dashboards
The dashboard in /dashboards is adapted from the excellent K6 / Grafana dashboard here:
https://grafana.com/grafana/dashboards/2587

In your local machine access http://localhost:3000/d/k6/k6-load-testing-results?orgId=1&refresh=5s&from=now-2d&to=now to see the dashboards

There are only two small modifications:
* the data source is configured to use the docker created InfluxDB data source
* the time period is set to now-15m, which I feel is a better view for most tests

#### Scripts

Here are the scripts to run the tests and write it at the influxdb
```
k6 run ./scripts/findByIdPlaylists.js -o influxdb=http://localhost:8086/k6 

k6 run ./scripts/findAllPlaylists.js -o influxdb=http://localhost:8086/k6 

k6 run ./scripts/mvcEventStreamPlaylist.js -o influxdb=http://localhost:8086/k6 

k6 run ./scripts/webfluxEventStreamPlaylist.js -o influxdb=http://localhost:8086/k6 

```
