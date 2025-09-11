# corvid

Common helm component and utility library

![Version: 0.20.0](https://img.shields.io/badge/Version-0.20.0-informational?style=flat-square) ![Type: library](https://img.shields.io/badge/Type-library-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

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
helm install corvid oci://registry.gitlab.com/georgeraven/raven-helm-charts/corvid --version 0.20.0
```

### As a helm dependency

You can also opt to directly reference this chart as a helm dependency defined in your `Chart.yaml`:

```yaml
dependencies:
- name: corvid
  version: 0.20.0
  repository: "oci://registry.gitlab.com/georgeraven/raven-helm-charts"
  # alias: <THE_NAME_YOU_WANT_TO_GIVE_THE_CHART> # optional for more advanced use-cases
  # condition: corvid.enabled # optional for more advanced use-cases
```

Then you should pull the chart with the following command:

```console
helm dependency update <PATH_TO_YOUR_CHART_DIR>
```

Which should automatically fetch the chart, update your lockfile, etc.

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
| autoscaling.behavior | object | `{}` | HPA behavior settings (included in keda ScaledObject if enabled) |
| autoscaling.enabled | bool | `false` | enable or disable autoscaling with a standalone HPA (settings are re-used if keda is enabled) |
| autoscaling.maxReplicas | int | `5` | maximum number of replicas to scale to |
| autoscaling.minReplicas | int | `1` | minimum number of replicas to scale to |
| autoscaling.targetCPUUtilizationPercentage | int | `80` | sets targetCPUUtilizationPercentage resource utilization of HPA |
| command | string | `nil` |  |
| cron.backoffLimit | int | `3` |  |
| cron.concurrencyPolicy | string | `"Allow"` |  |
| cron.enabled | bool | `false` | enable or disable cronjob |
| cron.failedJobsHistoryLimit | int | `1` |  |
| cron.schedule | string | `"@midnight"` | schedule for cronjob using Cron syntax https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/#schedule-syntax |
| cron.successfulJobsHistoryLimit | int | `1` |  |
| cron.suspend | bool | `false` | cronjob will not trigger on schedule but can be manually triggered |
| daemonset.enabled | bool | `false` |  |
| deployment.enabled | bool | `false` |  |
| deployment.strategy | string | `""` | rollout strategy `Recreate` or `RollingUpdate` this chart defaults to Recreate only if we detect a single replica with a volume |
| dnsConfig | object | `{}` |  |
| dnsPolicy | string | `""` |  |
| envFrom | string | `nil` |  |
| env[0].name | string | `"corvid_EXAMPLE_VARIABLE"` |  |
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
| initContainers | list | `[]` |  |
| job.annotations | object | `{}` | annotations to add to the job e.g for helm hooks |
| job.enabled | bool | `false` |  |
| keda.enabled | bool | `false` |  |
| keda.job.activeDeadlineSeconds | int | `60` |  |
| keda.job.backoffLimit | int | `3` |  |
| keda.job.ttlSecondsAfterFinished | int | `0` |  |
| keda.kind | string | `"ScaledJob"` |  |
| keda.object.cooldownPeriod | int | `300` |  |
| keda.object.failureThreshold | int | `1` |  |
| keda.object.idleReplicaCount | int | `0` |  |
| keda.object.minReplicas | int | `0` |  |
| keda.object.pollingInterval | int | `30` |  |
| keda.paused | bool | `false` |  |
| keda.transferHpaOwnership | bool | `true` |  |
| keda.triggers | list | `[]` |  |
| livenessProbe | string | `nil` | raw liveness probe overrides for user |
| livenessProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default liveness probe if not specified by user |
| livenessProbeEnabled | bool | `true` | enable or disable liveness probe entirely |
| nameOverride | string | `""` |  |
| netpol.enabled | bool | `false` |  |
| nodeSelector | object | `{}` |  |
| persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistence.defaultVolumeMounts[0].mountPath | string | `"/data/"` |  |
| persistence.defaultVolumeMounts[0].name | string | `"data"` |  |
| persistence.defaultVolumeMounts[0].subPath | string | `"data"` |  |
| persistence.enabled | bool | `true` |  |
| persistence.existingClaim | string | `""` |  |
| persistence.size | string | `"8Gi"` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` | podSecurityContext for consumer overrides |
| podSecurityContextDefault | object | `{"fsGroup":1000}` | default podSecurityContext if none specified |
| podSecurityContextEnabled | bool | `true` | enable or disable podSecurityContext entirely |
| ports[0].appProtocol | string | `"http"` |  |
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
| restartPolicy | string | `"Always"` |  |
| runtimeClassName | string | `nil` |  |
| secrets | list | `[]` |  |
| securityContext | object | `{}` | securityContext for consumer overrides |
| securityContextDefault | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}` | default securityContext if none specified |
| securityContextEnabled | bool | `true` | enable or disable securityContext entirely |
| service.annotations | object | `{}` | additional service annotations to add |
| service.enabled | bool | `false` | enable or disable the provided service |
| service.type | string | `"ClusterIP"` | service type to generate |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `true` | if enabled and create true, then create service account |
| serviceAccount.enabled | bool | `true` | enable or disable the entire service account creation and consumption |
| serviceAccount.name | string | `""` |  |
| startupProbe | string | `nil` | raw startup probe overrides for user |
| startupProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default startup probe if not specified by user |
| startupProbeEnabled | bool | `true` | enable or disable startup probe entirely |
| sts.enabled | bool | `false` |  |
| sts.updateStrategy | string | `"RollingUpdate"` |  |
| test.enabled | bool | `false` |  |
| tolerations | list | `[]` |  |
| topologySpreadConstraints | list | `[]` |  |
| volumeMounts | list | `[]` |  |
| volumes | list | `[]` |  |

# Changelog

## 0.20.0

This adds backwards compatible support for keda scaledObject and scaledJob, both disabled by default.

This also includes a slight breaking change to reduce the default maximum autoscaling to 5. Was originally 100.
We felt this was a more reasonable default.

This also adds backwards compatible behaviour for both HPA and keda.

The new default keda section is as follows:

```yaml
keda:
  # note autoscaling settings comes from the autoscaling section
  enabled: false
  kind: ScaledJob # ScaledJob or ScaledObject
  transferHpaOwnership: true
  paused: false
  # only jobs are baked into the keda resources
  # will use an existing deployment if ScaledObject
  # thus ensure deployment is enabled if using ScaledObject
  job:
    activeDeadlineSeconds: 60
    backoffLimit: 3
    ttlSecondsAfterFinished: 0
  object:
    cooldownPeriod: 300
    idleReplicaCount: 0
    failureThreshold: 1
    minReplicas: 0 # fallback number of replicas if HPA is unavailable
    pollingInterval: 30
  triggers: []
  # - type: rabbitmq
  #   metadata:
  #     protocol: amqp
  #     mode: QueueLength
  #     # -- the number of tasks to handle per pod
  #     value: "1"
  #     # -- how many tasks in queue before triggering
  #     activationValue: "1"
  #     queueName: myQueue
  #     vhostName: /
  #     unsafeSsl: "true"
  #   authenticationRef:
  #     name: my-rabbitmq-connection-secret-name
