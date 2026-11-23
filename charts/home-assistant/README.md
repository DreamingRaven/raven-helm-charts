# home-assistant

A Helm chart for Kubernetes

![Version: 0.21.0](https://img.shields.io/badge/Version-0.21.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2026.11.2](https://img.shields.io/badge/AppVersion-2026.11.2-informational?style=flat-square)

## Installing the Chart

### Install via OCI helm registry

To install the chart with the release name `home-assistant`, run the following commands.
For a list of all available charts and versions see the [container registry](https://gitlab.com/GeorgeRaven/raven-helm-charts/container_registry)

To pull the latest version without authentication:

```console
helm install home-assistant oci://registry.gitlab.com/georgeraven/raven-helm-charts/home-assistant
```

With authentication:

```console
helm registry login registry.gitlab.com -u <USERNAME> -p <GITLAB_TOKEN>
helm install home-assistant oci://registry.gitlab.com/georgeraven/raven-helm-charts/home-assistant --version 0.21.0
```

### As a helm dependency

You can also opt to directly reference this chart as a helm dependency defined in your `Chart.yaml`:

```yaml
dependencies:
- name: home-assistant
  version: 0.21.0
  repository: "oci://registry.gitlab.com/georgeraven/raven-helm-charts"
  # alias: <THE_NAME_YOU_WANT_TO_GIVE_THE_CHART> # optional for more advanced use-cases
  # condition: home-assistant.enabled # optional for more advanced use-cases
```

Then you should pull the chart with the following command:

```console
helm dependency update <PATH_TO_YOUR_CHART_DIR>
```

Which should automatically fetch the chart, update your lockfile, etc.

### Install via Helm index.yaml (deprecated method since: 2025-03-24)

To install the chart with the release name `home-assistant`, run the following commands:

```console
$ helm repo add raven https://gitlab.com/api/v4/projects/55284972/packages/helm/stable
$ helm repo update raven
$ helm install home-assistant raven/home-assistant
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://registry.gitlab.com/georgeraven/raven-helm-charts | home-assistant(corvid-app) | 0.19.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| home-assistant.affinity | object | `{}` |  |
| home-assistant.args | string | `nil` |  |
| home-assistant.autoscaling.enabled | bool | `false` |  |
| home-assistant.autoscaling.maxReplicas | int | `100` |  |
| home-assistant.autoscaling.minReplicas | int | `1` |  |
| home-assistant.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| home-assistant.command | string | `nil` |  |
| home-assistant.cron.enabled | bool | `false` | enable or disable cronjob |
| home-assistant.cron.schedule | string | `"@midnight"` | schedule for cronjob using Cron syntax https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/#schedule-syntax |
| home-assistant.cron.suspend | bool | `false` | cronjob will not trigger on schedule but can be manually triggered |
| home-assistant.deployment.enabled | bool | `true` |  |
| home-assistant.deployment.strategy | string | `""` | rollout strategy `Recreate` or `RollingUpdate` this chart defaults to Recreate only if we detect a single replica with a volume |
| home-assistant.dnsConfig | object | `{}` |  |
| home-assistant.dnsPolicy | string | `""` |  |
| home-assistant.envFrom | string | `nil` |  |
| home-assistant.env[0].name | string | `"HOME_ASSISTANT_EXAMPLE_VARIABLE"` |  |
| home-assistant.env[0].value | string | `"false"` |  |
| home-assistant.fullnameOverride | string | `""` |  |
| home-assistant.image.pullPolicy | string | `"IfNotPresent"` |  |
| home-assistant.image.registry | string | `"ghcr.io"` |  |
| home-assistant.image.repository | string | `"home-assistant/home-assistant"` |  |
| home-assistant.image.tag | string | `"2026.11.2@sha256:493a07e8f6530fc640223f4a0a5248f20a61ca2f718bb1d31efbf08a2c5ea28f"` |  |
| home-assistant.imagePullSecrets | list | `[]` |  |
| home-assistant.ingress.annotations | object | `{}` |  |
| home-assistant.ingress.className | string | `""` |  |
| home-assistant.ingress.enabled | bool | `false` |  |
| home-assistant.ingress.hosts[0].host | string | `"ha.org.example"` |  |
| home-assistant.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| home-assistant.ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| home-assistant.ingress.tls | list | `[]` |  |
| home-assistant.initContainers | list | `[]` |  |
| home-assistant.livenessProbe | string | `nil` | raw liveness probe overrides for user |
| home-assistant.livenessProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default liveness probe if not specified by user |
| home-assistant.livenessProbeEnabled | bool | `true` | enable or disable liveness probe entirely |
| home-assistant.nameOverride | string | `""` |  |
| home-assistant.netpol.enabled | bool | `true` |  |
| home-assistant.nodeSelector | object | `{}` |  |
| home-assistant.persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| home-assistant.persistence.enabled | bool | `false` |  |
| home-assistant.persistence.existingClaim | string | `""` |  |
| home-assistant.persistence.size | string | `"8Gi"` |  |
| home-assistant.podAnnotations | object | `{}` |  |
| home-assistant.podLabels | object | `{}` |  |
| home-assistant.podSecurityContext | object | `{}` | podSecurityContext for consumer overrides |
| home-assistant.podSecurityContextDefault | object | `{"fsGroup":1000}` | default podSecurityContext if none specified |
| home-assistant.podSecurityContextEnabled | bool | `true` | enable or disable podSecurityContext entirely |
| home-assistant.ports[0].containerPort | int | `8123` |  |
| home-assistant.ports[0].name | string | `"http"` |  |
| home-assistant.ports[0].protocol | string | `"TCP"` |  |
| home-assistant.ports[0].servicePort | int | `80` |  |
| home-assistant.readinessProbe | string | `nil` | raw readiness probe overrides for user |
| home-assistant.readinessProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default readiness probe if not specified by user |
| home-assistant.readinessProbeEnabled | bool | `true` | enable or disable readiness probe entirely |
| home-assistant.replicaCount | int | `1` |  |
| home-assistant.resources | string | `nil` | raw resources block overrides for user |
| home-assistant.resourcesDefault | object | `{"limits":{"memory":"500Mi"},"requests":{"cpu":"100m"}}` | default resources if not specified by user |
| home-assistant.resourcesEnabled | bool | `true` | enable or disable resources entirely |
| home-assistant.restartPolicy | string | `"Always"` |  |
| home-assistant.runtimeClassName | string | `nil` |  |
| home-assistant.secrets | list | `[]` |  |
| home-assistant.securityContext | object | `{}` | securityContext for consumer overrides |
| home-assistant.securityContextDefault | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":false,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}` | default securityContext if none specified |
| home-assistant.securityContextEnabled | bool | `true` | enable or disable securityContext entirely |
| home-assistant.service.annotations | object | `{}` |  |
| home-assistant.service.enabled | bool | `true` |  |
| home-assistant.service.type | string | `"ClusterIP"` |  |
| home-assistant.serviceAccount.annotations | object | `{}` |  |
| home-assistant.serviceAccount.automount | bool | `true` |  |
| home-assistant.serviceAccount.create | bool | `true` |  |
| home-assistant.serviceAccount.name | string | `""` |  |
| home-assistant.startupProbe | string | `nil` | raw startup probe overrides for user |
| home-assistant.startupProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default startup probe if not specified by user |
| home-assistant.startupProbeEnabled | bool | `true` | enable or disable startup probe entirely |
| home-assistant.tolerations | list | `[]` |  |
| home-assistant.volumeMounts[0].mountPath | string | `"/config/configuration.yaml"` |  |
| home-assistant.volumeMounts[0].name | string | `"config"` |  |
| home-assistant.volumeMounts[0].subPath | string | `"configuration.yaml"` |  |
| home-assistant.volumes[0].name | string | `"config"` |  |
| home-assistant.volumes[0].secret.defaultMode | int | `420` |  |
| home-assistant.volumes[0].secret.items[0].key | string | `"configuration.yaml"` |  |
| home-assistant.volumes[0].secret.items[0].path | string | `"configuration.yaml"` |  |
| home-assistant.volumes[0].secret.secretName | string | `"ha"` |  |

# Changelog

## 0.21.0 (corvid-app 0.19.0)

BREAKING CHANGE!

This release converts the chart to use corvid-app as the base.
This should change very little for the end user, except you will need to indent your values under home-assistant.

I.E the values are now as follows:
```yaml
home-assistant:
  ## @param replicaCount [string] Server deployment replica count
  replicaCount: 1

  image:
    ## @param image.registry [string] Image container registry
    registry: ghcr.io
    ## @param image.repository [string] Image repository
    repository: home-assistant/home-assistant
    ## @param image.pullPolicy [string] Image pull policy
    pullPolicy: IfNotPresent
```

If you do not indent under this new key, your values will not be applied, and you will likely get a broken deployment.

## 0.7.0

Added default volume and volumemount for a secret which should contain the home assistant configuration.

This will be made optional in a further patch, however if you override volumes and mounts this wont affect you currently.

## 0.6.0

DO NOT UPGRADE TO THIS UNLESS YOU HAVE A BACKUP OF YOUR DATA.

This change overhauled this chart to make use of the common corvid chart.
This brings multiple new features, but also completely broke some older conventions, and I am keen to rip off the bandaid too rather than introduce many smaller breaking changes, to take advantage of the relatively few people using this chart at this stage.

