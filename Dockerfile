FROM docker.io/debian:bookworm
RUN apt-get -y update && apt-get -y upgrade && apt-get -y --no-install-recommends install procps sudo init gnupg gnupg2 gnupg1 python3 python3-pip openssl curl net-tools nano
CMD [ "/bin/bash", "-c", "/usr/bin/tail -f /dev/null" ]