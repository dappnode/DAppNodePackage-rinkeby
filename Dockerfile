FROM ethereum/client-go:v1.8.11
ENV HOME /home
WORKDIR $HOME

ENTRYPOINT geth --rinkeby --fast --datadir=/home/.rinkeby --rpc --rpccorsdomain "*" --rpcaddr="0.0.0.0" --rpcvhosts "*" --ws --wsaddr="0.0.0.0" --wsorigins="*"