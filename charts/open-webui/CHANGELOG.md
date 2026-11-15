## Changelog

### 0.9.0

This version focuses on securityContext and podSecurityContext.
These changes should be backwards compatible, however you can return to the previous settings if you disable both podSecurityContext and securityContext in your values.yaml.

This change will force the 1000 user and group on mounted volumes, and the fsGroupChangePolicy is set to OnRootMismatch to ensure that the group is changed if it does not match the fsGroup.
This will also restrict the container to run as the 1000 user and group, and will not allow the container to run as root, or elevate, while also dropping all capabilities.
This also adds a default scratch volume on /tmp to ensure that the container has somewhere to write temporary files since we also set the root filesystem to read-only.
