# qbittorrent

A Helm chart for Kubernetes

![Version: 0.6.1](https://img.shields.io/badge/Version-0.6.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 5.1.4](https://img.shields.io/badge/AppVersion-5.1.4-informational?style=flat-square)

This helm chart is used to deploy qBittorrent into a kubernetes cluster.
This uses mostly standard values you will also find in other charts like those of bitnami.

This chart specifically has optional support for gluetun running as a side-car. See the initContainers section of the values.yaml for specific configuration to enable this. This will only require that you create your own secret to provide environment variables to gluetun. Please ensure you bind your qBittorrent in advanced options to only the tunnel interface. In my case this was tun0. Then also use ipleaks ``torrent address detection`` to ensure you are maintaining privacy. Also consider enabling qBittorrents anonymous mode.

## Usage

### Example Values

To create a qbittorrent client with your VPN you can use the following values as a rough guide. You will need to change the storage, and the host to match your own needs. You will also need to bring your own secret. In the following configuration I use the ``gluetun`` secret. This will be mounted with every key as environment variables to configure your gluetun setup. See https://github.com/qdm12/gluetun-wiki/tree/main/setup/providers for environment variables you will need to add to this secret.

```yaml
persistence:
  enabled: true
  size: 400Gi # <----------- CHANGE ME
  accessModes:
  - ReadWriteMany

securityContext:
  #capabilities:
  #  drop:
  #  - ALL
  #readOnlyRootFilesystem: false
  #runAsNonRoot: true
  #runAsUser: 1000

env:
- name: PUID
  value: "1000"
- name: PGID
  value: "1000"
- name: TZ
  value: "Europe/London"
# https://github.com/linuxserver/docker-qbittorrent/issues/179
- name: DOCKER_MODS
  value: "lscr.io/linuxserver/mods:universal-stdout-logs"
- name: LOGS_TO_STDOUT
  value: "/config/qBittorrent/logs/qbittorrent.log"

ingress:
  enabled: true
  annotations:
    cert-manager.io/cluster-issuer: "letsencrypt-issuer" # <----------- CHANGE ME
  hosts:
    - host: torrent.org.example # <----------- CHANGE ME
      paths:
        - path: /
          pathType: ImplementationSpecific
  ## @param ingress.tls [array] Ingress TLS
  tls:
  - secretName: torrent.org.example-tls # <----------- CHANGE ME
    hosts:
      - torrent.org.example # <----------- CHANGE ME

## @param initContainers Add bespoke init containers to the pods
initContainers:
# optional gluetun VPN client sidecar
# https://github.com/qdm12/gluetun
# https://github.com/qdm12/gluetun-wiki/pull/7
- name: gluetun # init sidecar for VPN connection
  image: "ghcr.io/qdm12/gluetun:latest"
  restartPolicy: Always # makes this init into a sidecar container k8s 1.29
  imagePullPolicy: Always
  ports:
  - name: http-proxy
    containerPort: 8888
    protocol: TCP
  - name: tcp-shadowsocks
    containerPort: 8388
    protocol: TCP
  - name: udp-shadowsocks
    containerPort: 8388
    protocol: UDP
  envFrom:
  - secretRef:
      name: gluetun
      optional: false
  env:
  - name: TZ
    value: "Europe/London"
  - name: FIREWALL_DEBUG
    value: "on"
  - name: FIREWALL_INPUT_PORTS
    value: "8080"
  securityContext:
    capabilities:
      add:
      - NET_ADMIN
      #drop:
      #- ALL
```

## Installing the Chart

### Install via OCI helm registry

To install the chart with the release name `qbittorrent`, run the following commands.
For a list of all available charts and versions see the [container registry](https://gitlab.com/GeorgeRaven/raven-helm-charts/container_registry)

To pull the latest version without authentication:

```console
helm install qbittorrent oci://registry.gitlab.com/georgeraven/raven-helm-charts/qbittorrent
```

With authentication:

```console
helm registry login registry.gitlab.com -u <USERNAME> -p <GITLAB_TOKEN>
helm install qbittorrent oci://registry.gitlab.com/georgeraven/raven-helm-charts/qbittorrent --version 0.6.1
```

### As a helm dependency

You can also opt to directly reference this chart as a helm dependency defined in your `Chart.yaml`:

```yaml
dependencies:
- name: qbittorrent
  version: 0.6.1
  repository: "oci://registry.gitlab.com/georgeraven/raven-helm-charts"
  # alias: <THE_NAME_YOU_WANT_TO_GIVE_THE_CHART> # optional for more advanced use-cases
  # condition: qbittorrent.enabled # optional for more advanced use-cases
```

Then you should pull the chart with the following command:

```console
helm dependency update <PATH_TO_YOUR_CHART_DIR>
```

Which should automatically fetch the chart, update your lockfile, etc.

### Install via Helm index.yaml (deprecated method since: 2025-03-24)

To install the chart with the release name `qbittorrent`, run the following commands:

```console
$ helm repo add raven https://gitlab.com/api/v4/projects/55284972/packages/helm/stable
$ helm repo update raven
$ helm install qbittorrent raven/qbittorrent
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://gitlab.com/api/v4/projects/55284972/packages/helm/stable | corvid | 0.12.0 |

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
| cron.enabled | bool | `false` | enable or disable cronjob |
| cron.schedule | string | `"@midnight"` | schedule for cronjob using Cron syntax https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/#schedule-syntax |
| cron.suspend | bool | `false` | cronjob will not trigger on schedule but can be manually triggered |
| deployment.strategy | string | `""` | rollout strategy `Recreate` or `RollingUpdate` this chart defaults to Recreate only if we detect a single replica with a volume |
| dnsConfig | object | `{}` |  |
| dnsPolicy | string | `""` |  |
| envFrom | string | `nil` |  |
| env[0].name | string | `"PUID"` |  |
| env[0].value | string | `"1000"` |  |
| env[1].name | string | `"GUID"` |  |
| env[1].value | string | `"1000"` |  |
| env[2].name | string | `"TZ"` |  |
| env[2].value | string | `"Europe/London"` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"ghcr.io"` |  |
| image.repository | string | `"linuxserver/qbittorrent"` |  |
| image.tag | string | `"5.1.4"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"qbittorrent.org.example"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| initContainers | string | `nil` |  |
| livenessProbe | string | `nil` | raw liveness probe overrides for user |
| livenessProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default liveness probe if not specified by user |
| livenessProbeEnabled | bool | `true` | enable or disable liveness probe entirely |
| nameOverride | string | `""` |  |
| netpol.enabled | bool | `true` |  |
| nodeSelector | object | `{}` |  |
| persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistence.enabled | bool | `true` |  |
| persistence.existingClaim | string | `""` |  |
| persistence.size | string | `"8Gi"` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` | podSecurityContext for consumer overrides |
| podSecurityContextDefault | object | `{"fsGroup":1000}` | default podSecurityContext if none specified |
| podSecurityContextEnabled | bool | `false` | enable or disable podSecurityContext entirely |
| ports[0].containerPort | int | `8080` |  |
| ports[0].name | string | `"http"` |  |
| ports[0].protocol | string | `"TCP"` |  |
| ports[0].servicePort | int | `80` |  |
| readinessProbe | string | `nil` | raw readiness probe overrides for user |
| readinessProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default readiness probe if not specified by user |
| readinessProbeEnabled | bool | `true` | enable or disable readiness probe entirely |
| replicaCount | int | `1` |  |
| resources | string | `nil` | raw resources block overrides for user |
| resourcesDefault | object | `{"limits":{"memory":"2Gi"},"requests":{"cpu":"200m"}}` | default resources if not specified by user |
| resourcesEnabled | bool | `true` | enable or disable resources entirely |
| restartPolicy | string | `"Always"` |  |
| runtimeClassName | string | `nil` |  |
| secrets | string | `nil` |  |
| securityContext | object | `{}` | securityContext for consumer overrides |
| securityContextDefault | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}` | default securityContext if none specified |
| securityContextEnabled | bool | `false` | enable or disable securityContext entirely |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| startupProbe | string | `nil` | raw startup probe overrides for user |
| startupProbeDefault | object | `{"httpGet":{"path":"/","port":"http"}}` | default startup probe if not specified by user |
| startupProbeEnabled | bool | `true` | enable or disable startup probe entirely |
| tolerations | list | `[]` |  |
| volumeMounts | list | `[]` |  |
| volumes | list | `[]` |  |

## Changelog

### 0.6.0

Minor version bump of default qbit to 5.1.0

### 0.3.1

Minor internal patch to prevent a PVC from being generated blankly if persistence.existingClaim is set. This is backwards compatible and requires no user changes.

### 0.3.0

This release fixes volume mounts and brings the corvid dependency up to date from 0.6.1 to 0.7.1. This largeley compatible, however liveness and readiness probes have now been removed from the internal charts configuration, with the expectation that you add these into your charts to maintain the liveness and readiness checks. This was done to ensure you could manipulate these checks at will, otherwise if I configure them in the charts values you wont be able to properly configure them how you want them later.

You will need to add the following to your values.yaml to maintain compatibility:

```yaml
livenessProbe:
  httpGet:
    path: /
    port: http
readinessProbe:
  httpGet:
    path: /
    port: http
```

