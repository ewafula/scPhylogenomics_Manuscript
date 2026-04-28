#!/usr/bin/env bash
# Local Manubot build.
# Reproduces what GitHub Actions runs in `.github/workflows/manubot.yaml`.
#
# Prerequisites (install via build/environment.yml or pip):
#   python>=3.10, manubot, pandoc>=2.19, pandoc-citeproc OR citeproc, pandoc-fignos
#   pandoc-tablenos, pandoc-eqnos
#
# Usage:
#   bash build/build.sh                 # HTML + PDF (default)
#   BUILD_DOCX=true bash build/build.sh # also emit .docx
#   BUILD_LATEX=true bash build/build.sh # also emit .tex
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

mkdir -p output

# 1. Process content/ into a single Markdown file with citation metadata.
manubot process \
  --content-directory=content \
  --output-directory=output \
  --cache-directory=ci/cache \
  --log-level=INFO

# 2. Render outputs via pandoc.
PANDOC_OPTS=(
  --from=markdown
  --to=html
  --standalone
  --self-contained
  --katex
  --csl=build/assets/style.csl
  --bibliography=output/references.json
  --filter=pandoc-fignos
  --filter=pandoc-tablenos
  --filter=pandoc-eqnos
  --metadata=link-citations:true
  --output=output/manuscript.html
  output/manuscript.md
)
pandoc "${PANDOC_OPTS[@]}"

# PDF via wkhtmltopdf (faster than LaTeX) — fall back to weasyprint if missing.
if command -v weasyprint >/dev/null 2>&1; then
  weasyprint output/manuscript.html output/manuscript.pdf
elif command -v wkhtmltopdf >/dev/null 2>&1; then
  wkhtmltopdf --enable-local-file-access output/manuscript.html output/manuscript.pdf
else
  echo "[build.sh] No PDF renderer found (weasyprint/wkhtmltopdf). Skipping PDF."
fi

# Optional formats.
if [[ "${BUILD_DOCX:-false}" == "true" ]]; then
  pandoc \
    --from=markdown --to=docx \
    --reference-doc=build/assets/reference.docx \
    --bibliography=output/references.json \
    --output=output/manuscript.docx \
    output/manuscript.md
fi

if [[ "${BUILD_LATEX:-false}" == "true" ]]; then
  pandoc \
    --from=markdown --to=latex \
    --bibliography=output/references.json \
    --output=output/manuscript.tex \
    output/manuscript.md
fi

echo "[build.sh] Build complete. See ./output/"
