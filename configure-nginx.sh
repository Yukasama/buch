#!/bin/bash

# Set Cloudflare domain
DOMAIN="buch.zenathra.com"

# Define path to Nginx configuration file
NGINX_CONF="/etc/nginx/conf.d/buch-web-proxy.conf"

# Define path to the certificate files
CERT_PATH="/home/ec2-user/buch/src/config/resources/tls"

# Create Nginx configuration with the hard-coded domain
cat <<EOF | sudo tee $NGINX_CONF
server {
    listen 80;
    server_name $DOMAIN;

    # Redirect all HTTP requests to HTTPS
    return 301 https://\$host\$request_uri;
}

server {
    listen 443 ssl;
    server_name $DOMAIN;

    ssl_certificate $CERT_PATH/certificate.crt;
    ssl_certificate_key $CERT_PATH/key.pem;

    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;

    location / {
        proxy_pass https://localhost:3000;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_ssl_certificate $CERT_PATH/certificate.crt;
        proxy_ssl_certificate_key $CERT_PATH/key.pem;
        proxy_ssl_trusted_certificate $CERT_PATH/certificate.crt;
        proxy_ssl_verify off;
    }
}
EOF

# Start and enable Nginx
sudo systemctl enable nginx
sudo systemctl start nginx

# Test the Nginx configuration
sudo nginx -t

# Reload Nginx to apply the changes
sudo systemctl reload nginx
