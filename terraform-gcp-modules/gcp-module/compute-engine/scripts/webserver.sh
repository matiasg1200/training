#!/bin/bash

apt update

apt install apache2 -y

cat <<EOF > /var/www/html/index.html
<html><body><p>Web server created using terraform.</p></body></html>
EOF
