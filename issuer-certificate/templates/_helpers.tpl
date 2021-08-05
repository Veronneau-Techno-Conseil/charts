{{/*
Expand the name of the chart.
*/}}
{{- define "issuerCertificate.name" -}}
{{- default .Chart.Name .Values.nameOverride | lower | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Expand the name of the chart.
*/}}
{{- define "issuerCertificate.pkcsSecret" -}}
{{- $name := default .Chart.Name .Values.nameOverride | lower | trunc 63 | trimSuffix "-"}}
{{- printf "%s-%s" $name "pkcs" }}
{{- end }}

{{/*
Expand the name of the chart.
*/}}
{{- define "issuerCertificate.jksSecret" -}}
{{- $name := default .Chart.Name .Values.nameOverride | lower | trunc 63 | trimSuffix "-"}}
{{- printf "%s-%s" $name "jks" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "issuerCertificate.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
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
{{- define "issuerCertificate.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}
