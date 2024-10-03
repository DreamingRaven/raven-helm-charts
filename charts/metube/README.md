# metube

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2024-04-12](https://img.shields.io/badge/AppVersion-2024--04--12-informational?style=flat-square)

A Helm chart for Kubernetes

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| env[0].name | string | `"DEFAULT_THEME"` |  |
| env[0].value | string | `"dark"` |  |
| env[1].name | string | `"DOWNLOAD_DIR"` |  |
| env[1].value | string | `"/downloads"` |  |
| env[2].name | string | `"UID"` |  |
| env[2].value | string | `"1001"` |  |
| env[3].name | string | `"GID"` |  |
| env[3].value | string | `"1001"` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"ghcr.io"` |  |
| image.repository | string | `"alexta69/metube"` |  |
| image.tag | string | `"2024-04-12"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"metube.org.example"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| livenessProbe.httpGet.path | string | `"/"` |  |
| livenessProbe.httpGet.port | string | `"http"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistence.enabled | bool | `true` |  |
| persistence.size | string | `"8Gi"` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| ports[0].containerPort | int | `8081` |  |
| ports[0].name | string | `"http"` |  |
| ports[0].protocol | string | `"TCP"` |  |
| ports[0].servicePort | int | `80` |  |
| readinessProbe.httpGet.path | string | `"/"` |  |
| readinessProbe.httpGet.port | string | `"http"` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| secrets | list | `[]` |  |
| securityContext | object | `{}` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |
| volumeMounts[0].mountPath | string | `"/downloads"` |  |
| volumeMounts[0].name | string | `"data"` |  |
| volumeMounts[0].readOnly | bool | `false` |  |
| volumeMounts[0].subPath | string | `"downloads"` |  |
| volumes[0].name | string | `"data"` |  |
| volumes[0].persistentVolumeClaim.claimName | string | `"metube"` |  |

