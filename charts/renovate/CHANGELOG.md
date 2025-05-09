# Changelog

## 0.3.0

This changes the behavior of the retries and historic resources.
While this likely does not affect most users in any substantive manner, I have marked it as a minor change because it does change the default retry behavior.

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
