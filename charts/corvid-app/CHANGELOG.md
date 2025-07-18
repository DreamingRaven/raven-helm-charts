# Changelog

## 0.13.0 (corvid 0.16.0)

This release adds statefulset support.
This is backwards compatible and is disabled by default.

```yaml
sts:
  enabled: false
  updateStrategy: RollingUpdate
```

## 0.12.0 (corvid 0.15.0)

This adds schema validation to the values.yaml in the most basic way possible.
This should not be effectual, but will eventually become expanded to support more validation.

This also adds backwards compatible HTTPRoute support.
Since ingress is dying a slow but steady death, I have added the most basic HTTPRoute
It is advised that you add the new values to your values.yaml even if it is disabled by default:

```yaml
httpRoute:
  enabled: false
  annotations: {}
  parentRefs:
  - name: my-gateway
  hostnames:
  - "corvid.org.example"
  exposedPorts:
  - number: 80
```

This will be slowly expanded to support more features.
If you need more features sooner it is advised to bring your own HTTPRoute.

## 0.11.0 (corvid 0.14.0)

This breaking change introduces the ability to configure the default persistent volume mounts. This is more useful for packagers since this allows the packages to define the default volume mounts for others to consume.

While this does not change corvids default behaviour it does change corvid-apps default behaviour since it issues a default data volume.

To restore this behaviour:

```yaml
persistence:
  enabled: true # corvid persistence is now false by default
  # the rest of your persistence config
  defaultVolumeMounts:
  - name: data
    mountPath: /data/
    subPath: data
```
