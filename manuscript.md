---
title: 'Single-cell phylogenomics from scRNA-seq SNPs using scPhylogenomics: an end-to-end workflow for clonal tumor evolution analysis'
keywords:
- single-cell RNA-seq
- tumor phylogenomics
- clonal evolution
- SNV calling
- cellsnp-lite
- phylogenetics
- protocol
lang: en-US
date-meta: '2026-04-29'
author-meta:
- Eric K. Wafula
- Prabin Dawdi
- Sayaka Miura
header-includes: |
  <!--
  Manubot generated metadata rendered from header-includes-template.html.
  Suggest improvements at https://github.com/manubot/manubot/blob/main/manubot/process/header-includes-template.html
  -->
  <meta name="dc.format" content="text/html" />
  <meta property="og:type" content="article" />
  <meta name="dc.title" content="Single-cell phylogenomics from scRNA-seq SNPs using scPhylogenomics: an end-to-end workflow for clonal tumor evolution analysis" />
  <meta name="citation_title" content="Single-cell phylogenomics from scRNA-seq SNPs using scPhylogenomics: an end-to-end workflow for clonal tumor evolution analysis" />
  <meta property="og:title" content="Single-cell phylogenomics from scRNA-seq SNPs using scPhylogenomics: an end-to-end workflow for clonal tumor evolution analysis" />
  <meta property="twitter:title" content="Single-cell phylogenomics from scRNA-seq SNPs using scPhylogenomics: an end-to-end workflow for clonal tumor evolution analysis" />
  <meta name="dc.date" content="2026-04-29" />
  <meta name="citation_publication_date" content="2026-04-29" />
  <meta property="article:published_time" content="2026-04-29" />
  <meta name="dc.modified" content="2026-04-29T00:14:43+00:00" />
  <meta property="article:modified_time" content="2026-04-29T00:14:43+00:00" />
  <meta name="dc.language" content="en-US" />
  <meta name="citation_language" content="en-US" />
  <meta name="dc.relation.ispartof" content="Manubot" />
  <meta name="dc.publisher" content="Manubot" />
  <meta name="citation_journal_title" content="Manubot" />
  <meta name="citation_technical_report_institution" content="Manubot" />
  <meta name="citation_author" content="Eric K. Wafula" />
  <meta name="citation_author_institution" content="Department of Biology, The University of Mississippi, University, MS 38677, USA" />
  <meta name="citation_author_orcid" content="0000-0000-0000-0000" />
  <meta name="citation_author" content="Prabin Dawdi" />
  <meta name="citation_author_institution" content="Department of Biology, The University of Mississippi, University, MS 38677, USA" />
  <meta name="citation_author_orcid" content="0000-0000-0000-0000" />
  <meta name="citation_author" content="Sayaka Miura" />
  <meta name="citation_author_institution" content="Department of Biology, The University of Mississippi, University, MS 38677, USA" />
  <meta name="citation_author_orcid" content="0000-0000-0000-0000" />
  <link rel="canonical" href="https://ewafula.github.io/scPhylogenomics_Manuscript/" />
  <meta property="og:url" content="https://ewafula.github.io/scPhylogenomics_Manuscript/" />
  <meta property="twitter:url" content="https://ewafula.github.io/scPhylogenomics_Manuscript/" />
  <meta name="citation_fulltext_html_url" content="https://ewafula.github.io/scPhylogenomics_Manuscript/" />
  <meta name="citation_pdf_url" content="https://ewafula.github.io/scPhylogenomics_Manuscript/manuscript.pdf" />
  <link rel="alternate" type="application/pdf" href="https://ewafula.github.io/scPhylogenomics_Manuscript/manuscript.pdf" />
  <link rel="alternate" type="text/html" href="https://ewafula.github.io/scPhylogenomics_Manuscript/v/027c47fd43ac9902acf4d2c253e77356541294dc/" />
  <meta name="manubot_html_url_versioned" content="https://ewafula.github.io/scPhylogenomics_Manuscript/v/027c47fd43ac9902acf4d2c253e77356541294dc/" />
  <meta name="manubot_pdf_url_versioned" content="https://ewafula.github.io/scPhylogenomics_Manuscript/v/027c47fd43ac9902acf4d2c253e77356541294dc/manuscript.pdf" />
  <meta property="og:type" content="article" />
  <meta property="twitter:card" content="summary_large_image" />
  <link rel="icon" type="image/png" sizes="192x192" href="https://manubot.org/favicon-192x192.png" />
  <link rel="mask-icon" href="https://manubot.org/safari-pinned-tab.svg" color="#ad1457" />
  <meta name="theme-color" content="#ad1457" />
  <!-- end Manubot generated metadata -->
bibliography:
- content/manual-references.json
manubot-output-bibliography: output/references.json
manubot-output-citekeys: output/citations.tsv
manubot-requests-cache-path: ci/cache/requests-cache
manubot-clear-requests-cache: false
...

<!--
This file is part of the scPhylogenomics protocol manuscript.
Manubot will inject the title, authors, affiliations, and metadata defined in
content/metadata.yaml directly above this file at build time. Anything written
here renders *after* the title block.
-->

## Editorial summary {.page_break_before}

