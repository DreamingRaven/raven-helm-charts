# Changelog

## 0.2.0

This version upgrades jellyfin helm chart.
This is potentially breaking if you overrode any of the variables related to volumes, or if you codified any of them.
If you let the chart handle volumes no changes are necessary. The only thing this would effect is duplication of volume and volumeMounts when attempting to set your own with persistence enabled.

I would suggest you backup your data before upgrading, and checking the manifests still generate the PVC you desire properly. Or better yet ensure you retain this PVC yourself.
