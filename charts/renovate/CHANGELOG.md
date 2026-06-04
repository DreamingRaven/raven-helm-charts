# Changelog

## 0.6.0

This is a major potentially breaking change.
This updates the backing corvid all the way from 0.13 to 0.17.
This means new defaults, new features, and new behaviors as per corvid changes.

This also however means more locked down deployment manifests.
I have made a best effort to maintain as much backwards compatibility where reasonable to do so, however in particular the new security context and pod security policies may cause issues.
These should be easy to work around, but will need some manual checking after updating, that everything is still working.

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
