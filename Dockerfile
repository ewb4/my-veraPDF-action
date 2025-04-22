FROM ghcr.io/verapdf/cli:v1.29.25 AS verapdf-cli-upstream

WORKDIR /tmp

FROM apline:3

# Copy the JRE from the previous stage
ENV JAVA_HOME=/opt/java/openjdk
ENV PATH "${JAVA_HOME}/bin:${PATH}"
COPY --from=verapdf-cli-upstream ${JAVA_HOME} $JAVA_HOME

# Copy the application from the previous stage
COPY --from=verapdf-cli-upstream /opt/verapdf/ /opt/verapdf/

# Copy any source file(s) required for the action
COPY entrypoint.sh /usr/src/

# Configure the container to be run as an executable
ENTRYPOINT ["/usr/src/entrypoint.sh"]