We present **scPhylogenomics**, a modular and containerized end‑to‑end
workflow that infers clonal tumor evolution directly from 10x Genomics
single‑cell RNA‑sequencing (scRNA‑seq) data. The protocol exploits somatic
single‑nucleotide variants (SNVs) within transcriptomic reads to reconstruct
high‑resolution clonal histories without requiring matched single‑cell DNA
sequencing.

## Abstract {.page_break_before}

We present scPhylogenomics, a modular and containerized computational
workflow designed to infer clonal tumor evolution directly from 10x Genomics
scRNA‑seq data. Unlike standard transcriptomic pipelines that focus solely on
gene expression‑based cell states, this protocol exploits somatic
single‑nucleotide variants (SNVs) within transcriptomic reads to reconstruct
high‑resolution evolutionary histories. The procedure is organized into five
automated modules: rigorous preprocessing (SoupX, DoubletFinder, and miQC),
reference‑assisted cell typing (Seurat and SingleR), ploidy‑based malignancy
stratification (CopyKAT), optimized single‑cell SNV calling (cellsnp‑lite),
and maximum‑likelihood phylogeny reconstruction (FastTree or IQ‑TREE). A key
advantage of scPhylogenomics over existing tools is its unified interface for
clonal clustering, offering users a choice between deep‑learning–based
manifold methods (SNPmanifold) or hybrid hierarchical weighted non‑negative
matrix factorization (WNMF) to resolve complex subclonal architectures.
Using multi‑site samples from the MSK SPECTRUM HGSOC study as a primary case
study, users can expect to distinguish malignant from non‑malignant cells,
identify site‑enriched clones, and generate annotated phylogenetic trees that
reflect spatial patterns of metastasis. The end‑to‑end execution of the
workflow typically takes 24–48 hours depending on dataset size and available
high‑performance computing (HPC) resources, requiring basic experience with
command‑line and containerized environments.

## Key references {.page_break_before}

<!--
Replace these placeholders with the citations once `manubot cite` has been
run. Use Manubot's `@doi:...`, `@pubmed:...`, or `@url:...` syntax.
-->

- Workflow and case study application — *Wafula et al., in preparation*.
- 10x Genomics Cell Ranger pipeline — `@url:https://www.10xgenomics.com/support/software/cell-ranger`.
- SoupX, DoubletFinder, miQC — preprocessing references (TODO: add DOIs).
- Seurat and SingleR — cell‑typing references (TODO: add DOIs).
- CopyKAT — ploidy inference reference (TODO: add DOI).
- cellsnp‑lite — single‑cell genotyping reference (TODO: add DOI).
- FastTree, IQ‑TREE — maximum‑likelihood phylogenetics references (TODO: add DOIs).
- SNPmanifold — VAE‑based clonal clustering reference (TODO: add DOI).


## Introduction {.page_break_before}

Single‑cell RNA sequencing (scRNA‑seq) has transformed cancer research by
enabling the resolution of intratumoral transcriptional heterogeneity at
single‑cell resolution. Conventional scRNA‑seq analysis workflows, however,
focus predominantly on gene expression–based questions — clustering cells
into phenotypic states, inferring trajectories, and identifying
differentially expressed genes — while largely overlooking the somatic
single‑nucleotide variants (SNVs) embedded in expressed transcripts. In
contrast, the reconstruction of tumor clonal architecture and evolutionary
histories is typically pursued using bulk or single‑cell DNA sequencing
(scDNA‑seq) and dedicated tumor phylogenetics tools. As a result, most
scRNA‑seq datasets remain underexploited with respect to clonal evolution,
despite containing sequence‑level information that could, in principle,
support phylogenetic inference.

Inferring clonal structure from scRNA‑seq is challenging. Coverage is
restricted to expressed loci and shows strong locus‑ and cell‑specific
dropout, 3′/5′ capture biases in droplet‑based platforms distort the
representation of coding regions, and amplification noise and allelic
imbalance can mimic homoplasy or back‑mutation. These properties make
scRNA‑seq intrinsically less suited to *de novo* variant discovery than
scDNA‑seq, but they do not preclude phylogenomics if models and workflows
explicitly account for transcriptomic noise and the targeting of expressed
SNVs. Existing tumor phylogenetics methods such as SCITE, SCARLET and
related frameworks were primarily developed for bulk or scDNA‑seq data and
assume high‑quality, genome‑wide variant calls with well‑characterized error
models. Moreover, there is currently no widely adopted end‑to‑end protocol
that takes users from raw scRNA‑seq data through ambient RNA and doublet
removal, cell‑type annotation, ploidy‑based tumor/normal stratification,
scRNA‑seq–tailored SNV calling, generation of SNP‑based multiple sequence
alignments (MSAs) and clonal clustering, to produce interpretable clonal
phylogenies.

Here we present **scPhylogenomics**, a fully modular, scalable, and
reproducible computational workflow that performs single‑cell phylogenomics
from 10x Genomics Chromium scRNA‑seq data by integrating RNA‑based quality
control, reference‑guided cell‑type annotation, copy‑number–based ploidy
inference and SNV‑based phylogeny reconstruction into a single protocol. The
workflow is implemented as a GitHub repository with Docker and Singularity
container images, and we illustrate its use on high‑grade serous ovarian
cancer (HGSOC) samples from the MSK SPECTRUM study (SPECTRUM‑OV‑003).

