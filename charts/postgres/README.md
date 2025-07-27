# postgres

A simple postgres instance for testing and including batteries in other charts for the user to replace with their own CNPG etc

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 17.5](https://img.shields.io/badge/AppVersion-17.5-informational?style=flat-square)

## Installing the Chart

### Install via OCI helm registry

To install the chart with the release name `postgres`, run the following commands.
For a list of all available charts and versions see the [container registry](https://gitlab.com/GeorgeRaven/raven-helm-charts/container_registry)

To pull the latest version without authentication:

```console
helm install postgres oci://registry.gitlab.com/georgeraven/raven-helm-charts/postgres
```

With authentication:

```console
helm registry login registry.gitlab.com -u <USERNAME> -p <GITLAB_TOKEN>
helm install postgres oci://registry.gitlab.com/georgeraven/raven-helm-charts/postgres --version 0.1.0
```

### Install via Helm index.yaml (deprecated method since: 2025-03-24)

To install the chart with the release name `postgres`, run the following commands:

```console
$ helm repo add raven https://gitlab.com/api/v4/projects/55284972/packages/helm/stable
$ helm repo update raven
$ helm install postgres raven/postgres
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://registry.gitlab.com/georgeraven/raven-helm-charts | postgres(corvid-app) | 0.13.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| postgres.affinity | object | `{}` |  |
| postgres.args | string | `nil` |  |
| postgres.autoscaling.enabled | bool | `false` |  |
| postgres.autoscaling.maxReplicas | int | `10` |  |
| postgres.autoscaling.minReplicas | int | `1` |  |
| postgres.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| postgres.command | string | `nil` |  |
| postgres.cron.backoffLimit | int | `3` |  |
| postgres.cron.concurrencyPolicy | string | `"Allow"` |  |
| postgres.cron.enabled | bool | `false` | enable or disable cronjob |
| postgres.cron.failedJobsHistoryLimit | int | `1` |  |
| postgres.cron.schedule | string | `"@midnight"` | schedule for cronjob using Cron syntax https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/#schedule-syntax |
| postgres.cron.successfulJobsHistoryLimit | int | `1` |  |
| postgres.cron.suspend | bool | `false` | cronjob will not trigger on schedule but can be manually triggered |
| postgres.daemonset.enabled | bool | `false` |  |
| postgres.deployment.enabled | bool | `true` |  |
| postgres.deployment.strategy | string | `""` | rollout strategy `Recreate` or `RollingUpdate` this chart defaults to Recreate only if we detect a single replica with a volume |
| postgres.dnsConfig | object | `{}` |  |
| postgres.dnsPolicy | string | `""` |  |
| postgres.envFrom | string | `nil` |  |
| postgres.env[0].name | string | `"PGDATA"` |  |
| postgres.env[0].value | string | `"/var/lib/postgresql/data/pgdata"` |  |
| postgres.env[1].name | string | `"PGPORT"` |  |
| postgres.env[1].value | string | `"5432"` |  |
| postgres.env[2].name | string | `"POSTGRES_DB"` |  |
| postgres.env[2].value | string | `"postgres"` |  |
| postgres.env[3].name | string | `"POSTGRES_USER"` |  |
| postgres.env[3].value | string | `"postgres"` |  |
| postgres.env[4].name | string | `"POSTGRES_PASSWORD"` |  |
| postgres.env[4].value | string | `"postgres"` |  |
| postgres.env[5].name | string | `"POSTGRES_HOST_AUTH_METHOD"` |  |
| postgres.env[5].value | string | `"scram-sha-256"` |  |
| postgres.env[6].name | string | `"POSTGRES_INITDB_ARGS"` |  |
| postgres.env[6].value | string | `"--auth-host=scram-sha-256"` |  |
| postgres.fullnameOverride | string | `""` |  |
| postgres.httpRoute.annotations | object | `{}` |  |
| postgres.httpRoute.enabled | bool | `false` |  |
| postgres.httpRoute.exposedPorts[0].number | int | `80` |  |
| postgres.httpRoute.hostnames[0] | string | `"postgres.org.example"` |  |
| postgres.httpRoute.parentRefs[0].name | string | `"my-gateway"` |  |
| postgres.image.pullPolicy | string | `"IfNotPresent"` |  |
| postgres.image.registry | string | `"docker.io"` |  |
| postgres.image.repository | string | `"library/postgres"` |  |
| postgres.image.tag | string | `"17.5"` |  |
| postgres.imagePullSecrets | list | `[]` |  |
| postgres.ingress.annotations | object | `{}` |  |
| postgres.ingress.className | string | `""` |  |
| postgres.ingress.enabled | bool | `true` |  |
| postgres.ingress.hosts[0].host | string | `"postgres.org.example"` |  |
| postgres.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| postgres.ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| postgres.ingress.tls | list | `[]` |  |
| postgres.initContainers | list | `[]` |  |
| postgres.job.enabled | bool | `false` |  |
| postgres.livenessProbe | string | `nil` | raw liveness probe overrides for user |
| postgres.livenessProbeDefault | object | `{"httpGet":{"path":"/healthz","port":"status"}}` | default liveness probe if not specified by user |
| postgres.livenessProbeEnabled | bool | `false` | enable or disable liveness probe entirely |
| postgres.nameOverride | string | `""` |  |
| postgres.netpol.enabled | bool | `true` |  |
| postgres.nodeSelector | object | `{}` |  |
| postgres.persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| postgres.persistence.defaultVolumeMounts[0].mountPath | string | `"/var/lib/postgresql/data"` |  |
| postgres.persistence.defaultVolumeMounts[0].name | string | `"data"` |  |
| postgres.persistence.defaultVolumeMounts[0].subPath | string | `"data"` |  |
| postgres.persistence.enabled | bool | `true` |  |
| postgres.persistence.existingClaim | string | `""` |  |
| postgres.persistence.size | string | `"8Gi"` |  |
| postgres.podAnnotations | object | `{}` |  |
| postgres.podLabels | object | `{}` |  |
| postgres.podSecurityContext | object | `{}` | podSecurityContext for consumer overrides |
| postgres.podSecurityContextDefault | object | `{"fsGroup":1000}` | default podSecurityContext if none specified |
| postgres.podSecurityContextEnabled | bool | `true` | enable or disable podSecurityContext entirely |
| postgres.ports[0].containerPort | int | `5432` |  |
| postgres.ports[0].name | string | `"postgres"` |  |
| postgres.ports[0].protocol | string | `"TCP"` |  |
| postgres.ports[0].servicePort | int | `5432` |  |
| postgres.readinessProbe | string | `nil` | raw readiness probe overrides for user |
| postgres.readinessProbeDefault | object | `{"httpGet":{"path":"/readyz","port":"status"}}` | default readiness probe if not specified by user |
| postgres.readinessProbeEnabled | bool | `false` | enable or disable readiness probe entirely |
| postgres.replicaCount | int | `1` |  |
| postgres.resources | string | `nil` | raw resources block overrides for user |
| postgres.resourcesDefault | object | `{"limits":{"memory":"128Mi"},"requests":{"cpu":"100m"}}` | default resources if not specified by user |
| postgres.resourcesEnabled | bool | `true` | enable or disable resources entirely |
| postgres.restartPolicy | string | `"Always"` |  |
| postgres.runtimeClassName | string | `nil` |  |
| postgres.secrets | list | `[]` |  |
| postgres.securityContext | object | `{}` | securityContext for consumer overrides |
| postgres.securityContextDefault | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":false,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}` | default securityContext if none specified |
| postgres.securityContextEnabled | bool | `true` | enable or disable securityContext entirely |
| postgres.service.type | string | `"ClusterIP"` |  |
| postgres.serviceAccount.annotations | object | `{}` |  |
| postgres.serviceAccount.automount | bool | `true` |  |
| postgres.serviceAccount.create | bool | `true` |  |
| postgres.serviceAccount.name | string | `""` |  |
| postgres.startupProbe | string | `nil` | raw startup probe overrides for user |
| postgres.startupProbeDefault | object | `{"httpGet":{"path":"/startupz","port":"status"}}` | default startup probe if not specified by user |
| postgres.startupProbeEnabled | bool | `false` | enable or disable startup probe entirely |
| postgres.sts.enabled | bool | `false` |  |
| postgres.sts.updateStrategy | string | `"RollingUpdate"` |  |
| postgres.tolerations | list | `[]` |  |
| postgres.topologySpreadConstraints | list | `[]` |  |
| postgres.volumeMounts | list | `[]` |  |
| postgres.volumes | list | `[]` |  |

