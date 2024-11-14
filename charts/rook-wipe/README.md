# rook-wipe

A Helm chart for Kubernetes

![Version: 0.1.1](https://img.shields.io/badge/Version-0.1.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.37.0-glibc](https://img.shields.io/badge/AppVersion-1.37.0--glibc-informational?style=flat-square)

Rook cleanup helm chart is responsible for zapping volumes and metadata from rook nodes.

This will NOT do anything when installed. It will create suspended cronjobs, which you may trigger to clean up rook data on demand.
One cronjob will be created for each rook node. You also have to specify which nodes by name, and which devices to wipe.

This should be installed once for each node, by a different name, usually using helm aliases. This simplifies maintenance, and reduces overall complexity.

## Installing the Chart

To install the chart with the release name `rook-wipe`, run the following commands:

```console
$ helm repo add raven https://gitlab.com/api/v4/projects/55284972/packages/helm/stable
$ helm repo update raven
$ helm install rook-wipe raven/rook-wipe
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://gitlab.com/api/v4/projects/55284972/packages/helm/stable | corvid | 0.11.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| args | string | `nil` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| command[0] | string | `"/bin/sh"` |  |
| command[1] | string | `"-c"` |  |
| command[2] | string | `"set -e\nif [[ -z \"$DEVICES\" ]]; then\n  echo \"No devices specified\"\n  exit 1\nelse\n  rm -rf /node/rook-data/*\n  IFS=','\n  for device in $DEVICES; do\n    dd if=/dev/zero of=${device} bs=1M count=100 oflag=direct\n  unset IFS\n  done\nfi\n"` |  |
| cron.enabled | bool | `true` | enable or disable cronjob |
| cron.schedule | string | `"@midnight"` | schedule for cronjob using Cron syntax https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/#schedule-syntax |
| cron.suspend | bool | `true` | cronjob will not trigger on schedule but can be manually triggered |
| dnsConfig | object | `{}` |  |
| dnsPolicy | string | `""` |  |
| envFrom | string | `nil` |  |
| env[0].name | string | `"DEVICES"` |  |
| env[0].value | string | `""` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"library/busybox"` |  |
| image.tag | string | `"1.37.0-glibc"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"rook-wipe.org.example"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| initContainers | list | `[]` |  |
| livenessProbe | string | `nil` | raw liveness probe overrides for user |
| livenessProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default liveness probe if not specified by user |
| livenessProbeEnabled | bool | `false` | enable or disable liveness probe entirely |
| nameOverride | string | `""` |  |
| netpol.enabled | bool | `true` |  |
| nodeName | string | `"exampleHostName"` |  |
| nodeSelector | object | `{}` |  |
| persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistence.enabled | bool | `false` |  |
| persistence.existingClaim | string | `""` |  |
| persistence.size | string | `"8Gi"` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` | podSecurityContext for consumer overrides |
| podSecurityContextDefault | object | `{}` | default podSecurityContext if none specified |
| podSecurityContextEnabled | bool | `true` | enable or disable podSecurityContext entirely |
| ports[0].containerPort | int | `8080` |  |
| ports[0].name | string | `"http"` |  |
| ports[0].protocol | string | `"TCP"` |  |
| ports[0].servicePort | int | `80` |  |
| readinessProbe | string | `nil` | raw readiness probe overrides for user |
| readinessProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default readiness probe if not specified by user |
| readinessProbeEnabled | bool | `false` | enable or disable readiness probe entirely |
| replicaCount | int | `1` |  |
| resources | string | `nil` | raw resources block overrides for user |
| resourcesDefault | object | `{"limits":{"memory":"200Mi"},"requests":{"cpu":"1000m"}}` | default resources if not specified by user |
| resourcesEnabled | bool | `true` | enable or disable resources entirely |
| restartPolicy | string | `"Always"` |  |
| runtimeClassName | string | `nil` |  |
| secrets | list | `[]` |  |
| securityContext | string | `nil` | securityContext for consumer overrides |
| securityContextDefault | object | `{"privileged":true}` | default securityContext if none specified |
| securityContextEnabled | bool | `true` | enable or disable securityContext entirely |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| startupProbe | string | `nil` | raw startup probe overrides for user |
| startupProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default startup probe if not specified by user |
| startupProbeEnabled | bool | `false` | enable or disable startup probe entirely |
| tolerations | list | `[]` |  |
| volumeMounts[0].mountPath | string | `"/node/rook-data"` |  |
| volumeMounts[0].name | string | `"rook-data-dir"` |  |
| volumeMounts[1].mountPath | string | `"/dev"` |  |
| volumeMounts[1].name | string | `"dev"` |  |
| volumes[0].hostPath.path | string | `"/var/lib/rook"` |  |
| volumes[0].name | string | `"rook-data-dir"` |  |
| volumes[1].hostPath.path | string | `"/dev"` |  |
| volumes[1].hostPath.type | string | `"Directory"` |  |
| volumes[1].name | string | `"dev"` |  |

# Changelog

## 0.1.0

Initial implementation.

