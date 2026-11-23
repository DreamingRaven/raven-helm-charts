# Changelog

## 0.21.0 (corvid-app 0.19.0)

BREAKING CHANGE!

This release converts the chart to use corvid-app as the base.
This should change very little for the end user, except you will need to indent your values under home-assistant.

I.E the values are now as follows:
```yaml
home-assistant:
  ## @param replicaCount [string] Server deployment replica count
  replicaCount: 1

  image:
    ## @param image.registry [string] Image container registry
    registry: ghcr.io
    ## @param image.repository [string] Image repository
    repository: home-assistant/home-assistant
    ## @param image.pullPolicy [string] Image pull policy
    pullPolicy: IfNotPresent
```

If you do not indent under this new key, your values will not be applied, and you will likely get a broken deployment.

## 0.7.0

Added default volume and volumemount for a secret which should contain the home assistant configuration.

This will be made optional in a further patch, however if you override volumes and mounts this wont affect you currently.

## 0.6.0

DO NOT UPGRADE TO THIS UNLESS YOU HAVE A BACKUP OF YOUR DATA.

This change overhauled this chart to make use of the common corvid chart.
This brings multiple new features, but also completely broke some older conventions, and I am keen to rip off the bandaid too rather than introduce many smaller breaking changes, to take advantage of the relatively few people using this chart at this stage.
