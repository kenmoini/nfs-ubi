FROM registry.access.redhat.com/ubi8/ubi-init:latest

# Basic Updates
RUN dnf update -y \
  && dnf install -y nfs-utils rpcbind \
  && dnf clean all \
  && rm -rf /var/cache/yum \
  && rm /etc/idmapd.conf /etc/exports

# http://wiki.linux-nfs.org/wiki/index.php/Nfsv4_configuration
RUN mkdir -p /var/lib/nfs/rpc_pipefs                                                     && \
    mkdir -p /var/lib/nfs/v4recovery                                                     && \
    echo "rpc_pipefs  /var/lib/nfs/rpc_pipefs  rpc_pipefs  defaults  0  0" >> /etc/fstab && \
    echo "nfsd        /proc/fs/nfsd            nfsd        defaults  0  0" >> /etc/fstab
    
RUN systemctl enable --now rpcbind \
 && systemctl enable --now nfs-server

RUN rm -rf /var/log/*

EXPOSE 2049
EXPOSE 111
EXPOSE 32765
EXPOSE 32767

CMD [ "/sbin/init" ]
