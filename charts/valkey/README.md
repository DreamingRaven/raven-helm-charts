# valkey

A Helm chart for Kubernetes

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 8.1.1-alpine](https://img.shields.io/badge/AppVersion-8.1.1--alpine-informational?style=flat-square)

## Installing the Chart

### Install via OCI helm registry

To install the chart with the release name `valkey`, run the following commands.
For a list of all available charts and versions see the [container registry](https://gitlab.com/GeorgeRaven/raven-helm-charts/container_registry)

To pull the latest version without authentication:

```console
helm install valkey oci://registry.gitlab.com/georgeraven/raven-helm-charts/valkey
```

With authentication:

```console
helm registry login registry.gitlab.com -u <USERNAME> -p <GITLAB_TOKEN>
helm install valkey oci://registry.gitlab.com/georgeraven/raven-helm-charts/valkey --version 0.1.0
```

### Install via Helm index.yaml (deprecated method since: 2025-03-24)

To install the chart with the release name `valkey`, run the following commands:

```console
$ helm repo add raven https://gitlab.com/api/v4/projects/55284972/packages/helm/stable
$ helm repo update raven
$ helm install valkey raven/valkey
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://registry.gitlab.com/georgeraven/raven-helm-charts | valkey(corvid-app) | 0.12.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| valkey.affinity | object | `{}` |  |
| valkey.args | string | `nil` |  |
| valkey.autoscaling.enabled | bool | `false` |  |
| valkey.autoscaling.maxReplicas | int | `3` |  |
| valkey.autoscaling.minReplicas | int | `1` |  |
| valkey.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| valkey.command[0] | string | `"/bin/sh"` |  |
| valkey.command[1] | string | `"-c"` |  |
| valkey.command[2] | string | `"valkey-server --port ${PORT}\n"` |  |
| valkey.cron.backoffLimit | int | `3` |  |
| valkey.cron.concurrencyPolicy | string | `"Allow"` |  |
| valkey.cron.enabled | bool | `false` | enable or disable cronjob |
| valkey.cron.failedJobsHistoryLimit | int | `1` |  |
| valkey.cron.schedule | string | `"@midnight"` | schedule for cronjob using Cron syntax https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/#schedule-syntax |
| valkey.cron.successfulJobsHistoryLimit | int | `1` |  |
| valkey.cron.suspend | bool | `false` | cronjob will not trigger on schedule but can be manually triggered |
| valkey.daemonset.enabled | bool | `false` |  |
| valkey.deployment.enabled | bool | `true` |  |
| valkey.deployment.strategy | string | `""` | rollout strategy `Recreate` or `RollingUpdate` this chart defaults to Recreate only if we detect a single replica with a volume |
| valkey.dnsConfig | object | `{}` |  |
| valkey.dnsPolicy | string | `""` |  |
| valkey.envFrom | string | `nil` |  |
| valkey.env[0].name | string | `"PORT"` |  |
| valkey.env[0].value | string | `"6379"` |  |
| valkey.fullnameOverride | string | `""` |  |
| valkey.httpRoute.annotations | object | `{}` |  |
| valkey.httpRoute.enabled | bool | `false` |  |
| valkey.httpRoute.exposedPorts[0].number | int | `80` |  |
| valkey.httpRoute.hostnames[0] | string | `"valkey.org.example"` |  |
| valkey.httpRoute.parentRefs[0].name | string | `"my-gateway"` |  |
| valkey.image.pullPolicy | string | `"IfNotPresent"` |  |
| valkey.image.registry | string | `"ghcr.io"` |  |
| valkey.image.repository | string | `"valkey-io/valkey"` |  |
| valkey.image.tag | string | `"8.1.1-alpine"` |  |
| valkey.imagePullSecrets | list | `[]` |  |
| valkey.ingress.annotations | object | `{}` |  |
| valkey.ingress.className | string | `""` |  |
| valkey.ingress.enabled | bool | `false` |  |
| valkey.ingress.hosts[0].host | string | `"valkey.org.example"` |  |
| valkey.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| valkey.ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| valkey.ingress.tls | list | `[]` |  |
| valkey.initContainers | list | `[]` |  |
| valkey.job.enabled | bool | `false` |  |
| valkey.livenessProbe | object | `{"exec":{"command":["sh","-c","valkey-cli ping\n"]}}` | raw liveness probe overrides for user |
| valkey.livenessProbeDefault | object | `{"exec":{"command":["sh","-c","valkey-cli ping\n"]}}` | default liveness probe if not specified by user |
| valkey.livenessProbeEnabled | bool | `true` | enable or disable liveness probe entirely |
| valkey.nameOverride | string | `""` |  |
| valkey.netpol.enabled | bool | `true` |  |
| valkey.nodeSelector | object | `{}` |  |
| valkey.persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| valkey.persistence.defaultVolumeMounts[0].mountPath | string | `"/data/"` |  |
| valkey.persistence.defaultVolumeMounts[0].name | string | `"data"` |  |
| valkey.persistence.defaultVolumeMounts[0].subPath | string | `"data"` |  |
| valkey.persistence.enabled | bool | `false` |  |
| valkey.persistence.existingClaim | string | `""` |  |
| valkey.persistence.size | string | `"8Gi"` |  |
| valkey.podAnnotations | object | `{}` |  |
| valkey.podLabels | object | `{}` |  |
| valkey.podSecurityContext | object | `{}` | podSecurityContext for consumer overrides |
| valkey.podSecurityContextDefault | object | `{"fsGroup":1000}` | default podSecurityContext if none specified |
| valkey.podSecurityContextEnabled | bool | `true` | enable or disable podSecurityContext entirely |
| valkey.ports[0].appProtocol | string | `"redis"` |  |
| valkey.ports[0].containerPort | int | `6379` |  |
| valkey.ports[0].name | string | `"redis"` |  |
| valkey.ports[0].protocol | string | `"TCP"` |  |
| valkey.ports[0].servicePort | int | `6379` |  |
| valkey.readinessProbe | object | `{"exec":{"command":["sh","-c","valkey-cli ping\n"]}}` | raw readiness probe overrides for user |
| valkey.readinessProbeDefault | object | `{"exec":{"command":["sh","-c","valkey-cli ping\n"]}}` | default readiness probe if not specified by user |
| valkey.readinessProbeEnabled | bool | `true` | enable or disable readiness probe entirely |
| valkey.replicaCount | int | `1` |  |
| valkey.resources | string | `nil` | raw resources block overrides for user |
| valkey.resourcesDefault | object | `{"limits":{"memory":"128Mi"},"requests":{"cpu":"100m"}}` | default resources if not specified by user |
| valkey.resourcesEnabled | bool | `true` | enable or disable resources entirely |
| valkey.restartPolicy | string | `"Always"` |  |
| valkey.runtimeClassName | string | `nil` |  |
| valkey.secrets | list | `[]` |  |
| valkey.securityContext | object | `{}` | securityContext for consumer overrides |
| valkey.securityContextDefault | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}` | default securityContext if none specified |
| valkey.securityContextEnabled | bool | `true` | enable or disable securityContext entirely |
| valkey.service.type | string | `"ClusterIP"` |  |
| valkey.serviceAccount.annotations | object | `{}` |  |
| valkey.serviceAccount.automount | bool | `true` |  |
| valkey.serviceAccount.create | bool | `true` |  |
| valkey.serviceAccount.name | string | `""` |  |
| valkey.startupProbe | object | `{"exec":{"command":["sh","-c","valkey-cli ping\n"]}}` | raw startup probe overrides for user |
| valkey.startupProbeDefault | object | `{"exec":{"command":["sh","-c","valkey-cli ping\n"]}}` | default startup probe if not specified by user |
| valkey.startupProbeEnabled | bool | `true` | enable or disable startup probe entirely |
| valkey.tolerations | list | `[]` |  |
| valkey.topologySpreadConstraints | list | `[]` |  |
| valkey.volumeMounts | list | `[]` |  |
| valkey.volumes | list | `[]` |  |

