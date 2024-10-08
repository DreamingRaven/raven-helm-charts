# backupd

This chart will provision volsync backupd and restore manifests.
This is to centralize the otherwise repeated backupd and restore manifests, from being ludicrously repetitive.
This chart aims to have reasonable defaults to reduce the amount of customization required.
This chart does not provision the volsync CRDs, this is left to the user, who must install the volsync operator and CRDs.
This chart also does not provision the restic secrets, which necessarily must be generated by the end user.

These manifests will automatically restore from a backupd on volume creation. This means that when a volume is deleted the contents will be restored from the backupd.
This chart makes use of volsyncs volume populator, which sources new volumes from a backupd on volume creation to restore from backupd.

## Changelog

### 0.7.0

This minor patch introduced backwards compatible restore changes. This included being able to select the previous integer, and asOf date so users can select which backup to restore.

No changes are necessary to the values.yaml but if you would like to use the new restore options you need to add `.restore.asOf` or `.restore.previous`. Note this are not populated by the base chart and they should be used mutually exclusively.

```yaml
restore:
  ...
  # define which backup to restore
  asOf: "" # string e.g: "2022-08-10T20:01:03-04:00"
  previous: # int e.g: 2
```
