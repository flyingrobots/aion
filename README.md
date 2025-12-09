![aion](https://github.com/user-attachments/assets/3369bf0b-c251-45c0-94c4-56b9849d189e)

# Computational Holography

## Recursive Metagraphs, Rulial Distance, and Deterministic Multiway Computation

**Status:** Foundations Series (Active Research)  
**Author:** James Ross  
**License:** Open Research / Universal Charter v1.0.0

### 📖 Overview

This repository contains the formal mathematical definitions and proofs for the **AION Architecture**—a post-Von Neumann computing model based on **Recursive Metagraphs (RMG)**.

The central thesis of this work is that by strictly enforcing algebraic graph rewriting (DPOI) within a "Two-Plane" commutation discipline, we can transform execution history from a transient side-effect into a tangible, geometric object. We call this **Computational Holography**: the ability to encode the entire volume of a computation's interior evolution onto its boundary edge.

### Core Primitives

#### 1. Recursive Metagraphs (RMG)

Standard graphs are flat. Hypergraphs allow multi-way relations but remain flat. An **RMG** is defined inductively: a graph where every node and edge can carry a payload, and that payload can itself be an entire RMG.

* **Formal Definition:** RMG is the carrier of the initial algebra for the functor $F(X) = P + \prod_{S \in \mathcal{G}} (V_S \to X) \times (E_S \to X)$.
* **Capability:** This allows for infinite nesting of state, enabling the system to model hierarchical dependencies (like ASTs, containerized processes, or neural networks) natively in the graph topology.

#### 2. Double-Pushout with Interfaces (DPOI)

State evolution is not defined by pointer arithmetic, but by **Algebraic Graph Rewriting**.

* We use **DPOI** in the adhesive category of Typed Open Graphs ($\text{OGraph}_T$).
* Rules are spans $L \leftarrow K \rightarrow R$ representing the pattern to delete ($L \setminus K$) and the pattern to create ($R \setminus K$).

#### 3. The "Two-Plane" Architecture

To manage concurrency in a recursive structure, we separate state into two orthogonal planes:

* **Skeleton Plane:** The structural topology (the "container").
* **Attachment Plane:** The internal data residing in the fibers of the nodes/edges.
* **Theorem 4.6 (Two-Plane Commutation):** We prove that operations on the attachments commute with operations on the skeleton (up to transport). This mathematically validates the "Attachments-First" parallel execution strategy.

### Computational Holography

The most significant result of this work is the formalization of the **Wormhole**.

> **Theorem 5.4 (Holographic Encoding):**
> The boundary data $(S_0, P)$, consisting of an initial state $S_0$ and a provenance payload $P$, is information-complete with respect to the interior evolution $S_0 \Rightarrow^* S_n$.

This implies:

* **Zero-Copy History:** We do not store logs; we store the *derivation*.
* **Time Travel:** Any state $S_i$ in the history can be losslessly reconstructed from the boundary.
* **Forking:** A "fork" is simply a divergent payload $P'$ sharing a prefix with $P$.

### Rulial Distance

How do distinct observers agree on reality in a relativistic computational universe?
We define **Rulial Distance** $D_{\tau,m}(O_1, O_2)$ using **Minimum Description Length (MDL)** theory. It measures the algorithmic complexity of the "translator" required to convert one observer's view of a wormhole into another's. This provides a computable geometry for interoperability.

### Ethical Implications

This architecture enables the perfect deterministic replay of cognitive processes. This capability necessitates strict ethical bounds derived from the [**Universal Charter**:](https://github.com/universalcharter)

* **Principle 6 (Sovereignty of Information):** Provenance is interior life. Forced replay is interrogation.
* **Rights for Forks:** A forked instance of a cognitive process is a sovereign entity, not a test fixture. "Forks are not test environments; they are lives".

### Citation

```bibtex
@techreport{Ross2025AION,
  title={ΑΙΩΝ: Computational Holography, Recursive Metagraphs, and Rulial Distance},
  author={Ross, James},
  institution={Independent Researcher},
  year={2025},
  month={November},
  url={https://flyingrobots.dev}
}
```

# CΩMPUTER

![CΩMPUTER (5)](https://github.com/user-attachments/assets/65c83fd7-a3b7-48a9-9975-04a580d27e6e)

[Read the book CΩMPUTER here!](https://github.com/flyingrobots/aion-computer-book)

## License

This repository contains only the CΩMPUTER manuscript, figures, compiled PDF, and documentation. These materials are © 2025 James Ross and licensed under Creative Commons Attribution 4.0 (CC BY 4.0); see LICENSE for details.

The AIΩN Runtime and JITOS software projects referenced by the paper are not part of this repository. Those separate codebases are licensed under the Apache License, Version 2.0 (see their own repositories or Apache License 2.0).

---

*Pronounced "eye-ON" (rhymes with aeon).*
