# Changelog

## 0.2.0

This is a breaking change, to set the default `postgres.ingress.enabled=false` thus disabling unintentional ingress, since this chart is not likely to be exposed.

I would like to affirm, do not use this chart in production. This is meant to enable quick testing of other charts. Please replace the usage of this chart with CNPG.
