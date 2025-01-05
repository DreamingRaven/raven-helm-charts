# pgadmin

A Helm chart for Kubernetes

![Version: 0.4.0](https://img.shields.io/badge/Version-0.4.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 8.13](https://img.shields.io/badge/AppVersion-8.13-informational?style=flat-square)

## Installing the Chart

To install the chart with the release name `pgadmin`, run the following commands:

```console
$ helm repo add raven https://gitlab.com/api/v4/projects/55284972/packages/helm/stable
$ helm repo update raven
$ helm install pgadmin raven/pgadmin
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
| envFrom[0].secretRef.name | string | `"pgadmin"` |  |
| env[0].name | string | `"PGADMIN_LISTEN_PORT"` |  |
| env[0].value | string | `"8080"` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"dpage/pgadmin4"` |  |
| image.tag | string | `"8.14"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"pgadmin.org.example"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| initContainers[0].command[0] | string | `"bash"` |  |
| initContainers[0].command[1] | string | `"-c"` |  |
| initContainers[0].command[2] | string | `"echo \"Chowning the following by changing dir:\"\ncp -r /usr/bin/python3.12 /chowned/.\nls -l /chowned\necho \"fin\"\n"` |  |
| initContainers[0].image | string | `"docker.io/dpage/pgadmin4:8.14"` |  |
| initContainers[0].name | string | `"chown"` |  |
| initContainers[0].securityContext.allowPrivilegeEscalation | bool | `true` |  |
| initContainers[0].securityContext.runAsUser | int | `0` |  |
| initContainers[0].volumeMounts[0].mountPath | string | `"/chowned"` |  |
| initContainers[0].volumeMounts[0].name | string | `"bin"` |  |
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
| podSecurityContextDefault | object | `{"fsGroup":5050}` | default podSecurityContext if none specified |
| podSecurityContextEnabled | bool | `true` | enable or disable podSecurityContext entirely |
| ports[0].containerPort | int | `8080` |  |
| ports[0].name | string | `"http"` |  |
| ports[0].protocol | string | `"TCP"` |  |
| ports[0].servicePort | int | `80` |  |
| readinessProbe | string | `nil` | raw readiness probe overrides for user |
| readinessProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default readiness probe if not specified by user |
| readinessProbeEnabled | bool | `true` | enable or disable readiness probe entirely |
| replicaCount | int | `1` |  |
| resources | string | `nil` | raw resources block overrides for user |
| resourcesDefault | object | `{"limits":{"memory":"1Gi"},"requests":{"cpu":"200m"}}` | default resources if not specified by user |
| resourcesEnabled | bool | `true` | enable or disable resources entirely |
| restartPolicy | string | `"Always"` |  |
| runtimeClassName | string | `nil` |  |
| secrets | list | `[]` |  |
| securityContext | object | `{}` | securityContext for consumer overrides |
| securityContextDefault | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":false,"runAsNonRoot":true,"runAsUser":5050}` | default securityContext if none specified |
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
| volumeMounts[0].mountPath | string | `"/usr/bin/python3.12"` |  |
| volumeMounts[0].name | string | `"bin"` |  |
| volumeMounts[0].subPath | string | `"python3.12"` |  |
| volumes[0].emptyDir | object | `{}` |  |
| volumes[0].name | string | `"bin"` |  |

# Changelog

# 0.3.0

Changed default security context to be much more restrictive.
Also changed volume mounting to modify python to 755 perms in an init container, so lower privileges can be used for pgadmin container itself. This is a very breaking change if you have set any of initContainers, volumes, volumeMounts, securityContext as these will need to now include this override init container and the volumes it uses.

