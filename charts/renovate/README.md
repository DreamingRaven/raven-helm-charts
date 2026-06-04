# renovate

A Helm chart for Kubernetes

![Version: 0.6.0](https://img.shields.io/badge/Version-0.6.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 39-full](https://img.shields.io/badge/AppVersion-39--full-informational?style=flat-square)

## Installing the Chart

### Install via OCI helm registry

To install the chart with the release name `renovate`, run the following commands.
For a list of all available charts and versions see the [container registry](https://gitlab.com/GeorgeRaven/raven-helm-charts/container_registry)

To pull the latest version without authentication:

```console
helm install renovate oci://registry.gitlab.com/georgeraven/raven-helm-charts/renovate
```

With authentication:

```console
helm registry login registry.gitlab.com -u <USERNAME> -p <GITLAB_TOKEN>
helm install renovate oci://registry.gitlab.com/georgeraven/raven-helm-charts/renovate --version 0.6.0
```

### As a helm dependency

You can also opt to directly reference this chart as a helm dependency defined in your `Chart.yaml`:

```yaml
dependencies:
- name: renovate
  version: 0.6.0
  repository: "oci://registry.gitlab.com/georgeraven/raven-helm-charts"
  # alias: <THE_NAME_YOU_WANT_TO_GIVE_THE_CHART> # optional for more advanced use-cases
  # condition: renovate.enabled # optional for more advanced use-cases
```

Then you should pull the chart with the following command:

```console
helm dependency update <PATH_TO_YOUR_CHART_DIR>
```

Which should automatically fetch the chart, update your lockfile, etc.

### Install via Helm index.yaml (deprecated method since: 2025-03-24)

To install the chart with the release name `renovate`, run the following commands:

```console
$ helm repo add raven https://gitlab.com/api/v4/projects/55284972/packages/helm/stable
$ helm repo update raven
$ helm install renovate raven/renovate
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://registry.gitlab.com/georgeraven/raven-helm-charts | renovate(corvid-app) | 0.17.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| renovate.affinity | object | `{}` |  |
| renovate.args | string | `nil` |  |
| renovate.autoscaling.behavior | object | `{}` | HPA behavior settings (included in keda ScaledObject if enabled) |
| renovate.autoscaling.enabled | bool | `false` | enable or disable autoscaling (settings are re-used if keda is enabled) |
| renovate.autoscaling.maxReplicas | int | `5` | maximum number of replicas to scale to |
| renovate.autoscaling.minReplicas | int | `1` | minimum number of replicas to scale to |
| renovate.autoscaling.targetCPUUtilizationPercentage | int | `80` | sets targetCPUUtilizationPercentage resource utilization of HPA |
| renovate.command | string | `nil` |  |
| renovate.cron.backoffLimit | int | `1` |  |
| renovate.cron.concurrencyPolicy | string | `"Replace"` |  |
| renovate.cron.enabled | bool | `true` | enable or disable cronjob |
| renovate.cron.failedJobsHistoryLimit | int | `2` |  |
| renovate.cron.schedule | string | `"@hourly"` | schedule for cronjob using Cron syntax https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/#schedule-syntax |
| renovate.cron.successfulJobsHistoryLimit | int | `1` |  |
| renovate.cron.suspend | bool | `false` | cronjob will not trigger on schedule but can be manually triggered |
| renovate.deployment.enabled | bool | `false` |  |
| renovate.deployment.strategy | string | `""` | rollout strategy `Recreate` or `RollingUpdate` this chart defaults to Recreate only if we detect a single replica with a volume |
| renovate.dnsConfig | object | `{}` |  |
| renovate.dnsPolicy | string | `""` |  |
| renovate.env | list | `[{"name":"RENOVATE_BASE_DIR","value":"/tmp/renovate/"},{"name":"RENOVATE_CONFIG_FILE","value":"/opt/renovate/config.json"}]` | Raw helm environment variable settings for static or dynamic values |
| renovate.envFrom | list | `[{"secretRef":{"name":"renovate","optional":false}}]` | Raw container envFrom https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/#container-v1-core |
| renovate.fullnameOverride | string | `""` | Full name override |
| renovate.httpRoute.annotations | object | `{}` |  |
| renovate.httpRoute.enabled | bool | `false` |  |
| renovate.httpRoute.exposedPorts[0].number | int | `80` |  |
| renovate.httpRoute.hostnames[0] | string | `"corvid.org.example"` |  |
| renovate.httpRoute.parentRefs[0].name | string | `"my-gateway"` |  |
| renovate.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| renovate.image.registry | string | `"ghcr.io"` | Image container registry |
| renovate.image.repository | string | `"renovatebot/renovate"` | Image repository |
| renovate.image.tag | string | `"43-full@sha256:ab564a1a7c94dd1a45aa1f28c4eaa48f831ec4782f1928b767a4cec5fd80d702"` | Overrides the image tag whose default is the chart appVersion. |
| renovate.imagePullSecrets | list | `[]` | Image pull secrets |
| renovate.initContainers | list | `[]` |  |
| renovate.livenessProbe | string | `nil` | raw liveness probe overrides for user |
| renovate.livenessProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default liveness probe if not specified by user |
| renovate.livenessProbeEnabled | bool | `false` | enable or disable liveness probe entirely |
| renovate.nameOverride | string | `""` | Partial name override |
| renovate.netpol.enabled | bool | `true` |  |
| renovate.nodeSelector | object | `{}` |  |
| renovate.persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| renovate.persistence.defaultVolumeMounts[0].mountPath | string | `"/data/"` |  |
| renovate.persistence.defaultVolumeMounts[0].name | string | `"data"` |  |
| renovate.persistence.defaultVolumeMounts[0].subPath | string | `"data"` |  |
| renovate.persistence.enabled | bool | `false` |  |
| renovate.persistence.existingClaim | string | `""` |  |
| renovate.persistence.size | string | `"8Gi"` |  |
| renovate.podAnnotations | object | `{}` | Pod annotations |
| renovate.podLabels | object | `{}` |  |
| renovate.podSecurityContext | object | `{}` | podSecurityContext for consumer overrides |
| renovate.podSecurityContextDefault | object | `{"fsGroup":1000}` | default podSecurityContext if none specified |
| renovate.podSecurityContextEnabled | bool | `true` | enable or disable podSecurityContext entirely |
| renovate.ports | list | `[{"appProtocol":"http","containerPort":8080,"name":"http","protocol":"TCP","servicePort":80}]` | Ports to expose, tie to the service, and ingress |
| renovate.readinessProbe | string | `nil` | raw readiness probe overrides for user |
| renovate.readinessProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default readiness probe if not specified by user |
| renovate.readinessProbeEnabled | bool | `false` | enable or disable readiness probe entirely |
| renovate.replicaCount | int | `1` | Server deployment replica count |
| renovate.resources | string | `nil` | raw resources block overrides for user |
| renovate.resourcesDefault | object | `{"limits":{"memory":"128Mi"},"requests":{"cpu":"100m"}}` | default resources if not specified by user |
| renovate.resourcesEnabled | bool | `false` | enable or disable resources entirely |
| renovate.restartPolicy | string | `"Always"` |  |
| renovate.runtimeClassName | string | `nil` |  |
| renovate.secrets | list | `[]` | A list of secrets with a list of keys to turn into environment variables, these take precedence over everything else |
| renovate.securityContext | object | `{}` | securityContext for consumer overrides |
| renovate.securityContextDefault | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}` | default securityContext if none specified |
| renovate.securityContextEnabled | bool | `true` | enable or disable securityContext entirely |
| renovate.service.annotations | object | `{}` |  |
| renovate.service.enabled | bool | `true` |  |
| renovate.service.type | string | `"ClusterIP"` | Service type |
| renovate.service.type | string | `"ClusterIP"` |  |
| renovate.serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| renovate.serviceAccount.automount | bool | `true` |  |
| renovate.serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| renovate.serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| renovate.startupProbe | string | `nil` | raw startup probe overrides for user |
| renovate.startupProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default startup probe if not specified by user |
| renovate.startupProbeEnabled | bool | `false` | enable or disable startup probe entirely |
| renovate.sts.enabled | bool | `false` |  |
| renovate.sts.updateStrategy | string | `"RollingUpdate"` |  |
| renovate.tolerations | list | `[]` |  |
| renovate.volumeMounts | list | `[]` |  |
| renovate.volumes | list | `[]` |  |

# Changelog

## 0.6.0

This is a major potentially breaking change.
This updates the backing corvid all the way from 0.13 to 0.17.
This means new defaults, new features, and new behaviors as per corvid changes.

This also however means more locked down deployment manifests.
I have made a best effort to maintain as much backwards compatibility where reasonable to do so, however in particular the new security context and pod security policies may cause issues.
These should be easy to work around, but will need some manual checking after updating, that everything is still working.

## 0.3.0

This changes the behavior of the retries and historic resources.
While this likely does not affect most users in any substantive manner, I have marked it as a minor change because it does change the default retry behavior.

## 0.2.1

Added backwards compatible change to image source.
This now sources from ghcr instead of dockerhub.

```yaml
image:
  registry: ghcr.io
  repository: renovatebot/renovate
  pullPolicy: IfNotPresent
  tag: "39-full"
```

