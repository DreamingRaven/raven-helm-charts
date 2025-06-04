# foundryvtt

A Helm chart for Kubernetes

![Version: 0.6.0](https://img.shields.io/badge/Version-0.6.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v12.331.0](https://img.shields.io/badge/AppVersion-v12.331.0-informational?style=flat-square)

## Installing the Chart

### Install via OCI helm registry

To install the chart with the release name `foundryvtt`, run the following commands.
For a list of all available charts and versions see the [container registry](https://gitlab.com/GeorgeRaven/raven-helm-charts/container_registry)

To pull the latest version without authentication:

```console
helm install foundryvtt oci://registry.gitlab.com/georgeraven/raven-helm-charts/foundryvtt
```

With authentication:

```console
helm registry login registry.gitlab.com -u <USERNAME> -p <GITLAB_TOKEN>
helm install foundryvtt oci://registry.gitlab.com/georgeraven/raven-helm-charts/foundryvtt --version 0.6.0
```

### Install via Helm index.yaml (deprecated method since: 2025-03-24)

To install the chart with the release name `foundryvtt`, run the following commands:

```console
$ helm repo add raven https://gitlab.com/api/v4/projects/55284972/packages/helm/stable
$ helm repo update raven
$ helm install foundryvtt raven/foundryvtt
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://gitlab.com/api/v4/projects/55284972/packages/helm/stable | corvid | 0.12.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| args | string | `nil` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `3` |  |
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
| env[0].name | string | `"FOUNDRY_IP_DISCOVERY"` |  |
| env[0].value | string | `"false"` |  |
| env[1].name | string | `"FOUNDRY_HOSTNAME"` |  |
| env[1].value | string | `"foundryvtt.org.example"` |  |
| env[2].name | string | `"FOUNDRY_LOCAL_HOSTNAME"` |  |
| env[2].value | string | `"foundryvtt.org.example"` |  |
| env[3].name | string | `"FOUNDRY_MINIFY_STATIC_FILES"` |  |
| env[3].value | string | `"true"` |  |
| env[4].name | string | `"FOUNDRY_UPNP"` |  |
| env[4].value | string | `"false"` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"ghcr.io"` |  |
| image.repository | string | `"felddy/foundryvtt"` |  |
| image.tag | string | `"13.344.0"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"foundryvtt.org.example"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| initContainers | list | `[]` |  |
| livenessProbe | string | `nil` | raw liveness probe overrides for user |
| livenessProbeDefault | object | `{"failureThreshold":20,"httpGet":{"path":"/","port":"http"},"periodSeconds":30}` | default liveness probe if not specified by user |
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
| podSecurityContextDefault | object | `{"fsGroup":421}` | default podSecurityContext if none specified |
| podSecurityContextEnabled | bool | `true` | enable or disable podSecurityContext entirely |
| ports[0].containerPort | int | `30000` |  |
| ports[0].name | string | `"http"` |  |
| ports[0].protocol | string | `"TCP"` |  |
| ports[0].servicePort | int | `80` |  |
| readinessProbe | string | `nil` | raw readiness probe overrides for user |
| readinessProbeDefault | object | `{"failureThreshold":20,"httpGet":{"path":"/","port":"http"},"periodSeconds":30}` | default readiness probe if not specified by user |
| readinessProbeEnabled | bool | `true` | enable or disable readiness probe entirely |
| replicaCount | int | `1` |  |
| resources | string | `nil` | raw resources block overrides for user |
| resourcesDefault | object | `{"limits":{"memory":"3Gi"},"requests":{"cpu":"400m"}}` | default resources if not specified by user |
| resourcesEnabled | bool | `true` | enable or disable resources entirely |
| restartPolicy | string | `"Always"` |  |
| runtimeClassName | string | `nil` |  |
| secrets[0].lookup[0].env | string | `"FOUNDRY_USERNAME"` |  |
| secrets[0].lookup[0].key | string | `"foundryUsername"` |  |
| secrets[0].lookup[1].env | string | `"FOUNDRY_PASSWORD"` |  |
| secrets[0].lookup[1].key | string | `"foundryPassword"` |  |
| secrets[0].lookup[2].env | string | `"FOUNDRY_ADMIN_KEY"` |  |
| secrets[0].lookup[2].key | string | `"adminPassword"` |  |
| secrets[0].name | string | `"foundryvtt"` |  |
| securityContext | object | `{}` | securityContext for consumer overrides |
| securityContextDefault | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"fsGroup":421,"readOnlyRootFilesystem":false,"runAsGroup":421,"runAsNonRoot":true,"runAsUser":421}` | default securityContext if none specified |
| securityContextEnabled | bool | `true` | enable or disable securityContext entirely |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| startupProbe | string | `nil` | raw startup probe overrides for user |
| startupProbeDefault | object | `{"failureThreshold":120,"httpGet":{"path":"/","port":"http"},"initialDelaySeconds":5,"periodSeconds":10}` | default startup probe if not specified by user |
| startupProbeEnabled | bool | `true` | enable or disable startup probe entirely |
| tolerations | list | `[]` |  |
| volumeMounts | list | `[]` |  |
| volumes | list | `[]` |  |

# Changelog

## 0.6.0

This adds default security and pod security policies to enable users upgrading from v12 to seamlessley upgrade to v13.

To restore the old behaviour simply disable both security policies.

```yaml
podSecurityContextEnabled: false
securityContextEnabled: false
```

Otherwise this enhances security and compatibility.

See also: https://github.com/felddy/foundryvtt-docker/discussions/1197

