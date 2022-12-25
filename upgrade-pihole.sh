#!/bin/bash
podman pull docker.io/pihole/pihole
podman stop pihole
podman rm pihole
podman run -d --name pihole -v /opt/pihole/etc-pihole/:/etc/pihole:z -v /opt/pihole/etc-dnsmasq.d/:/etc/dnsmasq.d:z -e TZ='America/New York' -e WEBPASSWORD='r@stp@st@pihole' -p 53:53/tcp -p 53:53/udp -p 8000:80 --cap-add=NET_ADMIN docker.io/pihole/pihole:latest
podman generate systemd pihole > /etc/systemd/system/container-pihole.service
