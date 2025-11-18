# AIΩN Protocol Papers

This repository contains technical papers for the AIΩN Protocol.

## Current Papers

### Computational Holography for Recursive Metagraphs

*Deterministic Concurrency, Provenance Encoding, and Rulial Distance*

Location: `aion-holography/`

## Abstract

We define Recursive Metagraphs (RMGs)—graph structures where nodes and edges recursively carry subgraphs—and give them a deterministic concurrent operational semantics using Double Pushout (DPO) graph rewriting in adhesive categories.

The **computational holography theorem** shows that the entire interior evolution of a computation can be encoded on a "boundary": an initial state $S_0$ together with a provenance payload $P$. This boundary data is information-complete, enabling full reconstruction of the derivation volume on demand.

Key results include:
- **Tick-level confluence**: parallel independent rewrites commute
- **Two-plane commutation**: attachment and skeleton updates are order-independent
- **Rulial distance**: an MDL-based pseudometric on observers

This forms the mathematical foundation of the AIΩN Protocol.

---

**Additional papers coming soon**, including:
- The AIΩN CΩMPUTER: machine model and operational semantics
- Glass-box AI cognition and multiverse debugging
- Practical implementations and case studies

## Building the Papers

### Automated Builds (CI/CD)

Every push to `main` automatically builds all papers via GitHub Actions. The compiled PDFs are available as:
- **Artifacts** on each commit (30-day retention)
- **Release assets** when you create a tagged release

To create a release with PDF:

```bash
git tag -a v1.0 -m "Release v1.0"
git push origin v1.0
# Then create release on GitHub
```

### Local Build

#### Prerequisites

- A working LaTeX installation (TeX Live 2023+ recommended)
- Standard packages: `amsmath`, `tikz`, `amsthm`, `enumitem`, `cleveref`

#### Compile

```bash
cd aion-holography
make
```

This produces `main.pdf` in the `aion-holography/` directory.

To clean build artifacts:
```bash
make clean
```

**Note**: PDFs are gitignored (standard practice). Use CI artifacts or local builds to access compiled papers.

## Repository Structure

```
aion/
├── README.md             # This file
└── aion-holography/
    ├── main.tex          # Document root
    ├── macros.tex        # Custom commands and theorem environments
    ├── references.bib    # Bibliography
    ├── Makefile
    └── sections/
        ├── intro.tex
        ├── rmg.tex
        ├── dpo_rmg.tex
        ├── determinism_confluence.tex
        ├── holography.tex
        ├── wormholes.tex
        ├── rulial_distance.tex
        ├── multiway_ruliad.tex
        └── discussion.tex
```

## Key Concepts

### Recursive Metagraphs
A graph where every node and edge can carry an attached subgraph, recursively. Formally:

```math
\mathcal{U} = (G; \alpha, \beta)
```

where $G$ is a skeleton graph and $\alpha$, $\beta$ attach RMGs to nodes and edges.

### Wormholes
A **wormhole** $(S_0, P)$ consists of:
- An initial RMG state $S_0$
- A provenance payload $P = (\mu_0, \dots, \mu_{n-1})$ recording microsteps

The **volume** is the full derivation $S_0 \Rightarrow \cdots \Rightarrow S_n$.
The **boundary** is just the pair $(S_0, P)$.

**Computational holography** proves these are equivalent: the boundary encodes the volume.

### Rulial Distance
An MDL-based metric $D_{\tau,m}(O_1, O_2)$ measuring how complex it is to translate between two observers' views of the same computation. Gives geometry to "observer space" in the Ruliad.

## Citation

```bibtex
@misc{RossHolography2025,
  author = {James Ross},
  title  = {Computational Holography for Recursive Metagraphs},
  year   = {2025},
  note   = {AIΩN Protocol Technical Report}
}
```

## Related Work

This paper builds on:
- **Algebraic graph rewriting**: Ehrig et al., Lack & Sobociński (adhesive categories)
- **Multiway systems**: Wolfram's Physics Project and the Ruliad
- **Minimum Description Length**: Rissanen's MDL principle

The companion paper "The AIΩN CΩMPUTER" applies these results to build a practical computational architecture with glass-box provenance and multiverse debugging.

## License

Copyright © 2025 James Ross. All rights reserved.

---

*Pronounced "eye-ON" (rhymes with aeon).*
