server {

  listen 443 ssl;
  server_name grafana.example.com;

  ssl_certificate /etc/ssl/crt/grafana.example.com.crt;
  ssl_certificate_key /etc/ssl/private/grafana.example.com.pem;

  location / {
    proxy_pass http://127.0.0.1:3000;
  }

}