# foundryvtt

![Version: 0.3.7](https://img.shields.io/badge/Version-0.3.7-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v12.330.0](https://img.shields.io/badge/AppVersion-v12.330.0-informational?style=flat-square)

A Helm chart for Kubernetes

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| GeorgeRaven |  | <https://gitlab.com/GeorgeRaven> |

## Source Code

* <https://gitlab.com/GeorgeRaven/raven-helm-charts>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://gitlab.com/api/v4/projects/55284972/packages/helm/stable | corvid | 0.7.1 |

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
| image.tag | string | `"12.331.0"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"foundryvtt.org.example"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| initContainers | list | `[]` |  |
| livenessProbe | object | `{}` |  |
| nameOverride | string | `""` |  |
| netpol.enabled | bool | `true` |  |
| nodeSelector | object | `{}` |  |
| persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistence.enabled | bool | `false` |  |
| persistence.existingClaim | string | `""` |  |
| persistence.size | string | `"8Gi"` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| ports[0].containerPort | int | `30000` |  |
| ports[0].name | string | `"http"` |  |
| ports[0].protocol | string | `"TCP"` |  |
| ports[0].servicePort | int | `80` |  |
| readinessProbe | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| restartPolicy | string | `"Always"` |  |
| runtimeClassName | string | `nil` |  |
| secrets[0].lookup[0].env | string | `"FOUNDRY_USERNAME"` |  |
| secrets[0].lookup[0].key | string | `"foundryUsername"` |  |
| secrets[0].lookup[1].env | string | `"FOUNDRY_PASSWORD"` |  |
| secrets[0].lookup[1].key | string | `"foundryPassword"` |  |
| secrets[0].lookup[2].env | string | `"FOUNDRY_ADMIN_KEY"` |  |
| secrets[0].lookup[2].key | string | `"adminPassword"` |  |
| secrets[0].name | string | `"foundryvtt"` |  |
| securityContext | object | `{}` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |
| volumeMounts | list | `[]` |  |
| volumes | list | `[]` |  |

