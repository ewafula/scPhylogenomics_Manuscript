# AGENTS.md — instructions for assistants helping with this manuscript

This file gives an LLM (or a new human collaborator) what they need to
resume work without re‑deriving the project context. Read this first.

## What this repository is

A Manubot manuscript for the **scPhylogenomics** protocol — a modular,
containerized workflow that infers clonal tumor evolution from 10x
Genomics scRNA‑seq data. Target journal: **Nature Protocols**.

The companion software lives at
<https://github.com/ewafula/scPhylogenomics>; this repository contains
only the manuscript and its build pipeline.

## Where things are

```
content/                 ← Markdown sections, numbered for Manubot ordering
  metadata.yaml          ← title, authors, affiliations, keywords
  manual-references.json ← citations Manubot can't fetch by ID
  citation-tags.tsv      ← @tag aliases
  images/                ← figures (PNG/SVG)
build/                   ← build.sh, environment.yml, assets/style.csl
ci/                      ← (created by the build) Manubot cache
.github/workflows/       ← Manubot build + lint CI
sessions/                ← dated session notes (LOCAL-ONLY, gitignored)
                           start every session here
SUBMISSION_CHECKLIST.md  ← Nature Protocols checklist (untick = remaining work)
OPEN_QUESTIONS.md        ← unresolved scientific/editorial questions
```

## How to resume a session

1. Open the most recent file under `sessions/`. Read the last
   "Decisions" / "Open questions" / "Next steps" blocks.
2. Skim `OPEN_QUESTIONS.md` and `SUBMISSION_CHECKLIST.md`.
3. `git log -- content/` shows what changed last.
4. Copy the template:
   ```bash
   cp sessions/_TEMPLATE.md "sessions/$(date +%Y-%m-%d).md"
   ```

## Style conventions used in this manuscript

- **Voice:** scientific present tense for method descriptions, past
  tense for case‑study results.
- **Markers in `content/04.procedure.md`:** Nature Protocols uses the
  symbols `▲ CRITICAL STEP`, `◆ OPTION`, `❚ PAUSE POINT`. We mirror
  those literal strings so the rendered document can be scanned at a
  glance.
- **Citations:** prefer `[@doi:...]`. Reserve `[@url:...]` for
  resources without a DOI. Define an alias in
  `content/citation-tags.tsv` only when a citation is used in many
  places.
- **Figures:** referenced via `{@fig:...}`; PNG masters go in
  `content/images/`.
- **Numbers:** SI units; en dashes for ranges (e.g., 24–48 h).

## How to extend the *Procedure* section

For each module:

1. Open `scPhylogenomics/analyses/<module>/README.md` and the
   wrapper `run-<module>.sh`.
2. In `content/04.procedure.md`, write **numbered, imperative,
   single‑action steps** continuing the global numbering (Module 1
   uses steps 1–5, Module 2 uses 6–8, etc.).
3. Surface every command‑line flag that a typical user will tune.
4. Add a CRITICAL STEP under any operation whose failure would silently
   propagate downstream (e.g., copykat baseline, cellsnp‑lite tag
   handling).
5. Update `content/05.timing.md` so its row count matches.

## How to extend *Troubleshooting*

Append rows to the table in `content/06.troubleshooting.md`. The
**Step** column must reference the numeric step in `04.procedure.md`.

## How to add a citation

For a DOI‑backed work, just write `[@doi:10.1038/s41587-023-01767-y]` in
the Markdown — Manubot will fetch the metadata at build time. To stop
re‑fetching, commit the resulting JSON entry into
`content/manual-references.json`.

## What NOT to do

- Don't paste the rendered HTML/PDF into the repo. CI builds them.
- Don't break the numeric prefixes on `content/*.md` files; Manubot
  concatenates them in alphabetical order.
- Don't edit `sessions/_TEMPLATE.md`. Copy it instead.
- Don't introduce literature in the prose without a citation.

## Build it locally

```bash
mamba env create -f build/environment.yml
mamba activate manubot
bash build/build.sh           # writes output/manuscript.{html,pdf,docx}
```

## Build it in CI

Push to `main` (or open a PR). The Manubot workflow uploads
`output/manuscript.{html,pdf,docx}` as artifacts and, on `main`,
publishes `output/` to the `gh-pages` branch.
