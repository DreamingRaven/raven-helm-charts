# vaultwarden

Unofficial Bitwarden compatible server written in Rust

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.36.0](https://img.shields.io/badge/AppVersion-1.36.0-informational?style=flat-square)

## Installing the Chart

### Install via OCI helm registry

To install the chart with the release name `vaultwarden`, run the following commands.
For a list of all available charts and versions see the [container registry](https://gitlab.com/GeorgeRaven/raven-helm-charts/container_registry)

To pull the latest version without authentication:

```console
helm install vaultwarden oci://registry.gitlab.com/georgeraven/raven-helm-charts/vaultwarden
```

With authentication:

```console
helm registry login registry.gitlab.com -u <USERNAME> -p <GITLAB_TOKEN>
helm install vaultwarden oci://registry.gitlab.com/georgeraven/raven-helm-charts/vaultwarden --version 0.1.0
```

### As a helm dependency

You can also opt to directly reference this chart as a helm dependency defined in your `Chart.yaml`:

```yaml
dependencies:
- name: vaultwarden
  version: 0.1.0
  repository: "oci://registry.gitlab.com/georgeraven/raven-helm-charts"
  # alias: <THE_NAME_YOU_WANT_TO_GIVE_THE_CHART> # optional for more advanced use-cases
  # condition: vaultwarden.enabled # optional for more advanced use-cases
```

Then you should pull the chart with the following command:

```console
helm dependency update <PATH_TO_YOUR_CHART_DIR>
```

Which should automatically fetch the chart, update your lockfile, etc.

### Install via Helm index.yaml (deprecated method since: 2025-03-24)

To install the chart with the release name `vaultwarden`, run the following commands:

```console
$ helm repo add raven https://gitlab.com/api/v4/projects/55284972/packages/helm/stable
$ helm repo update raven
$ helm install vaultwarden raven/vaultwarden
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://registry.gitlab.com/georgeraven/raven-helm-charts | vaultwarden(corvid-app) | 0.17.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| vaultwarden.affinity | object | `{}` |  |
| vaultwarden.args[0] | string | `"/start.sh\n"` |  |
| vaultwarden.autoscaling.behavior | object | `{}` | HPA behavior settings (included in keda ScaledObject if enabled) |
| vaultwarden.autoscaling.enabled | bool | `false` | enable or disable autoscaling with a standalone HPA (settings are re-used if keda is enabled) |
| vaultwarden.autoscaling.maxReplicas | int | `5` | maximum number of replicas to scale to |
| vaultwarden.autoscaling.minReplicas | int | `1` | minimum number of replicas to scale to |
| vaultwarden.autoscaling.targetCPUUtilizationPercentage | int | `80` | sets targetCPUUtilizationPercentage resource utilization of HPA |
| vaultwarden.command[0] | string | `"/bin/sh"` |  |
| vaultwarden.command[1] | string | `"-c"` |  |
| vaultwarden.cron.backoffLimit | int | `3` |  |
| vaultwarden.cron.concurrencyPolicy | string | `"Allow"` |  |
| vaultwarden.cron.enabled | bool | `false` | enable or disable cronjob |
| vaultwarden.cron.failedJobsHistoryLimit | int | `1` |  |
| vaultwarden.cron.schedule | string | `"@midnight"` | schedule for cronjob using Cron syntax https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/#schedule-syntax |
| vaultwarden.cron.successfulJobsHistoryLimit | int | `1` |  |
| vaultwarden.cron.suspend | bool | `false` | cronjob will not trigger on schedule but can be manually triggered |
| vaultwarden.daemonset.enabled | bool | `false` |  |
| vaultwarden.deployment.enabled | bool | `true` |  |
| vaultwarden.deployment.strategy | string | `""` | rollout strategy `Recreate` or `RollingUpdate` this chart defaults to Recreate only if we detect a single replica with a volume |
| vaultwarden.dnsConfig | object | `{}` |  |
| vaultwarden.dnsPolicy | string | `""` |  |
| vaultwarden.envFrom | string | `nil` |  |
| vaultwarden.env[0].name | string | `"ROCKET_PORT"` |  |
| vaultwarden.env[0].value | string | `"8080"` |  |
| vaultwarden.env[1].name | string | `"DOMAIN"` |  |
| vaultwarden.env[1].value | string | `"vaultwarden.org.example"` |  |
| vaultwarden.env[2].name | string | `"USER"` |  |
| vaultwarden.env[2].value | string | `"1000"` |  |
| vaultwarden.env[3].name | string | `"GROUP"` |  |
| vaultwarden.env[3].value | string | `"1000"` |  |
| vaultwarden.fullnameOverride | string | `""` |  |
| vaultwarden.httpRoute.annotations | object | `{}` |  |
| vaultwarden.httpRoute.enabled | bool | `false` |  |
| vaultwarden.httpRoute.exposedPorts[0].number | int | `80` |  |
| vaultwarden.httpRoute.hostnames[0] | string | `"vaultwarden.org.example"` |  |
| vaultwarden.httpRoute.parentRefs[0].name | string | `"my-gateway"` |  |
| vaultwarden.image.pullPolicy | string | `"IfNotPresent"` |  |
| vaultwarden.image.registry | string | `"ghcr.io"` |  |
| vaultwarden.image.repository | string | `"dani-garcia/vaultwarden"` |  |
| vaultwarden.image.tag | string | `"1.36.0@sha256:d626d04934cd1192ad8ced1adb975099fca78cec33ab467d2d3c923cde7f3b0c"` |  |
| vaultwarden.imagePullSecrets | list | `[]` |  |
| vaultwarden.ingress.annotations | object | `{}` |  |
| vaultwarden.ingress.className | string | `""` |  |
| vaultwarden.ingress.enabled | bool | `false` |  |
| vaultwarden.ingress.hosts[0].host | string | `"vaultwarden.org.example"` |  |
| vaultwarden.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| vaultwarden.ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| vaultwarden.ingress.tls | list | `[]` |  |
| vaultwarden.initContainers | list | `[]` |  |
| vaultwarden.job.annotations | object | `{}` | annotations to add to the job e.g for helm hooks |
| vaultwarden.job.enabled | bool | `false` |  |
| vaultwarden.keda.enabled | bool | `false` |  |
| vaultwarden.keda.job.activeDeadlineSeconds | int | `60` |  |
| vaultwarden.keda.job.backoffLimit | int | `3` |  |
| vaultwarden.keda.job.scalingStrategy | object | `{}` |  |
| vaultwarden.keda.job.ttlSecondsAfterFinished | int | `0` |  |
| vaultwarden.keda.kind | string | `"ScaledJob"` |  |
| vaultwarden.keda.object.cooldownPeriod | int | `300` |  |
| vaultwarden.keda.object.failureThreshold | int | `1` |  |
| vaultwarden.keda.object.idleReplicaCount | int | `0` |  |
| vaultwarden.keda.object.minReplicas | int | `0` |  |
| vaultwarden.keda.object.pollingInterval | int | `30` |  |
| vaultwarden.keda.paused | bool | `false` |  |
| vaultwarden.keda.transferHpaOwnership | bool | `true` |  |
| vaultwarden.keda.triggers | list | `[]` |  |
| vaultwarden.livenessProbe | string | `nil` | raw liveness probe overrides for user |
| vaultwarden.livenessProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default liveness probe if not specified by user |
| vaultwarden.livenessProbeEnabled | bool | `true` | enable or disable liveness probe entirely |
| vaultwarden.nameOverride | string | `""` |  |
| vaultwarden.netpol.enabled | bool | `true` |  |
| vaultwarden.nodeSelector | object | `{}` |  |
| vaultwarden.persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| vaultwarden.persistence.defaultVolumeMounts[0].mountPath | string | `"/data/"` |  |
| vaultwarden.persistence.defaultVolumeMounts[0].name | string | `"data"` |  |
| vaultwarden.persistence.defaultVolumeMounts[0].subPath | string | `"data"` |  |
| vaultwarden.persistence.enabled | bool | `true` |  |
| vaultwarden.persistence.existingClaim | string | `""` |  |
| vaultwarden.persistence.size | string | `"8Gi"` |  |
| vaultwarden.podAnnotations | object | `{}` |  |
| vaultwarden.podLabels | object | `{}` |  |
| vaultwarden.podSecurityContext | object | `{}` | podSecurityContext for consumer overrides |
| vaultwarden.podSecurityContextDefault | object | `{"fsGroup":1000}` | default podSecurityContext if none specified |
| vaultwarden.podSecurityContextEnabled | bool | `true` | enable or disable podSecurityContext entirely |
| vaultwarden.ports[0].appProtocol | string | `"http"` |  |
| vaultwarden.ports[0].containerPort | int | `8080` |  |
| vaultwarden.ports[0].name | string | `"http"` |  |
| vaultwarden.ports[0].protocol | string | `"TCP"` |  |
| vaultwarden.ports[0].servicePort | int | `80` |  |
| vaultwarden.readinessProbe | string | `nil` | raw readiness probe overrides for user |
| vaultwarden.readinessProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default readiness probe if not specified by user |
| vaultwarden.readinessProbeEnabled | bool | `true` | enable or disable readiness probe entirely |
| vaultwarden.replicaCount | int | `1` |  |
| vaultwarden.resources | string | `nil` | raw resources block overrides for user |
| vaultwarden.resourcesDefault | object | `{"limits":{"memory":"128Mi"},"requests":{"cpu":"100m"}}` | default resources if not specified by user |
| vaultwarden.resourcesEnabled | bool | `true` | enable or disable resources entirely |
| vaultwarden.restartPolicy | string | `"Always"` |  |
| vaultwarden.runtimeClassName | string | `nil` |  |
| vaultwarden.secrets | list | `[]` |  |
| vaultwarden.securityContext | object | `{}` | securityContext for consumer overrides |
| vaultwarden.securityContextDefault | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}` | default securityContext if none specified |
| vaultwarden.securityContextEnabled | bool | `true` | enable or disable securityContext entirely |
| vaultwarden.service.annotations | object | `{}` | additional service annotations to add |
| vaultwarden.service.enabled | bool | `true` | enable or disable the provided service |
| vaultwarden.service.type | string | `"ClusterIP"` | service type to generate |
| vaultwarden.serviceAccount.annotations | object | `{}` |  |
| vaultwarden.serviceAccount.automount | bool | `true` |  |
| vaultwarden.serviceAccount.create | bool | `true` | if enabled and create true, then create service account |
| vaultwarden.serviceAccount.enabled | bool | `true` | enable or disable the entire service account creation and consumption |
| vaultwarden.serviceAccount.name | string | `""` |  |
| vaultwarden.startupProbe | string | `nil` | raw startup probe overrides for user |
| vaultwarden.startupProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default startup probe if not specified by user |
| vaultwarden.startupProbeEnabled | bool | `true` | enable or disable startup probe entirely |
| vaultwarden.sts.enabled | bool | `false` |  |
| vaultwarden.sts.updateStrategy | string | `"RollingUpdate"` |  |
| vaultwarden.test.enabled | bool | `false` |  |
| vaultwarden.tolerations | list | `[]` |  |
| vaultwarden.topologySpreadConstraints | list | `[]` |  |
| vaultwarden.volumeMounts | list | `[]` |  |
| vaultwarden.volumes | list | `[]` |  |

# Changelog

## 0.1.0 (corvid-app 0.17.0)

Initial release.

This uses the default SQLite backend.

