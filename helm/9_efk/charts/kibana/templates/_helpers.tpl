{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "kibana.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
namespace
*/}}
{{- define "namespace" -}}
{{- default "default" "logging" -}}
{{- end -}}

{{/*
elasticsearchHosts
*/}}
{{- define "elasticsearchHosts" -}}
{{- if .Values.global.namespace -}}
  {{ printf "%s.%s.svc:9200" "http://elasticsearch-master" .Values.global.namespace }}
{{- else -}}
  {{ "http://elasticsearch-master:9200" }}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "kibana.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Release.Name .Values.nameOverride -}}
{{- printf "%s-%s" $name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "kibana.labels" -}}
app: {{ .Chart.Name }}
release: {{ .Release.Name | quote }}
heritage: {{ .Release.Service }}
{{- if .Values.labels }}
{{ toYaml .Values.labels }}
{{- end }}
{{- end -}}
