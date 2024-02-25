{{/*
Expand the name of the chart.
*/}}
{{- define "barcode.name" -}}
{{- default "barcode" .Values.barcode.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "barcode.fullname" -}}
{{- if .Values.barcode.fullnameOverride }}
{{- .Values.barcode.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default "barcode" .Values.barcode.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "barcode.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "barcode.labels" -}}
helm.sh/chart: {{ include "barcode.chart" . }}
{{ include "barcode.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "barcode.selectorLabels" -}}
app.kubernetes.io/name: {{ include "barcode.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "barcode.serviceAccountName" -}}
{{- if .Values.barcode.serviceAccount.create }}
{{- default (include "barcode.fullname" .) .Values.barcode.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.barcode.serviceAccount.name }}
{{- end }}
{{- end }}
