# Build Geth in a stock Go builder container
FROM golang:1.11-alpine as builder

WORKDIR /usr/src/app

RUN apk add --no-cache make gcc musl-dev linux-headers git

ARG BRANCH=v1.9.1

RUN git clone -b $BRANCH https://github.com/ethereum/go-ethereum.git
RUN cd go-ethereum && make geth

# Pull Geth into a second stage deploy alpine container
FROM alpine:latest

RUN apk add --no-cache ca-certificates
COPY --from=builder /usr/src/app/go-ethereum/build/bin/geth /usr/local/bin/

EXPOSE 30303 30303/udp 30304/udp
ENTRYPOINT geth --rinkeby --rpc --rpccorsdomain "*" --rpcaddr="0.0.0.0" --rpcvhosts "*" --ws --wsaddr="0.0.0.0" --wsorigins="*" $EXTRA_OPTS