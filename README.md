# Action for deployment of applications to CCF

This GitHub action is designed to automate deployment of an application to a CCF network.

---

## Pre-reqs

These action require 2 secrets to be stored in GitHub.

- ADMINCERT - The certificate that has admin access to ACL, which will be used to submit the transactions.

- ADMINKEY - The private key associated with the ADMINCERT.

---

## Example workflow: Sample

```
on: [push]

jobs:
  ccf-deploy:
    runs-on: ubuntu-latest
    name: Deploy CCF application
    env:
      CCF_URL: '<your ccf endpoint>/'
    steps:
      - name: Checkout
        uses: actions/checkout@v3
      - name: CCF deploy
        uses: msftsettiy/acl-deploy-app-action@v0.1.2-alpha
        id: deploy
        env:
          CERTD: ${{ secrets.ADMINCERT }}
          KEYD: ${{ secrets.ADMINKEY }}
        with:
          application: '<path to your bundled application>'
      - name: Get the response code
        run: echo "The response code is ${{ steps.deploy.outputs.response_code }}"
```
