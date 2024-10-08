# grocy

A Helm chart for Kubernetes

![Version: 0.2.3](https://img.shields.io/badge/Version-0.2.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v4.0.3-ls229](https://img.shields.io/badge/AppVersion-v4.0.3--ls229-informational?style=flat-square)

## Installing the Chart

To install the chart with the release name `grocy`, run the following commands:

```console
$ helm repo add raven https://gitlab.com/api/v4/projects/55284972/packages/helm/stable
$ helm repo update raven
$ helm install grocy raven/grocy
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `3` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| barcode.affinity | object | `{}` |  |
| barcode.autoscaling.enabled | bool | `false` |  |
| barcode.autoscaling.maxReplicas | int | `3` |  |
| barcode.autoscaling.minReplicas | int | `1` |  |
| barcode.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| barcode.env[0].name | string | `"PUID"` |  |
| barcode.env[0].value | string | `"1000"` |  |
| barcode.env[1].name | string | `"PGID"` |  |
| barcode.env[1].value | string | `"1000"` |  |
| barcode.env[2].name | string | `"TZ"` |  |
| barcode.env[2].value | string | `"Etc/UTC"` |  |
| barcode.fullnameOverride | string | `""` |  |
| barcode.image.pullPolicy | string | `"IfNotPresent"` |  |
| barcode.image.registry | string | `"docker.io"` |  |
| barcode.image.repository | string | `"f0rc3/barcodebuddy"` |  |
| barcode.image.tag | string | `"v1.8.1.8"` |  |
| barcode.imagePullSecrets | list | `[]` |  |
| barcode.ingress.annotations | object | `{}` |  |
| barcode.ingress.className | string | `""` |  |
| barcode.ingress.enabled | bool | `false` |  |
| barcode.ingress.hosts[0].host | string | `"barcode.local"` |  |
| barcode.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| barcode.ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| barcode.ingress.tls | list | `[]` |  |
| barcode.nameOverride | string | `""` |  |
| barcode.netpol.enabled | bool | `true` |  |
| barcode.nodeSelector | object | `{}` |  |
| barcode.persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| barcode.persistence.annotations | object | `{}` |  |
| barcode.persistence.enabled | bool | `false` |  |
| barcode.persistence.existingClaim | string | `""` |  |
| barcode.persistence.generatePVC | bool | `true` |  |
| barcode.persistence.labels | object | `{}` |  |
| barcode.persistence.size | string | `"8Gi"` |  |
| barcode.persistence.storageClass | string | `""` |  |
| barcode.podAnnotations | object | `{}` |  |
| barcode.podSecurityContext | object | `{}` |  |
| barcode.ports[0].containerPort | int | `80` |  |
| barcode.ports[0].name | string | `"http"` |  |
| barcode.ports[0].protocol | string | `"TCP"` |  |
| barcode.ports[0].servicePort | int | `80` |  |
| barcode.replicaCount | int | `1` |  |
| barcode.resources | object | `{}` |  |
| barcode.secrets | list | `[]` |  |
| barcode.securityContext | object | `{}` |  |
| barcode.service.type | string | `"ClusterIP"` |  |
| barcode.serviceAccount.annotations | object | `{}` |  |
| barcode.serviceAccount.create | bool | `true` |  |
| barcode.serviceAccount.name | string | `""` |  |
| barcode.tolerations | list | `[]` |  |
| env[0].name | string | `"GROCY_MODE"` |  |
| env[0].value | string | `"production"` |  |
| env[1].name | string | `"GROCY_CULTURE"` |  |
| env[1].value | string | `"en"` |  |
| env[2].name | string | `"CURRENCY"` |  |
| env[2].value | string | `"GBP"` |  |
| env[3].name | string | `"MAX_UPLOAD"` |  |
| env[3].value | string | `"50M"` |  |
| env[4].name | string | `"PHP_MAX_FILE_UPLOAD"` |  |
| env[4].value | string | `"200"` |  |
| env[5].name | string | `"PHP_MAX_POST"` |  |
| env[5].value | string | `"100M"` |  |
| env[6].name | string | `"PHP_MEMORY_LIMIT"` |  |
| env[6].value | string | `"512M"` |  |
| env[7].name | string | `"PUID"` |  |
| env[7].value | string | `"1000"` |  |
| env[8].name | string | `"PGID"` |  |
| env[8].value | string | `"1000"` |  |
| env[9].name | string | `"TZ"` |  |
| env[9].value | string | `"Etc/UTC"` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"ghcr.io"` |  |
| image.repository | string | `"linuxserver/grocy"` |  |
| image.tag | string | `"v4.0.3-ls229"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"grocy.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` |  |
| netpol.enabled | bool | `true` |  |
| nodeSelector | object | `{}` |  |
| persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistence.annotations | object | `{}` |  |
| persistence.enabled | bool | `false` |  |
| persistence.existingClaim | string | `""` |  |
| persistence.generatePVC | bool | `true` |  |
| persistence.labels | object | `{}` |  |
| persistence.size | string | `"8Gi"` |  |
| persistence.storageClass | string | `""` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| ports[0].containerPort | int | `80` |  |
| ports[0].name | string | `"http"` |  |
| ports[0].protocol | string | `"TCP"` |  |
| ports[0].servicePort | int | `80` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| secrets | list | `[]` |  |
| securityContext | object | `{}` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |

