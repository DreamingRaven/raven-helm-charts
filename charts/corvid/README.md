# corvid

Common helm component and utility library

![Version: 0.8.0](https://img.shields.io/badge/Version-0.8.0-informational?style=flat-square) ![Type: library](https://img.shields.io/badge/Type-library-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

This library chart primarily deals with abstracting common boilerplate into customisable components for re-use.

## Installing the Chart

To install the chart with the release name `corvid`, run the following commands:

```console
$ helm repo add raven https://gitlab.com/api/v4/projects/55284972/packages/helm/stable
$ helm repo update raven
$ helm install corvid raven/corvid
```

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
| envFrom[0].configMapRef.name | string | `"someConfigMap"` |  |
| envFrom[0].configMapRef.optional | bool | `false` |  |
| envFrom[1].secretRef.name | string | `"someSecret"` |  |
| envFrom[1].secretRef.optional | bool | `false` |  |
| env[0].name | string | `"CORVID_EXAMPLE_VARIABLE"` |  |
| env[0].value | string | `"false"` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"bitnami/kubectl"` |  |
| image.tag | string | `"1.31.1"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"corvid.org.example"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| initContainers | string | `nil` |  |
| livenessProbe.httpGet.path | string | `"/"` |  |
| livenessProbe.httpGet.port | string | `"http"` |  |
| nameOverride | string | `""` |  |
| netpol.enabled | bool | `true` |  |
| nodeSelector | object | `{}` |  |
| persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistence.enabled | bool | `true` |  |
| persistence.existingClaim | string | `""` |  |
| persistence.size | string | `"8Gi"` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| ports[0].containerPort | int | `8080` |  |
| ports[0].name | string | `"http"` |  |
| ports[0].protocol | string | `"TCP"` |  |
| ports[0].servicePort | int | `80` |  |
| readinessProbe.httpGet.path | string | `"/"` |  |
| readinessProbe.httpGet.port | string | `"http"` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| runtimeClassName | string | `nil` |  |
| schedule | string | `"@midnight"` |  |
| secrets | list | `[]` |  |
| securityContext | object | `{}` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |
| volumeMounts | list | `[]` |  |
| volumes | list | `[]` |  |

## Changelog

### 0.8.0

This release adds dnsPolicy and dnsConfig to the podSpec template.
This is backwards compatible since this will be ignored if the values do not exist.
To use this new template you can do something akin to the following as per your needs:

```yaml
dnsPolicy: "None"
dnsConfig:
	nameservers:
	- 1.1.1.1
	options:
	- name: ndots
	  value: "1"
```

However this should only be used if you know what you are doing, there are very specific cases where this might be required.
One such instance is VPNs in containers.
Otherwise it should be left empty:

```yaml
dnsPolicy: ""
dnsConfig: {}
```

see: https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/#pod-s-dns-policy

### 0.7.1

This release adds previously missing inbuilt startup probe configuration.
This is backwards compatible since no changes to values.yaml and it does not change the default behaviour.

To add a startup probe you can add the following to your values.yaml for the most basic startup probe:

```yaml
startupProbe:
	httpGet:
		path: /
		port: http # the port name if it is not call http
```

### 0.7.0

This release introduces a daemonset template. This is backwards compatible since no changes to values.yaml. If you would like to use this new template you can do something akin to the following. Replace ``corvid-test`` with your charts name:

```yaml
{{- define "corvid-test.daemonset" }}
# your daemonset overrides here
{{- end }}
{{- include "corvid.daemonset" (list . "corvid-test.daemonset") }}
```

### 0.6.5

This release introduces existingClaim persistence for the podSpec template. Thus this effects almost all usages, but only if ``.persistence.existingClaim`` is set.

By default please add the following to your values.yaml, although this is not required:

```yaml
persistence:
	existingClaim: ""
```

No changes are required in the templating itself, this is backwards compatible.

### 0.6.4

This release of corvid introduces CronJob templates. This is backwards compatible since the only new variables are part of a new template altogether to define a CronJob.
Any users seeking to invoke this new CronJob will need to add the following to their values.yaml:

```yaml
schedule: "@midnight" # or some other cron schedule, try: https://crontab.guru/
```

They will also need to invoke this new template in their templates (substituting ``corvid-test`` for their chart name):

```yaml
{{- define "corvid-test.cronjob" -}}
# your cronjob overrides here
{{- end -}}
{{- include "corvid.cronjob" (list . "corvid-test.cronjob") -}}
```

This is backwards compatible.

