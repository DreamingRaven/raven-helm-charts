# Changelog

## 0.9.0

This release adds default probe functionality. To enable me to create default probes without restricting the end user from either disabling them or overriding them as they see fit.
This is not backwards compatible because startupProbeEnabled is required to enable or disable probe functionality in all cases.

The idea for this feature comes from similar charts, like those bitnami create.

These new keys in the values.yaml are:

- startupProbeEnabled (bool)
- startupProbeDefault (map)
- livenessProbeEnabled (bool)
- livenessProbeDefault (map)
- readinessProbeEnabled (bool)
- readinessProbeDefault (map)
- resourcesEnabled (bool)
- resourcesDefault (map)

The recommended configuration is to enable all probes by default with reasonable values, and to enable resources.
This will use whatever you set as the default resources unless the user specifically overrides them.
When the user sets any key, all default values will be ignored using only the user provided keys.
This might look something akin to the following:

```yaml

# -- enable or disable resources entirely
resourcesEnabled: true
# -- default resources if not specified by user
resourcesDefault:
  limits:
    memory: 128Mi
  requests:
    cpu: 100m
# -- raw resources block overrides for user
resources:
  # limits:
  #   memory: 128Mi
  # requests:
  #   cpu: 100m

# -- enable or disable startup probe entirely
startupProbeEnabled: true
# -- default startup probe if not specified by user
startupProbeDefault:
  httpGet:
    path: /
    port: http
# -- raw startup probe overrides for user
startupProbe:
  # httpGet:
  #   path: /
  #   port: http

# -- enable or disable liveness probe entirely
livenessProbeEnabled: true
# -- default liveness probe if not specified by user
livenessProbeDefault:
  httpGet:
    path: /
    port: http
# -- raw liveness probe overrides for user
livenessProbe:
  # httpGet:
  #   path: /
  #   port: http

# -- enable or disable readiness probe entirely
readinessProbeEnabled: true
# -- default readiness probe if not specified by user
readinessProbeDefault:
  httpGet:
    path: /
    port: http
# -- raw readiness probe overrides for user
readinessProbe:
  # httpGet:
  #   path: /
  #   port: http

```

## 0.8.0

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

## 0.7.1

This release adds previously missing inbuilt startup probe configuration.
This is backwards compatible since no changes to values.yaml and it does not change the default behaviour.

To add a startup probe you can add the following to your values.yaml for the most basic startup probe:

```yaml
startupProbe:
	httpGet:
		path: /
		port: http # the port name if it is not call http
```

## 0.7.0

This release introduces a daemonset template. This is backwards compatible since no changes to values.yaml. If you would like to use this new template you can do something akin to the following. Replace ``corvid-test`` with your charts name:

```yaml
{{- define "corvid-test.daemonset" }}
# your daemonset overrides here
{{- end }}
{{- include "corvid.daemonset" (list . "corvid-test.daemonset") }}
```

## 0.6.5

This release introduces existingClaim persistence for the podSpec template. Thus this effects almost all usages, but only if ``.persistence.existingClaim`` is set.

By default please add the following to your values.yaml, although this is not required:

```yaml
persistence:
	existingClaim: ""
```

No changes are required in the templating itself, this is backwards compatible.

## 0.6.4

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
