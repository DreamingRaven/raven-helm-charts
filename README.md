# Raven Helm Charts

An opinionated set of packages specifically for [GitOps](https://about.gitlab.com/topics/gitops/) enabled [Kubernetes](https://kubernetes.io/) clusters, packaged via [Helm](https://helm.sh/) charts.

This repository aims to provide the following:

- Relatively standard and consistent Helm chart structure as far as reasonably possible.
- A consistent `README.md` containing a breakdown of possible arguments and architecture for each chart.
- A consistent `values.yaml` for each chart that is familiar to many users but also self-consistent when breaking any convention that limits functionality.
- Side-loadable secrets and configuration for each chart to make it easier to integrate with GitOps.

Please note this is still a work in progress as I am currently collating my various charts together into this one repository and integrating them nicely. This includes, for the sake of continued mantenance, integrating all charts into a common "corvid" base library chart. So that updates can be uniformly integrated with minimum repition.

## Quick Start

To access any and all of these charts:

```bash
helm repo add raven https://gitlab.com/api/v4/projects/55284972/packages/helm/stable
helm repo update raven
```

Then to view all available charts:

```bash
helm search repo raven
```

To see all possible versions of a chart:

```bash
helm search repo raven/home-assistant
```

For any particular chart please see their `README.md` files in the `charts` directory.

## Charts

`Corvid` is the base library chart for all other charts. This abstracts common boilerplate, and enables me to maintain significantly larger repository of charts long term.

There are a handful of charts here, which utilise the base chart:

- filebrowser; a http based file manager for administering files inside volumes\*
- foundryvtt; a http based virtual tabletop server
- home-assistant; a home-assistant webserver for home automation\*
- jellyfin; a http based media server
- ollama; a Gin / REST based LLM model server
- OpenWebUI; a web based interface for LLMs
- pgadmin4; a web based postgres admin interface
- qbittorrent; a http based torrent client for [Archlinux ISOs](https://archlinux.org/download/#bittorrent-download)
- renovate; a cronjob service to keep repositories up to date with latest releases
- rook-wipe; a utility chart for wiping rook-ceph metadata and drive data on systems like talos linux

\* Does not use `Corvid` (yet)

## Deprecated Charts

These charts pre-dated corvid meaning they are a handful to migrate, and I no longer use them so they have been removed since I won't notice if there are issues in my own cluster post migration.

- Grocy
- MeTube
- DDB-Proxy
