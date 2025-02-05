ARG CCF_VERSION=5.0.11

FROM ghcr.io/microsoft/ccf/app/dev/sgx:ccf-${CCF_VERSION}

RUN apt update && \
    apt install -y \
    python3.8 \
    python3-pip

RUN python3.8 -m pip install pip --upgrade

# Install CCF Python package to procure cose_signing
RUN pip install ccf==5.* || exit 1

COPY entrypoint.sh actions/deploy/entrypoint.sh

RUN ["chmod", "+x", "/actions/deploy/entrypoint.sh"]
ENTRYPOINT ["/actions/deploy/entrypoint.sh"]