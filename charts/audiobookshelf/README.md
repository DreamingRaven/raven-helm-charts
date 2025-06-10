# audiobookshelf

Self-hosted audiobook and podcast server

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v2.24.0](https://img.shields.io/badge/AppVersion-v2.24.0-informational?style=flat-square)

## Installing the Chart

### Install via OCI helm registry

To install the chart with the release name `audiobookshelf`, run the following commands.
For a list of all available charts and versions see the [container registry](https://gitlab.com/GeorgeRaven/raven-helm-charts/container_registry)

To pull the latest version without authentication:

```console
helm install audiobookshelf oci://registry.gitlab.com/georgeraven/raven-helm-charts/audiobookshelf
```

With authentication:

```console
helm registry login registry.gitlab.com -u <USERNAME> -p <GITLAB_TOKEN>
helm install audiobookshelf oci://registry.gitlab.com/georgeraven/raven-helm-charts/audiobookshelf --version 0.1.0
```

### Install via Helm index.yaml (deprecated method since: 2025-03-24)

To install the chart with the release name `audiobookshelf`, run the following commands:

```console
$ helm repo add raven https://gitlab.com/api/v4/projects/55284972/packages/helm/stable
$ helm repo update raven
$ helm install audiobookshelf raven/audiobookshelf
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://registry.gitlab.com/georgeraven/raven-helm-charts | audiobookshelf(corvid-app) | 0.11.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| audiobookshelf.affinity | object | `{}` |  |
| audiobookshelf.args | string | `nil` |  |
| audiobookshelf.autoscaling.enabled | bool | `false` |  |
| audiobookshelf.autoscaling.maxReplicas | int | `100` |  |
| audiobookshelf.autoscaling.minReplicas | int | `1` |  |
| audiobookshelf.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| audiobookshelf.command | string | `nil` |  |
| audiobookshelf.cron.backoffLimit | int | `3` |  |
| audiobookshelf.cron.concurrencyPolicy | string | `"Allow"` |  |
| audiobookshelf.cron.enabled | bool | `false` | enable or disable cronjob |
| audiobookshelf.cron.failedJobsHistoryLimit | int | `1` |  |
| audiobookshelf.cron.schedule | string | `"@midnight"` | schedule for cronjob using Cron syntax https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/#schedule-syntax |
| audiobookshelf.cron.successfulJobsHistoryLimit | int | `1` |  |
| audiobookshelf.cron.suspend | bool | `false` | cronjob will not trigger on schedule but can be manually triggered |
| audiobookshelf.daemonset.enabled | bool | `false` |  |
| audiobookshelf.deployment.enabled | bool | `true` |  |
| audiobookshelf.deployment.strategy | string | `""` | rollout strategy `Recreate` or `RollingUpdate` this chart defaults to Recreate only if we detect a single replica with a volume |
| audiobookshelf.dnsConfig | object | `{}` |  |
| audiobookshelf.dnsPolicy | string | `""` |  |
| audiobookshelf.envFrom | string | `nil` |  |
| audiobookshelf.env[0].name | string | `"PORT"` |  |
| audiobookshelf.env[0].value | string | `"8080"` |  |
| audiobookshelf.fullnameOverride | string | `""` |  |
| audiobookshelf.image.pullPolicy | string | `"IfNotPresent"` |  |
| audiobookshelf.image.registry | string | `"ghcr.io"` |  |
| audiobookshelf.image.repository | string | `"advplyr/audiobookshelf"` |  |
| audiobookshelf.image.tag | string | `"2.24.0"` |  |
| audiobookshelf.imagePullSecrets | list | `[]` |  |
| audiobookshelf.ingress.annotations | object | `{}` |  |
| audiobookshelf.ingress.className | string | `""` |  |
| audiobookshelf.ingress.enabled | bool | `false` |  |
| audiobookshelf.ingress.hosts[0].host | string | `"audiobookshelf.org.example"` |  |
| audiobookshelf.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| audiobookshelf.ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| audiobookshelf.ingress.tls | list | `[]` |  |
| audiobookshelf.initContainers | list | `[]` |  |
| audiobookshelf.job.enabled | bool | `false` |  |
| audiobookshelf.livenessProbe | string | `nil` | raw liveness probe overrides for user |
| audiobookshelf.livenessProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default liveness probe if not specified by user |
| audiobookshelf.livenessProbeEnabled | bool | `true` | enable or disable liveness probe entirely |
| audiobookshelf.nameOverride | string | `""` |  |
| audiobookshelf.netpol.enabled | bool | `true` |  |
| audiobookshelf.nodeSelector | object | `{}` |  |
| audiobookshelf.persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| audiobookshelf.persistence.defaultVolumeMounts[0].mountPath | string | `"/metadata/"` |  |
| audiobookshelf.persistence.defaultVolumeMounts[0].name | string | `"data"` |  |
| audiobookshelf.persistence.defaultVolumeMounts[0].subPath | string | `"metadata"` |  |
| audiobookshelf.persistence.defaultVolumeMounts[1].mountPath | string | `"/config/"` |  |
| audiobookshelf.persistence.defaultVolumeMounts[1].name | string | `"data"` |  |
| audiobookshelf.persistence.defaultVolumeMounts[1].subPath | string | `"config"` |  |
| audiobookshelf.persistence.defaultVolumeMounts[2].mountPath | string | `"/media/"` |  |
| audiobookshelf.persistence.defaultVolumeMounts[2].name | string | `"data"` |  |
| audiobookshelf.persistence.defaultVolumeMounts[2].subPath | string | `"media"` |  |
| audiobookshelf.persistence.enabled | bool | `true` |  |
| audiobookshelf.persistence.existingClaim | string | `""` |  |
| audiobookshelf.persistence.size | string | `"8Gi"` |  |
| audiobookshelf.podAnnotations | object | `{}` |  |
| audiobookshelf.podLabels | object | `{}` |  |
| audiobookshelf.podSecurityContext | object | `{}` | podSecurityContext for consumer overrides |
| audiobookshelf.podSecurityContextDefault | object | `{"fsGroup":1000}` | default podSecurityContext if none specified |
| audiobookshelf.podSecurityContextEnabled | bool | `true` | enable or disable podSecurityContext entirely |
| audiobookshelf.ports[0].appProtocol | string | `"http"` |  |
| audiobookshelf.ports[0].containerPort | int | `8080` |  |
| audiobookshelf.ports[0].name | string | `"http"` |  |
| audiobookshelf.ports[0].protocol | string | `"TCP"` |  |
| audiobookshelf.ports[0].servicePort | int | `80` |  |
| audiobookshelf.readinessProbe | string | `nil` | raw readiness probe overrides for user |
| audiobookshelf.readinessProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default readiness probe if not specified by user |
| audiobookshelf.readinessProbeEnabled | bool | `true` | enable or disable readiness probe entirely |
| audiobookshelf.replicaCount | int | `1` |  |
| audiobookshelf.resources | string | `nil` | raw resources block overrides for user |
| audiobookshelf.resourcesDefault | object | `{"limits":{"memory":"128Mi"},"requests":{"cpu":"100m"}}` | default resources if not specified by user |
| audiobookshelf.resourcesEnabled | bool | `true` | enable or disable resources entirely |
| audiobookshelf.restartPolicy | string | `"Always"` |  |
| audiobookshelf.runtimeClassName | string | `nil` |  |
| audiobookshelf.secrets | list | `[]` |  |
| audiobookshelf.securityContext | object | `{}` | securityContext for consumer overrides |
| audiobookshelf.securityContextDefault | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}` | default securityContext if none specified |
| audiobookshelf.securityContextEnabled | bool | `true` | enable or disable securityContext entirely |
| audiobookshelf.service.type | string | `"ClusterIP"` |  |
| audiobookshelf.serviceAccount.annotations | object | `{}` |  |
| audiobookshelf.serviceAccount.automount | bool | `true` |  |
| audiobookshelf.serviceAccount.create | bool | `true` |  |
| audiobookshelf.serviceAccount.name | string | `""` |  |
| audiobookshelf.startupProbe | string | `nil` | raw startup probe overrides for user |
| audiobookshelf.startupProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default startup probe if not specified by user |
| audiobookshelf.startupProbeEnabled | bool | `true` | enable or disable startup probe entirely |
| audiobookshelf.tolerations | list | `[]` |  |
| audiobookshelf.topologySpreadConstraints | list | `[]` |  |
| audiobookshelf.volumeMounts | list | `[]` |  |
| audiobookshelf.volumes[0].emptyDir | object | `{}` |  |
| audiobookshelf.volumes[0].name | string | `"static"` |  |