```

The adjusted default autoscaling section is as follows:

```yaml
autoscaling:
  # -- enable or disable autoscaling (settings are re-used if keda is enabled)
  enabled: false
  # -- minimum number of replicas to scale to
  minReplicas: 1
  # -- maximum number of replicas to scale to
  maxReplicas: 5 # CHANGED from 100
  # -- sets targetCPUUtilizationPercentage resource utilization of HPA
  targetCPUUtilizationPercentage: 80
  # -- HPA behavior settings (included in keda ScaledObject if enabled)
  behavior: {}
    # scaleDown:
    #   stabilizationWindowSeconds: 300
    #   policies:
    #   - type: Percent
    #     value: 80 # likely should be the same as targetCPUUtilizationPercentage
    #     periodSeconds: 15
```

## 0.19.1

This adds a flag to enable or disable the service account completely.
This is backwards compatible and does not change the default behaviour.

## 0.19.0

This adds backwards compatible job annotation support.

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

## 0.18.0

This adds backwards compatible service options, to enable disabling the service,
and add custom annotations as needed. No changes are necessary as the defaults,
match the old behaviour.

```yaml
service:
  enabled: true
  annotations: {}
  type: ClusterIP
```

## 0.17.0

This lowers the truncation of cronjob names from 63 to 52 characters.
This is because cronjobs create jobs which create pods, and at each stage it adds a suffix.
To support this I have truncated the cronjob name to 52 characters.

This just like the 63 char limit is baked in and cannot be overridden.

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

