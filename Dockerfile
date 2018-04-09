FROM ethereum/client-go:v1.7.3
ENV HOME /home
WORKDIR $HOME
COPY rinkeby.json $HOME
RUN geth --datadir=$HOME/.rinkeby init $HOME/rinkeby.json

ENTRYPOINT geth --networkid=4 --fast --datadir=/home/.rinkeby --cache=512 --rpc --rpccorsdomain "*" --rpcaddr="0.0.0.0" --ws --wsaddr="0.0.0.0" --wsorigins="*" --bootnodes=enode://a24ac7c5484ef4ed0c5eb2d36620ba4e4aa13b8c84684e1b4aab0cebea2ae45cb4d375b77eab56516d34bfbd3c1a833fc51296ff084b770b94fb9028c4d25ccf@52.169.42.101:30303