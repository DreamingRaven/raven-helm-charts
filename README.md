# Raven Helm Charts

An opinionated set of packages specifically for [GitOps](https://about.gitlab.com/topics/gitops/) enabled [Kubernetes](https://kubernetes.io/) clusters, packaged via [Helm](https://helm.sh/) charts.

This repository aims to provide the following:

- Relatively standard and consistent Helm chart structure as far as reasonably possible.
- A consistent `README.md` containing a breakdown of possible arguments and architecture for each chart.
- A consistent `values.yaml` for each chart that is familiar to many users but also self-consistent when breaking any convention that limits functionality.
- Side-loadable secrets and configuration for each chart to make it easier to integrate with GitOps.

Please note this is still a work in progress as I am currently collating my various charts together into this one repository and integrating them nicely.

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
