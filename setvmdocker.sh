docker-machine rm -f default && docker-machine create --driver virtualbox default && docker-machine env default && eval $(docker-machine env default) && docker-machine ip default
