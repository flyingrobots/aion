#!/usr/bin/env bash
set -euo pipefail

# Build and package an arXiv-ready tarball for aion-holography.
# Output: ax.tar in repository root.
#
# Steps:
#  1. Build main.pdf (to generate an up-to-date main.bbl).
#  2. Collect only the files arXiv needs: *.tex, Makefile, main.bbl.
#     (No .bib, .pdf, or aux files.)
#  3. Strip leading comment lines from .tex sources.
#  4. Create ax.tar at repo root.
#
# Usage: scripts/make-arxiv.sh

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
SRC="${ROOT}/aion-holography"
OUT="${ROOT}/ax.tar"

echo "==> Building PDF to refresh main.bbl"
cd "${SRC}"
latexmk -pdf main.tex >/dev/null

echo "==> Assembling arXiv payload"
WORKDIR="$(mktemp -d "${ROOT}/arxiv.XXXXXX")"
trap 'rm -rf "${WORKDIR}"' EXIT

# Copy only the needed files.
rsync -a --prune-empty-dirs \
  --include 'Makefile' \
  --include '*.tex' \
  --include 'main.bbl' \
  --exclude '*' \
  "${SRC}/" "${WORKDIR}/"

# Strip full-line comments from .tex sources (keep inline %).
find "${WORKDIR}" -maxdepth 1 -name '*.tex' -type f -print0 | while IFS= read -r -d '' f; do
  perl -ni -e 'next if /^\\s*%/; print' "$f"
done

echo "==> Creating ax.tar at ${OUT}"
tar -C "${WORKDIR}" -cf "${OUT}" . >/dev/null
echo "Wrote ${OUT}"
