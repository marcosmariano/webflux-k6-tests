import http from 'k6/http';
import { check, sleep } from "k6";

export let options = {
  stages: [
      // Ramp-up from 1 to 5 virtual users (VUs) in 5s
      { duration: "5s", target: 50 },

      // Stay at rest on 5 VUs for 10s
      { duration: "10s", target: 145 },

      // Ramp-down from 5 to 0 VUs for 5s
      { duration: "5s", target: 0 }
  ]
};

export default function () {
  const response =  http.get('http://localhost:8080/v2/playlist/f2906e7a-5750-4e3e-b8ca-09aa2efa3486');
  check(response, { "status is 200": (r) => r.status === 200 });
  sleep(.300);
};
