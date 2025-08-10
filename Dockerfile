FROM alpine:3.22

WORKDIR /root
COPY scripts/ssl .

CMD ["/bin/sh", "-c", ". generate-self-signed-certificate.sh"]