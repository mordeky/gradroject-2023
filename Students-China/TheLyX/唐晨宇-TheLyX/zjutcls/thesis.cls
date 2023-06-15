%%% 中文摘要及关键词 {
\newcommand\thesisheadtitle{\zjut@label@gradthesisheadtitle}

\ifzjutGradThesis
    % \renewcommand\thesistitle{\zjut@label@gradthesistitle}
    \renewcommand\thesisheadtitle{\zjut@label@gradthesisheadtitle}
\fi

\ifzjutInternship
    % \renewcommand\thesistitle{\zjut@label@internshiptitle}
    \renewcommand\thesisheadtitle{\zjut@label@internshipheadtitle}
\fi
%%% }

%%% 中文摘要及关键词 {
\newenvironment{abstractc}{
    \titlespacing{\chapter}{0pt}{-3pt}{18pt} % XXX 调整行距后@mckelvin 人工调的
    \chapter{\zjut@label@abstracttitlec}
}{}
\newcommand\keywordsc[1]{\vspace{1em}\noindent%
    {\songti\xiaosi\textbf{\zjut@label@keywordsc}}\quad{\songti\xiaosi{#1}}%
}
    
%%% English Abstract and Keywords
\newenvironment{abstracte}{
    \titlespacing{\chapter}{0pt}{-3pt}{18pt} % XXX 调整行距后@mckelvin 人工调的
    \chapter{\zjut@label@abstracttitlee}
}{}
\newcommand\keywordse[1]{\vspace{1em}\noindent%
    {\tnroman\xiaosi\textbf{\zjut@label@keywordse}}\quad{\tnroman\xiaosi{#1}}%
}
%%% }

%%%%%%%%%%%%%%%%%%%%
%% 各级标题
%% \titleformat{hcommandi}[hshapei]{hformati}{hlabeli}{hsepi}{hbefore-codei}[hafter-cod]
%% \titlespacing*{hcommandi}{hlefti}{hbefore-sepi}{hafter-sepi}[hright-sepi]
%% \titlecontents ToC
%% http://mirror.bjtu.edu.cn/CTAN/macros/latex/contrib/titlesec/titlesec.pdf
%%%%%%%%%%%%%%%%%%%%

%%% 论文的 1 级标题：小二，黑体，居中，加粗，段前段后18磅，1.5倍行距
\titleformat{\chapter}[block]{
    \onehalfspacing
    \xiaoer\heiti\filcenter\bfseries
    }{\chapterIndex}{1ex}{}{}

\titlespacing{\chapter}{0pt}{-9pt}{18pt} % XXX 调整行距后 @mckelvin 人工调的
\titlecontents{chapter}[0.1ex]
        {}
        {\wuhao\bfseries{\chapterReference\hspace{1ex}}}
        {\wuhao\bfseries}
        {\wuhao\bfseries\titlerule*[3pt]{.}\contentspage}

%%% 论文的 2 级标题：小三，宋体，加粗，段前12磅，段后6磅，1.5倍行距
\titleformat{\section}[hang]{\onehalfspacing \xiaosan\songti\bfseries}{\thesection}{1em}{}{}
\titlespacing{\section}{0pt}{-6pt}{6pt} % XXX 调整行距后@mckelvin 人工调的
\titlecontents{section}[1.0ex]
        {}
        {\wuhao\hspace{1ex}\thecontentslabel\hspace{1em}}
        {\wuhao}
        {\wuhao\titlerule*[3pt]{.}\contentspage}

%%% 论文的 3 级标题：四号，宋体，加粗，段前６磅，1.5倍行距，建议不使用四级或更高级别目录、标题 {
\titleformat{\subsection}[hang]{\onehalfspacing \sihao\songti\bfseries}{\thesubsection}{1em}{}{}
\titlespacing{\subsection}{0pt}{-3pt}{0pt} % XXX 调整行距后@mckelvin 人工调的
\titlecontents{subsection}[1.0ex]
        {}
        {\wuhao\hspace{2em}\thecontentslabel\hspace{1em}}
        {\wuhao}
        {\wuhao\titlerule*[3pt]{.}\contentspage}

%%% 论文的 4 级标题 DEPRECATED
\titleformat{\subsubsection}[hang]{\onehalfspacing \xiaosi\songti\bfseries}{\thesubsubsection}{1em}{}{}
\titlespacing{\subsubsection}{0pt}{0.0\baselineskip}{0.0\baselineskip}
\titlecontents{subsubsection}[1.0ex]
        {}
        {\wuhao\hspace{3em}\thecontentslabel\hspace{1em}}
        {\wuhao}
        {\wuhao\titlerule*[3pt]{.}\contentspage}

%%% 图目录
\renewcommand{\listfigurename}{\centerline{\zjut@label@listfigurename}}
\renewcommand{\numberline}[1]{\zjut@label@figurename~#1\hspace*{1em}}

\titlecontents{figure}[0.1ex]
        {}
        {\wuhao{\zjut@label@figurename \thecontentslabel\hspace{0.5ex}}}
        {\wuhao}
        {\wuhao\titlerule*[3pt]{.}\contentspage}
%%% }

%%% 表目录
\renewcommand{\listtablename}{\centerline{\zjut@label@listtablename}}
\renewcommand{\numberline}[1]{\zjut@label@tablename~#1\hspace*{1em}}
\titlecontents{table}[0.1ex]
        {}
        {\wuhao{\zjut@label@tablename \thecontentslabel\hspace{0.5ex}}}
        {\wuhao}
        {\wuhao\titlerule*[3pt]{.}\contentspage}
%%% }
