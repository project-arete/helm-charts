{{- define "cns_password" -}}
{{ randAlphaNum 16 }}
{{- end -}}