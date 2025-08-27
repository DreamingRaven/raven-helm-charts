# Changelog

## 0.16.2 (corvid 0.19.1)

This adds a flag to enable or disable the service account completely.
This is backwards compatible and does not change the default behaviour.

## 0.16.1 (corvid 0.19.0)

This adds the corvid backwards compatible job annotation field.

This is particularly useful for the purpose of adding `helm.sh/hook` annotations.

No action is necessary, however here are the new defaults for your reference:

```yaml
job:
  enabled: true
  # -- annotations to add to the generated job e.g for helm hooks
  annotations: {}
    # helm.sh/hook: post-install,post-upgrade
    # helm.sh/hook-weight: "-1"
    # helm.sh/hook-delete-policy: before-hook-creation
```

## 0.16.0 (corvid 0.18.0)

*BREAKING RELEASE*

#### What

This breaking release disables all forms of deployment by default. I.E `deployments` `daemonsets`, `statefulsets`, `jobs`, `cronjobs`

This also disables all exposure by default, other than the internal cluster service. I.E `ingress`, `httproute`

This also disables the default network policy, which can lead to confusion for users. `netpol`

This also disables the default connectivity test, which often plays no role in most charts. `test`

This means the new chart will only create 2 resources by default without being otherwise instructed:

- a default `pvc` to ensure users don't lose data
- a default `serviceAccount` due to how the podSpec defaults currently work

**We support all previous functionality, we merely make it an opt-in** for the user, which works better with helms lack of safeguards, for things like incorrect indentation.

We maintain default enablement of persistence, to prevent accidental data loss, by those not reading these changelogs.

We also maintain the default probes and resources, to provide some starting points (although we are looking to better merge overrides between `httpGet` and `exec` probes).

#### Why

The intention behind this change is to:

- Lean-in to the DIY / component based, low-abstraction approach this chart takes.
- Reduce boilerplate, as currently you have to disable all forms of deployment everywhere. This change would mean you now only have to enable the one you are interested in, whichever one that may be.
- Prevent accidentally bombing cluster resources with simultaneous deployments, daemonsets, statefulsets etc, without the willing opt-in of the user, which also confirms the user has properly mapped their values.
- Prevent accidentally exposing applications that users did not intend to be exposed.

While this is breaking, it is also very easily reverted, you need simply specifically enable the features you would like.

This also potentially means you can reduce the number of overrides you need to make in your own `values.yaml`.

#### Advised Actions

It is advised that you tweak your values.yaml to specifically enable everything you want, and rely on the defaults to keep everything else disabled.

```diff
- daemonset:
-   enabled: false
+ deployment:
+   enabled: true
- cron:
-   enabled: false
- job:
-   enabled: false
- ingress:
-   enabled: false
- service:
-   enabled: false
```

#### Backwards Compatibility

With this new change you can restore the exact old behaviour by setting the following in your `values.yaml` overrides (not advised, as not a useful default):

```yaml
daemonset:
  enabled: true
deployment:
  enabled: true
cron:
  enabled: true
job:
  enabled: true
ingress:
  enabled: true
service:
  enabled: true
test:
  enabled: true
```

## 0.15.0 (corvid 0.18.0)

This release adds backwards compatible service options, to enable disabling the service,
and add custom annotations as needed. No changes are necessary as the defaults,
match the old behaviour. The new defaults are as follows:

```yaml
service:
  enabled: true
  annotations: {}
  type: ClusterIP
```

## 0.14.0 (corvid 0.17.0)

This release truncates cronjob names from 63 to 52 characters.
This could potentially be breaking in cases where this behaviour was relied upon.
However I imagine your cronjobs were failing since they cannot be applied with more than 52 chars to k8s.

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
