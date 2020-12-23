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
{{- define "pvdata" -}}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- printf "%s-%s-%s" .Release.Name $name "data" | trunc 63 | trimSuffic "-" -}}
{{- end -}}

{{- define "pvlog" -}}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- printf "%s-%s-%s" .Release.Name $name "log" | trunc 63 | trimSuffic "-" -}}
{{- end -}}

{{- define "pvconfig" -}}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- printf "%s-%s-%s" .Release.Name $name "config" | trunc 63 | trimSuffic "-" -}}
{{- end -}}

{{/*
persistent volume claims
*/}}
{{- define "pvcdata" -}}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- printf "%s-%s-%s" .Release.Name $name "data" | trunc 63 | trimSuffic "-" -}}
{{- end -}}

{{- define "pvclog" -}}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- printf "%s-%s-%s" .Release.Name $name "log" | trunc 63 | trimSuffic "-" -}}
{{- end -}}

{{- define "pvcconfig" -}}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- printf "%s-%s-%s" .Release.Name $name "config" | trunc 63 | trimSuffic "-" -}}
{{- end -}}