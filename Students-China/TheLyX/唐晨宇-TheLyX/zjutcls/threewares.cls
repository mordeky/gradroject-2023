%%% 中文摘要及关键词 {
\newenvironment{abstractc}{
    \vspace{0.5em}\noindent
    {\heiti\xiaosi\textbf{\zjut@label@abstractc}} 
    \quad
}{}

\newcommand\keywordsc[1]{\vspace{1em}\noindent%
    {\heiti\xiaosi\textbf{\zjut@label@keywordsc}}\quad{\songti\xiaosi{#1}}%
}

%%% English Abstract and Keywords
\newenvironment{abstracte}{
    \vspace{0.5em}\noindent
    {\heiti\xiaosi\textbf{\zjut@label@abstracte \zjut@label@colon}} 
    \quad
}{}
\newcommand\keywordse[1]{\vspace{0.3em}\noindent%
    {\tnroman\xiaosi\textbf{\zjut@label@keywordse}}\quad{\tnroman\xiaosi{#1}}%
}
%%% }

%%% titles{
\newcommand\reportheadtitle{\zjut@label@defaultheadtitle}
\newcommand\reporttitle{\zjut@label@defaulttitle}

\ifzjutTranslation
    \renewcommand\reporttitle{\zjut@label@translationtitle}
    \renewcommand\reportheadtitle{\zjut@label@translationheadtitle}
\fi

\ifzjutLiteratureReview
    \renewcommand\reporttitle{\zjut@label@literaturereviewtitle}
    \renewcommand\reportheadtitle{\zjut@label@literaturereviewheadtitle}
\fi

\ifzjutOpeningReport
    \renewcommand\reporttitle{\zjut@label@openingreport}
    \renewcommand\reportheadtitle{\zjut@label@openingreportheadtitle}
\fi

\ifzjutInternship
    \renewcommand\reporttitle{\zjut@label@internshiptitle}
    \renewcommand\reportheadtitle{\zjut@label@internshipheadtitle}
\fi
%%%}

%%%%%%%%%%%%%%%%%%%%
%% 各级标题
%% \titleformat{hcommandi}[hshapei]{hformati}{hlabeli}{hsepi}{hbefore-codei}[hafter-cod]
%% \titlespacing*{hcommandi}{hlefti}{hbefore-sepi}{hafter-sepi}[hright-sepi]
%% \titlecontents ToC
%% http://mirror.bjtu.edu.cn/CTAN/macros/latex/contrib/titlesec/titlesec.pdf
%%%%%%%%%%%%%%%%%%%%

%%% 报告的 1 级标题：四号，黑体，居中，加粗，段前12磅，段后6磅，1.5倍行距
\titleclass{\chapter}{straight}
\titleformat{\chapter}[block]{
    \onehalfspacing
    \sihao\heiti\bfseries}{\chapterIndex}{1ex}{}{}
\titlespacing{\chapter}{0pt}{6pt}{2pt}
\titlecontents{chapter}[0.1ex]
        {}
        {\songti\bfseries{\CJKnumber{\thecontentslabel{}}、\hspace{1ex}}}
        {}
        {\titlerule*[5pt]{.}\contentspage}

%%% 报告的 2 级标题：小四，黑体，段前6磅，段后6磅，1.5倍行距
\titleformat{\section}[hang]{\xiaosi\heiti\bfseries}{\thesection}{1em}{}{}
\titlespacing{\section}{0pt}{-3pt}{0pt}
\titlecontents{section}[1.0ex]
        {}
        {\hspace{1em}\thecontentslabel\hspace{1em}}
        {}
        {\titlerule*[5pt]{.}\contentspage}

%%% 报告的 3 级标题：小四，黑体，段前段后６磅，1.5倍行距，建议不使用四级或更高级别目录、标题 {
\titleformat{\subsection}[hang]{\xiaosi\heiti\bfseries}{\thesubsection}{1em}{}{}
\titlespacing{\subsection}{0pt}{-3pt}{0pt}
\titlecontents{subsection}[1.0ex]
        {}
        {\hspace{2em}\thecontentslabel\hspace{1em}}
        {}
        {\titlerule*[5pt]{.}\contentspage}

%%% 报告的 4 级标题 DEPRECATED
\titleformat{\subsubsection}[hang]{\xiaosi\heiti\bfseries}{\thesubsubsection}{1em}{}{}
\titlespacing{\subsubsection}{0pt}{0.0\baselineskip}{0.0\baselineskip}
\titlecontents{subsubsection}[1.0ex]
        {}
        {\hspace{3em}\thecontentslabel\hspace{1em}}
        {}
        {\titlerule*[5pt]{.}\contentspage}
