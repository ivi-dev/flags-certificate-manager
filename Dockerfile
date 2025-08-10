FROM alpine:3.22

WORKDIR /root
COPY scripts/ssl /root

CMD ["/bin/sh", "-c", ". /root/generate-self-signed-certificate.sh"]