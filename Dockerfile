FROM alpine:3.22

COPY scripts/ssl /root

CMD ["/bin/sh", "-c", ". /root/generate-self-signed-certificate.sh"]