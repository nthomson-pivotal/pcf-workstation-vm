#!/bin/bash

set -e

# Install nginx
sudo apt install -y nginx

# Create a self-signed certificate for basic HTTPS
sudo openssl req -x509 -subj '/CN=domain.com/O=Pivotal/C=US' -nodes -newkey rsa:4096 -keyout /etc/nginx/cert.key -out /etc/nginx/cert.pem -days 365
