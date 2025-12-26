<img src="https://github.com/user-attachments/assets/f2903ac7-9103-4f20-af22-4d97bae6ed19" alt="AION" align="center" />

# THE REVΩLUTION WILL BE DETERMINISTIC
## THE PROOF IS MATHEMATICAL
### TIME WILL TELL

---

## AIΩN Foundations

**A formal framework for deterministic, history-native computation.**

[![Paper I](https://img.shields.io/badge/Paper_I-Published-brightgreen)](https://zenodo.org/...) [![Paper II](https://img.shields.io/badge/Paper_II-Published-brightgreen)](https://zenodo.org/...) [![Paper III](https://img.shields.io/badge/Paper_III-Published-brightgreen)](https://zenodo.org/...) [![Paper IV](https://img.shields.io/badge/Paper_IV-Published-brightgreen)](https://zenodo.org/...) [![Paper V](https://img.shields.io/badge/Paper_V-Draft-yellow)]() [![Paper VI](https://img.shields.io/badge/Paper_VI-Draft-yellow)]()

---

## Overview

This repository collects the **AIΩN Foundations Series**, a sequence of papers that establish a mathematical and architectural foundation for deterministic computation. The series develops, from first principles, a framework in which history is the primary representational artefact and state is derived as a materialised view.

We address a class of problems endemic to contemporary software systems: irreproducible builds, nondeterministic concurrency failures, and the absence of verifiable provenance for automated transformations. Our approach demonstrates that these pathologies are not inevitable features of complex systems, but consequences of an architectural decision—storing snapshots rather than transformations—that can be revisited.

The series proceeds incrementally. Each paper assumes familiarity with its predecessors but remains self-contained in its contributions. Papers I–IV establish the theoretical substrate; Papers V–VI extend the framework to ethical considerations and system architecture.

---

## Papers

| # | Title | Status | Contribution |
|---|-------|--------|--------------|
| I | **A Worldline Algebra for Recursive Provenance** | Published | Paper I introduces WARP graphs—finite directed multigraphs whose vertices and edges recursively carry attached WARP graphs—providing a minimal, well-founded "graphs all the way down" structure that unifies hierarchy, syntax, control flow, and provenance into a single algebraic object upon which the rest of the series builds. |
| II | **Canonical State Evolution and Deterministic Worldlines** | Published | Paper II equips WARP graphs with a deterministic concurrent operational semantics—based on double-pushout rewriting in an adhesive category of typed open graphs—proving that any scheduler-admissible batch of rewrites commits to the same successor state regardless of internal serialisation order, thereby grounding replay and provenance in a single tick-confluent execution model. |
| III | **Computational Holography & Provenance Payloads** | Published | Paper III formalises computational holography—proving that a deterministic WARP worldline's entire interior derivation is uniquely recoverable from a compact boundary encoding (initial state plus ordered tick patches), then develops practical machinery for slicing, branching, and multi-tick compression via wormholes. |
| IV | **Rulial Distance & Observer Geometry** | Published | Paper IV formalises observer geometry—modelling observers as resource-bounded functors from rewriting histories to trace spaces, introducing a rulial distance that measures the MDL-regularised cost of translating between descriptions, and grounding the Chronos–Kairos–Aion time triad—thereby providing a computable notion of frame separation that clarifies abstraction, auditability, and explainability trade-offs. |
| V | **Ethics & Sovereignty** | Draft | Addresses provenance, accountability, and the rights of computational agents. |
| VI | **Architecture & Operating System** | Draft | Specifies JITOS, a causal operating system that instantiates the preceding theory. |

---

## Related Work

The following repositories implement or extend concepts from the Foundations Series:

| Repository | Description |
|------------|-------------|
| [echo-engine](https://github.com/...) | Reference implementation of the DPO rewrite scheduler (Paper IV). |
| [jitos](https://github.com/...) | Userland kernel daemon for the causal operating system (Paper VI). |
| [wesley](https://github.com/...) | GraphQL-to-PostgreSQL compiler with formal verification. |
| [nine-lives](https://github.com/...) | Fractal supervision model for asynchronous operations. |
| [gatos](https://github.com/...) | Git As The Operating Surface—Git as programmable computational substrate. |

---

## Central Thesis

We contend that the fundamental unit of computational storage should be the *transformation*, not the *state*. When transformations are first-class and immutable, deterministic replay, time-travel debugging, and structural provenance emerge as natural consequences rather than heroic engineering efforts.

The AIΩN Foundations Series develops the formal machinery required to make this inversion rigorous and the architectural patterns required to make it practical.

---

## Citation

```bibtex
@misc{ross2025aion,
  author       = {Ross, James},
  title        = {The {AIΩN} Foundations Series},
  year         = {2025},
  publisher    = {Zenodo},
  note         = {Papers I--VI}
}
```

## License

These materials are © 2025 James Ross and licensed under Creative Commons Attribution 4.0 (CC BY 4.0); see LICENSE for details.

The AIΩN Runtime and [JITOS](https://github.com/flyingrobots/jitos) software projects referenced by the paper are not part of this repository. Those separate codebases are licensed under the Apache License, Version 2.0 (see their own repositories or Apache License 2.0).

AIΩN Foundations Series © 2025 by James Ross is licensed under CC BY 4.0. To view a copy of this license, visit [https://creativecommons.org/licenses/by/4.0/](https://creativecommons.org/licenses/by/4.0/)

_NOTE:_ If you do not wish to use MIND-UCAL, you may freely use all theory, math, and documentation under Apache 2.0 or CC BY 4.0, alone. No part of this repository requires adopting MIND-UCAL.

---

*Pronounced EYE-on, ryhmes with "lion"*
