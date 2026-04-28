# Nature Protocols submission checklist

Tick boxes as the manuscript matures. The checklist is loosely organized
to match Nature Protocols' "How to write a Nature Protocols article"
guidance and the journal's submission portal.

## Scope and framing

- [ ] Protocol describes a **single, mature method** that has been
  applied to ≥1 published study or has reproducible case data.
- [ ] Method offers a **clear advance** over alternatives (articulated
  in `content/01.introduction.md` → "Comparison to other methods").
- [ ] Title is ≤ 15 words and includes the method name.
- [ ] Editorial summary ≤ 75 words.
- [ ] Abstract ≤ 250 words.

## Required sections (Nature Protocols house structure)

- [x] Editorial summary
- [x] Abstract
- [x] Introduction — Development of the protocol, Overview of the
      procedure, Applications, Comparison with other methods
- [x] Experimental design
- [ ] **Materials** — REAGENTS, EQUIPMENT, REAGENT/EQUIPMENT SETUP
- [ ] **Procedure** — numbered steps with CRITICAL STEPs, OPTIONs and
      PAUSE POINTs
- [ ] **Timing** — table aligned to procedure steps
- [ ] **Troubleshooting** — Step / Problem / Possible reason / Solution
- [ ] **Anticipated results** — numbered figures with quantitative
      benchmarks
- [ ] (Optional) Discussion / Outlook
- [x] Data availability statement
- [x] Code availability statement
- [x] Author contributions (CRediT)
- [x] Acknowledgements
- [x] Competing interests
- [x] References

## Figures and tables

- [ ] Figure 1 — workflow schematic at 300 dpi, ≤ 6 in width.
- [ ] Per‑module figures (Figs. 2–5): cell typing, ploidy, SNV/MSA,
      phylogeny.
- [ ] All figures referenced in text via Manubot `{@fig:tag}` syntax.
- [ ] Tables referenced via `{@tbl:tag}`.
- [ ] Source data files prepared as supplementary CSV/Excel.

## Reproducibility

- [ ] All software dependencies pinned in
      [`build/environment.yml`](build/environment.yml) and in the
      workflow's `Dockerfile`.
- [ ] Container image (Docker/Singularity) released on GHCR / Sylabs
      with a tagged version corresponding to the manuscript.
- [ ] Workflow GitHub repo has a tagged release (`vX.Y.Z`) cited in
      `content/03.materials.md`.
- [ ] Example datasets and expected outputs hosted on Zenodo with a
      DOI.
- [ ] Reporting Summary completed (Nature Research checklist).
- [ ] Code availability statement names the exact release tag and DOI.

## Build / CI

- [ ] `bash build/build.sh` runs to completion locally on a clean conda
      env.
- [ ] GitHub Actions Manubot workflow is green on `main`.
- [ ] gh-pages site renders the latest manuscript.
- [ ] Lint workflow (markdownlint + cspell) is green.
- [ ] All `TODO` markers in `content/` resolved.

## Pre-submission review

- [ ] Internal lab read‑through (Sayaka Miura) — sign‑off in
      `sessions/`.
- [ ] External methodological review (one expert in single‑cell
      genomics, one in phylogenetics).
- [ ] Plagiarism / similarity check on the rendered manuscript.
- [ ] All open questions in `OPEN_QUESTIONS.md` resolved.

## Submission portal

- [ ] Cover letter naming Nature Protocols and proposed handling editor.
- [ ] Suggested reviewers (≥3) and excluded reviewers documented.
- [ ] License: CC BY 4.0 (manuscript) / open license for code.
