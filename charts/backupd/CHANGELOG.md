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
