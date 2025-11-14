# Changelog

## 0.4.0

- (Breaking) Enabled keycloak health endpoints by default, and swapped default status probes to them.
- (Breaking) Disable verbose logging by default.

## 0.2.0

- Changed all probes from `/` to `/realm/master` by default.
- Changed default resources to 1.75Gi memory and 350m cpu, to match more realistic needs.
- Changed auto-scaling to be max 5 by default, as 100 is obscene.