### Development of the protocol

The scPhylogenomics protocol builds on three conceptual strands of prior
work: (i) robust preprocessing and quality control for droplet‑based
scRNA‑seq, (ii) reference‑based cell‑type annotation and ploidy inference
from expression data, and (iii) SNV‑based tumor phylogenetics and clonal
clustering.

First, the preprocessing strategy (see *Procedure*, Module 1) integrates
established tools for ambient RNA correction (SoupX), doublet detection
(DoubletFinder) and quality control based on mitochondrial content and gene
detection (miQC). These tools have been widely used in the scRNA‑seq
community but are usually deployed piecemeal, with users needing to embed
them in bespoke pipelines. scPhylogenomics formalizes their combination into
a standardized module that can be reused across projects.

Second, the protocol leverages reference‑based methods to annotate cell
types and infer ploidy. For cell‑type annotation, scPhylogenomics uses
Seurat for integration and clustering and SingleR (with celldex references
or user‑supplied atlases) to transfer labels from well‑characterized
reference datasets to new scRNA‑seq data (see *Procedure*, Module 2). For
ploidy inference, the protocol employs the **copykat** R package, which
infers genome‑wide copy‑number profiles from expression data and classifies
cells as aneuploid (putative malignant) or diploid (non‑malignant), thereby
operationalizing the observation that many solid tumors exhibit pervasive
aneuploidy while stromal and immune cells remain near‑diploid (see
*Procedure*, Module 3).

Third, scPhylogenomics extends ideas from tumor phylogenetics and
single‑cell genotyping to scRNA‑seq. It adopts **cellsnp‑lite**, originally
developed for efficient genotyping of known SNPs from scRNA‑seq and
scDNA‑seq, to perform cell‑type–specific SNV calling from 10x Chromium BAM
files and to generate genotype matrices (allele depth, total depth and other
alleles) (see *Procedure*, Module 4, scripts `02-snv-calling.py` and
`utils/run-cellsnp-lite.sh`). From these matrices, the protocol constructs
SNP‑based MSAs in which each cell is encoded as a nucleotide sequence
across ordered SNP loci, together with binary/tertiary mutation profiles
(0/1/3 for reference/alternate/missing) for clustering (see
`03-generate-snp-msa.py`). This representation allows the use of
maximum‑likelihood phylogenetic software such as FastTree and IQ‑TREE and
supports downstream clonal clustering using both a deep‑learning variational
autoencoder (SNPmanifold) and a hierarchical weighted non‑negative matrix
factorization (WNMF) approach (see *Procedure*, Module 5,
`01-phylogeny-inference.py` and `03-snp-clustering.py`).

The development of scPhylogenomics was motivated by the need to resolve
clonal divergence in tumor scRNA‑seq data across both complex multi‑site
cohorts, such as the MSK SPECTRUM HGSOC study, and more conventional
single‑site or single‑sample datasets, where pervasive aneuploidy and
intra‑tumoral heterogeneity pose similar analytical challenges. The protocol
formalizes an analysis workflow we developed, organizing the method into
five modules that can be run sequentially as an end‑to‑end pipeline or
selectively applied to address related questions in tumor evolution and
clonal architecture.

### Overview of the procedure

The scPhylogenomics workflow is organized into five continuous modules that
transform Cell Ranger–processed 10x scRNA‑seq data into annotated clonal
phylogenies (Fig. {@fig:workflow-overview}).

1. **Data Preprocessing.** This module (*Procedure*, Module 1) automates
   high‑throughput quality control of 10x Genomics Chromium scRNA‑seq data
   by sequentially removing ambient RNA, excluding doublets, and filtering
   low‑quality cells to generate cleaned feature‑barcode matrices for each
   sample. Starting from the raw Cell Ranger count outputs (barcodes,
   features, and count matrices), the wrapper script
   `run-data-preprocessing.sh` calls three R scripts in series:
   `01-remove-ambient-rna.R` (SoupX), `02-remove-doublets.R`
   (DoubletFinder), and `03-remove-compromised.R` (miQC).

2. **Cell Typing.** This module (*Procedure*, Module 2) consolidates
   miQC‑filtered samples into a merged or integrated Seurat object and
   performs reference‑assisted cell‑type annotation. The wrapper
   `run-cell-typing.sh` runs `01-consolidate-samples.R` (Seurat,
   Harmony/CCA/FastMNN/RPCA) and `02-annotate-cell-types.R` (SingleR with
   celldex, custom Seurat objects, or external mapping files) and
   produces UMAPs, heatmaps, and annotation tables.

3. **Ploidy Inference.** This module (*Procedure*, Module 3) applies
   `01-classify-cell-ploidy.R` to annotated Seurat objects using
   **copykat** to infer genome‑wide copy‑number profiles and stratify cells
   into aneuploid (malignant), diploid (normal), or uncertain classes.

4. **SNV Calling.** This module (*Procedure*, Module 4) performs cell
   type–specific somatic SNV calling and constructs SNP‑based pseudo‑MSAs
   using `01-get-cell-type-barcodes.R`, `02-snv-calling.py` (cellsnp‑lite
   driver), and `03-generate-snp-msa.py`.

