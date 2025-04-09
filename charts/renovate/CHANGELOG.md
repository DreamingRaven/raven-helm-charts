# Changelog

## 0.2.1

Added backwards compatible change to image source.
This now sources from ghcr instead of dockerhub.

```yaml
image:
  registry: ghcr.io
  repository: renovatebot/renovate
  pullPolicy: IfNotPresent
  tag: "39-full"
```
