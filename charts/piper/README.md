# piper

A Helm chart for Kubernetes

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.4.0](https://img.shields.io/badge/AppVersion-1.4.0-informational?style=flat-square)

## Installing the Chart

### Install via OCI helm registry

To install the chart with the release name `piper`, run the following commands.
For a list of all available charts and versions see the [container registry](https://gitlab.com/GeorgeRaven/raven-helm-charts/container_registry)

To pull the latest version without authentication:

```console
helm install piper oci://registry.gitlab.com/georgeraven/raven-helm-charts/piper
```

With authentication:

```console
helm registry login registry.gitlab.com -u <USERNAME> -p <GITLAB_TOKEN>
helm install piper oci://registry.gitlab.com/georgeraven/raven-helm-charts/piper --version 0.1.0
```

### Install via Helm index.yaml (deprecated method since: 2025-03-24)

To install the chart with the release name `piper`, run the following commands:

```console
$ helm repo add raven https://gitlab.com/api/v4/projects/55284972/packages/helm/stable
$ helm repo update raven
$ helm install piper raven/piper
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://registry.gitlab.com/georgeraven/raven-helm-charts | corvid | 0.13.1 |

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
| cron.enabled | bool | `false` | enable or disable cronjob |
| cron.schedule | string | `"@midnight"` | schedule for cronjob using Cron syntax https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/#schedule-syntax |
| cron.suspend | bool | `false` | cronjob will not trigger on schedule but can be manually triggered |
| daemonset.enabled | bool | `false` |  |
| deployment.enabled | bool | `true` |  |
| deployment.strategy | string | `""` | rollout strategy `Recreate` or `RollingUpdate` this chart defaults to Recreate only if we detect a single replica with a volume |
| dnsConfig | object | `{}` |  |
| dnsPolicy | string | `""` |  |
| envFrom | string | `nil` |  |
| env[0].name | string | `"PUID"` |  |
| env[0].value | string | `"1000"` |  |
| env[1].name | string | `"PGID"` |  |
| env[1].value | string | `"1000"` |  |
| env[2].name | string | `"TZ"` |  |
| env[2].value | string | `"Etc/UTC"` |  |
| env[3].name | string | `"PIPER_VOICE"` |  |
| env[3].value | string | `"en_GB-allan-medium"` |  |
| env[4].name | string | `"PIPER_LENGTH"` |  |
| env[4].value | string | `"1.0"` |  |
| env[5].name | string | `"PIPER_NOISE"` |  |
| env[5].value | string | `"0.667"` |  |
| env[6].name | string | `"PIPER_NOISEW"` |  |
| env[6].value | string | `"0.333"` |  |
| env[7].name | string | `"PIPER_SPEAKER"` |  |
| env[7].value | string | `"0"` |  |
| env[8].name | string | `"PIPER_PROCS"` |  |
| env[8].value | string | `"1"` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"ghcr.io"` |  |
| image.repository | string | `"linuxserver/piper"` |  |
| image.tag | string | `"1.4.0"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"piper.org.example"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| initContainers | list | `[]` |  |
| job.enabled | bool | `false` |  |
| livenessProbe | string | `nil` | raw liveness probe overrides for user |
| livenessProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default liveness probe if not specified by user |
| livenessProbeEnabled | bool | `true` | enable or disable liveness probe entirely |
| nameOverride | string | `""` |  |
| netpol.enabled | bool | `true` |  |
| nodeSelector | object | `{}` |  |
| persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistence.enabled | bool | `false` |  |
| persistence.existingClaim | string | `""` |  |
| persistence.size | string | `"8Gi"` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` | podSecurityContext for consumer overrides |
| podSecurityContextDefault | object | `{"fsGroup":1000}` | default podSecurityContext if none specified |
| podSecurityContextEnabled | bool | `true` | enable or disable podSecurityContext entirely |
| ports[0].containerPort | int | `10200` |  |
| ports[0].name | string | `"wyoming"` |  |
| ports[0].protocol | string | `"TCP"` |  |
| ports[0].servicePort | int | `10200` |  |
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
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| startupProbe | string | `nil` | raw startup probe overrides for user |
| startupProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default startup probe if not specified by user |
| startupProbeEnabled | bool | `true` | enable or disable startup probe entirely |
| tolerations | list | `[]` |  |
| topologySpreadConstraints | list | `[]` |  |
| volumeMounts | list | `[]` |  |
| volumes | list | `[]` |  |

