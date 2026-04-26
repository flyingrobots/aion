<div align="center">
  <img src="https://github.com/user-attachments/assets/8937b69a-f12d-43c2-a30d-9e8c18b51c18" />
  <h1>A deterministic architecture for history-native computation — from recursive provenance to a protocol for distributed causal computing</h1>

[![Paper I](https://img.shields.io/badge/Paper_I-Published-brightgreen)](https://doi.org/10.5281/zenodo.17908005) 
[![Paper II](https://img.shields.io/badge/Paper_II-Published-brightgreen)](https://doi.org/10.5281/zenodo.17934512) 
[![Paper III](https://img.shields.io/badge/Paper_III-Published-brightgreen)](https://doi.org/10.5281/zenodo.17963669) 
[![Paper IV](https://img.shields.io/badge/Paper_IV-Published-brightgreen)](https://doi.org/10.5281/zenodo.18038297)
[![Paper V](https://img.shields.io/badge/Paper_V-Published-brightgreen)](https://doi.org/10.5281/zenodo.18146884)
[![Paper VI](https://img.shields.io/badge/Paper_VI-Published-brightgreen)](https://doi.org/10.5281/zenodo.18863648) 
[![Paper VII](https://img.shields.io/badge/Paper_VII-Published-brightgreen)](https://doi.org/10.5281/zenodo.19751149) 
[![Paper VIII](https://img.shields.io/badge/Paper_VIII-Draft-yellow)]()

</div>

## Overview

This repository collects the **AIΩN Foundations Series**, a sequence of eight papers that establish a mathematical, architectural, and ethical foundation for distributed causal computing. The series develops, from first principles, a framework in which witnessed causal history is the primary representational artefact. State, graphs, and runtimes are derived as observer-relative readings of it.

We address a class of problems endemic to contemporary software systems: irreproducible builds, nondeterministic concurrency failures, and the absence of verifiable provenance for automated transformations. Our approach demonstrates that these pathologies are not inevitable features of complex systems, but consequences of an architectural decision. Storing transformations rather than snapshots solves these problems.

The series proceeds incrementally. Papers I–III build the formal substrate: WARP graphs — recursive provenance structures, deterministic rewriting, and holographic recovery. Papers IV–V introduce observer geometry and emergent dynamics. Paper VI makes the ethical turn: for mind-like systems, complete provenance is interior life in executable form. Paper VII unifies the preceding machinery into a single scale-invariant optic and names the medium it induces. Paper VIII concludes the series by arguing that what the foundations describe is not a system to be built, but a protocol to be joined.

### Central Thesis

**We contend that the fundamental unit of computational storage should be the transformation, not the state.** When transformations are first-class and immutable, deterministic replay, time-travel debugging, and structural provenance emerge as natural consequences rather than heroic engineering efforts.

The series arrives at a stronger conclusion. When this inversion is carried through — from local execution to concurrent merging to distributed transport — the same control shape recurs at every scale. There is no graph, there is no runtime, and there is no system. There is only witnessed causal history, and everything we call a graph, a runtime, or a system is an observer-relative reading of it.

## Papers

| # | Title | Status | Contribution |
|---|-------|--------|--------------|
| I | **A Worldline Algebra for Recursive Provenance** | ✅ Published | Paper I introduces WARP graphs—finite directed multigraphs whose vertices and edges recursively carry attached WARP graphs—providing a minimal, well-founded "graphs all the way down" structure that unifies hierarchy, syntax, control flow, and provenance into a single algebraic object upon which the rest of the series builds. |
| II | **Canonical State Evolution and Deterministic Worldlines** | ✅ Published | Paper II equips WARP graphs with a deterministic concurrent operational semantics—based on double-pushout rewriting in an adhesive category of typed open graphs—proving that any scheduler-admissible batch of rewrites commits to the same successor state regardless of internal serialisation order, thereby grounding replay and provenance in a single tick-confluent execution model. |
| III | **Computational Holography & Provenance Payloads** | ✅ Published | Paper III formalises computational holography—proving that a deterministic WARP worldline's entire interior derivation is uniquely recoverable from a compact boundary encoding (initial state plus ordered tick patches), then develops practical machinery for slicing, branching, and multi-tick compression via wormholes. |
| IV | **Rulial Distance & Observer Geometry** | ✅ Published | Paper IV formalises observer geometry—modelling observers as resource-bounded functors from rewriting histories to trace spaces, introducing a rulial distance that measures the MDL-regularised cost of translating between descriptions, and grounding the Chronos–Kairos–Aion time triad—thereby providing a computable notion of frame separation that clarifies abstraction, auditability, and explainability trade-offs. |
| V | **Emergent Dynamics from Deterministic Rewrite Systems** | ✅ Published | By equipping deterministic rewrite histories with a local action functional, this paper establishes that quantum interference, unitary evolution, and the thermodynamic arrow of time emerge naturally as artifacts of observer-induced coarse-graining rather than as intrinsic physical postulates. |
| VI | **Ethics of Deterministic Replay & Provenance Sovereignty** | ✅ Published | For mind-like systems, complete provenance is not only diagnostics; it is interior life in executable form. |
| VII | **WARP: Optics, Holograms, and Worldlines over Shared Causal History** | ✅ Published | Defines the scale-invariant WARP optic—unifying local execution, concurrent braids, and distributed transport—and names the protocol-shaped causal medium it induces: the Continuum. |
| VIII | **Continuum: A Protocol for Distributed Causal Computation** | 🚧 Draft | There is no graph, there is no runtime, and there is no system—only witnessed causal history. Concludes the AIΩN Foundations Series by defining Continuum as a protocol in which coordination, governance, and trust emerge from witnessed admission alone. |

---

## Citation

```bibtex
@misc{ross2025aion,
  author       = {Ross, James},
  title        = {The {AI\Omega N} Foundations Series},
  year         = {2025--2026},
  publisher    = {Zenodo},
  note         = {Papers I--VIII}
}
```

---

# Continuum

<div align="center">
<a href="https://github.com/flyingrobots/continuum"><img alt="Continuum" src="https://github.com/user-attachments/assets/68b121de-5aa9-49d4-8f19-9ccc61e889bf" /></a>
  <h2><i>Continuum: A Protocol for Distributed Causal Computation</i></h2>
</div>

The AIΩN Foundations Series papers define Continuum as a protocol — the causal medium that emerges when every participant speaks witnessed admission. These projects make it concrete. Each is a Continuum application: a participant in the same protocol of witnessed causal admission, built for a different domain.

## Runtimes

### [Echo](https://github.com/flyingrobots/echo) 

Echo is a high-performance Continuum runtime for real-time deterministic simulation. State is a WARP graph; each tick proposes rewrites, executes them in deterministic order, and emits cryptographic hashes so tools and peers can validate and converge.

### [git-warp](https://github.com/git-stunts/git-warp)

git-warp is a Continuum runtime for distributed collaboration, built on Git's content-addressed storage. Each participant writes to an independent worldline while replicas deterministically materialize a shared graph state. No database, no servers — works anywhere you can push and pull.

## Compiler

### [Wesley](https://github.com/flyingrobots/wesley) 

Wesley is a Continuum schema compiler. It takes authored GraphQL SDL that describe WARP optics and graph contracts — the same surfaces defined in Paper VII §6.2 — and compiles them into runtime-checkable code for Echo, git-warp, and other Continuum participants. Wesley treats the authored schema as the sovereign system of record: generated artifacts (Rust, TypeScript, SQL) are derived surfaces, never peer authorities. Commands like plan, rehearse, and witness produce machine-readable evidence that a proposed change is lawful, safe, and conformant before it ships.

## Tools

### [warp-ttd](https://github.com/flyingrobots/warp-ttd)

WARP TTD is a Continuum time-travel debugger — a wide-aperture observer that inspects the causal history that produced a state: what was admitted, what was rejected, the resulting effect emissions. Because Continuum worldlines are patch-deterministic, there is no need to capture sessions or enable special modes; the protocol's computational holograms make the full derivation history recoverable from boundary data alone. A host-neutral GraphQL protocol allows the same debugger to serve any Continuum participant through capability-gated adapters.

---

## [CΩMPUTER](https://github.com/flyingrobots/aion-book-computer)
### The Geometry of All Possible Machines
#### By James Ross

<a href="https://github.com/flyingrobots/aion-computer-book/blob/book/computer.pdf">
  <img width="500" alt="Cosmic Doorway Illumination" src="https://github.com/user-attachments/assets/31d310c0-22d9-4068-822d-2d0f306787ca" align="left" />
</a>

**CΩMPUTER** is the synthesis work—a comprehensive manuscript that takes the formal machinery developed across the **AIΩN Foundations Series** and pushes it to its philosophical and architectural limit.

The central provocation is simple but immodest: computation is not something we invented to model reality; computation *is* the base reality, and what we call physics, cognition, and causality are projections—what certain computations look like from the inside, under resource constraints, to observers embedded within them.

The book constructs this claim carefully. It begins with WARP graphs as the ontological primitive: directed multigraphs whose nodes and edges recursively contain further graphs, rules, and meta-structure. There is no bottom layer of "atoms" or "bits"—only structure that, when you zoom in, reveals more structure. Double-pushout rewriting becomes the sole dynamical law: no differential equations, no instruction pointers, just local pattern-matching and graph surgery, applied everywhere, all at once, with conflicts resolved deterministically.

From this foundation emerges MRMW—the Multi-Rule Multi-World space—a geometry not of points and distances but of universes and their histories. Every possible rewrite sequence, every branch not taken, every counterfactual—all coexist as structure. What we experience as "the present" is a cross-section; what we call "physics" is a particularly stable, low-entropy region of this space (CΩSMOS). Superposition, interference, measurement collapse—these aren't quantum mysteries bolted onto classical intuition but natural consequences of how rewrite bundles interact and how observers, themselves embedded computations, must commit to consistent views.

The practical payoff is a new class of machines: multiversal computers that operate not on single execution traces but on families of universes. Time-travel debuggers that navigate worldlines. Counterfactual engines that ask "what if we had rewritten differently?" Adversarial universe generators that stress-test systems against entire possibility spaces. Cross-world optimisers that search not just parameter spaces but rule spaces.

**CΩMPUTER** also confronts what this means for intelligence and ethics. If minds are geometry-aware navigators of MRMW—agents that model, predict, and steer through branching possibility—then intelligence is not a property of biological neurons or silicon but a dynamical pattern that can occur anywhere sufficient structure supports it. And if machines can create, fork, merge, and terminate entire computational worlds, ethics can no longer treat "the universe" as a fixed stage. We must develop frameworks for responsibility over worlds, not just actions within them.

The book is not an introduction, and does not attempt to be. It assumes comfort with category theory, graph rewriting, and the vertigo that comes from taking "graphs all the way down" seriously as an engineering constraint. It is intended for those who suspect that computer science, physics, and AI are three dialects of the same language—and who want a proposal for what that language might be.

<p align="center"><a href="https://github.com/flyingrobots/aion-computer-book/blob/book/computer.pdf">READ CΩMPUTER FOR FREE ONLINE</a></p>

---

### License

This repository uses a split licensing model. Different categories of content are licensed under different terms.

#### 1. Code

All executable and functional materials, including but not limited to:

* Source code
* Build scripts
* Tooling and utilities
* Configuration files used for execution
* Binaries and compiled artifacts

are licensed under:

Apache License, Version 2.0
See [https://www.apache.org/licenses/LICENSE-2.0](https://www.apache.org/licenses/LICENSE-2.0)

#### 2. Literature

All non-executable, human-readable intellectual content, including but not limited to:

* Documentation (docs/)
* Mathematical and theoretical materials (warp-math/)
* Papers, essays, notes, and explanatory text
* Diagrams, figures, and conceptual descriptions

are licensed under:

Creative Commons Attribution 4.0 International (CC BY 4.0)
See [https://creativecommons.org/licenses/by/4.0/](https://creativecommons.org/licenses/by/4.0/)
