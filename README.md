# NFS Server on Red Hat Universal Base Image

## Building the Image

```bash
sudo podman build -t nfs-ubi .
```

## Running the Image

```bash
sudo mkdir -p /opt/nfs/{ocp,ocpreg,vmware,dropbox}

sudo podman run --privileged \
 --name nfs-ubi --network lanBridge --ip "192.168.42.31" \
 -p 2049 \
 -p 111 \
 -p 32765 \
 -p 32767 \
 -v ./exports.example:/etc/exports:ro
 -v /opt/nfs:/nfs
 nfs-ubi
```
