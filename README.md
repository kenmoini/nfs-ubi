# NFS Server on Red Hat Universal Base Image

## Building the Image

```bash
sudo podman build -t nfs-ubi .
```

## Running the Image

```bash
sudo podman run --privileged \
  -p 2049:2049   -p 2049:2049/udp   \
  -p 111:111     -p 111:111/udp     \
  -p 32765:32765 -p 32765:32765/udp \
  -p 32767:32767 -p 32767:32767/udp \
  nfs-ubi
```
