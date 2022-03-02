import http from 'k6/http';
import { check, sleep } from "k6";

export let options = {
  stages: [
      { duration: "5s", target: 100 },

      { duration: "10s", target: 200 },

      { duration: "10s", target: 300 }

  ]
};

export default function () {
  const response =  http.get('http://localhost:8080/v2/playlist');
  check(response, { "status is 200": (r) => r.status === 200 });
  sleep(.300);
};