5. **Phylogeny Inference.** This module (*Procedure*, Module 5) reconstructs
   single‑cell clonal histories by coupling maximum‑likelihood tree building
   (`01-phylogeny-inference.py` — FastTree/IQ‑TREE) with dual clonal
   clustering strategies (`03-snp-clustering.py` — SNPmanifold or
   hierarchical WNMF) and overlays clone, ploidy, cell type, and sample
   metadata via `04-infer-clonal-phylogeny.R`.

A schematic flowchart (Fig. {@fig:workflow-overview}) summarizes the data
flow and outputs of each module, and the *Procedure* section describes the
execution of these scripts in detail.

![Schematic of the scPhylogenomics end‑to‑end workflow showing the five
modules — data preprocessing, cell typing, ploidy inference, SNV calling
and phylogeny inference — together with the principal inputs and outputs of
each module. **Placeholder figure — replace with the final
`content/images/workflow-overview.png` exported from the lab figure
master.**](images/workflow-overview.png){#fig:workflow-overview width="6in"}

### Applications

scPhylogenomics is intended for researchers who wish to leverage scRNA‑seq
data to study clonal tumor evolution, particularly in settings where matched
scDNA‑seq is unavailable or impractical. Proven and potential applications
include:

- **Reconstruction of tumor clonal phylogenies from scRNA‑seq.** By
  generating SNP‑based MSAs and mutation profiles from scRNA‑seq,
  scPhylogenomics enables maximum‑likelihood tree inference and clonal
  clustering at single‑cell resolution.
- **Dissection of intratumoral heterogeneity and metastatic spread.** In the
  MSK SPECTRUM HGSOC case study, the protocol distinguishes malignant from
  non‑malignant cells, reveals aneuploid clones enriched at specific
  intraperitoneal sites and reconstructs phylogenies consistent with spatial
  patterns of metastasis.
- **Integration of genotype and transcriptional phenotype.** Because clonal
  assignments and ploidy labels can be mapped back onto expression‑derived
  embeddings (e.g., UMAPs), scPhylogenomics supports joint analysis of
  evolutionary lineage, cell state and microenvironmental context.
- **Comparative studies across tumor types.** The workflow is demonstrated
  on HGSOC, TNBC and AML datasets to illustrate its generalizability across
  epithelial and hematologic malignancies.
- **Method benchmarking and development.** The modular design (e.g.,
  pluggable SNV filters, clustering methods) makes scPhylogenomics suitable
  as a testbed for new scRNA‑seq genotyping models, phylogenetic algorithms
  or integrative multi‑omic approaches.

### Comparison to other methods

Several existing methods address individual components of the
scPhylogenomics workflow, but to our knowledge no published protocol
provides an integrated, containerized pipeline for scRNA‑seq–based tumor
phylogenomics. On the preprocessing and quality‑control side, frameworks
such as Seurat, Scanpy and scater implement normalization, dimension
reduction and clustering but leave ambient RNA, doublet detection and
mitochondrial QC to separate tools. SoupX, DoubletFinder and miQC are widely
used to address these issues, yet users typically need to orchestrate them
manually. scPhylogenomics standardizes this combination and ensures that
barcodes propagated into SNV calling are already filtered for major
technical artifacts.

For SNV calling from scRNA‑seq, general‑purpose tools (for example, GATK
RNA‑seq best practices) are not optimized for ultra‑sparse single‑cell data
and may produce high false‑positive rates. **cellsnp‑lite** was designed
specifically for efficient genotyping of biallelic SNPs from scRNA‑seq or
scDNA‑seq, providing fast pileup and genotyping of either detected or
user‑supplied common SNPs and outputting sparse SNP‑by‑cell count and
genotype matrices. Alternative tools such as scSplit, demuxlet and vireo
focus on donor demultiplexing and genotype assignment rather than
phylogenetically informative SNV discovery. Building on cellsnp‑lite,
scPhylogenomics adds optional filtering against common SNP panels,
RNA‑editing catalogs and Panels of Normals, and generates SNP‑based MSAs
plus binary/tertiary mutation matrices required for downstream phylogenetic
and clustering analyses.

In tumor phylogenetics, methods such as SCITE, SCARLET, SCClone and SECEDO
were developed primarily for scDNA‑seq or bulk data and model clonal
evolution using binary genotype matrices under infinite‑sites or
finite‑sites assumptions. They offer sophisticated probabilistic treatment
of sequencing errors and copy‑number events, but generally assume
precomputed SNV calls and do not integrate scRNA‑seq–specific preprocessing
or the construction of nucleotide MSAs. Moreover, they often treat SNVs as
abstract binary characters rather than sequences, limiting direct use of
general phylogenetic software such as FastTree, IQ‑TREE or RAxML.
scPhylogenomics explicitly generates SNP‑based MSAs, enabling users to apply
standard molecular phylogenetic models to scRNA‑seq–derived SNVs while also
providing clonal clustering on mutation profiles.

Several end‑to‑end scRNA‑seq pipelines (e.g., nf‑core/scrnaseq, scdrake and
other standardized workflows) emphasize expression‑based analyses — QC,
normalization, clustering and differential expression — but do not implement
SNV calling or phylogeny reconstruction from scRNA‑seq. Conversely, existing
tumor phylogenomics workflows have focused on DNA‑based input and typically
lack modules for scRNA‑seq–specific QC, cell‑type annotation and ploidy
detection.

The main advantages of scPhylogenomics relative to these alternatives are
(i) its explicit focus on SNV‑based phylogenomics from scRNA‑seq, (ii) the
integration of ploidy‑based tumor/normal stratification to restrict SNV
calling to malignant cells, (iii) the generation of both SNP MSAs and
mutation profile matrices, and (iv) containerized implementation
(Docker/Singularity) that facilitates reproducible deployment on
workstations and HPC clusters. Its main limitations, discussed in detail
elsewhere in the manuscript, include reliance on expressed loci, dependence
on aneuploidy‑based tumor classification, and computational cost for very
large datasets.


## Experimental design {.page_break_before}

### Considerations before starting

Several aspects of experimental design should be considered before
implementing scPhylogenomics:

- **Data type and sequencing platform.** The protocol is optimized for 10x
  Chromium 3′/5′ scRNA‑seq data processed by Cell Ranger, where gene
  expression matrices and BAM files with cell barcodes and UMIs are readily
  available. Application to other platforms (e.g., Drop‑seq, inDrop,
  Smart‑seq) is feasible in principle but may require adaptation of input
  formats and adjustment of SNV filtering thresholds.
- **Tumor type and aneuploidy burden.** Because ploidy inference with
  copykat is only one (optional) route for tumor/normal stratification in
  scPhylogenomics, the workflow is especially effective when malignant
  cells exhibit clear genome‑wide aneuploidy, such as in many HGSOC, TNBC,
  and other chromosomally unstable solid tumors. SNV calling is not
  restricted to copykat‑defined tumor cells; it can be performed based on
  user‑specified cell types deemed malignant from external information
  (e.g., marker expression or prior annotations), which is particularly
  useful in near‑diploid cancers (e.g., many pediatric or hematologic
  malignancies) where copy‑number–based classification has limited power.
- **Sample design and replication.** scPhylogenomics can be applied to
  single or multiple tumor samples per patient and across multiple patients.
  For evolutionary questions (e.g., metastatic seeding), multi‑regional or
  longitudinal sampling greatly increases interpretability. Biological
  replication at the patient level remains essential for generalizing
  conclusions. Within each sample, sufficient cell numbers per tumor
  compartment (typically several thousand) are needed to capture clonal
  diversity.
- **Controls and orthogonal data.** Where possible, users should complement
  scRNA‑seq with bulk exome or targeted DNA sequencing to confirm key
  driver mutations and to assess coverage biases in scRNA‑derived SNVs.
  Normal tissues or peripheral blood mononuclear cells can serve as a
  reference for Panel‑of‑Normals construction and for benchmarking copykat
  classifications.
- **Pre‑optimization of QC and SNV thresholds.** Ambient RNA, doublet, and
  mitochondrial filters should be tuned on pilot datasets or subsets of the
  data, using diagnostic plots to avoid over‑filtering (see *Procedure*,
  Modules 1–2). Similarly, SNV filtering parameters
  (`min_cells_per_snp`, `min_snps_per_cell`, allele frequency thresholds)
  may require adjustment based on sequencing depth and chemistry (see
  *Procedure*, Module 4).

### Equipment, expertise, and computational resources

The protocol requires:

- Access to a Linux workstation or HPC cluster with sufficient CPU cores
  (≥16 recommended), memory (≥64 GB, ideally 128 GB for large projects),
  and storage (≥100 GB per project).
- Basic familiarity with the Linux command line, container‑based execution
  (Docker or Singularity), and R and Python scripting environments (to run
  the module scripts described in the *Procedure*).
- Experience with scRNA‑seq analysis (e.g., using Seurat) to interpret QC
  plots, cell‑type annotations, and integration results.
- Familiarity with phylogenetic concepts (tree topology, branch lengths,
  model selection, bootstrap support) to interpret clonal trees and
  evaluate clustering solutions.

### Regulatory approvals

scPhylogenomics is a computational workflow that operates on existing
sequencing data and does not involve direct manipulation of human subjects
or biological specimens. Regulatory approvals (e.g., institutional review
board approval, informed consent, data access agreements) are assumed to
have been obtained for the generation and use of the underlying scRNA‑seq
datasets and are not addressed by this protocol. Users should ensure that
appropriate permissions (e.g., data use agreements for controlled‑access
datasets, Material Transfer Agreements for cell lines) have been secured
before downloading or analyzing patient‑derived data.


## Materials {.page_break_before}

> **Drafting status:** placeholder. To be expanded in subsequent sessions
> using the per‑module README files in the `scPhylogenomics` GitHub
> repository (`analyses/<module>/README.md`).

Nature Protocols expects the *Materials* section to enumerate every
biological reagent, software dependency, hardware requirement and reference
dataset that is required to execute the protocol. For this purely
computational workflow, *Materials* will be presented as four subsections:
**REAGENTS** (data), **EQUIPMENT** (hardware/software), **REFERENCE
DATASETS**, and **REAGENT/EQUIPMENT SETUP**. Pricing/vendor lines are
omitted because no wet‑lab consumables are used; instead, version pins and
DOIs are listed.

### REAGENTS (data)

> **TODO** — populate from
> `scPhylogenomics/README.md` (top‑level "Data description"
> section) and from each module README.

- **Triple‑negative breast cancer (TNBC) dataset** — TNBC5 sample from
  GSE148673 (CopyKAT methodology development study).
- **MSK SPECTRUM HGSOC dataset** — six tumor samples from multiple sites
  of patient SPECTRUM‑OV‑003 (`@url:https://www.synapse.org/Synapse:syn25569736/wiki/612269`).
- **Acute myeloid leukemia (AML) dataset** — sample LE1. *(Brief dataset
  description to be added — see open question SQ‑01 in `sessions/`.)*
- **10x Genomics Chromium reference transcriptome** — downloaded from
  `@url:https://www.10xgenomics.com/support/software/cell-ranger/downloads#reference-downloads`.
- **dbSNP/1000 Genomes common variants** (used by cellsnp‑lite Mode 1).
- **REDIportal RNA‑editing catalog** (used as optional SNV filter).
- **Panel of Normals (PoN)** — constructed from matched or atlas normal
  samples (procedure to be documented in the Materials/Procedure cross‑ref).

### EQUIPMENT (hardware and software)

> **TODO** — pin exact versions used in the case study. Versions should
> match those in `Dockerfile` at the root of the scPhylogenomics
> repository.

| Category | Tool | Version | Purpose |
|---|---|---|---|
| Hardware | Linux workstation or HPC | — | ≥16 CPU cores; 64–128 GB RAM; ≥100 GB storage |
| Container runtime | Docker | ≥24.0 | Build & run scPhylogenomics image |
| Container runtime | Singularity / Apptainer | ≥1.2 | HPC execution |
| Aligner | Cell Ranger | TBD | scRNA‑seq alignment, demultiplexing |
| R framework | Seurat | TBD | scRNA‑seq object handling, integration |
| R | SoupX | TBD | Ambient RNA correction |
| R | DoubletFinder | TBD | Doublet detection |
| R | miQC | TBD | Mitochondrial/QC filtering |
| R | SingleR + celldex | TBD | Reference‑assisted cell typing |
| R | copykat | TBD | Ploidy inference |
| C/Python | cellsnp‑lite | TBD | Single‑cell SNV calling |
| Python | SNPmanifold | TBD | VAE‑based clonal clustering |
| Python | NumPy / SciPy / scikit‑learn / nimfa | TBD | WNMF clonal clustering |
| Phylogenetics | FastTree | TBD | Maximum‑likelihood trees (fast) |
| Phylogenetics | IQ‑TREE | TBD | Maximum‑likelihood trees (model selection, bootstraps) |
| Visualization | ggplot2 / ggtree / ape | TBD | Tree and clone annotation |

### REAGENT/EQUIPMENT SETUP

> **TODO** — convert each module README's "Setup" / "Installation"
> instructions into Nature Protocols numbered Setup paragraphs.

1. **Clone the workflow repository.**

   ```bash
   git clone https://github.com/ewafula/scPhylogenomics.git
   cd scPhylogenomics
   ```

2. **Pull the prebuilt container** (recommended) **or build from source**:

   ```bash
   # Singularity (HPC)
   singularity pull docker://ghcr.io/ewafula/scphylogenomics:latest

   # Docker (workstation)
   docker pull ghcr.io/ewafula/scphylogenomics:latest
   ```

3. **Configure the project data tree** under `data/projects/<PROJECT>/...`
   following the directory layout shown in the top‑level README.

4. **Download reference resources** (Cell Ranger reference, common SNP VCF,
   REDIportal, PoN) into `data/refdata/`.

5. **(Optional) Build a custom reference** for SingleR using
   `scripts/create-reference-dataset.R`.


## Procedure {.page_break_before}

> **Drafting status:** scaffold. Each module sub‑section is a placeholder
> wrapper. The numbered Nature Protocols steps will be ported in upcoming
> sessions from
> `scPhylogenomics/analyses/<module>/README.md` and the wrapper
> `run-*.sh` scripts. Numbering is contiguous across modules per Nature
> Protocols house style.

### Module 1 — Data preprocessing ● Timing 2–6 h

> Source material: `analyses/data-preprocessing/README.md` and
> `run-data-preprocessing.sh`.

1. **Prepare Cell Ranger outputs.** *(TODO: paraphrase from Module 1
   README, including expected directory layout under
   `data/projects/<PROJECT>/<SAMPLE>/outs/`.)*

2. **Remove ambient RNA with SoupX.** Run `01-remove-ambient-rna.R`.
   *(TODO: list parameters, key flags, and expected diagnostic plots.)*

   ▲ **CRITICAL STEP** — Check the SoupX contamination fraction (`rho`)
   diagnostic plot before continuing.

3. **Detect and remove doublets with DoubletFinder.** Run
   `02-remove-doublets.R`.

4. **Filter compromised cells with miQC.** Run `03-remove-compromised.R`.

   ▲ **CRITICAL STEP** — Inspect the per‑sample miQC posterior probability
   plots to ensure that healthy cell populations are retained.

5. **Output check.** Confirm the filtered feature‑barcode matrices and
   sample‑level QC tables in `analyses/data-preprocessing/results/`.

### Module 2 — Cell typing ● Timing 1–4 h

> Source material: `analyses/cell-typing/README.md` and
> `run-cell-typing.sh`.

6. **Consolidate samples with `01-consolidate-samples.R`** (Seurat:
   normalization, optional integration via Harmony / CCA / FastMNN /
   RPCA, clustering).

7. **Annotate cell types with `02-annotate-cell-types.R`** (SingleR with
   celldex references, custom Seurat references, or external mapping
   files).

8. **Output check.** UMAPs, heatmaps, and annotation tables under
   `analyses/cell-typing/plots/` and `.../results/`.

### Module 3 — Ploidy inference ● Timing 1–8 h (CPU‑bound)

> Source material: `analyses/ploidy-inference/README.md` and
> `run-ploidy-inference.sh`.

9. **Classify cell ploidy with `01-classify-cell-ploidy.R` (copykat).**

10. **Inspect copykat heatmaps** and merge ploidy classes into the Seurat
    metadata.

    ◆ **OPTION** — Skip this module and use external malignancy labels
    (e.g., from marker‑based annotation) when working with near‑diploid
    cancers.

### Module 4 — SNV calling ● Timing 4–24 h

> Source material: `analyses/snv-calling/README.md`,
> `run-snv-calling.sh`, and `utils/run-cellsnp-lite.sh`.

11. **Extract barcodes for the target population** with
    `01-get-cell-type-barcodes.R`.

12. **Run cellsnp‑lite** via `02-snv-calling.py`. *(TODO: enumerate
    Mode 1 vs Mode 2 parameters, optional REDIportal/PoN filtering.)*

    ▲ **CRITICAL STEP** — Verify the count of variants surviving filtering
    (`min_count`, `min_maf`); too few SNVs will starve downstream
    phylogenetics.

13. **Generate SNP MSAs and mutation profile matrices** with
    `03-generate-snp-msa.py` (parameters: `min_cells_per_snp`,
    `min_snps_per_cell`, allele frequency thresholds).

### Module 5 — Phylogeny inference ● Timing 4–18 h

> Source material: `analyses/phylogeny-inference/README.md` and
> `run-phylogeny-inference.sh`.

14. **Infer maximum‑likelihood phylogenies** with
    `01-phylogeny-inference.py` (FastTree or IQ‑TREE).

15. **Harmonize variant sets across tree and clustering inputs** with
    `02-filter-variants.py`.

16. **Cluster clones** with `03-snp-clustering.py` (SNPmanifold VAE *or*
    hierarchical Ward + WNMF).

17. **Annotate trees** with `04-infer-clonal-phylogeny.R` to overlay clone,
    ploidy, cell type, and sample of origin and to produce annotated
    clonal/lineage/sample‑level trees.

    ❚ **PAUSE POINT** — Save annotated tree objects (`.rds`/`.nwk`) before
    downstream DEG/GSEA analyses.


## Timing {.page_break_before}

> **Drafting status:** placeholder. Per‑step timings will be filled in
> after benchmarking on the SPECTRUM‑OV‑003 case study.

| Steps | Description | Approx. time (case study) |
|---|---|---|
| 1–5 | Module 1 — Data preprocessing | 2–6 h |
| 6–8 | Module 2 — Cell typing | 1–4 h |
| 9–10 | Module 3 — Ploidy inference (copykat) | 1–8 h |
| 11–13 | Module 4 — SNV calling (cellsnp‑lite + MSA) | 4–24 h |
| 14–17 | Module 5 — Phylogeny inference and clonal clustering | 4–18 h |
| **Total** | End‑to‑end execution | **24–48 h** (typical) |

> **TODO** — replace approximate ranges with measured wall‑clock times on a
> defined HPC profile (CPU/RAM/threads). Add hands‑on vs. compute‑only
> breakdowns where useful.


## Troubleshooting {.page_break_before}

> **Drafting status:** placeholder. Each module README in the
> scPhylogenomics repository contains a "Troubleshooting / Common issues"
> block — these will be consolidated here in Nature Protocols house style
> (Step | Problem | Possible reason | Solution).

| Step | Problem | Possible reason | Solution |
|---|---|---|---|
| 2 | SoupX `rho` cannot be estimated | Too few empty droplets in raw matrix | Provide `tod`/`toc` from raw Cell Ranger output and re‑run with manually supplied clusters. |
| 3 | DoubletFinder identifies an implausibly large doublet fraction | Heterogeneous tissue with rare populations | Re‑estimate `pK` via `paramSweep_v3` and tune the expected doublet rate to the chemistry. |
| 4 | miQC drops most cells | Tissue with intrinsically high mitochondrial signal | Replace miQC with a fixed % MT cutoff or run on a tissue‑matched calibration dataset. |
| 7 | SingleR labels are sparse / "NA" | Reference mismatch | Use a lineage‑matched celldex reference or a custom Seurat reference built with `scripts/create-reference-dataset.R`. |
| 9 | copykat fails to converge | Too few cells; unclear normal baseline | Provide a normal‑cell barcode list explicitly via `norm.cell.names`. |
| 12 | cellsnp‑lite output is empty | BAM lacks `CB`/`UB` tags or barcodes don't match Cell Ranger output | Re‑split BAM with the same barcode list used in Module 1; verify chemistry. |
| 13 | SNP MSA collapses to a few cells | `min_cells_per_snp` / `min_snps_per_cell` too strict | Lower thresholds; inspect SNP/cell distribution histograms. |
| 14 | IQ‑TREE OOM / very slow | Too many sites or cells | Use FastTree first; subset variants by `02-filter-variants.py`; partition by chromosome. |
| 16 | SNPmanifold latent space collapses | Insufficient informative SNPs per cell | Reduce VAE latent dim; switch to hierarchical WNMF clustering. |

> **TODO** — extend with case‑study‑specific failure modes encountered
> during the SPECTRUM‑OV‑003 / TNBC5 / LE1 runs.


## Anticipated results {.page_break_before}

> **Drafting status:** placeholder. To be expanded once the case‑study
> figures are finalized. Each subsection below corresponds to a planned
> figure or supplementary item.

### Module 1 — Cleaned feature‑barcode matrices

Users should obtain per‑sample filtered Seurat objects with diagnostic
plots showing (i) the SoupX contamination fraction `rho`, (ii)
DoubletFinder doublet‑score distributions, and (iii) miQC posterior
probability surfaces. Typical retention is 60–90% of input barcodes.

> **TODO** — insert representative QC panel for SPECTRUM‑OV‑003.

### Module 2 — Reference‑annotated cell atlas

Expected output: an integrated UMAP partitioned into epithelial,
stromal, and immune compartments with SingleR labels. For SPECTRUM‑OV‑003
the case study yields a clear epithelial/aneuploid axis distinguishable
from the tumor microenvironment.

### Module 3 — Ploidy classification

Expected output: copykat heatmaps showing chromosome‑level CNV signal,
plus a metadata column partitioning cells into `aneuploid` /
`diploid` / `not.defined`. Aneuploid fraction varies by tumor type;
HGSOC samples typically exceed 70% aneuploid epithelial cells.

### Module 4 — SNP MSAs and mutation matrices

Expected output: a FASTA‑style SNP pseudo‑MSA (cells × ordered SNP
loci) and a binary/tertiary mutation matrix (`0/1/3` for ref/alt/missing).
Typical sizes for the case studies range from a few thousand to tens of
thousands of SNPs across thousands of cells after default filtering.

### Module 5 — Annotated clonal phylogenies

Expected output: maximum‑likelihood trees (Newick + plot), clone
assignments, and overlay panels showing clone × sample, clone × cell
type and clone × ploidy. For SPECTRUM‑OV‑003 the trees are expected to
reveal site‑enriched aneuploid clones consistent with intraperitoneal
metastasis patterns.

> **TODO** — embed final figures: `images/fig2-cell-typing.png`,
> `images/fig3-ploidy.png`, `images/fig4-snv-msa.png`,
> `images/fig5-phylogeny.png`.


## Discussion {.page_break_before}

> **Drafting status:** placeholder. Nature Protocols allows an optional
> short discussion. Anticipated themes:

- **Strengths.** First end‑to‑end, containerized scRNA‑seq → SNV →
  phylogeny pipeline; explicit SNP MSAs that integrate with standard
  phylogenetics software; pluggable clonal clustering.
- **Limitations.** Reliance on expressed loci; aneuploidy‑dependence of
  copykat; computational cost on cohorts with millions of cells.
- **Outlook.** Extension to additional chemistries (Smart‑seq, multiome),
  long‑read scRNA‑seq, joint inference with copy‑number trees, and
  benchmarking against scDNA‑seq–based clonal trees.


## Reporting summary {.page_break_before}

A Nature Research Reporting Summary will be supplied with the final
manuscript submission. *(TODO.)*

## Data availability {.page_break_before}

- **TNBC5** scRNA‑seq data are available under GEO accession
  `@url:https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE148673`.
- **MSK SPECTRUM** data are available via Synapse
  `@url:https://www.synapse.org/Synapse:syn25569736/wiki/612269`
  (controlled access).
- **AML LE1** data: *TODO — add accession or contact.*

## Code availability {.page_break_before}

The scPhylogenomics workflow is openly developed at
`@url:https://github.com/ewafula/scPhylogenomics`. Container images
(Docker/Singularity) are released under the same repository. The version
used in this protocol is pinned in `build/environment.yml` and in the
`Dockerfile`.

## Author contributions {.page_break_before}

> **TODO** — populate using the CRediT taxonomy.

E.W. — software, methodology, writing — original draft. P.D. — methodology,
validation. S.M. — conceptualization, supervision, funding acquisition,
writing — review & editing.

## Acknowledgements {.page_break_before}

> **TODO** — funding sources, MSK SPECTRUM consortium acknowledgement,
> Mississippi MAGIC HPC.

## Competing interests {.page_break_before}

The authors declare no competing interests.


## References {.page_break_before}

<!--
Manubot will replace this section automatically. Do not edit by hand.

How citations work in this manuscript:
- Cite a DOI:    [@doi:10.1038/s41587-023-01767-y]
- Cite a PMID:   [@pubmed:30559446]
- Cite a URL:    [@url:https://example.com]
- Cite an arXiv: [@arxiv:2106.04561]
- Cite a tag:    [@tag:soupx]   (resolved via content/citation-tags.tsv)

Manubot regenerates citation metadata in `content/manual-references.json`
during the build (see `build/build.sh`).
-->

<div id="refs"></div>

