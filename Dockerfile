# Generated with JReleaser 1.9.0 at 2023-12-05T21:09:18.00924-08:00
FROM azul/zulu-openjdk-alpine:11-jre

    LABEL "org.opencontainers.image.title"="tessellate"
    LABEL "org.opencontainers.image.description"="Tessellate is tool for parsing and partitioning data."
    LABEL "org.opencontainers.image.url"="https://github.com/ClusterlessHQ"
    LABEL "org.opencontainers.image.licenses"="MPL-2.0"
    LABEL "org.opencontainers.image.version"="1.0-wip-dev"
    LABEL "org.opencontainers.image.revision"="8dc2d33cd6c4c3f31fec8acc166edc28f85cc15d"


COPY assembly/* /

RUN unzip tessellate-1.0-wip-dev.zip && \
rm tessellate-1.0-wip-dev.zip && \
chmod +x tessellate-1.0-wip-dev/bin/tess && \
mv /tessellate-1.0-wip-dev /tess

ENV PATH="${PATH}:/tess/bin"


ENTRYPOINT ["/tess/bin/tess"]

CMD ["--help"]
