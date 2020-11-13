FROM debian:stretch
LABEL maintainer="Andrzej Olender" \
      description="A docker image based on Debian that provides pdflatex and common packages" \
      repo="https://hub.docker.com/repository/docker/andrzejolender/pdflatex"

# Latex packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends texlive-latex-recommended texlive-fonts-recommended && \
    apt-get install -y --no-install-recommends texlive-latex-extra texlive-fonts-extra texlive-lang-all && \
    apt-get purge --auto-remove && \
    apt-get clean \
    rm -rf /var/lib/apt/lists/* && 

WORKDIR /root

# Default command
CMD ["bash"]