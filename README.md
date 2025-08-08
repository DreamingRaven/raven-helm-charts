# Raven Helm Charts

The helm charts provided herein aim to:

- Be consistent; All basing on a universal corvid library.
- Be low-abstraction; Taking out the boilerplate, while still allowing for full customization.
- Support gitOps + external secrets; Supporting loading of external secrets, configmaps, partly due to the low-abstraction.
- Provide sane defaults; Reducing security risks by default like adding reasonable network policies, probes, service accounts, etc.
- Regular updates; Thanks to renovate, we maintain a steady flow of updates of upstream containers, READMES, etc.

## Getting Started

There are a plethora of charts currently available.
You need only choose the helm chart you desire from the `charts/` directory.

You will find specific instructions for each chart in their respective `README.md` files, which are updated regularly.

You can get a quick view of the chart packages and all their historic versions in the [container registry](https://gitlab.com/GeorgeRaven/raven-helm-charts/container_registry)
