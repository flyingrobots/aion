@@ -0,0 +1,295 @@
\sectionbreak
\section{Provenance Payloads and Computational Holography}
\label{sec:holography}

We now make precise the idea that the entire interior evolution of a
computation can be encoded on a ``boundary'': an initial state together
with a finite provenance payload.  This is the formal content of
\emph{computational holography}.

\subsection{Microsteps and derivation graphs}

Fix a rule set $R$ and tick semantics as in
Theorem~\ref{thm:tick-confluence}.  A \emph{microstep} is a single
scheduler tick whose batch contains exactly one skeleton DPOI step
(possibly accompanied by attachment steps in preserved fibers).  We
write
\[
  S_i \;\Rewrite^{\mu_i}\; S_{i+1}
\]
for such a microstep, where the label $\mu_i$ records:
\begin{itemize}[leftmargin=*]
  \item the rule identifier $p \in R$;
  \item the match identifier for the skeleton step;
  \item any attachment-rule identifiers used in the same tick;
  \item auxiliary metadata (timestamps, policy hashes, etc.).
\end{itemize}
We abstract this as a finite record in some fixed alphabet; in
particular, we assume it has a self-delimiting encoding.

For a value $v$ in some state $S_i$ we define a \emph{derivation graph}
$\mathcal{D}(v)$ whose nodes are intermediate values and whose edges are
microstep applications that produced them; the construction is standard
and we omit the routine details.  Because we only consider finite derivations
\[
  S_0 \Rewrite^{\mu_0} S_1 \Rewrite^{\mu_1} \cdots
  \Rewrite^{\mu_{n-1}} S_n,
\]
every provenance edge in $\mathcal{D}(v)$ points from a value in some
state $S_j$ to a value in a strictly later state $S_{j'}$ with $j' > j$.
Immutability ensures that values are never updated in-place, only created
at later ticks.  Hence every causal chain leading to $v$ has length at
most $n$, and $\mathcal{D}(v)$ is a finite, acyclic graph.
Comment on lines +30 to +42
@coderabbitai
coderabbitai bot
3 hours ago
⚠️ Potential issue | 🟠 Major

Tighten the finiteness/acyclicity justification for the derivation graph.

Right now you jump from “finite derivation” + forward‑in‑time edges to “(\mathcal{D}(v)) is a finite, acyclic graph” in one sentence. Acyclicity is fine (edges strictly increase tick index), but finiteness actually uses two separate facts:

Only finitely many states (S_0,\dots,S_n) occur in the volume.
Each state is a finite RMG state (finite underlying graph), so only finitely many values ever appear.
I’d spell that out and avoid the slightly misleading “Because we only consider finite derivations … every provenance edge …” phrasing. For example:

-For a value $v$ in some state $S_i$ we define a \emph{derivation graph}
-$\mathcal{D}(v)$ whose nodes are intermediate values and whose edges are
-microstep applications that produced them; the construction is standard
-and we omit the routine details.  Because we only consider finite derivations
-\[
-  S_0 \Rewrite^{\mu_0} S_1 \Rewrite^{\mu_1} \cdots
-  \Rewrite^{\mu_{n-1}} S_n,
-\]
-every provenance edge in $\mathcal{D}(v)$ points from a value in some
-state $S_j$ to a value in a strictly later state $S_{j'}$ with $j' > j$.
-Immutability ensures that values are never updated in-place, only created
-at later ticks.  Hence every causal chain leading to $v$ has length at
-most $n$, and $\mathcal{D}(v)$ is a finite, acyclic graph.
+For a value $v$ in some state $S_i$ we define a \emph{derivation graph}
+$\mathcal{D}(v)$ whose nodes are intermediate values and whose edges are
+microstep applications that produced them; the construction is standard
+and we omit the routine details.  For a finite derivation
+\[
+  S_0 \Rewrite^{\mu_0} S_1 \Rewrite^{\mu_1} \cdots
+  \Rewrite^{\mu_{n-1}} S_n,
+\]
+each microstep consumes values in some $S_j$ and produces new values in
+the strictly later state $S_{j+1}$, so every provenance edge in
+$\mathcal{D}(v)$ points from a value in $S_j$ to a value in $S_{j'}$
+with $j' > j$.  Immutability ensures that values are never updated
+in-place, only created at later ticks.  Since each RMG state $S_j$ is
+finite and there are only $n+1$ such states along the derivation,
+$\mathcal{D}(v)$ has finitely many nodes; and because tick indices
+strictly increase along edges, every causal chain leading to $v$ has
+length at most $n$, so $\mathcal{D}(v)$ is a finite acyclic graph.

---

Comment on lines +167 to +176
@coderabbitai
coderabbitai bot
3 hours ago
⚠️ Potential issue | 🟠 Major

Stop crediting tick‑level confluence for what is really determinism in the reconstruction definition.

You fixed the determinism vs confluence split in the wormhole definition, but here you still say:

“By Theorem~\textbackslash ref{thm:tick-confluence}, each (S_{i+1}) is well-defined up to isomorphism.”

However, the fact that (\Apply(S_i,\mu_i)) yields a unique successor is fundamentally determinism of the tick semantics; tick‑level confluence is about independence of interleavings of concurrent matches.

I’d mirror the earlier wording and make both roles explicit:

-  S_{i+1} \;=\; \Apply(S_i,\mu_i)
-\]
-for $0 \le i < n$, where $\Apply$ executes the unique microstep
-described by~$\mu_i$ under the tick semantics.  By
-Theorem~\ref{thm:tick-confluence}, each $S_{i+1}$ is well-defined up
-to isomorphism.
+  S_{i+1} \;=\; \Apply(S_i,\mu_i)
+\]
+for $0 \le i < n$, where $\Apply$ executes the unique microstep
+described by~$\mu_i$ under the deterministic tick semantics.
+Determinism ensures that each $S_{i+1}$ is uniquely determined (up to
+isomorphism), while tick-level confluence
+(Theorem~\ref{thm:tick-confluence}) guarantees that any internal
+interleaving of concurrent matches compatible with $\mu_i$ yields an
+isomorphic successor.
Otherwise you’re (again) implicitly loading determinism into a theorem that’s nominally about confluence.

---

aion-holography/sections/multiway_ruliad.tex lines 89 and 98-100: the
punctuation for the time model triad is inconsistent ("Chronos--Kairos--Aion" vs
"Chronos, Kairos, Aion"); choose one convention and make all occurrences
identical—either replace the commas with en-dashes on lines 98-100
(Chronos--Kairos--Aion) if treating it as a compound triad, or replace the
en-dashes on line 89 with commas on line 89 (Chronos, Kairos, Aion) if treating
them as a simple list—then update every other instance in the file to match.

---

Comment on lines +59 to +71
@coderabbitai
coderabbitai bot
3 hours ago
⚠️ Potential issue | 🟠 Major

RMG morphism definition still lacks a base case and a clear ambient category for atoms.

You fixed the overt circularity by switching to “structural recursion on RMG depth”, but this is still incomplete:

You only give a clause for composite objects ((S,\alpha,\beta)); there is no base case describing morphisms between atoms (\mathrm{Atom}(p)).
You say “for each (v) a morphism of attachments (f_v : \alpha(v) \To \alpha'(f_V(v)))”, but you never specify in which category these attachment morphisms live. Previously this was (incorrectly) “in (\RMG)”; now it’s just floating.
As written, (\RMG) is not actually a category: Hom‑sets between atomic objects are undefined, and the recursion on attachments has no base case.

You need to either:

Treat the payloads (P) as a discrete base category (most conservative), or
Parametrise RMGs over an arbitrary small base category (\mathcal{C}) of atomic payloads and make that explicit.
Here’s a concrete minimal patch using the discrete‑payload option:

-\begin{definition}[RMG morphism]
-We define morphisms by structural recursion on RMG depth.  A morphism
-$f : (S,\alpha,\beta) \To (S',\alpha',\beta')$ consists of:
+\begin{definition}[RMG morphism]
+We define morphisms by structural recursion on RMG depth, taking the
+set of atomic payloads $P$ as a discrete category (only identity
+morphisms).  Thus
+\[
+  \Hom(\Atom(p),\Atom(p')) =
+  \begin{cases}
+    \{\id_{\Atom(p)}\} & \text{if } p = p',\\
+    \emptyset          & \text{otherwise.}
+  \end{cases}
+\]
+For composite objects, a morphism
+$f : (S,\alpha,\beta) \To (S',\alpha',\beta')$ consists of:
@@
-  \item for each $v \in V$ a morphism of attachments
-    $f_v : \alpha(v) \To \alpha'(f_V(v))$ and, for each $e \in E$, a
-    morphism $f_e : \beta(e) \To \beta'(f_E(e))$, defined recursively
-    using the same clause whenever an attachment is itself of the form
-    $(S,\alpha,\beta)$.
+  \item for each $v \in V$ a morphism of attachments
+    $f_v : \alpha(v) \To \alpha'(f_V(v))$ and, for each $e \in E$, a
+    morphism $f_e : \beta(e) \To \beta'(f_E(e))$, where each $f_v$ and
+    $f_e$ is itself an RMG morphism, defined recursively on the depth
+    of the attachment.
If you need nontrivial maps between atoms later, just replace “discrete category on (P)” with “small base category (\mathcal{C}) whose objects are payloads” and adjust the Hom‑clause accordingly. But as it stands, the category structure you claim for (\RMG) is underspecified.

🤖 Prompt for AI Agents
In aion-holography/sections/rmg.tex around lines 59–71, the RMG morphism
definition omits a base case for atoms and fails to specify the ambient category
for attachment morphisms; add an explicit base clause that defines Hom(Atom(p),
Atom(q)) (e.g. make payloads P a discrete category so Hom(Atom(p),Atom(q)) =
empty unless p=q, where it is the identity), and state that every attachment
morphism f_v and f_e lives in that chosen base category (or alternatively
parameterize the whole definition over a small base category C of payloads and
replace “in RMG” with morphisms in C); update the recursive clause to stop at
atoms using that base-case Hom and ensure composition/identities use the
base-category identities for atomic attachments.

---


Original file line number	Diff line number	Diff line change
@@ -0,0 +1,162 @@
\sectionbreak
\section{Recursive Metagraphs}
\label{sec:rmg}

In this section we define Recursive Metagraphs (RMGs) and relate them to
standard graph models and typed open graphs.  An RMG is a finite typed
open graph whose nodes and edges may themselves carry RMGs recursively,
forming a finitely branching, well-founded tree of graphs.

\subsection{Inductive definition}

Fix a set $P$ of atomic payloads (blobs, literals, external IDs).

\begin{definition}[Recursive Metagraph]\label{def:rmg}
The class $\RMG$ of \emph{recursive metagraphs} is the least set closed
under the following constructors:
\begin{enumerate}[leftmargin=*]
  \item for each $p \in P$ there is an \emph{atom} $\mathrm{Atom}(p)
    \in \RMG$;
  \item for any finite directed multigraph $S = (V,E,s,t)$ and
    assignments $\alpha : V \To \RMG$, $\beta : E \To \RMG$, the triple
    $(S,\alpha,\beta)$ is in $\RMG$.
\end{enumerate}
\end{definition}

We write an element of $\RMG$ as either an atom or as a ``1-skeleton''
graph decorated by attachments on vertices and edges.  Attachments
themselves may be recursive metagraphs, so this attachment structure
can nest arbitrarily deeply.  This definition agrees with the
set-theoretic and initial-algebra presentation developed in previous
technical notes.

\paragraph{Example (A tiny recursive metagraph).}
As a concrete instance, consider a program call graph where each
function node carries its own abstract syntax tree (AST) and each call
edge carries a small provenance graph (e.g.\ optimisation decisions or
runtime statistics).  We can model this as an RMG whose skeleton has
nodes $v_f,v_g$ for functions $f,g$, a directed edge
$e_{\mathsf{call}} : v_f \to v_g$ for the call, and attachments:
$\alpha(v_f)$ the AST of $f$, $\alpha(v_g)$ the AST of $g$, and
$\beta(e_{\mathsf{call}})$ the call provenance.

\subsection{Initial algebra viewpoint}

Let $\mathcal{G}$ be a small collection of allowable skeleton shapes
(finite directed multigraphs up to isomorphism).  Define a finitary
polynomial endofunctor
$F : \Set \To \Set$ by
\[
  F(X) = P + \coprod_{S\in\mathcal{G}} (V_S \To X) \times (E_S \To X).
\]
Then $\RMG$ is (up to isomorphism) the carrier of the initial
$F$-algebra.  This yields the usual structural recursion and induction
principles: every function out of $\RMG$ is uniquely determined by its
action on atoms and on decorated skeletons.

\subsection{Morphisms and category of RMGs}

\begin{definition}[RMG morphism]
We define morphisms by structural recursion on RMG depth.  A morphism
$f : (S,\alpha,\beta) \To (S',\alpha',\beta')$ consists of:
\begin{itemize}[leftmargin=*]
  \item a graph homomorphism of skeletons $f_V : V \To V'$, $f_E : E \To
    E'$ preserving sources and targets; and
  \item for each $v \in V$ a morphism of attachments
    $f_v : \alpha(v) \To \alpha'(f_V(v))$ and, for each $e \in E$, a
    morphism $f_e : \beta(e) \To \beta'(f_E(e))$, defined recursively
    using the same clause whenever an attachment is itself of the form
    $(S,\alpha,\beta)$.
\end{itemize}
Composition and identities are defined componentwise.
flyingrobots marked this conversation as resolved.
\end{definition}
\begin{figure}[t]
  \centering
  \begin{tikzpicture}[
      snode/.style={circle,draw=purple!70!black,fill=purple!10,thick,minimum size=10mm,inner sep=0pt},
      sedge/.style={-Latex,thick,purple!70!black},
      anode/.style={circle,draw=orange!70!black,fill=orange!8,thin,minimum size=4mm,inner sep=0pt},
      aedge/.style={-Latex,thin,orange!70!black},
      >=Latex
    ]

    % Skeleton level
    \node[snode] (v1) at (0,0) {$v_1$};
    \node[snode] (v2) at (3.0,0) {$v_2$};
    \draw[sedge] (v1) -- node[above]{\small $e_{\mathsf{call}}$} (v2);

    \node at (1.5,-1.0) {\small skeleton $G$};

    % Attachment for v1 (e.g. an AST)
    \begin{scope}[shift={(-2.4,1.6)}]
      \node[anode] (a1) at (0,0) {};
      \node[anode] (a2) at (0.9,0.6) {};
      \node[anode] (a3) at (0.9,-0.6) {};
      \draw[aedge] (a1) -- (a2);
      \draw[aedge] (a1) -- (a3);
      \node[anchor=east] at (-0.1,0) {\small $\alpha(v_1)$};
    \end{scope}
    \draw[thin,dashed] (-0.3,0.5) to[out=150,in=0] (-1.5,1.6);

    % Attachment for v2
    \begin{scope}[shift={(1.8,1.6)}]
      \node[anode] (b1) at (0,0) {};
      \node[anode] (b2) at (0.9,0) {};
      \node[anode] (b3) at (0.45,0.8) {};
      \draw[aedge] (b1) -- (b2);
      \draw[aedge] (b2) -- (b3);
      \draw[aedge] (b3) -- (b1);
      \node[anchor=east] at (-0.1,0) {\small $\alpha(v_2)$};
    \end{scope}
    \draw[thin,dashed] (3.3,0.5) to[out=30,in=180] (2.7,1.6);

    % Attachment for edge e
    \begin{scope}[shift={(1.5,-2.0)}]
      \node[anode] (c1) at (-0.6,0) {};
      \node[anode] (c2) at (0.6,0) {};
      \draw[aedge] (c1) -- (c2);
      \node at (0,-0.8) {\small $\beta(e_{\mathsf{call}})$};
    \end{scope}
    \draw[thin,dashed] (1.5,-0.2) -- (1.5,-1.4);

  \end{tikzpicture}
  \caption{A simple recursive metagraph: the skeleton $G$ has two
  nodes $v_1,v_2$ and an edge $e_{\mathsf{call}}$, while each node and
  edge carries its own attached graph $\alpha(v_i),\beta(e_{\mathsf{call}})$.
  In an RMG this attachment structure recurses: the attachment graphs
  themselves may have attachments, and so on.}
  \label{fig:rmg-recursive-example}
\end{figure}

\subsection{Relation to ordinary and hypergraphs}

Typed open graphs $\OGraph_T$ form an adhesive category, and DPO
rewriting is well-behaved there.  Typed hypergraphs embed fully and
faithfully into typed open graphs via an incidence construction that
preserves DPO steps and their multiway derivations.
Thus RMG rewriting subsumes standard open-graph and hypergraph
rewriting while adding recursive structure through attachments.

\subsection{Notation summary}

For convenience, we collect the main notation introduced so far:

\medskip
\begin{center}
\begin{tabular}{ll}
\textbf{Symbol} & \textbf{Meaning} \\[2pt]
\hline\\[-8pt]
$\mathcal{U} = (G;\alpha,\beta)$ & single RMG state (one object in a universe $\mathcal{U}$) \\
$p = (L \xleftarrow{\ell} K \xrightarrow{r} R)$ & DPOI rule \\
$\mu_i$ & microstep label \\
$P = (\mu_0,\dots,\mu_{n-1})$ & provenance payload \\
$S_0 \Rewrite^\ast S_n$ & derivation volume (interior evolution) \\
$(S_0,P)$ & wormhole (boundary encoding) \\
$\Del(m), \Use(m)$ & delete and use sets of a match \\
$\Recon(S_0,P)$ & reconstruction procedure \\
\end{tabular}
\end{center}
\medskip

Subsequent sections introduce $D_{\tau,m}$ (rulial distance),
Comment on lines +149 to +161
@coderabbitai
coderabbitai bot
3 hours ago
⚠️ Potential issue | 🟠 Major

Notation for (\mathcal{U}) vs (U) is now self‑contradictory; fix the universe symbol.

The table entry currently reads:

$\mathcal{U} = (G;\alpha,\beta)$ & single RMG state (one object in a universe $\mathcal{U}$) \\
You’re using (\mathcal{U}) simultaneously for:

A single RMG state, and
The ambient “universe” containing that state.
Then, two lines later, you introduce (\Hist(U,R)), where (U) is clearly meant to be the collection/category of RMG states. This is exactly the ambiguity the earlier review asked you to avoid, and the new wording makes it worse.

I’d disambiguate as follows:

-$\mathcal{U} = (G;\alpha,\beta)$ & single RMG state (one object in a universe $\mathcal{U}$) \\
+$\mathcal{U} = (G;\alpha,\beta)$ & single RMG state (one object in an RMG universe $U$) \\
@@
-Subsequent sections introduce $D_{\tau,m}$ (rulial distance),
-$\Hist(U,R)$ (history category), and other observer-related notation.
+Subsequent sections introduce $D_{\tau,m}$ (rulial distance),
+$\Hist(U,R)$ (history category on a universe $U$ of RMG states), and
+other observer-related notation.
That way (\mathcal{U}) is consistently “a particular state” and (U) is “the collection/category of such states”.

🤖 Prompt for AI Agents
In aion-holography/sections/rmg.tex around lines 149-161, the symbol \mathcal{U}
is used inconsistently as both a single RMG state and the ambient universe;
change the notation so \mathcal{U} denotes one particular RMG state (e.g.
“\mathcal{U} = (G;\alpha,\beta)” and describe it as “a single RMG state”),
reserve U (plain U) for the collection/category of states (the universe), update
the table entry text accordingly, and then search and replace other occurrences
in this section (e.g. \Hist(U,R) and any sentences that refer to “universe”) to
use U when referring to the collection and \mathcal{U} when referring to an
individual state so the notation is consistent throughout.

--

Review is correct but critically incomplete—fixes needed at three locations, not one.

The bibliography indeed mixes formats. However, your diff only addresses line 2 (Ehrig2006). The regex verification found THREE entries using "First Last" format:

Line 2 (Ehrig2006): needs fix ✓ (covered by your diff)
Line 9: author = {Hartmut Ehrig and Michael L{\"o}we} — needs fix
Line 30: author = {Bob Coecke and Ross Duncan} — needs fix
Lines 73, 84 (LS06, EEPT06) are already correctly formatted as "Last, First" and require no changes.

Apply the diff to line 2, then standardize lines 9 and 30 to Last, FirstName format as well. Verify the entire file has zero remaining "First Last" entries after the fixes.
