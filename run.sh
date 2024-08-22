docker run -p 4567:4567 \
  -v /etc/localtime:/etc/localtime:ro \
  -v $(pwd):/app \
  --name jep-sinatra-backend-c jep-sinatra-backend-i:latest
