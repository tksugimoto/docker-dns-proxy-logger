FROM alpine:3.9

RUN apk --update --no-cache add dnsmasq

CMD ["dnsmasq" \
    ,"--no-daemon" \
    ,"--no-hosts" \
    ,"--log-queries" \
    ,"--dns-loop-detect" \
]
