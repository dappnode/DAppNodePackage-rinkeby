ARG VERSION
FROM ethereum/client-go:$VERSION as geth

# Pull Geth into a second stage deploy alpine container
FROM alpine:edge

RUN apk add --no-cache ca-certificates
COPY --from=geth /usr/local/bin/geth /usr/local/bin/geth
ENTRYPOINT [ "sh", "-c", "eval geth --rinkeby --rpc --rpccorsdomain='*' --rpcaddr='0.0.0.0' --rpcvhosts='*' --ws --wsaddr='0.0.0.0' --wsorigins='*' ${EXTRA_OPTS}"]
