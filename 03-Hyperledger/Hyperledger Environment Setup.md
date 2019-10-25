## Hyperledger Environment Setup
brew -v
brew install curl
curl -v

docker —version
docker-compose —version

brew install go
go version

export GOPATH=$HOME/go
echo $GOPATH
export PATH=$PATH:$GOPATH/bin
echo $PATH

brew install node
node -v
npm -v

curl -sSL http://bit.ly/2ysbOFE | bash -s 1.2.0

ls
cd fabric-samples/
cd bin


## Deploying Your First Network
cd first-network/

./byfn.sh -h

./byfn.sh generate

ls channel-artifacts

ls crypto-config

./byfn.sh up

./byfn.sh down

./byfn.sh generate
