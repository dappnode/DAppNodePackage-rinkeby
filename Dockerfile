ARG UPSTREAM_VERSION

FROM ethereum/client-go:${UPSTREAM_VERSION}

ENTRYPOINT geth --rinkeby --http --http.addr 0.0.0.0 --http.corsdomain "*" --http.vhosts "*" --ws --ws.origins "*" --ws.addr 0.0.0.0 --syncmode ${SYNCMODE:-snap} --port ${P2P_PORT} --metrics --metrics.addr 0.0.0.0 $EXTRA_OPTIONS
