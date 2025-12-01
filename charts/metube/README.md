# metube

A Helm chart for Kubernetes

![Version: 0.4.0](https://img.shields.io/badge/Version-0.4.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2025.11.29](https://img.shields.io/badge/AppVersion-2025.11.29-informational?style=flat-square)

## Installing the Chart

### Install via OCI helm registry

To install the chart with the release name `metube`, run the following commands.
For a list of all available charts and versions see the [container registry](https://gitlab.com/GeorgeRaven/raven-helm-charts/container_registry)

To pull the latest version without authentication:

```console
helm install metube oci://registry.gitlab.com/georgeraven/raven-helm-charts/metube
```

With authentication:

```console
helm registry login registry.gitlab.com -u <USERNAME> -p <GITLAB_TOKEN>
helm install metube oci://registry.gitlab.com/georgeraven/raven-helm-charts/metube --version 0.4.0
```

### As a helm dependency

You can also opt to directly reference this chart as a helm dependency defined in your `Chart.yaml`:

```yaml
dependencies:
- name: metube
  version: 0.4.0
  repository: "oci://registry.gitlab.com/georgeraven/raven-helm-charts"
  # alias: <THE_NAME_YOU_WANT_TO_GIVE_THE_CHART> # optional for more advanced use-cases
  # condition: metube.enabled # optional for more advanced use-cases
```

Then you should pull the chart with the following command:

```console
helm dependency update <PATH_TO_YOUR_CHART_DIR>
```

Which should automatically fetch the chart, update your lockfile, etc.

### Install via Helm index.yaml (deprecated method since: 2025-03-24)

To install the chart with the release name `metube`, run the following commands:

```console
$ helm repo add raven https://gitlab.com/api/v4/projects/55284972/packages/helm/stable
$ helm repo update raven
$ helm install metube raven/metube
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://registry.gitlab.com/georgeraven/raven-helm-charts | metube(corvid-app) | 0.17.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| metube.affinity | object | `{}` |  |
| metube.args | string | `nil` |  |
| metube.autoscaling.behavior | object | `{}` | HPA behavior settings (included in keda ScaledObject if enabled) |
| metube.autoscaling.enabled | bool | `false` | enable or disable autoscaling with a standalone HPA (settings are re-used if keda is enabled) |
| metube.autoscaling.maxReplicas | int | `5` | maximum number of replicas to scale to |
| metube.autoscaling.minReplicas | int | `1` | minimum number of replicas to scale to |
| metube.autoscaling.targetCPUUtilizationPercentage | int | `80` | sets targetCPUUtilizationPercentage resource utilization of HPA |
| metube.command | string | `nil` |  |
| metube.cron.backoffLimit | int | `3` |  |
| metube.cron.concurrencyPolicy | string | `"Allow"` |  |
| metube.cron.enabled | bool | `false` | enable or disable cronjob |
| metube.cron.failedJobsHistoryLimit | int | `1` |  |
| metube.cron.schedule | string | `"@midnight"` | schedule for cronjob using Cron syntax https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/#schedule-syntax |
| metube.cron.successfulJobsHistoryLimit | int | `1` |  |
| metube.cron.suspend | bool | `false` | cronjob will not trigger on schedule but can be manually triggered |
| metube.daemonset.enabled | bool | `false` |  |
| metube.deployment.enabled | bool | `true` |  |
| metube.deployment.strategy | string | `""` | rollout strategy `Recreate` or `RollingUpdate` this chart defaults to Recreate only if we detect a single replica with a volume |
| metube.dnsConfig | object | `{}` |  |
| metube.dnsPolicy | string | `""` |  |
| metube.enabled | bool | `true` |  |
| metube.envFrom | string | `nil` |  |
| metube.env[0].name | string | `"DOWNLOAD_MODE"` |  |
| metube.env[0].value | string | `"limited"` |  |
| metube.env[10].name | string | `"ENABLE_ACCESSLOG"` |  |
| metube.env[10].value | string | `"true"` |  |
| metube.env[11].name | string | `"DEFAULT_THEME"` |  |
| metube.env[11].value | string | `"dark"` |  |
| metube.env[1].name | string | `"MAX_CONCURRENT_DOWNLOADS"` |  |
| metube.env[1].value | string | `"3"` |  |
| metube.env[2].name | string | `"DELETE_FILE_ON_TRASHCAN"` |  |
| metube.env[2].value | string | `"true"` |  |
| metube.env[3].name | string | `"DEFAULT_OPTION_PLAYLIST_STRICT_MODE"` |  |
| metube.env[3].value | string | `"true"` |  |
| metube.env[4].name | string | `"DOWNLOAD_DIR"` |  |
| metube.env[4].value | string | `"/data/downloads"` |  |
| metube.env[5].name | string | `"CREATE_CUSTOM_DIRS"` |  |
| metube.env[5].value | string | `"true"` |  |
| metube.env[6].name | string | `"STATE_DIR"` |  |
| metube.env[6].value | string | `"/data/.metube"` |  |
| metube.env[7].name | string | `"TEMP_DIR"` |  |
| metube.env[7].value | string | `"/data/tmp"` |  |
| metube.env[8].name | string | `"HTTPS"` |  |
| metube.env[8].value | string | `"false"` |  |
| metube.env[9].name | string | `"URL_PREFIX"` |  |
| metube.env[9].value | string | `"/"` |  |
| metube.fullnameOverride | string | `""` |  |
| metube.httpRoute.annotations | object | `{}` |  |
| metube.httpRoute.enabled | bool | `false` |  |
| metube.httpRoute.exposedPorts[0].number | int | `80` |  |
| metube.httpRoute.hostnames[0] | string | `"corvid-app.org.example"` |  |
| metube.httpRoute.parentRefs[0].name | string | `"my-gateway"` |  |
| metube.image.pullPolicy | string | `"IfNotPresent"` |  |
| metube.image.registry | string | `"ghcr.io"` |  |
| metube.image.repository | string | `"alexta69/metube"` |  |
| metube.image.tag | string | `"2025.11.29"` |  |
| metube.imagePullSecrets | list | `[]` |  |
| metube.ingress.annotations | object | `{}` |  |
| metube.ingress.className | string | `""` |  |
| metube.ingress.enabled | bool | `false` |  |
| metube.ingress.hosts[0].host | string | `"corvid-app.org.example"` |  |
| metube.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| metube.ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| metube.ingress.tls | list | `[]` |  |
| metube.initContainers | list | `[]` |  |
| metube.job.annotations | object | `{}` | annotations to add to the job e.g for helm hooks |
| metube.job.enabled | bool | `false` |  |
| metube.keda.enabled | bool | `false` |  |
| metube.keda.job.activeDeadlineSeconds | int | `60` |  |
| metube.keda.job.backoffLimit | int | `3` |  |
| metube.keda.job.scalingStrategy | object | `{}` |  |
| metube.keda.job.ttlSecondsAfterFinished | int | `0` |  |
| metube.keda.kind | string | `"ScaledJob"` |  |
| metube.keda.object.cooldownPeriod | int | `300` |  |
| metube.keda.object.failureThreshold | int | `1` |  |
| metube.keda.object.idleReplicaCount | int | `0` |  |
| metube.keda.object.minReplicas | int | `0` |  |
| metube.keda.object.pollingInterval | int | `30` |  |
| metube.keda.paused | bool | `false` |  |
| metube.keda.transferHpaOwnership | bool | `true` |  |
| metube.keda.triggers | list | `[]` |  |
| metube.livenessProbe | string | `nil` | raw liveness probe overrides for user |
| metube.livenessProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default liveness probe if not specified by user |
| metube.livenessProbeEnabled | bool | `true` | enable or disable liveness probe entirely |
| metube.nameOverride | string | `""` |  |
| metube.netpol.enabled | bool | `true` |  |
| metube.nodeSelector | object | `{}` |  |
| metube.persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| metube.persistence.defaultVolumeMounts[0].mountPath | string | `"/data/"` |  |
| metube.persistence.defaultVolumeMounts[0].name | string | `"data"` |  |
| metube.persistence.defaultVolumeMounts[0].subPath | string | `"data"` |  |
| metube.persistence.enabled | bool | `true` |  |
| metube.persistence.existingClaim | string | `""` |  |
| metube.persistence.size | string | `"8Gi"` |  |
| metube.podAnnotations | object | `{}` |  |
| metube.podLabels | object | `{}` |  |
| metube.podSecurityContext | object | `{}` | podSecurityContext for consumer overrides |
| metube.podSecurityContextDefault | object | `{"fsGroup":1000}` | default podSecurityContext if none specified |
| metube.podSecurityContextEnabled | bool | `true` | enable or disable podSecurityContext entirely |
| metube.ports[0].appProtocol | string | `"http"` |  |
| metube.ports[0].containerPort | int | `8081` |  |
| metube.ports[0].name | string | `"http"` |  |
| metube.ports[0].protocol | string | `"TCP"` |  |
| metube.ports[0].servicePort | int | `80` |  |
| metube.readinessProbe | string | `nil` | raw readiness probe overrides for user |
| metube.readinessProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default readiness probe if not specified by user |
| metube.readinessProbeEnabled | bool | `true` | enable or disable readiness probe entirely |
| metube.replicaCount | int | `1` |  |
| metube.resources | string | `nil` | raw resources block overrides for user |
| metube.resourcesDefault | object | `{"limits":{"memory":"128Mi"},"requests":{"cpu":"100m"}}` | default resources if not specified by user |
| metube.resourcesEnabled | bool | `true` | enable or disable resources entirely |
| metube.restartPolicy | string | `"Always"` |  |
| metube.runtimeClassName | string | `nil` |  |
| metube.secrets | list | `[]` |  |
| metube.securityContext | object | `{}` | securityContext for consumer overrides |
| metube.securityContextDefault | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}` | default securityContext if none specified |
| metube.securityContextEnabled | bool | `true` | enable or disable securityContext entirely |
| metube.service.annotations | object | `{}` | additional service annotations to add |
| metube.service.enabled | bool | `true` | enable or disable the provided service |
| metube.service.type | string | `"ClusterIP"` | service type to generate |
| metube.serviceAccount.annotations | object | `{}` |  |
| metube.serviceAccount.automount | bool | `true` |  |
| metube.serviceAccount.create | bool | `true` | if enabled and create true, then create service account |
| metube.serviceAccount.enabled | bool | `true` | enable or disable the entire service account creation and consumption |
| metube.serviceAccount.name | string | `""` |  |
| metube.startupProbe | string | `nil` | raw startup probe overrides for user |
| metube.startupProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default startup probe if not specified by user |
| metube.startupProbeEnabled | bool | `true` | enable or disable startup probe entirely |
| metube.sts.enabled | bool | `false` |  |
| metube.sts.updateStrategy | string | `"RollingUpdate"` |  |
| metube.test.enabled | bool | `false` |  |
| metube.tolerations | list | `[]` |  |
| metube.topologySpreadConstraints | list | `[]` |  |
| metube.volumeMounts | list | `[]` |  |
| metube.volumes | list | `[]` |  |

# Changelog

## 0.2.0 Complete Overhaul

This release overhauls metube, and brings it out of deprication.
This now is a completely corvid-app-ised version of metube.

