#!/bin/bash

cp $1 /opt/ccf_sgx/bin/set_js_app.json

echo "$CERTD" > /opt/ccf_sgx/bin/cert
echo "$KEYD" > /opt/ccf_sgx/bin/key

cd /opt/ccf_sgx/bin
echo "Submitting the JS app."
response_code=$(curl -k -s -i -o response.txt -w  "%{response_code}" -L -X PUT ${CCF_URL}/app/userDefinedEndpoints?api-version=2024-08-22-preview -H "Content-Type: application/json" --data-binary set_js_app.json --cert cert --key key)
echo "Response from ACL: $response_code"
echo "response_code=$response_code" >> $GITHUB_OUTPUT