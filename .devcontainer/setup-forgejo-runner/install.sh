#!/bin/bash
set -xe

ARCH=$(uname -m | sed 's/x86_64/amd64/;s/aarch64/arm64/')
RUNNER_VERSION=$(curl -X 'GET' https://data.forgejo.org/api/v1/repos/forgejo/runner/releases/latest | jq .name -r | cut -c 2-)
FORGEJO_URL="https://code.forgejo.org/forgejo/runner/releases/download/v${RUNNER_VERSION}/forgejo-runner-${RUNNER_VERSION}-linux-${ARCH}"

curl -o /usr/local/bin/forgejo-runner "${FORGEJO_URL}"
chmod +x /usr/local/bin/forgejo-runner

cat >/usr/local/bin/forgejo-runner-exec<<EOF
#!/bin/bash
exec forgejo-runner exec --container-daemon-socket /tmp/podman-143d1b19-36fb-4790-9a48-eb7a5e5e378e.sock --image=data.forgejo.org/oci/node:lts "\$@"
EOF
chmod +x /usr/local/bin/forgejo-runner-exec

# XXX: fix stupid access error
echo "" > /tmp/.devcontainer-setup
