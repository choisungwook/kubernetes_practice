{{/*
chart name
*/}}
{{- define "name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
app name
*/}}
{{- define "fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
persistent volumes
*/}}
{{- define "pv-data" -}}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- printf "%s-%s-%s" .Release.Name $name "data" | trunc 63 | trimSuffic "-" -}}
{{- end -}}

{{- define "pv-log" -}}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- printf "%s-%s-%s" .Release.Name $name "log" | trunc 63 | trimSuffic "-" -}}
{{- end -}}

{{- define "pv-config" -}}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- printf "%s-%s-%s" .Release.Name $name "config" | trunc 63 | trimSuffic "-" -}}
{{- end -}}

{{/*
persistent volume claims
*/}}
{{- define "pvc-data" -}}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- printf "%s-%s-%s" .Release.Name $name "data" | trunc 63 | trimSuffic "-" -}}
{{- end -}}

{{- define "pvc-log" -}}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- printf "%s-%s-%s" .Release.Name $name "log" | trunc 63 | trimSuffic "-" -}}
{{- end -}}

{{- define "pvc-config" -}}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- printf "%s-%s-%s" .Release.Name $name "config" | trunc 63 | trimSuffic "-" -}}
{{- end -}}