# corvid

Common helm component and utility library

![Version: 0.16.0](https://img.shields.io/badge/Version-0.16.0-informational?style=flat-square) ![Type: library](https://img.shields.io/badge/Type-library-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

This library chart primarily deals with abstracting common boilerplate into customisable components for re-use.

## Installing the Chart

### Install via OCI helm registry

To install the chart with the release name `corvid`, run the following commands.
For a list of all available charts and versions see the [container registry](https://gitlab.com/GeorgeRaven/raven-helm-charts/container_registry)

To pull the latest version without authentication:

```console
helm install corvid oci://registry.gitlab.com/georgeraven/raven-helm-charts/corvid
```

With authentication:

```console
helm registry login registry.gitlab.com -u <USERNAME> -p <GITLAB_TOKEN>
helm install corvid oci://registry.gitlab.com/georgeraven/raven-helm-charts/corvid --version 0.16.0
```

### Install via Helm index.yaml (deprecated method since: 2025-03-24)

To install the chart with the release name `corvid`, run the following commands:

```console
$ helm repo add raven https://gitlab.com/api/v4/projects/55284972/packages/helm/stable
$ helm repo update raven
$ helm install corvid raven/corvid
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| args | string | `nil` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| command | string | `nil` |  |
| cron.backoffLimit | int | `3` |  |
| cron.concurrencyPolicy | string | `"Allow"` |  |
| cron.enabled | bool | `false` | enable or disable cronjob |
| cron.failedJobsHistoryLimit | int | `1` |  |
| cron.schedule | string | `"@midnight"` | schedule for cronjob using Cron syntax https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/#schedule-syntax |
| cron.successfulJobsHistoryLimit | int | `1` |  |
| cron.suspend | bool | `false` | cronjob will not trigger on schedule but can be manually triggered |
| deployment.strategy | string | `""` | rollout strategy `Recreate` or `RollingUpdate` this chart defaults to Recreate only if we detect a single replica with a volume |
| envFrom[0].configMapRef.name | string | `"someConfigMap"` |  |
| envFrom[0].configMapRef.optional | bool | `false` |  |
| envFrom[1].secretRef.name | string | `"someSecret"` |  |
| envFrom[1].secretRef.optional | bool | `false` |  |
| env[0].name | string | `"CORVID_EXAMPLE_VARIABLE"` |  |
| env[0].value | string | `"false"` |  |
| fullnameOverride | string | `""` |  |
| httpRoute.annotations | object | `{}` |  |
| httpRoute.enabled | bool | `false` |  |
| httpRoute.exposedPorts[0].number | int | `80` |  |
| httpRoute.hostnames[0] | string | `"corvid.org.example"` |  |
| httpRoute.parentRefs[0].name | string | `"my-gateway"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"library/alpine"` |  |
| image.tag | string | `"3.22.0"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"corvid.org.example"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| initContainers | string | `nil` |  |
| livenessProbe | string | `nil` | raw liveness probe overrides for user |
| livenessProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default liveness probe if not specified by user |
| livenessProbeEnabled | bool | `true` | enable or disable liveness probe entirely |
| nameOverride | string | `""` |  |
| netpol.enabled | bool | `true` |  |
| nodeSelector | object | `{}` |  |
| persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistence.defaultVolumeMounts | string | `nil` |  |
| persistence.enabled | bool | `false` |  |
| persistence.existingClaim | string | `""` |  |
| persistence.size | string | `"8Gi"` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` | podSecurityContext for consumer overrides |
| podSecurityContextDefault | object | `{"fsGroup":1000}` | default podSecurityContext if none specified |
| podSecurityContextEnabled | bool | `true` | enable or disable podSecurityContext entirely |
| ports[0].containerPort | int | `8080` |  |
| ports[0].name | string | `"http"` |  |
| ports[0].protocol | string | `"TCP"` |  |
| ports[0].servicePort | int | `80` |  |
| readinessProbe | string | `nil` | raw readiness probe overrides for user |
| readinessProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default readiness probe if not specified by user |
| readinessProbeEnabled | bool | `true` | enable or disable readiness probe entirely |
| replicaCount | int | `1` |  |
| resources | string | `nil` | raw resources block overrides for user |
| resourcesDefault | object | `{"limits":{"memory":"128Mi"},"requests":{"cpu":"100m"}}` | default resources if not specified by user |
| resourcesEnabled | bool | `true` | enable or disable resources entirely |
| runtimeClassName | string | `nil` |  |
| secrets | list | `[]` |  |
| securityContext | object | `{}` | securityContext for consumer overrides |
| securityContextDefault | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}` | default securityContext if none specified |
| securityContextEnabled | bool | `true` | enable or disable securityContext entirely |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| startupProbe | string | `nil` | raw startup probe overrides for user |
| startupProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default startup probe if not specified by user |
| startupProbeEnabled | bool | `true` | enable or disable startup probe entirely |
| sts.enabled | bool | `false` |  |
| sts.updateStrategy | string | `"RollingUpdate"` |  |
| tolerations | list | `[]` |  |
| topologySpreadConstraints | list | `[]` |  |
| volumeMounts | list | `[]` |  |
| volumes | list | `[]` |  |

# Changelog

## 0.16.0

Added backwards compatible statefulset support.
Here is the default configuration for it if you would like to add it to your charts.

```yaml
sts:
  enabled: false
  updateStrategy: RollingUpdate
```

## 0.15.0

This adds backwards compatible HTTPRoute support.
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

## 0.14.0

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

## 0.13.2

Substantively backwards compatible changes to enable controls of ctonjobs:

```yaml
cron:
  successfulJobsHistoryLimit: 1
  failedJobsHistoryLimit: 1
  backoffLimit: 3
  concurrencyPolicy: Allow # Allow, Forbid, Replace
```

This changes defaults, however the defaults changes are only to history and backoffLimits which would clog up kubernetes with many resources.

## 0.13.1

Added backwards compatible optional AppProtocol.
For richer interaction / information.

https://github.com/kubernetes/enhancements/blob/master/keps/sig-network/1507-app-protocol/README.md

https://github.com/kubernetes/kubernetes/issues/40244

```yaml
ports:
- name: http
  containerPort: 8080
  servicePort: 80
  protocol: TCP
  appProtocol: http # NEW
```

## 0.13.0

Adds backwards compatible topologySpreadConstraints.

Simply add the following to make use of them:

```yaml
topologySpreadConstraints: []
```

## 0.12.0

Behaviour has changed for single replica deployments with volumes.
If you have a deployment that:

- has a single replica (any of .Values.replicaCount=1, .Values.autoscaling.enabled=false)
- has a volume (any of .Values.volumes>0, .Values.persistence.existingClaim!="", .Values.persistence.enabled=true)

We now default the deployment to `Recreate` rollout strategy instead of `RollingUpdate` to enable rollouts to complete without manual intervention.

You can manually define the rollout strategy if you would rather not rely on this automated behaviour, this is left blank by default but feel free to adjust it as you see fit downstream:

```yaml

deployment:
  # -- rollout strategy `Recreate` or `RollingUpdate` this chart defaults to Recreate only if we detect a single replica with a volume
  strategy: ""

```

We do check for this key, so you will need to add this to your `values.yaml` else you will get thrown a key error.

## 0.11.0

This is backwards incompatible.
Security context defaults. Both `pod` and `container` level defaults are now available.
You will need to add the following to your downstream values.yaml changing the defaults to your needs:

```yaml

# -- enable or disable podSecurityContext entirely
podSecurityContextEnabled: true
# -- default podSecurityContext if none specified
podSecurityContextDefault:
  fsGroup: 1000
# -- podSecurityContext for consumer overrides
podSecurityContext: {}
  # fsGroup: 1000

# -- enable or disable securityContext entirely
securityContextEnabled: true
# -- default securityContext if none specified
securityContextDefault:
  capabilities:
    drop:
    - ALL
  readOnlyRootFilesystem: true
  runAsNonRoot: true
  runAsUser: 1000
  runAsGroup: 1000
  allowPrivilegeEscalation: false
# -- securityContext for consumer overrides
securityContext: {}
  # capabilities:
  #   drop:
  #   - ALL
  # readOnlyRootFilesystem: true
  # runAsNonRoot: true
  # runAsUser: 1000

```

PLEASE NOTE: The above default security context is very restrictive. Depending on your needs you may need to tone this down based on the application you are packaging.
Combined with the existing network policies this can be a very restrictive setup, where the container can do little, and it can communicate with very little.

This change enables consumers of your own charts to override the defaults, but also for you to prescribe defaults in the instance the user has not done so.
This also enables the user to completely disable them for debugging etc. This should ensure unaware consumers get some security defaults, so its important you pick reasonable defaults.

## 0.10.0

Backward incompatible change to cronjobs.
A new subkey `cron` now exists, which now contains the `enabled`, `schedule` and `suspend` fields.

To update ensure that `schedule` has been moved under the `cron` map.

```yaml

cron:
  # -- enable or disable cronjob
  enabled: false
  # -- schedule for cronjob using Cron syntax https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/#schedule-syntax
  schedule: "@midnight"
  # -- cronjob will not trigger on schedule but can be manually triggered
  suspend: false

```

## 0.9.0

This release adds default probe functionality. To enable me to create default probes without restricting the end user from either disabling them or overriding them as they see fit.
This is not backwards compatible because startupProbeEnabled is required to enable or disable probe functionality in all cases.

The idea for this feature comes from similar charts, like those bitnami create.

These new keys in the values.yaml are:

- startupProbeEnabled (bool)
- startupProbeDefault (map)
- livenessProbeEnabled (bool)
- livenessProbeDefault (map)
- readinessProbeEnabled (bool)
- readinessProbeDefault (map)
- resourcesEnabled (bool)
- resourcesDefault (map)

The recommended configuration is to enable all probes by default with reasonable values, and to enable resources.
This will use whatever you set as the default resources unless the user specifically overrides them.
When the user sets any key, all default values will be ignored using only the user provided keys.
This might look something akin to the following:

```yaml

# -- enable or disable resources entirely
resourcesEnabled: true
# -- default resources if not specified by user
resourcesDefault:
  limits:
    memory: 128Mi
  requests:
    cpu: 100m
# -- raw resources block overrides for user
resources:
  # limits:
  #   memory: 128Mi
  # requests:
  #   cpu: 100m

# -- enable or disable startup probe entirely
startupProbeEnabled: true
# -- default startup probe if not specified by user
startupProbeDefault:
  httpGet:
    path: /
    port: http
# -- raw startup probe overrides for user
startupProbe:
  # httpGet:
  #   path: /
  #   port: http

# -- enable or disable liveness probe entirely
livenessProbeEnabled: true
# -- default liveness probe if not specified by user
livenessProbeDefault:
  httpGet:
    path: /
    port: http
# -- raw liveness probe overrides for user
livenessProbe:
  # httpGet:
  #   path: /
  #   port: http

# -- enable or disable readiness probe entirely
readinessProbeEnabled: true
# -- default readiness probe if not specified by user
readinessProbeDefault:
  httpGet:
    path: /
    port: http
# -- raw readiness probe overrides for user
readinessProbe:
  # httpGet:
  #   path: /
  #   port: http

```

## 0.8.0

This release adds dnsPolicy and dnsConfig to the podSpec template.
This is backwards compatible since this will be ignored if the values do not exist.
To use this new template you can do something akin to the following as per your needs:

```yaml
dnsPolicy: "None"
dnsConfig:
	nameservers:
	- 1.1.1.1
	options:
	- name: ndots
	  value: "1"
```

However this should only be used if you know what you are doing, there are very specific cases where this might be required.
One such instance is VPNs in containers.
Otherwise it should be left empty:

```yaml
dnsPolicy: ""
dnsConfig: {}
```

see: https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/#pod-s-dns-policy

## 0.7.1

This release adds previously missing inbuilt startup probe configuration.
This is backwards compatible since no changes to values.yaml and it does not change the default behaviour.

To add a startup probe you can add the following to your values.yaml for the most basic startup probe:

```yaml
startupProbe:
  httpGet:
    path: /
    port: http # the port name if it is not call http
```

## 0.7.0

This release introduces a daemonset template. This is backwards compatible since no changes to values.yaml. If you would like to use this new template you can do something akin to the following. Replace ``corvid-test`` with your charts name:

```yaml
{{- define "corvid-test.daemonset" }}
# your daemonset overrides here
{{- end }}
{{- include "corvid.daemonset" (list . "corvid-test.daemonset") }}
```

## 0.6.5

This release introduces existingClaim persistence for the podSpec template. Thus this effects almost all usages, but only if ``.persistence.existingClaim`` is set.

By default please add the following to your values.yaml, although this is not required:

```yaml
persistence:
	existingClaim: ""
```

No changes are required in the templating itself, this is backwards compatible.

## 0.6.4

This release of corvid introduces CronJob templates. This is backwards compatible since the only new variables are part of a new template altogether to define a CronJob.
Any users seeking to invoke this new CronJob will need to add the following to their values.yaml:

```yaml
schedule: "@midnight" # or some other cron schedule, try: https://crontab.guru/
```

They will also need to invoke this new template in their templates (substituting ``corvid-test`` for their chart name):

```yaml
{{- define "corvid-test.cronjob" -}}
# your cronjob overrides here
{{- end -}}
{{- include "corvid.cronjob" (list . "corvid-test.cronjob") -}}
```

This is backwards compatible.

