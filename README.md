# scPhylogenomics — Nature Protocols manuscript

Manubot source for the protocol article describing the
[scPhylogenomics](https://github.com/ewafula/scPhylogenomics) workflow:
a modular, containerized pipeline that infers clonal tumor evolution
from 10x Genomics single‑cell RNA‑seq data.

| Output | Latest build |
|---|---|
| HTML  | `output/manuscript.html`  (CI artifact and `gh-pages` site) |
| PDF   | `output/manuscript.pdf`   (CI artifact) |
| DOCX  | `output/manuscript.docx`  (CI artifact when `BUILD_DOCX=true`) |

## Repository layout

```text
content/                 ← Markdown sections (numbered for Manubot)
  00.front-matter.md     ← Editorial summary, abstract, key references
  01.introduction.md     ← Introduction, Development, Overview, Applications, Comparison
  02.experimental-design.md
  03.materials.md        ← REAGENTS / EQUIPMENT / SETUP
  04.procedure.md        ← Numbered Nature Protocols steps (Modules 1–5)
  05.timing.md
  06.troubleshooting.md
  07.anticipated-results.md
  08.discussion.md
  09.declarations.md     ← Data/Code availability, Contributions, COI
  99.references.md       ← Manubot reference anchor
  metadata.yaml
  manual-references.json
  citation-tags.tsv
  images/
build/                   ← build.sh, environment.yml, assets/
.github/workflows/       ← Manubot build + lint CI
sessions/                ← dated lab-notebook session notes (LOCAL-ONLY, gitignored)
SUBMISSION_CHECKLIST.md
OPEN_QUESTIONS.md
AGENTS.md                ← onboarding guide for assistants/collaborators
```

## Build the manuscript locally

```bash
# 1. Install the conda environment (mamba recommended)
mamba env create -f build/environment.yml
mamba activate manubot

# 2. (Optional) drop the Nature Protocols CSL into build/assets/
#    https://github.com/citation-style-language/styles
curl -L -o build/assets/style.csl \
  https://raw.githubusercontent.com/citation-style-language/styles/master/nature.csl

# 3. Render
bash build/build.sh

# 4. Outputs
open output/manuscript.html   # macOS; xdg-open on Linux
```

## Continuous integration

Pushes and pull requests to `main` trigger
[`.github/workflows/manubot.yaml`](.github/workflows/manubot.yaml),
which:

1. Creates the conda environment from `build/environment.yml`.
2. Runs `bash build/build.sh`.
3. Uploads `output/manuscript.{html,pdf,docx}` as a job artifact.
4. On pushes to `main`, deploys `output/` to the `gh-pages` branch so
   the latest manuscript is browsable at
   `https://ewafula.github.io/scPhylogenomics-manuscript/`.

A separate
[`.github/workflows/lint.yaml`](.github/workflows/lint.yaml) runs
markdownlint and cspell on every push/PR.

## Working over multiple sessions

This is a multi‑week writing project. Use `sessions/` as the lab
notebook. **The `sessions/` folder and the original Word working draft
are gitignored on purpose** — they are personal continuity files, not
part of the published manuscript, and they live only on the working
machine.

1. Read [`sessions/README.md`](sessions/README.md).
2. Copy [`sessions/_TEMPLATE.md`](sessions/_TEMPLATE.md) to
   `sessions/$(date +%Y-%m-%d).md`.
3. End each session by filling in **Summary**, **Decisions**,
   **Changes**, **Open questions**, **Next steps**.
4. Promote questions into [`OPEN_QUESTIONS.md`](OPEN_QUESTIONS.md) when
   they need a co‑author or external answer.
5. Tick off boxes in
   [`SUBMISSION_CHECKLIST.md`](SUBMISSION_CHECKLIST.md) as the
   manuscript matures.

See [`AGENTS.md`](AGENTS.md) for a complete onboarding/runbook.

## License

Manuscript text: CC BY 4.0. Build scripts: BSD‑2‑Clause (or as
permitted by Manubot rootstock — final license to be confirmed before
submission).
