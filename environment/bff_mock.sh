docker run -it --rm \
  -p 8080:8080 \
  --name wiremock \
  -v $PWD/stub:/home/wiremock \
  wiremock/wiremock:2.35.0