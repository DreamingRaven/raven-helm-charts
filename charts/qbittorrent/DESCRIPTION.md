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
