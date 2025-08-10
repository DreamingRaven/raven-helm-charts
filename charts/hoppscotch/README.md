# hoppscotch

A Helm chart for Kubernetes

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

## Installing the Chart

### Install via OCI helm registry

To install the chart with the release name `hoppscotch`, run the following commands.
For a list of all available charts and versions see the [container registry](https://gitlab.com/GeorgeRaven/raven-helm-charts/container_registry)

To pull the latest version without authentication:

```console
helm install hoppscotch oci://registry.gitlab.com/georgeraven/raven-helm-charts/hoppscotch
```

With authentication:

```console
helm registry login registry.gitlab.com -u <USERNAME> -p <GITLAB_TOKEN>
helm install hoppscotch oci://registry.gitlab.com/georgeraven/raven-helm-charts/hoppscotch --version 0.1.0
```

### As a helm dependency

You can also opt to directly reference this chart as a helm dependency defined in your `Chart.yaml`:

```yaml
dependencies:
- name: hoppscotch
  version: 0.1.0
  repository: "oci://registry.gitlab.com/georgeraven/raven-helm-charts"
  # alias: <THE_NAME_YOU_WANT_TO_GIVE_THE_CHART> # optional for more advanced use-cases
  # condition: hoppscotch.enabled # optional for more advanced use-cases
```

Then you should pull the chart with the following command:

```console
helm dependency update <PATH_TO_YOUR_CHART_DIR>
```

Which should automatically fetch the chart, update your lockfile, etc.

### Install via Helm index.yaml (deprecated method since: 2025-03-24)

To install the chart with the release name `hoppscotch`, run the following commands:

```console
$ helm repo add raven https://gitlab.com/api/v4/projects/55284972/packages/helm/stable
$ helm repo update raven
$ helm install hoppscotch raven/hoppscotch
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://registry.gitlab.com/georgeraven/raven-helm-charts | frontend(corvid-app) | 0.16.1 |
| oci://registry.gitlab.com/georgeraven/raven-helm-charts | admin(corvid-app) | 0.16.1 |
| oci://registry.gitlab.com/georgeraven/raven-helm-charts | backend(corvid-app) | 0.16.1 |
| oci://registry.gitlab.com/georgeraven/raven-helm-charts | migrate(corvid-app) | 0.16.1 |
| oci://registry.gitlab.com/georgeraven/raven-helm-charts | postgres | 0.2.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| admin.enabled | bool | `false` |  |
| admin.image.registry | string | `"docker.io"` |  |
| admin.image.repository | string | `"hoppscotch/hoppscotch"` |  |
| admin.image.tag | string | `"2025.7.1"` |  |
| backend.enabled | bool | `true` |  |
| backend.image.registry | string | `"docker.io"` |  |
| backend.image.repository | string | `"hoppscotch/hoppscotch"` |  |
| backend.image.tag | string | `"2025.7.1"` |  |
| exampleSecret.enabled | bool | `true` |  |
| exampleSecret.name | string | `"hoppscotch"` |  |
| frontend.enabled | bool | `false` |  |
| frontend.image.registry | string | `"docker.io"` |  |
| frontend.image.repository | string | `"hoppscotch/hoppscotch"` |  |
| frontend.image.tag | string | `"2025.7.1"` |  |
| migrate.command[0] | string | `"/bin/sh"` |  |
| migrate.command[1] | string | `"-c"` |  |
| migrate.command[2] | string | `"export DATABASE_URL=${DATABASE_URL:-\"postgres://${DATABASE_USER}:${DATABASE_PASSWORD}@${DATABASE_HOST}:${DATABASE_PORT}/${DATABASE_NAME}\"}\necho \"Attempting to migrate database... '${DATABASE_HOST}:${DATABASE_PORT}/${DATABASE_NAME}' as '${DATABASE_USER}'\"\npnpx prisma migrate deploy\n"` |  |
| migrate.enabled | bool | `true` |  |
| migrate.env[0].name | string | `"DATABASE_USER"` |  |
| migrate.env[0].valueFrom.secretKeyRef.key | string | `"POSTGRES_USER"` |  |
| migrate.env[0].valueFrom.secretKeyRef.name | string | `"hoppscotch"` |  |
| migrate.env[1].name | string | `"DATABASE_PASSWORD"` |  |
| migrate.env[1].valueFrom.secretKeyRef.key | string | `"POSTGRES_PASSWORD"` |  |
| migrate.env[1].valueFrom.secretKeyRef.name | string | `"hoppscotch"` |  |
| migrate.env[2].name | string | `"DATABASE_HOST"` |  |
| migrate.env[2].valueFrom.secretKeyRef.key | string | `"POSTGRES_HOST"` |  |
| migrate.env[2].valueFrom.secretKeyRef.name | string | `"hoppscotch"` |  |
| migrate.env[3].name | string | `"DATABASE_PORT"` |  |
| migrate.env[3].valueFrom.secretKeyRef.key | string | `"POSTGRES_PORT"` |  |
| migrate.env[3].valueFrom.secretKeyRef.name | string | `"hoppscotch"` |  |
| migrate.env[4].name | string | `"DATABASE_NAME"` |  |
| migrate.env[4].valueFrom.secretKeyRef.key | string | `"POSTGRES_DB"` |  |
| migrate.env[4].valueFrom.secretKeyRef.name | string | `"hoppscotch"` |  |
| migrate.image.registry | string | `"docker.io"` |  |
| migrate.image.repository | string | `"hoppscotch/hoppscotch"` |  |
| migrate.image.tag | string | `"2025.7.1"` |  |
| migrate.job.annotations."helm.sh/hook" | string | `"post-install,post-upgrade"` |  |
| migrate.job.annotations."helm.sh/hook-delete-policy" | string | `"before-hook-creation"` |  |
| migrate.job.annotations."helm.sh/hook-weight" | string | `"-1"` |  |
| migrate.job.enabled | bool | `true` |  |
| migrate.netpol.enabled | bool | `true` |  |
| migrate.resourcesDefault.limits.memory | string | `"1Gi"` |  |
| migrate.resourcesDefault.requests.cpu | string | `"100m"` |  |
| migrate.volumeMounts[0].mountPath | string | `"/.cache"` |  |
| migrate.volumeMounts[0].name | string | `"scratch"` |  |
| migrate.volumeMounts[0].subPath | string | `"cache"` |  |
| migrate.volumeMounts[1].mountPath | string | `"/.local"` |  |
| migrate.volumeMounts[1].name | string | `"scratch"` |  |
| migrate.volumeMounts[1].subPath | string | `"local"` |  |
| migrate.volumeMounts[2].mountPath | string | `"/tmp"` |  |
| migrate.volumeMounts[2].name | string | `"scratch"` |  |
| migrate.volumeMounts[2].subPath | string | `"tmp"` |  |
| migrate.volumes[0].emptyDir | object | `{}` |  |
| migrate.volumes[0].name | string | `"scratch"` |  |
| postgres.enabled | bool | `true` |  |
| postgres.env[0].name | string | `"PGDATA"` |  |
| postgres.env[0].value | string | `"/var/lib/postgresql/data/pgdata"` |  |
| postgres.env[1].name | string | `"PGPORT"` |  |
| postgres.env[1].valueFrom.secretKeyRef.key | string | `"POSTGRES_PORT"` |  |
| postgres.env[1].valueFrom.secretKeyRef.name | string | `"hoppscotch"` |  |
| postgres.env[2].name | string | `"POSTGRES_DB"` |  |
| postgres.env[2].valueFrom.secretKeyRef.key | string | `"POSTGRES_DB"` |  |
| postgres.env[2].valueFrom.secretKeyRef.name | string | `"hoppscotch"` |  |
| postgres.env[3].name | string | `"POSTGRES_USER"` |  |
| postgres.env[3].valueFrom.secretKeyRef.key | string | `"POSTGRES_USER"` |  |
| postgres.env[3].valueFrom.secretKeyRef.name | string | `"hoppscotch"` |  |
| postgres.env[4].name | string | `"POSTGRES_PASSWORD"` |  |
| postgres.env[4].valueFrom.secretKeyRef.key | string | `"POSTGRES_PASSWORD"` |  |
| postgres.env[4].valueFrom.secretKeyRef.name | string | `"hoppscotch"` |  |
| postgres.env[5].name | string | `"POSTGRES_HOST_AUTH_METHOD"` |  |
| postgres.env[5].value | string | `"scram-sha-256"` |  |
| postgres.env[6].name | string | `"POSTGRES_INITDB_ARGS"` |  |
| postgres.env[6].value | string | `"--auth-host=scram-sha-256"` |  |
| postgres.postgres.fullnameOverride | string | `"postgres"` |  |

# Changelog

## 0.16.0 (corvid 0.18.0)

*BREAKING RELEASE*

#### What

This breaking release disables all forms of deployment by default. I.E `deployments` `daemonsets`, `statefulsets`, `jobs`, `cronjobs`

This also disables all exposure by default, other than the internal cluster service. I.E `ingress`, `httproute`

This also disables the default network policy, which can lead to confusion for users. `netpol`

This also disables the default connectivity test, which often plays no role in most charts. `test`

This means the new chart will only create 2 resources by default without being otherwise instructed:

- a default `pvc` to ensure users don't lose data
- a default `serviceAccount` due to how the podSpec defaults currently work

**We support all previous functionality, we merely make it an opt-in** for the user, which works better with helms lack of safeguards, for things like incorrect indentation.

We maintain default enablement of persistence, to prevent accidental data loss, by those not reading these changelogs.

We also maintain the default probes and resources, to provide some starting points (although we are looking to better merge overrides between `httpGet` and `exec` probes).

#### Why

The intention behind this change is to:

- Lean-in to the DIY / component based, low-abstraction approach this chart takes.
- Reduce boilerplate, as currently you have to disable all forms of deployment everywhere. This change would mean you now only have to enable the one you are interested in, whichever one that may be.
- Prevent accidentally bombing cluster resources with simultaneous deployments, daemonsets, statefulsets etc, without the willing opt-in of the user, which also confirms the user has properly mapped their values.
- Prevent accidentally exposing applications that users did not intend to be exposed.

While this is breaking, it is also very easily reverted, you need simply specifically enable the features you would like.

This also potentially means you can reduce the number of overrides you need to make in your own `values.yaml`.

#### Advised Actions

It is advised that you tweak your values.yaml to specifically enable everything you want, and rely on the defaults to keep everything else disabled.

```diff
- daemonset:
-   enabled: false
+ deployment:
+   enabled: true
- cron:
-   enabled: false
- job:
-   enabled: false
- ingress:
-   enabled: false
- service:
-   enabled: false
```

#### Backwards Compatibility

With this new change you can restore the exact old behaviour by setting the following in your `values.yaml` overrides (not advised, as not a useful default):

```yaml
daemonset:
  enabled: true
deployment:
  enabled: true
cron:
  enabled: true
job:
  enabled: true
ingress:
  enabled: true
service:
  enabled: true
test:
  enabled: true
```

## 0.15.0 (corvid 0.18.0)

This release adds backwards compatible service options, to enable disabling the service,
and add custom annotations as needed. No changes are necessary as the defaults,
match the old behaviour. The new defaults are as follows:

```yaml
service:
  enabled: true
  annotations: {}
  type: ClusterIP
```

## 0.14.0 (corvid 0.17.0)

This release truncates cronjob names from 63 to 52 characters.
This could potentially be breaking in cases where this behaviour was relied upon.
However I imagine your cronjobs were failing since they cannot be applied with more than 52 chars to k8s.

## 0.13.0 (corvid 0.16.0)

This release adds statefulset support.
This is backwards compatible and is disabled by default.

```yaml
sts:
  enabled: false
  updateStrategy: RollingUpdate
```

## 0.12.0 (corvid 0.15.0)

This adds schema validation to the values.yaml in the most basic way possible.
This should not be effectual, but will eventually become expanded to support more validation.

This also adds backwards compatible HTTPRoute support.
Since ingress is dying a slow but steady death, I have added the most basic HTTPRoute
It is advised that you add the new values to your values.yaml even if it is disabled by default:

```yaml
httpRoute:
  enabled: false
  annotations: {}
  parentRefs:
  - name: my-gateway
  hostnames:
  - "corvid.org.example"
  exposedPorts:
  - number: 80
```

This will be slowly expanded to support more features.
If you need more features sooner it is advised to bring your own HTTPRoute.

## 0.11.0 (corvid 0.14.0)

This breaking change introduces the ability to configure the default persistent volume mounts. This is more useful for packagers since this allows the packages to define the default volume mounts for others to consume.

While this does not change corvids default behaviour it does change hoppscotchs default behaviour since it issues a default data volume.

To restore this behaviour:

```yaml
persistence:
  enabled: true # corvid persistence is now false by default
  # the rest of your persistence config
  defaultVolumeMounts:
  - name: data
    mountPath: /data/
    subPath: data
```

