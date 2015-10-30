%%% asst1a.mp -- do not edit, generated automatically by asst1a.tex
verbatimtex
\documentclass [10pt]{article}
\begin {document}
etex;
input boxes; input theory;
beginfig(1);
LaTeX_unitlength := 1.0pt;
w := 0*LaTeX_unitlength;
h := 0*LaTeX_unitlength;
  mediumnodes;

  u := 1.5cm;
  node.q0(); q0.c = (-3u,0);
  node.q1(); q1.c = (-2u,0);
  node.q2(); q2.c = (-1u,0);
  node.q3(); q3.c = (0,0);

  loop(q0, up, ZERO);
  loop(q1, up, ZERO);
  loop(q2, up, ZERO);
  loop(q3, up, ZEROONE);
  edge(q0, q1, curve, ONE);
  edge(q1, q2, curve, ONE);
  edge(q2, q3, curve, ONE);

  drawboxed(q0, q1, q2, q3);
  makestart(q0);
  makefinal(q3);
endfig;
beginfig(2);
LaTeX_unitlength := 1.0pt;
w := 0*LaTeX_unitlength;
h := 0*LaTeX_unitlength;
  mediumnodes;

  u := 1.5cm;
  node.q0(); q0.c = (-3u,0);
  node.q1(); q1.c = (-2u,0);
  node.q2(); q2.c = (-1u,0);
  node.q3(); q3.c = (0,0);
  node.q4(); q4.c = (u,0);

  loop(q0, up, ONE);
  loop(q1, up, ZERO);
  loop(q4, up, ZEROONE);
  edge(q0, q1, curve, ZERO);
  edge(q1, q2, curve, ONE);
  edge(q2, q3, curve, ZERO);
  edge(q3, q4, curve, ONE);
  edge(q2, q0, 45, ONE);
  edge(q3, q1, -55, ZERO);

  drawboxed(q0, q1, q2, q3, q4);
  makestart(q0);
  makefinal(q4);
endfig;
beginfig(3);
LaTeX_unitlength := 1.0pt;
w := 0*LaTeX_unitlength;
h := 0*LaTeX_unitlength;
  mediumnodes;

  u := 1.5cm;
  node.q0(); q0.c = (-3u,0);
  node.q1(); q1.c = (-2u,0);
  node.q2(); q2.c = (-3u,-u);

  edge(q0, q1, curve, ZERO);
  edge(q0, q2, -curve, ONE);
  edge(q2, q1, 1, ZEROONE);
  edge(q1, q2, 65, ZEROONE);

  drawboxed(q0, q1, q2);
  makestart(q0);
  makefinal(q1);
endfig;
beginfig(4);
LaTeX_unitlength := 1.0pt;
w := 0*LaTeX_unitlength;
h := 0*LaTeX_unitlength;
  mediumnodes;

  u := 1.5cm;
  node.q0(); q0.c = (-3u,0);
  node.q1(); q1.c = (-2u,0);
  node.q2(); q2.c = (-1u,0);
  node.q3(); q3.c = (0,0);

  loop(q0, up, ZERO);
  loop(q3, up, ZEROONE);
  edge(q0, q1, curve, ONE);
  edge(q1, q2, curve, ONE);
  edge(q2, q3, curve, ZERO);
  edge(q1, q0, curve, ZERO);
  edge(q2, q1, curve, ONE);

  drawboxed(q0, q1, q2, q3);
  makestart(q0);
  makefinal(q0, q1, q2);
endfig;
beginfig(5);
LaTeX_unitlength := 1.0pt;
w := 0*LaTeX_unitlength;
h := 0*LaTeX_unitlength;
  mediumnodes;

  u := 1.5cm;
  node.q0(); q0.c = (-3u,0);
  node.q1(); q1.c = (-2u,0);

  loop(q1, up, ZEROONE);
  edge(q0, q1, curve, ZEROONE);

  drawboxed(q0, q1);
  makestart(q0);
  makefinal(q0);
endfig;
verbatimtex
\end{document}
etex;
%%% the end.
end.
endinput;
