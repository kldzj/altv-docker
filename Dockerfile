FROM debian:10-slim
ARG ALTV_BRANCH="release"
ARG ALTV_VERSION="latest"
ARG ALTV_CS="false"

WORKDIR /root

COPY . .
RUN chmod +x ./scripts/*.sh
RUN useradd -ms /bin/bash altv
RUN ./scripts/00-dependencies.sh
RUN ./scripts/10-server.sh
RUN ./scripts/20-cleanup.sh
RUN chown -R altv /opt/altv
RUN chmod +x /opt/altv/altv-server

WORKDIR /home/altv
COPY ./scripts/30-entrypoint.sh ./entrypoint.sh
RUN chmod +x ./entrypoint.sh
RUN chown altv ./entrypoint.sh

USER altv
WORKDIR /opt/altv/

EXPOSE 7788/udp
EXPOSE 7788/tcp

ENTRYPOINT [ "/home/altv/entrypoint.sh" ]