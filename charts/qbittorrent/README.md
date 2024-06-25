# qBittorrent Helm Chart

This helm chart is used to deploy qBittorrent into a kubernetes cluster.
This uses mostly standard values you will also find in other charts like those of bitnami.

This chart specifically has optional support for gluetun running as a side-car. See the initContainers section of the values.yaml for specific configuration to enable this. This will only require that you create your own secret to provide environment variables to gluetun. Please ensure you bind your qBittorrent in advanced options to only the tunnel interface. In my case this was tun0. Then also use ipleaks ``torrent address detection`` to ensure you are maintaining privacy. Also consider enabling qBittorrents anonymous mode.

This chart makes heavy use of my own corvid library chart, to reduce the amount of boilerplate I have to maintain across my charts.

More details are to come, please consult the values.yaml for specifics.
