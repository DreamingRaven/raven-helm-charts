# Corvid

## Changelog

### 0.6.4

This release of corvid introduces CronJob templates. This is backwards compatible since the only new variables are part of a new template altogether to define a CronJob.
Any users seeking to invoke this new CronJob will need to add the following to their values.yaml:

```yaml
schedule: "@midnight" # or some other cron schedule, try: https://crontab.guru/
```

They will also need to invoke this new template in their templates (substituting ``corvid-test`` for their chart name):

```yaml
{{- define "corvid-test.cronjob" -}}
{{- end -}}
{{- include "corvid.cronjob" (list . "corvid-test.cronjob") -}}
```
