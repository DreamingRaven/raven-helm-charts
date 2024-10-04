# jellymeta

A Helm chart for Kubernetes

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

## Installing the Chart

To install the chart with the release name `jellymeta`, run the following commands:

```console
$ helm repo add raven https://gitlab.com/api/v4/projects/55284972/packages/helm/stable
$ helm repo update raven
$ helm install jellymeta raven/jellymeta
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://gitlab.com/api/v4/projects/55284972/packages/helm/stable | filebrowser | 0.1.0 |
| https://gitlab.com/api/v4/projects/55284972/packages/helm/stable | jellyfin | 0.1.1 |
| https://gitlab.com/api/v4/projects/55284972/packages/helm/stable | metube | 0.1.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| filebrowser.enabled | bool | `true` |  |
| filebrowser.persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| filebrowser.persistence.enabled | bool | `true` |  |
| filebrowser.persistence.size | string | `"8Gi"` |  |
| filebrowser.volumeMounts[0].mountPath | string | `"/database"` |  |
| filebrowser.volumeMounts[0].name | string | `"data"` |  |
| filebrowser.volumeMounts[0].readOnly | bool | `false` |  |
| filebrowser.volumeMounts[0].subPath | string | `"database"` |  |
| filebrowser.volumeMounts[1].mountPath | string | `"/srv"` |  |
| filebrowser.volumeMounts[1].name | string | `"data"` |  |
| filebrowser.volumeMounts[1].readOnly | bool | `false` |  |
| filebrowser.volumeMounts[1].subPath | string | `"files"` |  |
| filebrowser.volumeMounts[2].mountPath | string | `"/.filebrowser.json"` |  |
| filebrowser.volumeMounts[2].name | string | `"config"` |  |
| filebrowser.volumeMounts[2].readOnly | bool | `false` |  |
| filebrowser.volumeMounts[2].subPath | string | `".filebrowser.json"` |  |
| filebrowser.volumeMounts[3].mountPath | string | `"/srv/jellyfin"` |  |
| filebrowser.volumeMounts[3].name | string | `"jellyfin"` |  |
| filebrowser.volumeMounts[3].readOnly | bool | `false` |  |
| filebrowser.volumeMounts[3].subPath | string | `"media"` |  |
| filebrowser.volumeMounts[4].mountPath | string | `"/srv/metube"` |  |
| filebrowser.volumeMounts[4].name | string | `"metube"` |  |
| filebrowser.volumeMounts[4].readOnly | bool | `false` |  |
| filebrowser.volumeMounts[4].subPath | string | `"downloads"` |  |
| filebrowser.volumes[0].name | string | `"data"` |  |
| filebrowser.volumes[0].persistentVolumeClaim.claimName | string | `"jellymeta-filebrowser"` |  |
| filebrowser.volumes[1].configMap.items[0].key | string | `".filebrowser.json"` |  |
| filebrowser.volumes[1].configMap.items[0].path | string | `".filebrowser.json"` |  |
| filebrowser.volumes[1].configMap.name | string | `"filebrowser"` |  |
| filebrowser.volumes[1].name | string | `"config"` |  |
| filebrowser.volumes[2].name | string | `"jellyfin"` |  |
| filebrowser.volumes[2].persistentVolumeClaim.claimName | string | `"jellymeta-jellyfin"` |  |
| filebrowser.volumes[3].name | string | `"metube"` |  |
| filebrowser.volumes[3].persistentVolumeClaim.claimName | string | `"jellymeta-metube"` |  |
| jellyfin.enabled | bool | `true` |  |
| jellyfin.persistence.accessModes[0] | string | `"ReadWriteMany"` |  |
| jellyfin.persistence.enabled | bool | `true` |  |
| jellyfin.persistence.size | string | `"8Gi"` |  |
| jellyfin.volumeMounts[0].mountPath | string | `"/data"` |  |
| jellyfin.volumeMounts[0].name | string | `"data"` |  |
| jellyfin.volumeMounts[0].readOnly | bool | `true` |  |
| jellyfin.volumeMounts[0].subPath | string | `"media"` |  |
| jellyfin.volumeMounts[1].mountPath | string | `"/config"` |  |
| jellyfin.volumeMounts[1].name | string | `"data"` |  |
| jellyfin.volumeMounts[1].readOnly | bool | `false` |  |
| jellyfin.volumeMounts[1].subPath | string | `"config"` |  |
| jellyfin.volumes[0].name | string | `"data"` |  |
| jellyfin.volumes[0].persistentVolumeClaim.claimName | string | `"jellymeta-jellyfin"` |  |
| metube.enabled | bool | `true` |  |
| metube.persistence.accessModes[0] | string | `"ReadWriteMany"` |  |
| metube.persistence.enabled | bool | `true` |  |
| metube.persistence.size | string | `"8Gi"` |  |
| metube.volumeMounts[0].mountPath | string | `"/downloads"` |  |
| metube.volumeMounts[0].name | string | `"data"` |  |
| metube.volumeMounts[0].readOnly | bool | `false` |  |
| metube.volumeMounts[0].subPath | string | `"downloads"` |  |
| metube.volumes[0].name | string | `"data"` |  |
| metube.volumes[0].persistentVolumeClaim.claimName | string | `"jellymeta-metube"` |  |

