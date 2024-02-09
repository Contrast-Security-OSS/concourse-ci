# Deploy this using 1Password CLI to have secrets injected
# op inject -i secret.yml.tpl -o secret.yml && kubectl apply -f secret.yml && rm secret.yml
apiVersion: v1
kind: Secret
stringData:
  api_key: "op://Personal/apptwo/keys/api_key"
  authorization: "op://Personal/apptwo/keys/auth_header"
  org_uuid: "op://Personal/apptwo/keys/org_uuid"
  url: "op://Personal/apptwo/keys/teamserver_url"
  username: "op://Personal/apptwo/username"
  service_key: "op://Personal/apptwo/keys/service_key"
metadata:
  name: contrast-cli-creds
  namespace: concourse-ci-main
type: Opaque
