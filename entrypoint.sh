#!/bin/bash

API_VERSION="2024-08-22-preview"
CONTENT_TYPE="Content-Type: application/json"

cp $1 /opt/ccf_sgx/bin/bundle.json

echo "$CERTD" > /opt/ccf_sgx/bin/cert
echo "$KEYD" > /opt/ccf_sgx/bin/key

echo "Admin cert: ${CERTD:0:10}..."
echo "Admin key: ${KEYD:0:10}..."

cd /opt/ccf_sgx/bin
echo "Working dir /opt/ccf_sgx/bin"
echo "Sending PUT request to ${CCF_URL}/app/userDefinedEndpoints?api-version=$API_VERSION"
response_code=$(curl -k -s -i -o response.txt -w  "%{response_code}" -L -X PUT ${CCF_URL}/app/userDefinedEndpoints?api-version=$API_VERSION -H "$CONTENT_TYPE" --data-binary "@/opt/ccf_sgx/bin/bundle.json" --cert cert --key key)
echo "Response from ACL: $response_code"
echo "response_code=$response_code" >> $GITHUB_OUTPUT
