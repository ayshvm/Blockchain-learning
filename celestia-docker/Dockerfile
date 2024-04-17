FROM ghcr.io/celestiaorg/celestia-app:v1.7.0
USER root

# Install required packages using apk
RUN apk --no-cache add \
        curl \
        jq \
        openssl \
        lz4 \
	    wget 


COPY entrypoint.sh /opt/entrypoint.sh

EXPOSE 26660 26657 26658 26659 9090

ENTRYPOINT [ "/bin/bash", "/opt/entrypoint.sh" ]