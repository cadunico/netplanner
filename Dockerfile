# NetPlanner — imagem estática servida por Nginx
# SPDX-License-Identifier: GPL-3.0-or-later
FROM nginx:stable-alpine

LABEL org.opencontainers.image.title="NetPlanner" \
      org.opencontainers.image.description="Visual IPv4/IPv6 subnet calculator with VLSM" \
      org.opencontainers.image.authors="Carlos Eduardo Mattos da Cruz" \
      org.opencontainers.image.source="https://github.com/cadunico/netplanner" \
      org.opencontainers.image.licenses="GPL-3.0-or-later"

COPY index.html /usr/share/nginx/html/index.html
COPY site.html  /usr/share/nginx/html/site.html
COPY docs/img/  /usr/share/nginx/html/docs/img/

EXPOSE 80
HEALTHCHECK --interval=30s --timeout=3s CMD wget -qO- http://127.0.0.1/ >/dev/null || exit 1
