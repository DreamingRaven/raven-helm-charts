This chart acts as an application abstraction layer so that the corvid library can be dropped in and used, even without the boilerplate templates!

You can use this chart to create an arbitrary number of applications even in one helm chart by clever exploitation of helm aliases.

Consider the following `Chart.yaml` dependencies section

```yaml
dependencies:
- alias: api
  condition: api.enabled
  name: corvid-app
  version: 0.9.0 # change to be latest corvid-app version
  repository: "https://gitlab.com/api/v4/projects/55284972/packages/helm/stable"
- alias: web
  condition: web.enabled
  name: corvid-app
  version: 0.9.0 # change to be latest corvid-app version
  repository: "https://gitlab.com/api/v4/projects/55284972/packages/helm/stable"
```

Using the alias function we can rename corvid-app to suit whatever app name we want it to become.
We can then override settings in values.yaml using the aliases name:

```yaml
api:
	image:
	  registry: registry.example.org
	  repository: foo/someapi
	  tag: ""
	deployment:
		enabled: true
	cron:
		enabled: false
	job:
		enabled: false
	daemonset:
		enabled: false
web:
	image:
	  registry: registry.example.org
	  repository: foo/somefrontend
	  tag: ""
	deployment:
		enabled: true
	cron:
		enabled: false
	job:
		enabled: false
	daemonset:
		enabled: false
```

Now we have a chart with no templates, creating very different applications with only `values.yaml` and `Chart.yaml`. This can be a very quick way to prototype a new application.
Thus this can expedite the development process, as long as all you need fits in the confines of what is configurable in a corvid-app. Otherwise you will still prefer to use corvid directly for the possibility to override functionality to any desired level. You may find you start with a corvid-app, but then as your needs expand and you can warrant more time investment you will likely progress to creating your own corvid-app implementation for your specific needs using the corvid library directly just as the corvid-app does.
