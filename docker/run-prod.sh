#!/bin/bash
set -euo pipefail

docker run \
  --env-file ./docker/.env.prod-test \
  --network inertia_ssr_adapters_network \
  -e PORT=4004 \
  -p 4004:4004 \
  inertia_ssr_adapters

