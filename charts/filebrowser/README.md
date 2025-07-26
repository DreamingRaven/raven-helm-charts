# filebrowser

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v2.41.0](https://img.shields.io/badge/AppVersion-v2.41.0-informational?style=flat-square)

A Helm chart for Kubernetes

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| configmap.generate | bool | `true` |  |
| env[0].name | string | `"FILEBROWSER_EXAMPLE_VARIABLE"` |  |
| env[0].value | string | `"false"` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"filebrowser/filebrowser"` |  |
| image.tag | string | `"v2.41.0"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"filebrowser.org.example"` |  |
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
| podSecurityContext.fsGroup | int | `1001` |  |
| podSecurityContext.runAsGroup | int | `1001` |  |
| podSecurityContext.runAsUser | int | `1001` |  |
| ports[0].containerPort | int | `8080` |  |
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
| volumeMounts[0].mountPath | string | `"/database"` |  |
| volumeMounts[0].name | string | `"data"` |  |
| volumeMounts[0].readOnly | bool | `false` |  |
| volumeMounts[0].subPath | string | `"database"` |  |
| volumeMounts[1].mountPath | string | `"/srv"` |  |
| volumeMounts[1].name | string | `"data"` |  |
| volumeMounts[1].readOnly | bool | `false` |  |
| volumeMounts[1].subPath | string | `"files"` |  |
| volumeMounts[2].mountPath | string | `"/.filebrowser.json"` |  |
| volumeMounts[2].name | string | `"config"` |  |
| volumeMounts[2].readOnly | bool | `false` |  |
| volumeMounts[2].subPath | string | `".filebrowser.json"` |  |
| volumes[0].name | string | `"data"` |  |
| volumes[0].persistentVolumeClaim.claimName | string | `"filebrowser"` |  |
| volumes[1].configMap.items[0].key | string | `".filebrowser.json"` |  |
| volumes[1].configMap.items[0].path | string | `".filebrowser.json"` |  |
| volumes[1].configMap.name | string | `"filebrowser"` |  |
| volumes[1].name | string | `"config"` |  |

