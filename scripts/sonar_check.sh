#!/usr/bin/env bash
set -euo pipefail

if ! command -v jq >/dev/null 2>&1; then
  sudo apt-get update -qq
  sudo apt-get install -y jq
fi

: "${SONAR_TOKEN:?SONAR_TOKEN is required}"
: "${SONAR_PROJECT_KEY:?SONAR_PROJECT_KEY is required}"
: "${SONAR_HOST_URL:=https://sonarcloud.io}"

COUNT="$(curl -s -u "${SONAR_TOKEN}:" \
  "${SONAR_HOST_URL}/api/issues/search?componentKeys=${SONAR_PROJECT_KEY}&types=VULNERABILITY&severities=MAJOR&resolved=false" \
  | jq '.total')"

echo "Quantidade de vulnerabilidades (MAJOR): ${COUNT}"

if [ "${COUNT:-0}" -gt 2 ]; then
  echo "Pipeline bloqueada: mais de 2 vulnerabilidades médias encontradas."
  exit 1
fi
