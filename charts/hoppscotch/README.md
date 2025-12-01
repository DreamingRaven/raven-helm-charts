# hoppscotch

Open-Source API Development Ecosystem

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
| admin.deployment.enabled | bool | `true` |  |
| admin.enabled | bool | `false` |  |
| admin.image.registry | string | `"docker.io"` |  |
| admin.image.repository | string | `"hoppscotch/hoppscotch"` |  |
| admin.image.tag | string | `"2025.10.1"` |  |
| backend.command[0] | string | `"/bin/sh"` |  |
| backend.command[1] | string | `"-c"` |  |
| backend.command[2] | string | `"export DATABASE_URL=${DATABASE_URL:-\"postgres://${POSTGRES_USER}:${POSTGRES_PASSWORD}@${POSTGRES_HOST}:${POSTGRES_PORT}/${POSTGRES_NAME}\"}\necho \"Attempting to run backend...\"\nnode prod_run.mjs\n"` |  |
| backend.deployment.enabled | bool | `true` |  |
| backend.enabled | bool | `true` |  |
| backend.envFrom[0].secretRef.name | string | `"hoppscotch"` |  |
| backend.image.registry | string | `"docker.io"` |  |
| backend.image.repository | string | `"hoppscotch/hoppscotch"` |  |
| backend.image.tag | string | `"2025.10.1"` |  |
| backend.livenessProbeDefault.httpGet.path | string | `"/health"` |  |
| backend.livenessProbeDefault.httpGet.port | string | `"http"` |  |
| backend.netpol.enabled | bool | `true` |  |
| backend.persistence.enabled | bool | `false` |  |
| backend.ports[0].appProtocol | string | `"http"` |  |
| backend.ports[0].containerPort | int | `8080` |  |
| backend.ports[0].name | string | `"http"` |  |
| backend.ports[0].protocol | string | `"TCP"` |  |
| backend.ports[0].servicePort | int | `80` |  |
| backend.readinessProbeDefault.httpGet.path | string | `"/health"` |  |
| backend.readinessProbeDefault.httpGet.port | string | `"http"` |  |
| backend.service.enabled | bool | `true` |  |
| backend.startupProbeDefault.httpGet.path | string | `"/health"` |  |
| backend.startupProbeDefault.httpGet.port | string | `"http"` |  |
| exampleSecret.enabled | bool | `true` |  |
| exampleSecret.name | string | `"hoppscotch"` |  |
| frontend.deployment.enabled | bool | `true` |  |
| frontend.enabled | bool | `true` |  |
| frontend.envFrom[0].secretRef.name | string | `"hoppscotch"` |  |
| frontend.image.registry | string | `"ghcr.io"` |  |
| frontend.image.repository | string | `"nginx/nginx-unprivileged"` |  |
| frontend.image.tag | string | `"1.28.0-alpine3.21"` |  |
| frontend.initContainers[0].command[0] | string | `"sh"` |  |
| frontend.initContainers[0].command[1] | string | `"-c"` |  |
| frontend.initContainers[0].command[2] | string | `"cp -r /site/selfhost-web/ /static/html\n# substitute localhost:3000 with the correct frontend url\n# using grep on the entire directory\ngrep -r \"localhost:3000\" /static/html -l | xargs sed -i 's|localhost:3000|localhost:8080|g'\n"` |  |
| frontend.initContainers[0].image | string | `"docker.io/hoppscotch/hoppscotch:2025.10.1"` |  |
| frontend.initContainers[0].name | string | `"hoppscotch-fe"` |  |
| frontend.initContainers[0].volumeMounts[0].mountPath | string | `"/static/"` |  |
| frontend.initContainers[0].volumeMounts[0].name | string | `"static"` |  |
| frontend.livenessProbeDefault.httpGet.path | string | `"/"` |  |
| frontend.livenessProbeDefault.httpGet.port | string | `"http"` |  |
| frontend.netpol.enabled | bool | `true` |  |
| frontend.persistence.enabled | bool | `false` |  |
| frontend.ports[0].appProtocol | string | `"http"` |  |
| frontend.ports[0].containerPort | int | `8080` |  |
| frontend.ports[0].name | string | `"http"` |  |
| frontend.ports[0].protocol | string | `"TCP"` |  |
| frontend.ports[0].servicePort | int | `80` |  |
| frontend.readinessProbeDefault.httpGet.path | string | `"/"` |  |
| frontend.readinessProbeDefault.httpGet.port | string | `"http"` |  |
| frontend.securityContextDefault.allowPrivilegeEscalation | bool | `false` |  |
| frontend.securityContextDefault.capabilities.drop[0] | string | `"ALL"` |  |
| frontend.securityContextDefault.readOnlyRootFilesystem | bool | `false` |  |
| frontend.securityContextDefault.runAsGroup | int | `1000` |  |
| frontend.securityContextDefault.runAsNonRoot | bool | `true` |  |
| frontend.securityContextDefault.runAsUser | int | `1000` |  |
| frontend.service.enabled | bool | `true` |  |
| frontend.startupProbeDefault.httpGet.path | string | `"/"` |  |
| frontend.startupProbeDefault.httpGet.port | string | `"http"` |  |
| frontend.volumeMounts[0].mountPath | string | `"/usr/share/nginx/html/"` |  |
| frontend.volumeMounts[0].name | string | `"static"` |  |
| frontend.volumeMounts[0].readOnly | bool | `true` |  |
| frontend.volumeMounts[0].subPath | string | `"html"` |  |
| frontend.volumes[0].emptyDir | object | `{}` |  |
| frontend.volumes[0].name | string | `"static"` |  |
| migrate.command[0] | string | `"/bin/sh"` |  |
| migrate.command[1] | string | `"-c"` |  |
| migrate.command[2] | string | `"export DATABASE_URL=${DATABASE_URL:-\"postgres://${POSTGRES_USER}:${POSTGRES_PASSWORD}@${POSTGRES_HOST}:${POSTGRES_PORT}/${POSTGRES_NAME}\"}\necho \"Attempting to migrate database... '${POSTGRES_HOST}:${POSTGRES_PORT}/${POSTGRES_NAME}' as '${POSTGRES_USER}'\"\npnpx prisma migrate deploy\n"` |  |
| migrate.enabled | bool | `true` |  |
| migrate.env[0].name | string | `"DATABASE_URL"` |  |
| migrate.env[0].valueFrom.secretKeyRef.key | string | `"DATABASE_URL"` |  |
| migrate.env[0].valueFrom.secretKeyRef.name | string | `"hoppscotch"` |  |
| migrate.env[1].name | string | `"POSTGRES_USER"` |  |
| migrate.env[1].valueFrom.secretKeyRef.key | string | `"POSTGRES_USER"` |  |
| migrate.env[1].valueFrom.secretKeyRef.name | string | `"hoppscotch"` |  |
| migrate.env[2].name | string | `"POSTGRES_PASSWORD"` |  |
| migrate.env[2].valueFrom.secretKeyRef.key | string | `"POSTGRES_PASSWORD"` |  |
| migrate.env[2].valueFrom.secretKeyRef.name | string | `"hoppscotch"` |  |
| migrate.env[3].name | string | `"POSTGRES_HOST"` |  |
| migrate.env[3].valueFrom.secretKeyRef.key | string | `"POSTGRES_HOST"` |  |
| migrate.env[3].valueFrom.secretKeyRef.name | string | `"hoppscotch"` |  |
| migrate.env[4].name | string | `"POSTGRES_PORT"` |  |
| migrate.env[4].valueFrom.secretKeyRef.key | string | `"POSTGRES_PORT"` |  |
| migrate.env[4].valueFrom.secretKeyRef.name | string | `"hoppscotch"` |  |
| migrate.env[5].name | string | `"POSTGRES_NAME"` |  |
| migrate.env[5].valueFrom.secretKeyRef.key | string | `"POSTGRES_DB"` |  |
| migrate.env[5].valueFrom.secretKeyRef.name | string | `"hoppscotch"` |  |
| migrate.image.registry | string | `"docker.io"` |  |
| migrate.image.repository | string | `"hoppscotch/hoppscotch"` |  |
| migrate.image.tag | string | `"2025.10.1"` |  |
| migrate.job.annotations."helm.sh/hook" | string | `"post-install,post-upgrade"` |  |
| migrate.job.annotations."helm.sh/hook-delete-policy" | string | `"before-hook-creation"` |  |
| migrate.job.annotations."helm.sh/hook-weight" | string | `"-1"` |  |
| migrate.job.enabled | bool | `true` |  |
| migrate.netpol.enabled | bool | `true` |  |
| migrate.persistence.enabled | bool | `false` |  |
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

## 0.1.0

Initial release of the helm chart.

