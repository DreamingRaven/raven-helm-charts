# Changelog

## 0.14.0

This changes the health probes to target the foundry `/api/status` endpoint instead of the `/` endpoint.

This should improve the health check reliability, and reduce the amount of data being sent to the health check endpoint.

If you would like to maintain the old behaviour you can set the following:

```yaml
startupProbe:
  httpGet:
    path: /
    port: http
livenessProbe:
  httpGet:
    path: /
    port: http
readinessProbe:
  httpGet:
    path: /
    port: http
```

This should be backwards compatible.

## 0.6.0

This adds default security and pod security policies to enable users upgrading from v12 to seamlessley upgrade to v13.

To restore the old behaviour simply disable both security policies.

```yaml
podSecurityContextEnabled: false
securityContextEnabled: false
```

Otherwise this enhances security and compatibility.

See also: https://github.com/felddy/foundryvtt-docker/discussions/1197
