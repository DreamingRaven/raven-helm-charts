# Jellyfin Meta Chart

This chart is a chart which contains multiple other more atomic charts as dependencies.
This allows you to control a broader deployment of interconnected resources.

In this instance this is a meta chart for jellyfin, with components like metube and filebrowser to help automate and remotely administer the jellyfin data files. This is because jellyfin currently has no in-built video downloader, and thus we need tools like metube and filebrowser to help.
