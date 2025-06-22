#!/bin/bash
COMMIT_SHA=$1

curl -X POST \
  -H "Authorization: token $ORCH_TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/$ORCH_REPO/dispatches \
  -d '{
    "event_type": "deployment_request",
    "client_payload": {
      "commit_sha": "'"$COMMIT_SHA"'",
      "repository": "backend-main",
      "environment": "staging"
    }
  }'

echo "Orchestrator triggered for commit: $COMMIT_SHA"