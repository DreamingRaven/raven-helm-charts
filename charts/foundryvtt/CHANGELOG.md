# Changelog

## 0.6.0

This adds default security and pod security policies to enable users upgrading from v12 to seamlessley upgrade to v13.

To restore the old behaviour simply disable both security policies.

```yaml
podSecurityContextEnabled: false
securityContextEnabled: false
```

Otherwise this enhances security and compatibility.

See also: https://github.com/felddy/foundryvtt-docker/discussions/1197
