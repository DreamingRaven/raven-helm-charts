# Changelog

# 0.3.0

Changed default security context to be much more restrictive.
Also changed volume mounting to modify python to 755 perms in an init container, so lower privileges can be used for pgadmin container itself. This is a very breaking change if you have set any of initContainers, volumes, volumeMounts, securityContext as these will need to now include this override init container and the volumes it uses.
