# renovate

A Helm chart for Kubernetes

![Version: 0.3.0](https://img.shields.io/badge/Version-0.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 39-full](https://img.shields.io/badge/AppVersion-39--full-informational?style=flat-square)

## Installing the Chart

### Install via OCI helm registry

To install the chart with the release name `renovate`, run the following commands.
For a list of all available charts and versions see the [container registry](https://gitlab.com/GeorgeRaven/raven-helm-charts/container_registry)

To pull the latest version without authentication:

```console
helm install renovate oci://registry.gitlab.com/georgeraven/raven-helm-charts/renovate
```

With authentication:

```console
helm registry login registry.gitlab.com -u <USERNAME> -p <GITLAB_TOKEN>
helm install renovate oci://registry.gitlab.com/georgeraven/raven-helm-charts/renovate --version 0.3.0
```

### Install via Helm index.yaml (deprecated method since: 2025-03-24)

To install the chart with the release name `renovate`, run the following commands:

```console
$ helm repo add raven https://gitlab.com/api/v4/projects/55284972/packages/helm/stable
$ helm repo update raven
$ helm install renovate raven/renovate
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://registry.gitlab.com/georgeraven/raven-helm-charts | corvid | 0.13.2 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| args | string | `nil` |  |
| command | string | `nil` |  |
| cron.backoffLimit | int | `1` |  |
| cron.concurrencyPolicy | string | `"Replace"` |  |
| cron.enabled | bool | `true` | enable or disable cronjob |
| cron.failedJobsHistoryLimit | int | `2` |  |
| cron.schedule | string | `"@hourly"` | schedule for cronjob using Cron syntax https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/#schedule-syntax |
| cron.successfulJobsHistoryLimit | int | `1` |  |
| cron.suspend | bool | `false` | cronjob will not trigger on schedule but can be manually triggered |
| deployment.strategy | string | `""` | rollout strategy `Recreate` or `RollingUpdate` this chart defaults to Recreate only if we detect a single replica with a volume |
| dnsConfig | object | `{}` |  |
| dnsPolicy | string | `""` |  |
| envFrom[0].secretRef.name | string | `"renovate"` |  |
| envFrom[0].secretRef.optional | bool | `false` |  |
| env[0].name | string | `"RENOVATE_BASE_DIR"` |  |
| env[0].value | string | `"/tmp/renovate/"` |  |
| env[1].name | string | `"RENOVATE_CONFIG_FILE"` |  |
| env[1].value | string | `"/opt/renovate/config.json"` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"ghcr.io"` |  |
| image.repository | string | `"renovatebot/renovate"` |  |
| image.tag | string | `"40-full"` |  |
| imagePullSecrets | list | `[]` |  |
| initContainers | list | `[]` |  |
| livenessProbe | string | `nil` | raw liveness probe overrides for user |
| livenessProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default liveness probe if not specified by user |
| livenessProbeEnabled | bool | `false` | enable or disable liveness probe entirely |
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
| podSecurityContextEnabled | bool | `false` | enable or disable podSecurityContext entirely |
| ports[0].appProtocol | string | `"http"` |  |
| ports[0].containerPort | int | `8080` |  |
| ports[0].name | string | `"http"` |  |
| ports[0].protocol | string | `"TCP"` |  |
| ports[0].servicePort | int | `80` |  |
| readinessProbe | string | `nil` | raw readiness probe overrides for user |
| readinessProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default readiness probe if not specified by user |
| readinessProbeEnabled | bool | `false` | enable or disable readiness probe entirely |
| replicaCount | int | `1` |  |
| resources | string | `nil` | raw resources block overrides for user |
| resourcesDefault | object | `{"limits":{"memory":"128Mi"},"requests":{"cpu":"100m"}}` | default resources if not specified by user |
| resourcesEnabled | bool | `false` | enable or disable resources entirely |
| restartPolicy | string | `"Always"` |  |
| runtimeClassName | string | `nil` |  |
| secrets | list | `[]` |  |
| securityContext | object | `{}` | securityContext for consumer overrides |
| securityContextDefault | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}` | default securityContext if none specified |
| securityContextEnabled | bool | `false` | enable or disable securityContext entirely |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| startupProbe | string | `nil` | raw startup probe overrides for user |
| startupProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default startup probe if not specified by user |
| startupProbeEnabled | bool | `false` | enable or disable startup probe entirely |
| tolerations | list | `[]` |  |
| volumeMounts | list | `[]` |  |
| volumes | list | `[]` |  |

# Changelog

## 0.3.0

This changes the behavior of the retries and historic resources.
While this likely does not affect most users in any substantive manner, I have marked it as a minor change because it does change the default retry behavior.

## 0.2.1

Added backwards compatible change to image source.
This now sources from ghcr instead of dockerhub.

```yaml
image:
  registry: ghcr.io
  repository: renovatebot/renovate
  pullPolicy: IfNotPresent
  tag: "39-full"
```

