## Changelog

### 0.3.1

Minor internal patch to prevent a PVC from being generated blankly if persistence.existingClaim is set. This is backwards compatible and requires no user changes.

### 0.3.0

This release fixes volume mounts and brings the corvid dependency up to date from 0.6.1 to 0.7.1. This largeley compatible, however liveness and readiness probes have now been removed from the internal charts configuration, with the expectation that you add these into your charts to maintain the liveness and readiness checks. This was done to ensure you could manipulate these checks at will, otherwise if I configure them in the charts values you wont be able to properly configure them how you want them later.

You will need to add the following to your values.yaml to maintain compatibility:

```yaml
livenessProbe:
  httpGet:
    path: /
    port: http
readinessProbe:
  httpGet:
    path: /
    port: http
```
