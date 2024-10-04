# jellyfin

A Helm chart for Kubernetes

![Version: 0.1.1](https://img.shields.io/badge/Version-0.1.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 10.8.13](https://img.shields.io/badge/AppVersion-10.8.13-informational?style=flat-square)

## Installing the Chart

To install the chart with the release name `jellyfin`, run the following commands:

```console
$ helm repo add raven https://gitlab.com/api/v4/projects/55284972/packages/helm/stable
$ helm repo update raven
$ helm install jellyfin raven/jellyfin
```

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
| env[0].name | string | `"PUID"` |  |
| env[0].value | string | `"1001"` |  |
| env[1].name | string | `"PGID"` |  |
| env[1].value | string | `"1001"` |  |
| env[2].name | string | `"TZ"` |  |
| env[2].value | string | `"Etc/UTC"` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"lscr.io"` |  |
| image.repository | string | `"linuxserver/jellyfin"` |  |
| image.tag | string | `"10.9.11"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"jellyfin.org.example"` |  |
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
| ports[0].containerPort | int | `8096` |  |
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
| volumeMounts[0].mountPath | string | `"/data"` |  |
| volumeMounts[0].name | string | `"data"` |  |
| volumeMounts[0].readOnly | bool | `true` |  |
| volumeMounts[0].subPath | string | `"media"` |  |
| volumeMounts[1].mountPath | string | `"/config"` |  |
| volumeMounts[1].name | string | `"data"` |  |
| volumeMounts[1].readOnly | bool | `false` |  |
| volumeMounts[1].subPath | string | `"config"` |  |
| volumes[0].name | string | `"data"` |  |
| volumes[0].persistentVolumeClaim.claimName | string | `"jellyfin"` |  |

