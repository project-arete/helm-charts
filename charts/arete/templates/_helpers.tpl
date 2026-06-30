{{/*
    Returns a password: the provided value if set, otherwise the value already
    stored in an existing Secret (so it stays stable across upgrades), otherwise
    a freshly generated random one.
*/}}
{{- define "arete.root.password" -}}
{{- $password := .value -}}
{{- if not $password }}
{{- $existing := lookup "v1" "Secret" .context.Release.Namespace .secretName }}
{{- if and $existing $existing.data }}
{{- $password = index $existing.data .key | b64dec }}
{{- end }}
{{- end }}
{{- if not $password }}
{{- $password = randAlphaNum 32 }}
{{- end }}
{{- $password -}}
{{- end -}}

{{/*
    Name of the etcd root credentials Secret.
*/}}
{{- define "arete.root.etcdSecretName" -}}
{{- printf "%s-etcd-root" .Values.name -}}
{{- end -}}

{{/*
    Returns the etcd root password, base64-encoded, generating one if not set.
*/}}
{{- define "arete.root.etcdPassword" -}}
{{- $secretName := include "arete.root.etcdSecretName" . -}}
{{- include "arete.root.password" (dict "value" .Values.etcd.rootPassword "secretName" $secretName "key" "ETCD_ROOT_PASSWORD" "context" .) | b64enc -}}
{{- end -}}




{{/*
    Name of the etcd user credentials Secret.
*/}}
{{- define "arete.user.etcdSecretName" -}}
{{- printf "%s-etcd-user" .Values.name -}}
{{- end -}}

{{/*
    Returns a username: the provided value if set, otherwise the value already
    stored in an existing Secret (so it stays stable across upgrades), otherwise
    a freshly generated random one.
*/}}
{{- define "arete.user.username" -}}
{{- $username := .value -}}
{{- if not $username }}
{{- $existing := lookup "v1" "Secret" .context.Release.Namespace .secretName }}
{{- if and $existing $existing.data }}
{{- $username = index $existing.data .key | b64dec }}
{{- end }}
{{- end }}
{{- if not $username }}
{{- $username = randAlphaNum 7 }}
{{- end }}
{{- $username -}}
{{- end -}}

{{/*
    Returns the etcd username, base64-encoded, generating one if not set.
*/}}
{{- define "arete.user.etcdUsername" -}}
{{- $secretName := include "arete.user.etcdSecretName" . -}}
{{- include "arete.user.username" (dict "value" .Values.etcd.username "secretName" $secretName "key" "CNS_USERNAME" "context" .) | b64enc -}}
{{- end -}}

{{/*
    Returns a password: the provided value if set, otherwise the value already
    stored in an existing Secret (so it stays stable across upgrades), otherwise
    a freshly generated random one.
*/}}
{{- define "arete.user.password" -}}
{{- $password := .value -}}
{{- if not $password }}
{{- $existing := lookup "v1" "Secret" .context.Release.Namespace .secretName }}
{{- if and $existing $existing.data }}
{{- $password = index $existing.data .key | b64dec }}
{{- end }}
{{- end }}
{{- if not $password }}
{{- $password = randAlphaNum 32 }}
{{- end }}
{{- $password -}}
{{- end -}}

{{/*
    Returns the etcd user password, base64-encoded, generating one if not set.
*/}}
{{- define "arete.user.etcdPassword" -}}
{{- $secretName := include "arete.user.etcdSecretName" . -}}
{{- include "arete.user.password" (dict "value" .Values.etcd.userPassword "secretName" $secretName "key" "CNS_PASSWORD" "context" .) | b64enc -}}
{{- end -}}