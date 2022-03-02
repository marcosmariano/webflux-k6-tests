# Intro
Load test of our Spring Webflux API

you can run the api using in the root of this repository
```
java -jar webflux.jar
```
## K6
Install K6 in your machine at first!
https://k6.io/docs/

#### Dashboards
The dashboard in /dashboards is adapted from the excellent K6 / Grafana dashboard here:
https://grafana.com/grafana/dashboards/2587

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