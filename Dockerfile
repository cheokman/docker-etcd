FROM cheokman/docker-go:1.7.3
MAINTAINER Ben Wu <wucheokman@gmail.com>

ENV ETCD_HOME $GOPATH/src/etcd
ENV ETCD_VER v3.1.0-rc.0
ENV DOWNLOAD_URL https://github.com/coreos/etcd/releases/download


RUN mkdir -p $ETCD_HOME \
    && curl -L ${DOWNLOAD_URL}/${ETCD_VER}/etcd-${ETCD_VER}-linux-amd64.tar.gz  -o /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz \
    && tar xzvf /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz -C ${ETCD_HOME} --strip-components=1

EXPOSE 4001 2380 2379
WORKDIR ${ETCD_HOME}

CMD ["./etcd"]