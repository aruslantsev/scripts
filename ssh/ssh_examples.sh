# jupyter on remotehost:8900, map ports to localhost:8080
ssh -L 8080:localhost:8900 user@remotehost
# socks proxy
ssh -N -D 5555 proxy-server
