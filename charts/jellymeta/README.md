# jellymeta

A Helm chart for Kubernetes

![Version: 0.3.0](https://img.shields.io/badge/Version-0.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

This chart is a chart which contains multiple other more atomic charts as dependencies.
This allows you to control a broader deployment of interconnected resources.

In this instance this is a meta chart for jellyfin, with components like metube and filebrowser to help automate and remotely administer the jellyfin data files. This is because jellyfin currently has no in-built video downloader, and thus we need tools like metube and filebrowser to help.

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
| https://gitlab.com/api/v4/projects/55284972/packages/helm/stable | jellyfin | 0.8.0 |
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
| filebrowser.volumes[0].name | string | `"data"` |  |
| filebrowser.volumes[0].persistentVolumeClaim.claimName | string | `"jellymeta-filebrowser"` |  |
| filebrowser.volumes[1].configMap.items[0].key | string | `".filebrowser.json"` |  |
| filebrowser.volumes[1].configMap.items[0].path | string | `".filebrowser.json"` |  |
| filebrowser.volumes[1].configMap.name | string | `"filebrowser"` |  |
| filebrowser.volumes[1].name | string | `"config"` |  |
| filebrowser.volumes[2].name | string | `"jellyfin"` |  |
| filebrowser.volumes[2].persistentVolumeClaim.claimName | string | `"jellymeta-jellyfin"` |  |
| jellyfin.enabled | bool | `true` |  |
| jellyfin.persistence.accessModes[0] | string | `"ReadWriteMany"` |  |
| jellyfin.persistence.enabled | bool | `true` |  |
| jellyfin.persistence.size | string | `"8Gi"` |  |
| metube.enabled | bool | `false` |  |
| metube.persistence.accessModes[0] | string | `"ReadWriteMany"` |  |
| metube.persistence.enabled | bool | `true` |  |
| metube.persistence.size | string | `"8Gi"` |  |
| metube.volumeMounts[0].mountPath | string | `"/downloads"` |  |
| metube.volumeMounts[0].name | string | `"data"` |  |
| metube.volumeMounts[0].readOnly | bool | `false` |  |
| metube.volumeMounts[0].subPath | string | `"downloads"` |  |
| metube.volumes[0].name | string | `"data"` |  |
| metube.volumes[0].persistentVolumeClaim.claimName | string | `"jellymeta-metube"` |  |

# Changelog

## 0.2.0

This version upgrades jellyfin helm chart.
This is potentially breaking if you overrode any of the variables related to volumes, or if you codified any of them.
If you let the chart handle volumes no changes are necessary. The only thing this would effect is duplication of volume and volumeMounts when attempting to set your own with persistence enabled.

I would suggest you backup your data before upgrading, and checking the manifests still generate the PVC you desire properly. Or better yet ensure you retain this PVC yourself.

