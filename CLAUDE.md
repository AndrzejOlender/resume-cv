# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

LaTeX-based CV/resume for Andrzej Olender. The CV is written in `main.tex` using a custom layout (no CV template class) built on `article` with `paracol` for two-column design.

## Build

Compile PDF locally:
```bash
pdflatex -interaction=batchmode main.tex
```

Build using Docker:
```bash
docker build -t resume-cv .
docker run -v $(pwd):/root resume-cv pdflatex -interaction=batchmode main.tex
```

The Docker image (`andrzejolender/resume-cv:1.0.0`) is Debian-based with full texlive packages.

## CI/CD

GitHub Actions workflow (`.github/workflows/main.yml`) runs on push to `master`/`dev` and on PRs to `master`. It compiles `main.tex` and uploads the resulting PDF as artifact `CVAndrzejOlender`.

## Structure

- `main.tex` — single-file CV source. Defines all custom commands (`\cvevent`, `\cvskill`, `\cvsection`, `\cvmetaevent`, etc.) at the top, then document content below line ~258.
- Layout: 31/69 column ratio (`\columnratio{0.31}`). Left column = photo, skills, certificates, contact, education, hobby. Right column = header, about me, work experience.
- Colors: primary `maincol` RGB(48,95,118), dark `darkcol` RGB(70,70,70), light `lightcol` RGB(245,245,245).
- Assets: `andrzejolender.jpg` (photo), `qrcode.png`.
- Pre-built PDFs: `CV_AndrzejOlender-EN.pdf`, `CV_AndrzejOlender-PL.pdf`.
