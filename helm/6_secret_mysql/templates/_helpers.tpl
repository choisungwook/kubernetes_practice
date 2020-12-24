{{- define "name" -}}
{{- default .Release.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Return database name
*/}}
{{- define "database.name" -}}
{{- default (include "name" .) .Values.databasename -}}
{{- end -}}

{{/*
Return root password
*/}}
{{- define "root.password" -}}
{{- if .Values.rootpassword -}}
  {{- .Values.rootpassword -}}
{{- else -}}
  {{- randAlphaNum 10 -}}
{{- end -}}
{{- end -}}

{{/*
Return MYSQL_USER
*/}}
{{- define "user.name" -}}
{{- default "user" .Values.user.name -}}
{{- end -}}

{{/*
Return MYSQL_PASSWORD
*/}}
{{- define "user.password" -}}
{{- if .Values.user.password -}}
  {{- .Values.user.password -}}
{{- else -}}
  {{- randAlphaNum 10 -}}
{{- end -}}
{{- end -}}