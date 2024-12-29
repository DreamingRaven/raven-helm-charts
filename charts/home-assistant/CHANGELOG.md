# Changelog

## 0.7.0

Added default volume and volumemount for a secret which should contain the home assistant configuration.

This will be made optional in a further patch, however if you override volumes and mounts this wont affect you currently.

## 0.6.0

DO NOT UPGRADE TO THIS UNLESS YOU HAVE A BACKUP OF YOUR DATA.

This change overhauled this chart to make use of the common corvid chart.
This brings multiple new features, but also completely broke some older conventions, and I am keen to rip off the bandaid too rather than introduce many smaller breaking changes, to take advantage of the relatively few people using this chart at this stage.
