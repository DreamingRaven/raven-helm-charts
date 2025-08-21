# cloudflared

A Helm chart for Kubernetes

![Version: 0.3.1](https://img.shields.io/badge/Version-0.3.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2025.8.1](https://img.shields.io/badge/AppVersion-2025.8.1-informational?style=flat-square)

## Installing the Chart

### Install via OCI helm registry

To install the chart with the release name `cloudflared`, run the following commands.
For a list of all available charts and versions see the [container registry](https://gitlab.com/GeorgeRaven/raven-helm-charts/container_registry)

To pull the latest version without authentication:

```console
helm install cloudflared oci://registry.gitlab.com/georgeraven/raven-helm-charts/cloudflared
```

With authentication:

```console
helm registry login registry.gitlab.com -u <USERNAME> -p <GITLAB_TOKEN>
helm install cloudflared oci://registry.gitlab.com/georgeraven/raven-helm-charts/cloudflared --version 0.3.1
```

### As a helm dependency

You can also opt to directly reference this chart as a helm dependency defined in your `Chart.yaml`:

```yaml
dependencies:
- name: cloudflared
  version: 0.3.1
  repository: "oci://registry.gitlab.com/georgeraven/raven-helm-charts"
  # alias: <THE_NAME_YOU_WANT_TO_GIVE_THE_CHART> # optional for more advanced use-cases
  # condition: cloudflared.enabled # optional for more advanced use-cases
```

Then you should pull the chart with the following command:

```console
helm dependency update <PATH_TO_YOUR_CHART_DIR>
```

Which should automatically fetch the chart, update your lockfile, etc.

### Install via Helm index.yaml (deprecated method since: 2025-03-24)

To install the chart with the release name `cloudflared`, run the following commands:

```console
$ helm repo add raven https://gitlab.com/api/v4/projects/55284972/packages/helm/stable
$ helm repo update raven
$ helm install cloudflared raven/cloudflared
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://gitlab.com/api/v4/projects/55284972/packages/helm/stable | corvid | 0.12.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| args[0] | string | `"tunnel"` |  |
| args[1] | string | `"run"` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| command | string | `nil` |  |
| cron.enabled | bool | `false` | enable or disable cronjob |
| cron.schedule | string | `"@midnight"` | schedule for cronjob using Cron syntax https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/#schedule-syntax |
| cron.suspend | bool | `false` | cronjob will not trigger on schedule but can be manually triggered |
| deployment.strategy | string | `""` | rollout strategy `Recreate` or `RollingUpdate` this chart defaults to Recreate only if we detect a single replica with a volume |
| dnsConfig | object | `{}` |  |
| dnsPolicy | string | `""` |  |
| envFrom | string | `nil` |  |
| env[0].name | string | `"NO_AUTOUPDATE"` |  |
| env[0].value | string | `"true"` |  |
| env[1].name | string | `"TUNNEL_METRICS"` |  |
| env[1].value | string | `"0.0.0.0:2000"` |  |
| env[2].name | string | `"TUNNEL_TOKEN"` |  |
| env[2].valueFrom.secretKeyRef.key | string | `"cloudflaredToken"` |  |
| env[2].valueFrom.secretKeyRef.name | string | `"cloudflared"` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"cloudflare/cloudflared"` |  |
| image.tag | string | `"2025.8.1"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"cloudflared.org.example"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| initContainers | list | `[]` |  |
| livenessProbe | string | `nil` | raw liveness probe overrides for user |
| livenessProbeDefault | object | `{"failureThreshold":6,"httpGet":{"path":"/ready","port":"http"},"initialDelaySeconds":10,"periodSeconds":10}` | default liveness probe if not specified by user |
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
| ports[0].containerPort | int | `2000` |  |
| ports[0].name | string | `"http"` |  |
| ports[0].protocol | string | `"TCP"` |  |
| ports[0].servicePort | int | `80` |  |
| readinessProbe | string | `nil` | raw readiness probe overrides for user |
| readinessProbeDefault | object | `{"failureThreshold":3,"httpGet":{"path":"/ready","port":"http"},"initialDelaySeconds":10,"periodSeconds":10}` | default readiness probe if not specified by user |
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
| startupProbeDefault | object | `{"failureThreshold":6,"httpGet":{"path":"/ready","port":"http"},"initialDelaySeconds":10,"periodSeconds":10}` | default startup probe if not specified by user |
| startupProbeEnabled | bool | `true` | enable or disable startup probe entirely |
| tolerations | list | `[]` |  |
| volumeMounts | list | `[]` |  |
| volumes | list | `[]` |  |

