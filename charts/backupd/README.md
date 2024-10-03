# backupd

![Version: 0.7.0](https://img.shields.io/badge/Version-0.7.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

Corvid approved backupd manifests

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| backup.copyMethod | string | `"Snapshot"` |  |
| backup.enabled | bool | `false` |  |
| backup.pruneIntervalDays | int | `1` |  |
| backup.retain.daily | int | `4` |  |
| backup.retain.hourly | int | `5` |  |
| backup.retain.monthly | int | `2` |  |
| backup.retain.weekly | int | `3` |  |
| backup.retain.yearly | int | `1` |  |
| backup.schedule | string | `"0 * * * 1"` |  |
| backup.trigger | object | `{}` |  |
| existingPVC | string | `""` |  |
| existingSecret | string | `""` |  |
| persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistence.generate | bool | `true` |  |
| persistence.size | string | `"8Gi"` |  |
| restore.asOf | string | `""` |  |
| restore.enabled | bool | `false` |  |
| restore.previous | string | `nil` |  |
| restore.schedule | string | `"1 * * * 1"` |  |
| restore.trigger | string | `nil` |  |

