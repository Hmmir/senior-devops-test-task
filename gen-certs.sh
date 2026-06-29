#!/usr/bin/env sh
set -eu

CERT_DIR="${1:-./certs}"
mkdir -p "$CERT_DIR"

openssl req \
  -x509 \
  -nodes \
  -newkey rsa:2048 \
  -keyout "$CERT_DIR/server.key" \
  -out "$CERT_DIR/server.crt" \
  -days 365 \
  -subj "/C=RU/ST=Moscow/L=Moscow/O=LocalDev/CN=localhost" \
  -addext "subjectAltName=DNS:localhost,IP:127.0.0.1"

echo "Certificates generated in $CERT_DIR"
