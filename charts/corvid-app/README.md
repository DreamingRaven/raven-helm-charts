# corvid-app

A Helm chart for Kubernetes

![Version: 0.17.0](https://img.shields.io/badge/Version-0.17.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

This chart acts as an application abstraction layer so that the corvid library can be dropped in and used, even without the boilerplate templates!

You can use this chart to create an arbitrary number of applications even in one helm chart by clever exploitation of helm aliases.

Consider the following `Chart.yaml` dependencies section

```yaml
dependencies:
- alias: api
  condition: api.enabled
  name: corvid-app
  version: 0.16.0 # change to be latest corvid-app version
  repository: "oci://registry.gitlab.com/georgeraven/raven-helm-charts"
- alias: web
  condition: web.enabled
  name: corvid-app
  version: 0.16.0 # change to be latest corvid-app version
  repository: "oci://registry.gitlab.com/georgeraven/raven-helm-charts"
```

Using the alias function we can rename corvid-app to suit whatever app name we want it to become.
We can then override settings in values.yaml using the aliases name:

```yaml
api: # must match Chart.yaml alias
  image:
    registry: registry.example.org
    repository: foo/someapi
    tag: ""
  deployment:
    enabled: true # specifically enable from a plethora of deployment options
  service:
    enabled: true
  ingress:
    enabled: true

web: # must match Chart.yaml alias
  image:
    registry: registry.example.org
    repository: foo/somefrontend
    tag: ""
  deployment:
    enabled: true
  service:
    enabled: true
  ingress:
    enabled: true
```

Now we have a chart with no templates, creating very different applications with only `values.yaml` and `Chart.yaml`. This can be a very quick way to prototype a new application.
Thus this can expedite the development process, as long as all you need fits in the confines of what is configurable in a corvid-app. Otherwise you will still prefer to use corvid directly for the possibility to override functionality to any desired level. You may find you start with a corvid-app, but then as your needs expand and you can warrant more time investment you will likely progress to creating your own corvid-app implementation for your specific needs using the corvid library directly just as the corvid-app does.

## Installing the Chart

### Install via OCI helm registry

To install the chart with the release name `corvid-app`, run the following commands.
For a list of all available charts and versions see the [container registry](https://gitlab.com/GeorgeRaven/raven-helm-charts/container_registry)

To pull the latest version without authentication:

```console
helm install corvid-app oci://registry.gitlab.com/georgeraven/raven-helm-charts/corvid-app
```

With authentication:

```console
helm registry login registry.gitlab.com -u <USERNAME> -p <GITLAB_TOKEN>
helm install corvid-app oci://registry.gitlab.com/georgeraven/raven-helm-charts/corvid-app --version 0.17.0
```

### As a helm dependency

You can also opt to directly reference this chart as a helm dependency defined in your `Chart.yaml`:

```yaml
dependencies:
- name: corvid-app
  version: 0.17.0
  repository: "oci://registry.gitlab.com/georgeraven/raven-helm-charts"
  # alias: <THE_NAME_YOU_WANT_TO_GIVE_THE_CHART> # optional for more advanced use-cases
  # condition: corvid-app.enabled # optional for more advanced use-cases
```

Then you should pull the chart with the following command:

```console
helm dependency update <PATH_TO_YOUR_CHART_DIR>
```

Which should automatically fetch the chart, update your lockfile, etc.

### Install via Helm index.yaml (deprecated method since: 2025-03-24)

To install the chart with the release name `corvid-app`, run the following commands:

```console
$ helm repo add raven https://gitlab.com/api/v4/projects/55284972/packages/helm/stable
$ helm repo update raven
$ helm install corvid-app raven/corvid-app
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../corvid | corvid | 0.21.0 |

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
| env[0].name | string | `"corvid-app_EXAMPLE_VARIABLE"` |  |
| env[0].value | string | `"false"` |  |
| fullnameOverride | string | `""` |  |
| httpRoute.annotations | object | `{}` |  |
| httpRoute.enabled | bool | `false` |  |
| httpRoute.exposedPorts[0].number | int | `80` |  |
| httpRoute.hostnames[0] | string | `"corvid-app.org.example"` |  |
| httpRoute.parentRefs[0].name | string | `"my-gateway"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"library/alpine"` |  |
| image.tag | string | `"3.22.0"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"corvid-app.org.example"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| initContainers | list | `[]` |  |
| job.annotations | object | `{}` | annotations to add to the job e.g for helm hooks |
| job.enabled | bool | `false` |  |
| keda.enabled | bool | `false` |  |
| keda.job.activeDeadlineSeconds | int | `60` |  |
| keda.job.backoffLimit | int | `3` |  |
| keda.job.scalingStrategy | object | `{}` |  |
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

## 0.18.0 (corvid 0.21.0)

This adds backwards compatible keda scaledJob scalingStrategy support.

The defaults are empty and will do nothing unless overridden.

```yaml
keda:
  job:
    scalingStrategy: {}
      # strategy: custom
```

## 0.17.0 (corvid 0.20.0)

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

