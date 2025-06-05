# cyberchef

The Cyber Swiss Army Knife - a web app for encryption, encoding, compression and data analysis

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v10.19.4](https://img.shields.io/badge/AppVersion-v10.19.4-informational?style=flat-square)

## Installing the Chart

### Install via OCI helm registry

To install the chart with the release name `cyberchef`, run the following commands.
For a list of all available charts and versions see the [container registry](https://gitlab.com/GeorgeRaven/raven-helm-charts/container_registry)

To pull the latest version without authentication:

```console
helm install cyberchef oci://registry.gitlab.com/georgeraven/raven-helm-charts/cyberchef
```

With authentication:

```console
helm registry login registry.gitlab.com -u <USERNAME> -p <GITLAB_TOKEN>
helm install cyberchef oci://registry.gitlab.com/georgeraven/raven-helm-charts/cyberchef --version 0.1.0
```

### Install via Helm index.yaml (deprecated method since: 2025-03-24)

To install the chart with the release name `cyberchef`, run the following commands:

```console
$ helm repo add raven https://gitlab.com/api/v4/projects/55284972/packages/helm/stable
$ helm repo update raven
$ helm install cyberchef raven/cyberchef
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://registry.gitlab.com/georgeraven/raven-helm-charts | cyberchef(corvid-app) | 0.10.3 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| cyberchef.affinity | object | `{}` |  |
| cyberchef.args | string | `nil` |  |
| cyberchef.autoscaling.enabled | bool | `false` |  |
| cyberchef.autoscaling.maxReplicas | int | `100` |  |
| cyberchef.autoscaling.minReplicas | int | `1` |  |
| cyberchef.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| cyberchef.command | string | `nil` |  |
| cyberchef.cron.backoffLimit | int | `3` |  |
| cyberchef.cron.concurrencyPolicy | string | `"Allow"` |  |
| cyberchef.cron.enabled | bool | `false` | enable or disable cronjob |
| cyberchef.cron.failedJobsHistoryLimit | int | `1` |  |
| cyberchef.cron.schedule | string | `"@midnight"` | schedule for cronjob using Cron syntax https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/#schedule-syntax |
| cyberchef.cron.successfulJobsHistoryLimit | int | `1` |  |
| cyberchef.cron.suspend | bool | `false` | cronjob will not trigger on schedule but can be manually triggered |
| cyberchef.daemonset.enabled | bool | `false` |  |
| cyberchef.deployment.enabled | bool | `true` |  |
| cyberchef.deployment.strategy | string | `""` | rollout strategy `Recreate` or `RollingUpdate` this chart defaults to Recreate only if we detect a single replica with a volume |
| cyberchef.dnsConfig | object | `{}` |  |
| cyberchef.dnsPolicy | string | `""` |  |
| cyberchef.envFrom | string | `nil` |  |
| cyberchef.env[0].name | string | `"cyberchef_EXAMPLE_VARIABLE"` |  |
| cyberchef.env[0].value | string | `"false"` |  |
| cyberchef.fullnameOverride | string | `""` |  |
| cyberchef.image.pullPolicy | string | `"IfNotPresent"` |  |
| cyberchef.image.registry | string | `"ghcr.io"` |  |
| cyberchef.image.repository | string | `"nginx/nginx-unprivileged"` |  |
| cyberchef.image.tag | string | `"1.27.5-alpine3.21"` |  |
| cyberchef.imagePullSecrets | list | `[]` |  |
| cyberchef.ingress.annotations | object | `{}` |  |
| cyberchef.ingress.className | string | `""` |  |
| cyberchef.ingress.enabled | bool | `false` |  |
| cyberchef.ingress.hosts[0].host | string | `"cyberchef.org.example"` |  |
| cyberchef.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| cyberchef.ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| cyberchef.ingress.tls | list | `[]` |  |
| cyberchef.initContainers[0].command[0] | string | `"sh"` |  |
| cyberchef.initContainers[0].command[1] | string | `"-c"` |  |
| cyberchef.initContainers[0].command[2] | string | `"cp -r /usr/share/nginx/html/ /output/.\n"` |  |
| cyberchef.initContainers[0].image | string | `"ghcr.io/gchq/cyberchef:10.19.4"` |  |
| cyberchef.initContainers[0].imagePullPolicy | string | `"IfNotPresent"` |  |
| cyberchef.initContainers[0].name | string | `"cyberchef"` |  |
| cyberchef.initContainers[0].volumeMounts[0].mountPath | string | `"/output/"` |  |
| cyberchef.initContainers[0].volumeMounts[0].name | string | `"static"` |  |
| cyberchef.job.enabled | bool | `false` |  |
| cyberchef.livenessProbe | string | `nil` | raw liveness probe overrides for user |
| cyberchef.livenessProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default liveness probe if not specified by user |
| cyberchef.livenessProbeEnabled | bool | `true` | enable or disable liveness probe entirely |
| cyberchef.nameOverride | string | `""` |  |
| cyberchef.netpol.enabled | bool | `true` |  |
| cyberchef.nodeSelector | object | `{}` |  |
| cyberchef.persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| cyberchef.persistence.enabled | bool | `false` |  |
| cyberchef.persistence.existingClaim | string | `""` |  |
| cyberchef.persistence.size | string | `"8Gi"` |  |
| cyberchef.podAnnotations | object | `{}` |  |
| cyberchef.podLabels | object | `{}` |  |
| cyberchef.podSecurityContext | object | `{}` | podSecurityContext for consumer overrides |
| cyberchef.podSecurityContextDefault | object | `{"fsGroup":1000}` | default podSecurityContext if none specified |
| cyberchef.podSecurityContextEnabled | bool | `true` | enable or disable podSecurityContext entirely |
| cyberchef.ports[0].appProtocol | string | `"http"` |  |
| cyberchef.ports[0].containerPort | int | `8080` |  |
| cyberchef.ports[0].name | string | `"http"` |  |
| cyberchef.ports[0].protocol | string | `"TCP"` |  |
| cyberchef.ports[0].servicePort | int | `80` |  |
| cyberchef.readinessProbe | string | `nil` | raw readiness probe overrides for user |
| cyberchef.readinessProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default readiness probe if not specified by user |
| cyberchef.readinessProbeEnabled | bool | `true` | enable or disable readiness probe entirely |
| cyberchef.replicaCount | int | `1` |  |
| cyberchef.resources | string | `nil` | raw resources block overrides for user |
| cyberchef.resourcesDefault | object | `{"limits":{"memory":"128Mi"},"requests":{"cpu":"100m"}}` | default resources if not specified by user |
| cyberchef.resourcesEnabled | bool | `true` | enable or disable resources entirely |
| cyberchef.restartPolicy | string | `"Always"` |  |
| cyberchef.runtimeClassName | string | `nil` |  |
| cyberchef.secrets | list | `[]` |  |
| cyberchef.securityContext | object | `{}` | securityContext for consumer overrides |
| cyberchef.securityContextDefault | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":false,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}` | default securityContext if none specified |
| cyberchef.securityContextEnabled | bool | `true` | enable or disable securityContext entirely |
| cyberchef.service.type | string | `"ClusterIP"` |  |
| cyberchef.serviceAccount.annotations | object | `{}` |  |
| cyberchef.serviceAccount.automount | bool | `true` |  |
| cyberchef.serviceAccount.create | bool | `true` |  |
| cyberchef.serviceAccount.name | string | `""` |  |
| cyberchef.startupProbe | string | `nil` | raw startup probe overrides for user |
| cyberchef.startupProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default startup probe if not specified by user |
| cyberchef.startupProbeEnabled | bool | `true` | enable or disable startup probe entirely |
| cyberchef.tolerations | list | `[]` |  |
| cyberchef.topologySpreadConstraints | list | `[]` |  |
| cyberchef.volumeMounts[0].mountPath | string | `"/usr/share/nginx/html/"` |  |
| cyberchef.volumeMounts[0].name | string | `"static"` |  |
| cyberchef.volumeMounts[0].readOnly | bool | `true` |  |
| cyberchef.volumeMounts[0].subPath | string | `"html"` |  |
| cyberchef.volumes[0].emptyDir | object | `{}` |  |
| cyberchef.volumes[0].name | string | `"static"` |  |

