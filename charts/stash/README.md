# stash

A Helm chart for Kubernetes

![Version: 0.1.1](https://img.shields.io/badge/Version-0.1.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

## Installing the Chart

### Install via OCI helm registry

To install the chart with the release name `stash`, run the following commands.
For a list of all available charts and versions see the [container registry](https://gitlab.com/GeorgeRaven/raven-helm-charts/container_registry)

To pull the latest version without authentication:

```console
helm install stash oci://registry.gitlab.com/georgeraven/raven-helm-charts/stash
```

With authentication:

```console
helm registry login registry.gitlab.com -u <USERNAME> -p <GITLAB_TOKEN>
helm install stash oci://registry.gitlab.com/georgeraven/raven-helm-charts/stash --version 0.1.1
```

### As a helm dependency

You can also opt to directly reference this chart as a helm dependency defined in your `Chart.yaml`:

```yaml
dependencies:
- name: stash
  version: 0.1.1
  repository: "oci://registry.gitlab.com/georgeraven/raven-helm-charts"
  # alias: <THE_NAME_YOU_WANT_TO_GIVE_THE_CHART> # optional for more advanced use-cases
  # condition: stash.enabled # optional for more advanced use-cases
```

Then you should pull the chart with the following command:

```console
helm dependency update <PATH_TO_YOUR_CHART_DIR>
```

Which should automatically fetch the chart, update your lockfile, etc.

### Install via Helm index.yaml (deprecated method since: 2025-03-24)

To install the chart with the release name `stash`, run the following commands:

```console
$ helm repo add raven https://gitlab.com/api/v4/projects/55284972/packages/helm/stable
$ helm repo update raven
$ helm install stash raven/stash
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://registry.gitlab.com/georgeraven/raven-helm-charts | stash(corvid-app) | 0.17.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| stash.affinity | object | `{}` |  |
| stash.args[0] | string | `"stash --nobrowser --config ${STASH_CONFIG}\n"` |  |
| stash.autoscaling.behavior | object | `{}` | HPA behavior settings (included in keda ScaledObject if enabled) |
| stash.autoscaling.enabled | bool | `false` | enable or disable autoscaling with a standalone HPA (settings are re-used if keda is enabled) |
| stash.autoscaling.maxReplicas | int | `5` | maximum number of replicas to scale to |
| stash.autoscaling.minReplicas | int | `1` | minimum number of replicas to scale to |
| stash.autoscaling.targetCPUUtilizationPercentage | int | `80` | sets targetCPUUtilizationPercentage resource utilization of HPA |
| stash.command[0] | string | `"/bin/sh"` |  |
| stash.command[1] | string | `"-c"` |  |
| stash.cron.backoffLimit | int | `3` |  |
| stash.cron.concurrencyPolicy | string | `"Allow"` |  |
| stash.cron.enabled | bool | `false` | enable or disable cronjob |
| stash.cron.failedJobsHistoryLimit | int | `1` |  |
| stash.cron.schedule | string | `"@midnight"` | schedule for cronjob using Cron syntax https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/#schedule-syntax |
| stash.cron.successfulJobsHistoryLimit | int | `1` |  |
| stash.cron.suspend | bool | `false` | cronjob will not trigger on schedule but can be manually triggered |
| stash.daemonset.enabled | bool | `false` |  |
| stash.deployment.enabled | bool | `true` |  |
| stash.deployment.strategy | string | `""` | rollout strategy `Recreate` or `RollingUpdate` this chart defaults to Recreate only if we detect a single replica with a volume |
| stash.dnsConfig | object | `{}` |  |
| stash.dnsPolicy | string | `""` |  |
| stash.envFrom | string | `nil` |  |
| stash.env[0].name | string | `"STASH_STASH"` |  |
| stash.env[0].value | string | `"/data"` |  |
| stash.env[1].name | string | `"STASH_GENERATED"` |  |
| stash.env[1].value | string | `"/generated"` |  |
| stash.env[2].name | string | `"STASH_CACHE"` |  |
| stash.env[2].value | string | `"/cache"` |  |
| stash.env[3].name | string | `"STASH_METADATA"` |  |
| stash.env[3].value | string | `"/metadata"` |  |
| stash.env[4].name | string | `"STASH_BLOBS"` |  |
| stash.env[4].value | string | `"/blobs"` |  |
| stash.env[5].name | string | `"STASH_CONFIG"` |  |
| stash.env[5].value | string | `"/config/config.yaml"` |  |
| stash.env[6].name | string | `"STASH_PORT"` |  |
| stash.env[6].value | string | `"9999"` |  |
| stash.env[7].name | string | `"USER"` |  |
| stash.env[7].value | string | `"1000"` |  |
| stash.env[8].name | string | `"GROUP"` |  |
| stash.env[8].value | string | `"1000"` |  |
| stash.fullnameOverride | string | `""` |  |
| stash.httpRoute.annotations | object | `{}` |  |
| stash.httpRoute.enabled | bool | `false` |  |
| stash.httpRoute.exposedPorts[0].number | int | `80` |  |
| stash.httpRoute.hostnames[0] | string | `"stash.org.example"` |  |
| stash.httpRoute.parentRefs[0].name | string | `"my-gateway"` |  |
| stash.image.pullPolicy | string | `"IfNotPresent"` |  |
| stash.image.registry | string | `"docker.io"` |  |
| stash.image.repository | string | `"stashapp/stash"` |  |
| stash.image.tag | string | `"v0.30.1"` |  |
| stash.imagePullSecrets | list | `[]` |  |
| stash.ingress.annotations | object | `{}` |  |
| stash.ingress.className | string | `""` |  |
| stash.ingress.enabled | bool | `false` |  |
| stash.ingress.hosts[0].host | string | `"stash.org.example"` |  |
| stash.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| stash.ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| stash.ingress.tls | list | `[]` |  |
| stash.initContainers | list | `[]` |  |
| stash.job.annotations | object | `{}` | annotations to add to the job e.g for helm hooks |
| stash.job.enabled | bool | `false` |  |
| stash.keda.enabled | bool | `false` |  |
| stash.keda.job.activeDeadlineSeconds | int | `60` |  |
| stash.keda.job.backoffLimit | int | `3` |  |
| stash.keda.job.scalingStrategy | object | `{}` |  |
| stash.keda.job.ttlSecondsAfterFinished | int | `0` |  |
| stash.keda.kind | string | `"ScaledJob"` |  |
| stash.keda.object.cooldownPeriod | int | `300` |  |
| stash.keda.object.failureThreshold | int | `1` |  |
| stash.keda.object.idleReplicaCount | int | `0` |  |
| stash.keda.object.minReplicas | int | `0` |  |
| stash.keda.object.pollingInterval | int | `30` |  |
| stash.keda.paused | bool | `false` |  |
| stash.keda.transferHpaOwnership | bool | `true` |  |
| stash.keda.triggers | list | `[]` |  |
| stash.livenessProbe | string | `nil` | raw liveness probe overrides for user |
| stash.livenessProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default liveness probe if not specified by user |
| stash.livenessProbeEnabled | bool | `true` | enable or disable liveness probe entirely |
| stash.nameOverride | string | `""` |  |
| stash.netpol.enabled | bool | `true` |  |
| stash.nodeSelector | object | `{}` |  |
| stash.persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| stash.persistence.defaultVolumeMounts[0].mountPath | string | `"/data/"` |  |
| stash.persistence.defaultVolumeMounts[0].name | string | `"data"` |  |
| stash.persistence.defaultVolumeMounts[0].subPath | string | `"data"` |  |
| stash.persistence.defaultVolumeMounts[1].mountPath | string | `"/metadata/"` |  |
| stash.persistence.defaultVolumeMounts[1].name | string | `"data"` |  |
| stash.persistence.defaultVolumeMounts[1].subPath | string | `"metadata"` |  |
| stash.persistence.defaultVolumeMounts[2].mountPath | string | `"/cache/"` |  |
| stash.persistence.defaultVolumeMounts[2].name | string | `"data"` |  |
| stash.persistence.defaultVolumeMounts[2].subPath | string | `"cache"` |  |
| stash.persistence.defaultVolumeMounts[3].mountPath | string | `"/blobs/"` |  |
| stash.persistence.defaultVolumeMounts[3].name | string | `"data"` |  |
| stash.persistence.defaultVolumeMounts[3].subPath | string | `"blobs"` |  |
| stash.persistence.defaultVolumeMounts[4].mountPath | string | `"/generated/"` |  |
| stash.persistence.defaultVolumeMounts[4].name | string | `"data"` |  |
| stash.persistence.defaultVolumeMounts[4].subPath | string | `"generated"` |  |
| stash.persistence.defaultVolumeMounts[5].mountPath | string | `"/config/"` |  |
| stash.persistence.defaultVolumeMounts[5].name | string | `"data"` |  |
| stash.persistence.defaultVolumeMounts[5].subPath | string | `"config"` |  |
| stash.persistence.enabled | bool | `true` |  |
| stash.persistence.existingClaim | string | `""` |  |
| stash.persistence.size | string | `"8Gi"` |  |
| stash.podAnnotations | object | `{}` |  |
| stash.podLabels | object | `{}` |  |
| stash.podSecurityContext | object | `{}` | podSecurityContext for consumer overrides |
| stash.podSecurityContextDefault | object | `{"fsGroup":1000}` | default podSecurityContext if none specified |
| stash.podSecurityContextEnabled | bool | `true` | enable or disable podSecurityContext entirely |
| stash.ports[0].appProtocol | string | `"http"` |  |
| stash.ports[0].containerPort | int | `9999` |  |
| stash.ports[0].name | string | `"http"` |  |
| stash.ports[0].protocol | string | `"TCP"` |  |
| stash.ports[0].servicePort | int | `80` |  |
| stash.readinessProbe | string | `nil` | raw readiness probe overrides for user |
| stash.readinessProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default readiness probe if not specified by user |
| stash.readinessProbeEnabled | bool | `true` | enable or disable readiness probe entirely |
| stash.replicaCount | int | `1` |  |
| stash.resources | string | `nil` | raw resources block overrides for user |
| stash.resourcesDefault | object | `{"limits":{"memory":"128Mi"},"requests":{"cpu":"100m"}}` | default resources if not specified by user |
| stash.resourcesEnabled | bool | `true` | enable or disable resources entirely |
| stash.restartPolicy | string | `"Always"` |  |
| stash.runtimeClassName | string | `nil` |  |
| stash.secrets | list | `[]` |  |
| stash.securityContext | object | `{}` | securityContext for consumer overrides |
| stash.securityContextDefault | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}` | default securityContext if none specified |
| stash.securityContextEnabled | bool | `true` | enable or disable securityContext entirely |
| stash.service.annotations | object | `{}` | additional service annotations to add |
| stash.service.enabled | bool | `true` | enable or disable the provided service |
| stash.service.type | string | `"ClusterIP"` | service type to generate |
| stash.serviceAccount.annotations | object | `{}` |  |
| stash.serviceAccount.automount | bool | `true` |  |
| stash.serviceAccount.create | bool | `true` | if enabled and create true, then create service account |
| stash.serviceAccount.enabled | bool | `true` | enable or disable the entire service account creation and consumption |
| stash.serviceAccount.name | string | `""` |  |
| stash.startupProbe | string | `nil` | raw startup probe overrides for user |
| stash.startupProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default startup probe if not specified by user |
| stash.startupProbeEnabled | bool | `true` | enable or disable startup probe entirely |
| stash.sts.enabled | bool | `false` |  |
| stash.sts.updateStrategy | string | `"RollingUpdate"` |  |
| stash.test.enabled | bool | `false` |  |
| stash.tolerations | list | `[]` |  |
| stash.topologySpreadConstraints | list | `[]` |  |
| stash.volumeMounts | list | `[]` |  |
| stash.volumes | list | `[]` |  |

# Changelog

## 0.1.1 (corvid-app 0.17.0)

Minor bug fixes to ensure volumes are correctly mounting to the container, to enable initial setup to complete successfully.

## 0.1.0 (corvid-app 0.17.0)

Initial release.

