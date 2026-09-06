FROM amazon/aws-cli:latest

# podman build -t awscli-with-session .

RUN yum update -y && \
    yum install -y amazon-ssm-agent || true && \
    yum install -y groff less curl && \
    curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_64bit/session-manager-plugin.rpm" -o "session-manager-plugin.rpm" && \
    yum install -y session-manager-plugin.rpm && \
    rm session-manager-plugin.rpm && \
    yum clean all

ENTRYPOINT ["aws"]
