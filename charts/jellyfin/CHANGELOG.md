# Changelog

## 0.7.0

BREAKING CHANGES!

The chart has been overhauled to use corvid.
Please TAKE A BACKUP of your data before upgrading.
In particular the name of the default generated PVC has changed so if you used `persistence.enabled` you will need to either manually ensure the PVC exists and set the existing persistence claim flag, or change the full name override to `jellyfin` to match previous behaviour.
The default `persistence.enabled` is now set to `false`.
