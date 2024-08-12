# qBittorrent Helm Chart

This helm chart is used to deploy qBittorrent into a kubernetes cluster.
This uses mostly standard values you will also find in other charts like those of bitnami.

This chart specifically has optional support for gluetun running as a side-car. See the initContainers section of the values.yaml for specific configuration to enable this. This will only require that you create your own secret to provide environment variables to gluetun. Please ensure you bind your qBittorrent in advanced options to only the tunnel interface. In my case this was tun0. Then also use ipleaks ``torrent address detection`` to ensure you are maintaining privacy. Also consider enabling qBittorrents anonymous mode.

This chart makes heavy use of my own corvid library chart, to reduce the amount of boilerplate I have to maintain across my charts.

More details are to come, please consult the values.yaml for specifics.

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


## Changelog

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
