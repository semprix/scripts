#!/bin/bash

echo "Starting nTopng"
sleep 2
# -i <interface_name> --https-port <port_number> -e <daemonized>
ntopng -i lo --http-port 3000 -e
echo "Done"
