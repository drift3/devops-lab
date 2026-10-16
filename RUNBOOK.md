# RUNBOOK — Status Page Down (ubuntu-lab)

## Symptom
curl http://localhost fails or returns an error.

## Procedure (in order)
1. Confirm the symptom: `curl -s -o /dev/null -w "%{http_code}\n" http://localhost`
   - 000 / connection refused -> nginx down -> step 2
   - 200 -> server fine, problem is elsewhere (network/client)
   - 403 -> permissions on /var/www/html
   - 404 -> wrong document root or missing index.html
2. Check the service: `systemctl status nginx`
   - inactive -> `sudo systemctl start nginx`
   - failed -> read the log lines at the bottom, then: `journalctl -u nginx -n 30 --no-pager`
3. If config was recently changed: `sudo nginx -t` — fix any errors it reports, then `sudo systemctl reload nginx`
4. Verify recovery: `curl http://localhost` returns the status page.
5. Write down what happened and why (add a line to this file's History section).

## History
- 2026-09-28 — Initial runbook created during linux-001.
