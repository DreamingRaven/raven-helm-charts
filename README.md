# Raven Helm Charts

An opinionated set of helm charts specifically for [GitOps](https://about.gitlab.com/topics/gitops/) enabled [Kubernetes](https://kubernetes.io/) clusters, packaged via [Helm](https://helm.sh/) charts.

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
