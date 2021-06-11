#!/bin/bash

# Generate certificate.der and key.der
swift run MakeCert

# Convert key.der to key.pem
openssl rsa -in key.der -inform der -outform pem -out key.pem

# Convert certificate.der to certificate.pem
openssl x509 -in certificate.der -inform der -outform pem -out certificate.pem

# Make a PKCS12 bundle: bundle.p12
openssl pkcs12 -export -in certificate.pem -inkey key.pem -out bundle.p12 -passout pass:password
