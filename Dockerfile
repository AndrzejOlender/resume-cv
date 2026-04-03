FROM debian:bookworm-slim
LABEL maintainer="Andrzej Olender" \
      description="A docker image based on Debian that provides pdflatex and common packages"

# Latex packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      texlive-latex-recommended texlive-fonts-recommended \
      texlive-latex-extra texlive-fonts-extra texlive-lang-all && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /root

CMD ["bash"]
