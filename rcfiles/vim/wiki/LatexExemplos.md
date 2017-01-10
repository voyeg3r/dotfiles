### macro para imagens

``` latex
\newcommand{\myfig}[3] %label, caption, filename
{
\begin{figure}[h!]
 \centering
 \includegraphics[width=\linewidth]{pics/#3}
 \caption{#2}
 \label{fig:#1}
\end{figure}
}
```

### Quebra de linha com distância definida em valor

``` latex
\textsc{\LARGE University Name}\\[1.5cm]
```

### texto ao redor de figura

``` latex
%Preamble
\usepackage{wrapfig, graphicx}

% Document
\begin{wrapfigure}{l}{0.5\textwidth} % l for left, r for right
\centering
\includegraphics[width=0.45\textwidth]{test}
\caption{Text wrapped around figure}
\label{fig:wrapfig}
\end{wrapfigure}
```

### dimensão correta do papel no pdflatex

``` latex
\ifx\pdfoutput\undefined
\else
    \pdfpagewidth=8.5in
    \pdfpageheight=11in
\fi
```
