#!/bin/bash

cat > index.html <<EOF
<h1>Managed by Terraform</h1>
<h2>Maintained by Vlad S.</h2>
EOF

nohup busybox httpd -f -p "${server_port}" &

