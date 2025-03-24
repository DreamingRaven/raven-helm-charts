# corvid-app

A Helm chart for Kubernetes

![Version: 0.10.2](https://img.shields.io/badge/Version-0.10.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

This chart acts as an application abstraction layer so that the corvid library can be dropped in and used, even without the boilerplate templates!

You can use this chart to create an arbitrary number of applications even in one helm chart by clever exploitation of helm aliases.

Consider the following `Chart.yaml` dependencies section

```yaml
dependencies:
- alias: api
  condition: api.enabled
  name: corvid-app
  version: 0.9.0 # change to be latest corvid-app version
  repository: "https://gitlab.com/api/v4/projects/55284972/packages/helm/stable"
- alias: web
  condition: web.enabled
  name: corvid-app
  version: 0.9.0 # change to be latest corvid-app version
  repository: "https://gitlab.com/api/v4/projects/55284972/packages/helm/stable"
```

Using the alias function we can rename corvid-app to suit whatever app name we want it to become.
We can then override settings in values.yaml using the aliases name:

```yaml
api:
	image:
	  registry: registry.example.org
	  repository: foo/someapi
	  tag: ""
	deployment:
		enabled: true
	cron:
		enabled: false
	job:
		enabled: false
	daemonset:
		enabled: false
web:
	image:
	  registry: registry.example.org
	  repository: foo/somefrontend
	  tag: ""
	deployment:
		enabled: true
	cron:
		enabled: false
	job:
		enabled: false
	daemonset:
		enabled: false
```

Now we have a chart with no templates, creating very different applications with only `values.yaml` and `Chart.yaml`. This can be a very quick way to prototype a new application.
Thus this can expedite the development process, as long as all you need fits in the confines of what is configurable in a corvid-app. Otherwise you will still prefer to use corvid directly for the possibility to override functionality to any desired level. You may find you start with a corvid-app, but then as your needs expand and you can warrant more time investment you will likely progress to creating your own corvid-app implementation for your specific needs using the corvid library directly just as the corvid-app does.

## Installing the Chart

### Install via OCI helm registry

To install the chart with the release name `corvid-app`, run the following commands.
For a list of all available charts and versions see the [container registry](https://gitlab.com/GeorgeRaven/raven-helm-charts/container_registry)

To pull the latest version without authentication:

```console
helm install corvid-app oci://registry.gitlab.com/georgeraven/raven-helm-charts/corvid-app
```

With authentication:

```console
helm registry login registry.gitlab.com -u <USERNAME> -p <GITLAB_TOKEN>
helm install corvid-app oci://registry.gitlab.com/georgeraven/raven-helm-charts/corvid-app --version 0.10.2
```

### Install via Helm index.yaml (deprecated method since: 2025-03-24)

To install the chart with the release name `corvid-app`, run the following commands:

```console
$ helm repo add raven https://gitlab.com/api/v4/projects/55284972/packages/helm/stable
$ helm repo update raven
$ helm install corvid-app raven/corvid-app
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../corvid | corvid | 0.13.1 |

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
| cron.enabled | bool | `true` | enable or disable cronjob |
| cron.schedule | string | `"@midnight"` | schedule for cronjob using Cron syntax https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/#schedule-syntax |
| cron.suspend | bool | `false` | cronjob will not trigger on schedule but can be manually triggered |
| daemonset.enabled | bool | `true` |  |
| deployment.enabled | bool | `true` |  |
| deployment.strategy | string | `""` | rollout strategy `Recreate` or `RollingUpdate` this chart defaults to Recreate only if we detect a single replica with a volume |
| dnsConfig | object | `{}` |  |
| dnsPolicy | string | `""` |  |
| envFrom | string | `nil` |  |
| env[0].name | string | `"corvid-app_EXAMPLE_VARIABLE"` |  |
| env[0].value | string | `"false"` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"corvid-app/corvid-app"` |  |
| image.tag | string | `"0.10.2"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"corvid-app.org.example"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| initContainers | list | `[]` |  |
| job.enabled | bool | `true` |  |
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
| podSecurityContextDefault | object | `{"fsGroup":1000}` | default podSecurityContext if none specified |
| podSecurityContextEnabled | bool | `true` | enable or disable podSecurityContext entirely |
| ports[0].appProtocol | string | `"http"` |  |
| ports[0].containerPort | int | `8080` |  |
| ports[0].name | string | `"http"` |  |
| ports[0].protocol | string | `"TCP"` |  |
| ports[0].servicePort | int | `80` |  |
| readinessProbe | string | `nil` | raw readiness probe overrides for user |
| readinessProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default readiness probe if not specified by user |
| readinessProbeEnabled | bool | `true` | enable or disable readiness probe entirely |
| replicaCount | int | `1` |  |
| resources | string | `nil` | raw resources block overrides for user |
| resourcesDefault | object | `{"limits":{"memory":"128Mi"},"requests":{"cpu":"100m"}}` | default resources if not specified by user |
| resourcesEnabled | bool | `true` | enable or disable resources entirely |
| restartPolicy | string | `"Always"` |  |
| runtimeClassName | string | `nil` |  |
| secrets | list | `[]` |  |
| securityContext | object | `{}` | securityContext for consumer overrides |
| securityContextDefault | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}` | default securityContext if none specified |
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
| topologySpreadConstraints | list | `[]` |  |
| volumeMounts | list | `[]` |  |
| volumes | list | `[]` |  |

