%%% Theorem Environment
\theoremstyle{plain}
\theorembodyfont{\songti\rmfamily}
\theoremheaderfont{\heiti\rmfamily}
  \newtheorem{theorem}{定理~}[chapter]
  \newtheorem{lemma}{引理~}[chapter]
  \newtheorem{axiom}{公理~}[chapter]
  \newtheorem{proposition}{命题~}[chapter]
  \newtheorem{corollary}{推论~}[chapter]
  \newtheorem{definition}{定义~}[chapter]
  \newtheorem{conjecture}{猜想~}[chapter]
  \newtheorem{example}{例~}[chapter]
  \newtheorem{remark}{注~}[chapter]
  %\newtheorem{algorithm}{算法~}[chapter]
  \newenvironment{proof}{\noindent{\heiti 证明：}}{\hfill $ \square $ \vskip 4mm}
  \theoremsymbol{$\square$}
%%

% \graphicspath{{figures/}}  % 定义所有的eps文件在 figures 子目录下

\DeclareRobustCommand{\zjuttitlec}{}
\DeclareRobustCommand{\zjuttitle}[1]{%
  \renewcommand{\zjuttitlec}{#1}}

\DeclareRobustCommand{\zjuttitleEn}{}
\DeclareRobustCommand{\zjuttitleeng}[1]{%
  \renewcommand{\zjuttitleEn}{#1}}

\DeclareRobustCommand{\zjutauthornamec}{}
\DeclareRobustCommand{\zjutauthorid}{}
\DeclareRobustCommand{\zjutauthor}[2]{%
  \renewcommand{\zjutauthornamec}{#1}%
  \renewcommand{\zjutauthorid}{#2}}
\DeclareRobustCommand{\zjutmentorc}{}
\DeclareRobustCommand{\zjutmentor}[1]{%
  \renewcommand{\zjutmentorc}{#1}}
\DeclareRobustCommand{\zjutgrade}{}
\DeclareRobustCommand{\zjutmajor}{}
\DeclareRobustCommand{\zjutinfo}[2]{%
  \renewcommand{\zjutgrade}{#1}%
  \renewcommand{\zjutmajor}{#2}}
\DeclareRobustCommand{\zjutcollegec}{}
\DeclareRobustCommand{\zjutcollege}[1]{%
  \renewcommand{\zjutcollegec}{#1}}
\DeclareRobustCommand{\zjutsubmitteddatee}{}
\DeclareRobustCommand{\zjutdate}[1]{%
  \renewcommand{\zjutsubmitteddatee}{#1}}

\DeclareRobustCommand{\zjutthesis}{\textsc{ZJUT}\-\textsc{Thesis}}
\DeclareRobustCommand{\thuthesis}{\textsc{Thu}\-\textsc{Thesis}}
\DeclareRobustCommand{\zjutreport}{\textsc{ZJUT}\-\textsc{Report}}


%%% Original Preamble
\DeclareRobustCommand\nobreakspace{\leavevmode\nobreak\ }

\DeclareRobustCommand{\zjutreporttype}[1]{\renewcommand{\zjutreporttype}{#1}}
\DeclareRobustCommand{\zjutSubmittedDate}[1]{\renewcommand{\zjutSubmittedDate}{#1}}
\DeclareRobustCommand{\zjutAuthorName}[1]{\renewcommand{\zjutAuthorName}{#1}}
\DeclareRobustCommand{\zjutAuthorID}[1]{\renewcommand{\zjutAuthorID}{#1}}
\DeclareRobustCommand{\zjutMentor}[1]{\renewcommand{\zjutMentor}{#1}}
\DeclareRobustCommand{\thesisTitle}[1]{\renewcommand{\thesisTitle}{#1}}
\DeclareRobustCommand{\thesisTitleEn}[1]{\renewcommand{\thesisTitleEn}{#1}}
\DeclareRobustCommand{\zjutCollege}[1]{\renewcommand{\zjutCollege}{#1}}
\DeclareRobustCommand{\zjutGradeYear}[1]{\renewcommand{\zjutGradeYear}{#1}}
\DeclareRobustCommand{\zjutMajor}[1]{\renewcommand{\zjutMajor}{#1}}
\DeclareRobustCommand{\zjutClass}[1]{\renewcommand{\zjutClass}{#1}}
\DeclareRobustCommand{\zjutInternshipTitle}[1]{\renewcommand{\zjutInternshipTitle}{#1}}

\DeclareRobustCommand{\titleLeftSpace}[1]{\renewcommand{\titleLeftSpace}{#1}}
\DeclareRobustCommand{\titleUlineLength}[1]{\renewcommand{\titleUlineLength}{#1}}
\DeclareRobustCommand{\coverUlineLength}[1]{\renewcommand{\coverUlineLength}{#1}}

\newcommand{\coveruline}[1]{\hspace{2mm}\uline{\makebox[\coverUlineLength]{#1}}}

\newcommand{\isBasicInternship} {\newif\ifBasicInternship \BasicInternshiptrue}
\newcommand{\isBoostInternship} {\newif\ifBasicInternship \BasicInternshipfalse}

\newcommand{\myfrontmatter}{
  \frontmatter \pagenumbering{Roman}  % Arabic
}

\newcommand{\myabstractc}{\myfrontmatter \abstractc}

\DeclareRobustCommand{\reporttitle}[1]{
  \renewcommand{\reporttitle}{#1}
  \mainmatter
  % \renewcommand\figurename{\zjut@label@figurename}
  % \renewcommand\tablename{\zjut@label@tablename}
  \vspace*{3.0mm}
  
  \begin{minipage}[b]{.9\linewidth}
    \onehalfspacing
    \centering\sanhao\heiti\bfseries{\reporttitle}  % 不使用 \centerline, 会导致不能自动换行
    % \centerline{\sanhao\heiti\bfseries{#1}}
  \end{minipage}
  
  \vspace*{6.0mm}
}

\newcommand{\mymainmatter}{
  \mainmatter
  \onehalfspacing % 正文部分1.5倍行距
}

% 目录部分单倍行距，且为目录加上标签
\newcommand{\mycontentsindex}{
	\singlespacing
	\tableofcontents{}
	\addcontentsline{toc}{chapter}{\contentsname}
  % 这里直接引用 \zjut@label@contents 会报 “未定义” 的错误，
  %   因为它是在 .cfg 文件中定义的，而 .cfg 文件将会在这些语句之后加载
	% \addcontentsline{toc}{chapter}{\zjut@label@contents}
}

\newcommand{\mytablesindex}{
	\listoftables
	\addcontentsline{toc}{chapter}{\listtablename}
}

\newcommand{\myfiguresindex}{
	\listoffigures
	\addcontentsline{toc}{chapter}{\listfigurename}
	\mymainmatter
}

\newcommand{\myappendix}{\chapter{\appendixtitle}}

\ifenglishVersion
  \newcommand{\myul}{\ul}
  \newcommand{\theTitleContent}{\zjuttitleEn}
  % \newcommand{\theTitleContent}{Design and Implementation of Forbidden Word Recognition and Rendering with Browser Environment}
\else
  \newcommand{\myul}{\uline}
  \newcommand{\theTitleContent}{\zjuttitlec}
\fi

%\endinput
