FROM centos:7.6.1810

RUN yum -y install dnsmasq

CMD ["dnsmasq" \
    ,"--no-daemon" \
    ,"--no-hosts" \
    ,"--log-queries" \
    ,"--dns-loop-detect" \
]
