FROM cheokman/docker-go:1.7.3
MAINTAINER Ben Wu <wucheokman@gmail.com>

ENV ETCD_HOME $GOPATH/src/etcd
ENV ETCD_VER v3.0.12
ENV DOWNLOAD_URL https://github.com/coreos/etcd/releases/download
ENV PATH $PATH:${ETCD_HOME}

RUN mkdir -p $ETCD_HOME \
    && curl -L ${DOWNLOAD_URL}/${ETCD_VER}/etcd-${ETCD_VER}-linux-amd64.tar.gz  -o /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz \
    && tar xzvf /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz -C ${ETCD_HOME} --strip-components=1

EXPOSE 2379/tcp 2380/tcp
WORKDIR ${ETCD_HOME}

ENTRYPOINT ["./etcd"]