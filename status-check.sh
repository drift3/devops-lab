#!/bin/bash
echo "Host: $(hostname) — web server check on $(date)"
curl -s -o /dev/null -w "HTTP status: %{http_code}\n" http://localhost || echo "Server unreachable"
