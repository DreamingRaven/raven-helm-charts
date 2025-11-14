# keycloak

A Helm chart for Kubernetes

![Version: 0.4.0](https://img.shields.io/badge/Version-0.4.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 26.4.2](https://img.shields.io/badge/AppVersion-26.4.2-informational?style=flat-square)

## Installing the Chart

### Install via OCI helm registry

To install the chart with the release name `keycloak`, run the following commands.
For a list of all available charts and versions see the [container registry](https://gitlab.com/GeorgeRaven/raven-helm-charts/container_registry)

To pull the latest version without authentication:

```console
helm install keycloak oci://registry.gitlab.com/georgeraven/raven-helm-charts/keycloak
```

With authentication:

```console
helm registry login registry.gitlab.com -u <USERNAME> -p <GITLAB_TOKEN>
helm install keycloak oci://registry.gitlab.com/georgeraven/raven-helm-charts/keycloak --version 0.4.0
```

### As a helm dependency

You can also opt to directly reference this chart as a helm dependency defined in your `Chart.yaml`:

```yaml
dependencies:
- name: keycloak
  version: 0.4.0
  repository: "oci://registry.gitlab.com/georgeraven/raven-helm-charts"
  # alias: <THE_NAME_YOU_WANT_TO_GIVE_THE_CHART> # optional for more advanced use-cases
  # condition: keycloak.enabled # optional for more advanced use-cases
```

Then you should pull the chart with the following command:

```console
helm dependency update <PATH_TO_YOUR_CHART_DIR>
```

Which should automatically fetch the chart, update your lockfile, etc.

### Install via Helm index.yaml (deprecated method since: 2025-03-24)

To install the chart with the release name `keycloak`, run the following commands:

```console
$ helm repo add raven https://gitlab.com/api/v4/projects/55284972/packages/helm/stable
$ helm repo update raven
$ helm install keycloak raven/keycloak
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://registry.gitlab.com/georgeraven/raven-helm-charts | keycloak(corvid-app) | 0.13.0 |
| oci://registry.gitlab.com/georgeraven/raven-helm-charts | postgres | 0.2.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| keycloak.affinity | object | `{}` |  |
| keycloak.args[0] | string | `"start"` |  |
| keycloak.autoscaling.enabled | bool | `false` |  |
| keycloak.autoscaling.maxReplicas | int | `5` |  |
| keycloak.autoscaling.minReplicas | int | `2` |  |
| keycloak.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| keycloak.command | string | `nil` |  |
| keycloak.cron.backoffLimit | int | `3` |  |
| keycloak.cron.concurrencyPolicy | string | `"Allow"` |  |
| keycloak.cron.enabled | bool | `false` | enable or disable cronjob |
| keycloak.cron.failedJobsHistoryLimit | int | `1` |  |
| keycloak.cron.schedule | string | `"@midnight"` | schedule for cronjob using Cron syntax https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/#schedule-syntax |
| keycloak.cron.successfulJobsHistoryLimit | int | `1` |  |
| keycloak.cron.suspend | bool | `false` | cronjob will not trigger on schedule but can be manually triggered |
| keycloak.daemonset.enabled | bool | `false` |  |
| keycloak.deployment.enabled | bool | `true` |  |
| keycloak.deployment.strategy | string | `""` | rollout strategy `Recreate` or `RollingUpdate` this chart defaults to Recreate only if we detect a single replica with a volume |
| keycloak.dnsConfig | object | `{}` |  |
| keycloak.dnsPolicy | string | `""` |  |
| keycloak.enabled | bool | `true` |  |
| keycloak.env | list | `[{"name":"KC_HOSTNAME","value":"keycloak.org.example"},{"name":"KC_HTTP_PORT","value":"8080"},{"name":"KC_MANAGEMENT_PORT","value":"9000"},{"name":"KC_HEALTH_ENABLED","value":"true"},{"name":"KC_HTTP_ENABLED","value":"true"},{"name":"KC_PROXY_HEADERS","value":"xforwarded"},{"name":"KC_DB","value":"postgres"},{"name":"KC_DB_URL_HOST","value":"postgres"},{"name":"KC_DB_URL_PORT","value":"5432"},{"name":"KC_DB_URL_DATABASE","value":"keycloak"},{"name":"KC_DB_USERNAME","value":"keycloak"},{"name":"KC_DB_PASSWORD","value":"keycloak"},{"name":"KC_BOOTSTRAP_ADMIN_USERNAME","value":"keycloak"},{"name":"KC_BOOTSTRAP_ADMIN_PASSWORD","value":"keycloak"}]` | available ENV options documented here: https://www.keycloak.org/server/all-config?options-filter=all#category-database |
| keycloak.envFrom | string | `nil` |  |
| keycloak.fullnameOverride | string | `""` |  |
| keycloak.httpRoute.annotations | object | `{}` |  |
| keycloak.httpRoute.enabled | bool | `false` |  |
| keycloak.httpRoute.exposedPorts[0].number | int | `80` |  |
| keycloak.httpRoute.hostnames[0] | string | `"keycloak.org.example"` |  |
| keycloak.httpRoute.parentRefs[0].name | string | `"my-gateway"` |  |
| keycloak.image.pullPolicy | string | `"IfNotPresent"` |  |
| keycloak.image.registry | string | `"quay.io"` |  |
| keycloak.image.repository | string | `"keycloak/keycloak"` |  |
| keycloak.image.tag | string | `"26.4.2"` |  |
| keycloak.imagePullSecrets | list | `[]` |  |
| keycloak.ingress.annotations | object | `{}` |  |
| keycloak.ingress.className | string | `""` |  |
| keycloak.ingress.enabled | bool | `true` |  |
| keycloak.ingress.hosts[0].host | string | `"keycloak.org.example"` |  |
| keycloak.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| keycloak.ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| keycloak.ingress.tls | list | `[]` |  |
| keycloak.initContainers | list | `[]` |  |
| keycloak.job.enabled | bool | `false` |  |
| keycloak.livenessProbe | string | `nil` | raw liveness probe overrides for user |
| keycloak.livenessProbeDefault | object | `{"httpGet":{"path":"/health/live","port":"management"}}` | default liveness probe if not specified by user |
| keycloak.livenessProbeEnabled | bool | `true` | enable or disable liveness probe entirely |
| keycloak.nameOverride | string | `""` |  |
| keycloak.netpol.enabled | bool | `true` |  |
| keycloak.nodeSelector | object | `{}` |  |
| keycloak.persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| keycloak.persistence.defaultVolumeMounts[0].mountPath | string | `"/data/"` |  |
| keycloak.persistence.defaultVolumeMounts[0].name | string | `"data"` |  |
| keycloak.persistence.defaultVolumeMounts[0].subPath | string | `"data"` |  |
| keycloak.persistence.enabled | bool | `true` |  |
| keycloak.persistence.existingClaim | string | `""` |  |
| keycloak.persistence.size | string | `"8Gi"` |  |
| keycloak.podAnnotations | object | `{}` |  |
| keycloak.podLabels | object | `{}` |  |
| keycloak.podSecurityContext | object | `{}` | podSecurityContext for consumer overrides |
| keycloak.podSecurityContextDefault | object | `{"fsGroup":1000}` | default podSecurityContext if none specified |
| keycloak.podSecurityContextEnabled | bool | `true` | enable or disable podSecurityContext entirely |
| keycloak.ports[0].appProtocol | string | `"http"` |  |
| keycloak.ports[0].containerPort | int | `8080` |  |
| keycloak.ports[0].name | string | `"http"` |  |
| keycloak.ports[0].protocol | string | `"TCP"` |  |
| keycloak.ports[0].servicePort | int | `80` |  |
| keycloak.ports[1].appProtocol | string | `"http"` |  |
| keycloak.ports[1].containerPort | int | `9000` |  |
| keycloak.ports[1].name | string | `"management"` |  |
| keycloak.ports[1].protocol | string | `"TCP"` |  |
| keycloak.ports[1].servicePort | int | `9000` |  |
| keycloak.readinessProbe | string | `nil` | raw readiness probe overrides for user |
| keycloak.readinessProbeDefault | object | `{"httpGet":{"path":"/health/ready","port":"management"}}` | default readiness probe if not specified by user |
| keycloak.readinessProbeEnabled | bool | `true` | enable or disable readiness probe entirely |
| keycloak.replicaCount | int | `1` |  |
| keycloak.resources | string | `nil` | raw resources block overrides for user |
| keycloak.resourcesDefault | object | `{"limits":{"memory":"1.75Gi"},"requests":{"cpu":"350m"}}` | default resources if not specified by user |
| keycloak.resourcesEnabled | bool | `true` | enable or disable resources entirely |
| keycloak.restartPolicy | string | `"Always"` |  |
| keycloak.runtimeClassName | string | `nil` |  |
| keycloak.secrets | list | `[]` |  |
| keycloak.securityContext | object | `{}` | securityContext for consumer overrides |
| keycloak.securityContextDefault | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":false,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}` | default securityContext if none specified |
| keycloak.securityContextEnabled | bool | `true` | enable or disable securityContext entirely |
| keycloak.service.type | string | `"ClusterIP"` |  |
| keycloak.serviceAccount.annotations | object | `{}` |  |
| keycloak.serviceAccount.automount | bool | `true` |  |
| keycloak.serviceAccount.create | bool | `true` |  |
| keycloak.serviceAccount.name | string | `""` |  |
| keycloak.startupProbe | string | `nil` | raw startup probe overrides for user |
| keycloak.startupProbeDefault | object | `{"httpGet":{"path":"/health/started","port":"management"}}` | default startup probe if not specified by user |
| keycloak.startupProbeEnabled | bool | `true` | enable or disable startup probe entirely |
| keycloak.sts.enabled | bool | `false` |  |
| keycloak.sts.updateStrategy | string | `"RollingUpdate"` |  |
| keycloak.tolerations | list | `[]` |  |
| keycloak.topologySpreadConstraints | list | `[]` |  |
| keycloak.volumeMounts | list | `[]` |  |
| keycloak.volumes | list | `[]` |  |
| postgres.enabled | bool | `true` |  |
| postgres.postgres.env[0].name | string | `"PGDATA"` |  |
| postgres.postgres.env[0].value | string | `"/var/lib/postgresql/data/pgdata"` |  |
| postgres.postgres.env[1].name | string | `"PGPORT"` |  |
| postgres.postgres.env[1].value | string | `"5432"` |  |
| postgres.postgres.env[2].name | string | `"POSTGRES_DB"` |  |
| postgres.postgres.env[2].value | string | `"keycloak"` |  |
| postgres.postgres.env[3].name | string | `"POSTGRES_USER"` |  |
| postgres.postgres.env[3].value | string | `"keycloak"` |  |
| postgres.postgres.env[4].name | string | `"POSTGRES_PASSWORD"` |  |
| postgres.postgres.env[4].value | string | `"keycloak"` |  |
| postgres.postgres.env[5].name | string | `"POSTGRES_HOST_AUTH_METHOD"` |  |
| postgres.postgres.env[5].value | string | `"scram-sha-256"` |  |
| postgres.postgres.env[6].name | string | `"POSTGRES_INITDB_ARGS"` |  |
| postgres.postgres.env[6].value | string | `"--auth-host=scram-sha-256"` |  |
| postgres.postgres.fullnameOverride | string | `"postgres"` |  |

# Changelog

## 0.4.0

- (Breaking) Enabled keycloak health endpoints by default, and swapped default status probes to them.
- (Breaking) Disable verbose logging by default.

## 0.2.0

- Changed all probes from `/` to `/realm/master` by default.
- Changed default resources to 1.75Gi memory and 350m cpu, to match more realistic needs.
- Changed auto-scaling to be max 5 by default, as 100 is obscene.

