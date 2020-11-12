FROM golang:1.15-alpine as builder

ARG UPSTREAM_VERSION

RUN apk add --no-cache make gcc musl-dev linux-headers git 
ADD https://golang.org/dl/go1.15.5.src.tar.gz /tmp/go.tar.gz
RUN (cd /tmp && tar -xf go.tar.gz)
RUN (cd /tmp/go/src && ./make.bash)
ENV PATH="/tmp/go/bin:${PATH}"

RUN git clone -b ${UPSTREAM_VERSION} https://github.com/ethereum/go-ethereum.git && \
    cd go-ethereum && make geth
    
# Pull Geth into a second stage deploy alpine container
FROM alpine:edge

RUN apk add --no-cache ca-certificates
COPY --from=geth /usr/local/bin/geth /usr/local/bin/geth
ENTRYPOINT [ "sh", "-c", "eval geth --rinkeby --rpc --rpccorsdomain='*' --rpcaddr='0.0.0.0' --rpcvhosts='*' --ws --wsaddr='0.0.0.0' --wsorigins='*' ${EXTRA_OPTS}"]
