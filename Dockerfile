FROM debian:stretch
LABEL maintainer="Andrzej Olender" \
      description="A docker image based on Debian that provides pdflatex and common packages" \
      repo="https://github.com/theredfish/docker-pdflatex"

# Latex packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends texlive-latex-recommended texlive-fonts-recommended && \
    apt-get install -y --no-install-recommends texlive-latex-extra texlive-fonts-extra texlive-lang-all && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get purge --auto-remove && \
    apt-get clean

WORKDIR /root

# Default command
CMD ["bash"]