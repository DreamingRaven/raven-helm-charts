Rook cleanup helm chart is responsible for zapping volumes and metadata from rook nodes.

This will NOT do anything when installed. It will create suspended cronjobs, which you may trigger to clean up rook data on demand.
One cronjob will be created for each rook node. You also have to specify which nodes by name, and which devices to wipe.

This should be installed once for each node, by a different name, usually using helm aliases. This simplifies maintenance, and reduces overall complexity.
