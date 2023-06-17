#!/bin/bash
#set -x

# API data must be filled ( https://api.contabo.com/ )
CLIENT_ID=
CLIENT_SECRET=
API_USER=
API_PASSWORD=

ACCESS_TOKEN=$(curl -d "client_id=$CLIENT_ID" -d "client_secret=$CLIENT_SECRET" --data-urlencode "username=$API_USER" --data-urlencode "password=$API_PASSWORD" -d 'grant_type=password' 'https://auth.contabo.com/auth/realms/contabo/protocol/openid-connect/token' | jq -r '.access_token')

curl -s -X GET 'https://api.contabo.com/v1/compute/instances/100058232/snapshots' -H 'Content-Type: application/json' -H "Authorization: Bearer ${ACCESS_TOKEN}" -H 'x-request-id: 04e0f898-37b4-48bc-a794-1a57abe6aa55' -H 'x-trace-id: 123213' | jq '.data'| jq -r '.[].snapshotId' |sed 's/snap//' > /tmp/snaplog

SNAP1=$(sed -n '1p' /tmp/snaplog)
SNAP2=$(sed -n '2p' /tmp/snaplog)

# Detect oldest snapshot
OLDEST_SNAPSHOT=$(echo $(( SNAP1 < SNAP2 ? SNAP1 : SNAP2 )) )

# Delete old snapshot
curl -X DELETE https://api.contabo.com/v1/compute/instances/100058232/snapshots/snap${OLDEST_SNAPSHOT} -H 'Content-Type: application/json' -H "Authorization: Bearer ${ACCESS_TOKEN}" -H 'x-request-id: 04e0f898-37b4-48bc-a794-1a57abe6aa55' -H 'x-trace-id: 75681'

# Create new snapshot
curl -X POST 'https://api.contabo.com/v1/compute/instances/100058232/snapshots' -H 'Content-Type: application/json' -H "Authorization: Bearer ${ACCESS_TOKEN}" -H 'x-request-id: 04e0f898-37b4-48bc-a794-1a57abe6aa55' -H 'x-trace-id: 75681' -d '{"name":"API-Autosnapshot-Script","description":"API-Auto-Snapshot"}'
