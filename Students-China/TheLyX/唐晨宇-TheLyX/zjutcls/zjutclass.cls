%%
%% Copyright (C) 2008-09-24 by Wei-Wei Guo <wwguo@zju.edu.cn>
%% Copyright (C) 2012-12-28 by Myau-tsai PAN <ibmmc@live.com>, Unlucky <unlucky1990@gmail.com>
%% 
%% This file may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, either version 1.2 of this license
%% or (at your option) any later version.  The latest version of this
%% license is in:
%% 
%%    http://www.latex-project.org/lppl.txt
%% 
%% and version 1.2 or later is part of all distributions of LaTeX version
%% 1999/12/01 or later.
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{zjutclass}
    [2012/12/28 v0.1 ZJUT Class]

\AtEndOfPackage{\makeatletter\input{zjutcls/zjut.cfg}\makeatother}
% \makeatletter\input{zjutcls/thesis.cfg}\makeatother
% \AtEndOfPackage{\input{zjutcls/robust_cmds.cls}}

%%% 声明类文件的选项{
%%% 实习报告与论文
\newif\ifzjutThesis % 默认创建一个状态为false的布尔变量
\newif\ifzjutInternship
\newif\ifzjutGradThesis

\newif\ifenglishVersion
\newif\ifremovePageHeader
\newif\ifuseMac

\DeclareOption{gradthesis}{\zjutGradThesistrue\zjutThesistrue}
\DeclareOption{internship}{\zjutInternshiptrue\zjutThesistrue}

\DeclareOption{englishversion}{\englishVersiontrue}
\DeclareOption{rmpageheader}{\removePageHeadertrue}
\DeclareOption{usemac}{\useMactrue}

\ifzjutThesis
\else
    %%% 三大件
    \newif\ifzjutTranslation
    \newif\ifzjutLiteratureReview
    \newif\ifzjutOpeningReport

    \DeclareOption{translation}{\zjutTranslationtrue}
    \DeclareOption{literaturereview}{\zjutLiteratureReviewtrue}
    \DeclareOption{openingreport}{\zjutOpeningReporttrue}
\fi
%%% }

% 导入配置文件
% \ifenglishVersion
% \ifzjutGradThesis
% \ifzjutThesis
    % \AtEndOfPackage{\makeatletter\input{zjutcls/thesis.cfg}\makeatother}
% \else
%     \AtEndOfPackage{\makeatletter\input{zjutcls/threewares.cfg}\makeatother}
% \fi

\ProcessOptions\relax
\LoadClass[12pt,oneside,openany]{book}

\ifzjutThesis
    \RequirePackage[a4paper,
        % A4宽度 8.27 inches = 210.058 mm
        % A4高度 11.69 inches = 296.926 mm
        % 左右边距 1.22 inches = 30.988 mm
        % 上下边距 1.46 inches = 37.084 mm
        % 页眉页脚高度 1.18 inches = 29.972 mm
        % 210.058 - 30.988 * 2 = 148.082 mm
        % 296.926 - 37.084 * 222.758 mm
        textwidth=148.082true mm,
        textheight=222.758true mm, % 页眉线 - 最后一行文字底端
        head=12true mm,
        headsep=2true mm,
        footskip=7true mm,
        includehead,
    ]{geometry}
\else
    \RequirePackage[a4paper,
        % 页眉 0.59 inches = 14.986 mm
        % 页脚 0.69 inches = 17.526 mm
        % text={148true mm,223true mm},
        % top=25.4true mm,
        % head=10.4true mm,
        % headsep=2.5true mm, % 微调
        % bottom=25.4true mm,
        % foot=7.9true mm,
        textwidth=148.082true mm,
        textheight=240true mm, % 页眉线 - 最后一行文字底端 XXX @mckelvin 人工调的
        head=10true mm,
        headsep=10true mm,
        footskip=10true mm,
        includehead,
        includefoot,
    ]{geometry}
\fi

\RequirePackage{graphicx}                       % 支持插图处理
\RequirePackage{titlesec}                       % 控制标题的宏包
\RequirePackage{titletoc}                       % 控制目录的宏包
\RequirePackage{fancyhdr}                       % fancyhdr宏包 支持页眉和页脚的相关定义
% \RequirePackage{soulutf8}  % 使用 ul 命令，需要导入 soulutf8

% xeCJK中文粗体、斜体、数字支持，并提供将阿拉伯数字转换成中文数字的命令
\ifuseMac
    \RequirePackage[slantfont, boldfont]{xeCJK}
\else
    \RequirePackage[slantfont, CJKnumber, boldfont]{xeCJK}
\fi

\RequirePackage{color}                          % 支持彩色
\RequirePackage{amsmath}                        % AMSLaTeX宏包 用来排出更加漂亮的公式
\RequirePackage{amssymb}                        % 数学符号生成命令
\newcommand\hmax{0}                             % insert before bm package
\RequirePackage{bm}                             % 处理数学公式中的黑斜体的宏包
\RequirePackage[below]{placeins}                %允许上一个section的浮动图形出现在下一个section的开始部分,还提供\FloatBarrier命令,使所有未处理的浮动图形立即被处理
\RequirePackage{flafter}                        % 使得所有浮动体不能被放置在其浮动环境之前，以免浮动体在引述它的文本之前出现.
\RequirePackage{float}                          % 设置图片浮动格式
\RequirePackage{multirow}                       % 使用Multirow宏包，使得表格可以合并多个row格
\RequirePackage{booktabs}                       % 表格，横的粗线；\specialrule{1pt}{0pt}{0pt}
\RequirePackage{longtable}                      % 支持跨页的表格。
\RequirePackage{tabularx}                       % 自动设置表格的列宽
\RequirePackage{subfigure}                      % 支持子图 %centerlast 设置最后一行是否居中
\RequirePackage[subfigure]{ccaption}            % 支持子图的中文标题
\RequirePackage[sort&compress,numbers]{natbib}  % 支持引用缩写的宏包
\RequirePackage{enumitem}                       % 使用enumitem宏包,改变列表项的格式
\RequirePackage{calc}                           % 长度可以用+ - * / 进行计算
\RequirePackage{txfonts}                        % 字体宏包
\RequirePackage{bm}                             % 处理数学公式中的黑斜体的宏包
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}  % 定理类环境宏包，其中 amsmath 选项用来兼容 AMS LaTeX 的宏包
%\RequirePackage{CJKnumb}                       % 提供将阿拉伯数字转换成中文数字的命令
\ifuseMac
    \RequirePackage{zhnumber}                   % 提供将阿拉伯数字转换成中文数字的命令,仅在Mac下使用？？
\fi
\RequirePackage{indentfirst}                    % 首行缩进宏包
%\RequirePackage{CJKutf8}                       % 用在UTF8编码环境下，它可以自动调用CJK，同时针对UTF8编码作了设置。
%\RequirePackage{hypbmsec}                      % 用来控制书签中标题显示内容
\RequirePackage{CJKfntef}
\RequirePackage{times}
% see issue #27
\RequirePackage{expl3}	% \ExplSyntaxOn 依赖于 expl3，否则可能会编译不过
% see issue #5
\ExplSyntaxOn
\cs_new_eq:NN \__save_dim_max:nn \dim_max:nn
\cs_new_eq:NN \__save_dim_min:nn \dim_min:nn
\AtBeginDocument
{
    \cs_set_eq:NN \dim_max:nn \__save_dim_max:nn
    \cs_set_eq:NN \dim_min:nn \__save_dim_min:nn
}
\ExplSyntaxOff

\RequirePackage{fontspec,xunicode,xltxtra}      % XeLaTeX相关字体字库 
% 如果您的pdf制作中文书签有乱码使用如下命令，就可以解决了
\RequirePackage[xetex, unicode,
    pdfstartview=FitH,
    CJKbookmarks=true,
    bookmarksnumbered=true,
    bookmarksopen=true,
    colorlinks=true,
    citecolor=black,
    linkcolor=black,
    anchorcolor=black,
    urlcolor=black,
    breaklinks=true
]{hyperref}

\RequirePackage{ifthen}
\RequirePackage{calc}
\RequirePackage{setspace}
\RequirePackage{listings} % 插入代码
\RequirePackage{xcolor} % 代码高亮

%% 代码高亮设置
% \lstset{language=matlab}
\lstset{
	language=python,                                     % 设置语言
	columns=fixed,       
	numbers=left,                                        % 在左侧显示行号
	numberstyle=\tiny\color{gray},                       % 设定行号格式
	frame=none,                                          % 不显示背景边框
	% frame=single,                                        % 设置边框格式
	backgroundcolor=\color[RGB]{245,245,244},            % 设定背景颜色
	% keywordstyle=\color[RGB]{40,40,255},                 % 设定关键字颜色
	keywordstyle=\color{blue},                           % 设置关键字颜色
	numberstyle=\footnotesize\color{darkgray},
	% commentstyle=\it\color[RGB]{0,96,96},                % 设置代码注释的格式
	commentstyle=\color[cmyk]{1,0,1,0},                  % 设置注释颜色
	stringstyle=\rmfamily\slshape\color[RGB]{128,0,0},   % 设置字符串格式
	showstringspaces=false,                              % 不显示字符串中的空格
	escapeinside=``,                                     % 逃逸字符，用于显示中文
	breaklines,                                          % 自动折行
	extendedchars=false,
	xleftmargin=2em,xrightmargin=2em, aboveskip=1em,     % 设置边距
	tabsize=4,                                           % 设置tab空格数
	showspaces=false                                     % 不显示空格
}

% 支持算法环境
\RequirePackage[boxed,ruled,lined]{algorithm2e}
\RequirePackage{algorithmic}

%%% 设置字体{
\setmainfont[Mapping=tex-text]{Times New Roman}
\setsansfont{Arial}
\setmonofont{Courier New}

\setCJKmainfont{SimSun}
\setCJKsansfont{SimHei}
\setCJKmonofont{SimSun}
\punctstyle{kaiming}

\setCJKfamilyfont{SongTi}{SimSun} % 更好印刷效果可换成 Adobe Heiti Std
\DeclareRobustCommand{\songti}{\CJKfamily{SongTi}}     % 宋体
\setCJKfamilyfont{FangSong}{FangSong}
\DeclareRobustCommand{\fangsong}{\CJKfamily{FangSong}} % 仿宋
\setCJKfamilyfont{KaiShu}{KaiTi}
\DeclareRobustCommand{\kaiti}{\CJKfamily{KaiShu}}      % 楷体
\setCJKfamilyfont{HeiTi}{SimHei}
\DeclareRobustCommand{\heiti}{\CJKfamily{HeiTi}}       % 黑体
\setCJKfamilyfont{LiShu}{LiSu}
\DeclareRobustCommand{\lishu}{\CJKfamily{LiShu}}       % 隶书
\setCJKfamilyfont{YouYuan}{YouYuan}
\DeclareRobustCommand{\youti}{\CJKfamily{YouYuan}}     % 幼圆
\setCJKfamilyfont{STFangsong}{STFangsong}
\DeclareRobustCommand{\stfangsong}{\CJKfamily{STFangsong}} % ST仿宋
\setCJKfamilyfont{STXingkai}{STXingkai}
\DeclareRobustCommand{\stxingkai}{\CJKfamily{STXingkai}}   % ST行楷
\setCJKfamilyfont{tnroman}{Times New Roman}
\DeclareRobustCommand{\tnroman}{\CJKfamily{tnroman}}       % Times New Roman
%%%}

%%% 设置行/段间距{
\frenchspacing
\widowpenalty=10000
\setlength{\parskip}{0pt} % 段距
\setlength{\parindent}{2.5em}

\renewcommand{\singlespacing}{\setstretch{1.09}} % 对应Word中单倍行距
\renewcommand{\onehalfspacing}{\setstretch{1.35}} % 对应Word中1.5倍行距
\onehalfspacing % 默认1.5倍行距
\renewcommand{\arraystretch}{0.6}
%%%}

%%% 设置字号{
\captionnamefont{\wuhao\songti} % 图/表标题 五号宋体
\captiontitlefont{\wuhao\songti}
\DeclareRobustCommand{\chuhao}{\fontsize{42pt}{\baselineskip}\selectfont}  % 初号
\DeclareRobustCommand{\xiaochu}{\fontsize{36pt}{\baselineskip}\selectfont} % 小初
\DeclareRobustCommand{\yihao}{\fontsize{26pt}{\baselineskip}\selectfont}   % 一号
\DeclareRobustCommand{\xiaoyi}{\fontsize{24pt}{\baselineskip}\selectfont}  % 小一
\DeclareRobustCommand{\erhao}{\fontsize{22pt}{\baselineskip}\selectfont}   % 二号
\DeclareRobustCommand{\xiaoer}{\fontsize{18pt}{\baselineskip}\selectfont}  % 小二
\DeclareRobustCommand{\sanhao}{\fontsize{16pt}{\baselineskip}\selectfont}  % 三号 
\DeclareRobustCommand{\xiaosan}{\fontsize{15pt}{\baselineskip}\selectfont} % 小三
\DeclareRobustCommand{\sihao}{\fontsize{14pt}{\baselineskip}\selectfont}   % 四号
\DeclareRobustCommand{\xiaosi}{\fontsize{12pt}{\baselineskip}\selectfont}  % 小四
\DeclareRobustCommand{\wuhao}{\fontsize{10.5pt}{\baselineskip}\selectfont} % 五号
\DeclareRobustCommand{\xiaowu}{\fontsize{9pt}{\baselineskip}\selectfont}   % 小五
\DeclareRobustCommand{\liuhao}{\fontsize{7.5pt}{\baselineskip}\selectfont} % 六号
\DeclareRobustCommand{\xiaoliu}{\fontsize{6.5pt}{\baselineskip}\selectfont}% 小六
\DeclareRobustCommand{\qihao}{\fontsize{5.5pt}{\baselineskip}\selectfont}  % 七号
\DeclareRobustCommand{\bahao}{\fontsize{5pt}{\baselineskip}\selectfont}    % 八号
%%%}

% 0: chapter
% 1: section
% 2: subsection
% 3: subsubsection
\setcounter{secnumdepth}{3} % 自动编号最大深度到 subsubsection
\setcounter{tocdepth}{2} % 目录显示深度到 subsection

% 导入结构文件：标题、摘要、关键字、各级标题、图/表目录
\ifzjutThesis
    \input{zjutcls/thesis.cls}
\else
    \input{zjutcls/threewares.cls}
\fi

%%% 页眉页脚{
\newcommand\theheadtitle{\zjut@label@defaultheadtitle}
\ifzjutThesis
    \renewcommand\theheadtitle{\thesisheadtitle}
\else
    \renewcommand\theheadtitle{\reportheadtitle}
\fi

\pagestyle{fancy}
\ifremovePageHeader
    % \pagestyle{empty}
    \fancyhead[L]{}
    \fancyhead[R]{}
    %\fancyhead[C]{}
    \renewcommand{\headrulewidth}{0pt} % 分隔线宽度0磅
\else
	\fancyhf{}
	\renewcommand{\headrulewidth}{0.5pt}
	\fancypagestyle{plain}{
	  \fancyhf{}
	  \fancyhead[C]{\xiaowu\songti \theheadtitle}
	  \fancyfoot[C]{\xiaowu\thepage}
	}
	\fancyhf{}
	
	\fancyhead[C]{\xiaowu\songti \theheadtitle}
\fi

%\fancyfoot[L]{左页脚}
\fancyfoot[C]{\xiaowu\thepage}
%\fancyfoot[R]{右页脚}

%%% }

%%% 图
\renewcommand{\figurename}{~\zjut@label@figurename~}
\renewcommand{\thefigure}{~\thechapter-\arabic{figure}~}

%%% 表
\renewcommand{\tablename}{~\zjut@label@tablename~}
\renewcommand{\thetable}{~\thechapter-\arabic{table}~}

%%% 算法
\renewcommand{\algorithmcfname}{\zjut@label@algname}
% \setlength{\belowcaptionskip}{2mm}
\renewcommand{\footnotesize}{\xiaowu}

%%% 目录
% \renewcommand{\contentsname}{\centerline{\zjut@label@contents}}
\renewcommand{\contentsname}{\zjut@label@contents}
\renewcommand{\listtablename}{\zjut@label@listtablename}
\renewcommand{\listfigurename}{\zjut@label@listfigurename}

\newenvironment{acknowledgementtitle}{
    \titlespacing{\chapter}{0pt}{-3pt}{18pt} % XXX 调整行距后@mckelvin 人工调的
    \chapter{\zjut@label@acknowledgementtitle}
}{}
\newcommand\acknowledgementname{\zjut@label@acknowledgement}
%\newcommand\acknowledgementtitle{\zjut@label@acknowledgementtitle}
\renewcommand\appendixname{\zjut@label@appendix}
\newcommand\appendixtitle{\zjut@label@appendixtitle}


%%%%%%%%%% References %%%%%%%%%%%%%%%%%
\renewcommand{\bibname}{\zjut@label@bibname}
%\bibliographystyle{GBT7714-2005NLang-ZJUT}
\urlstyle{same}
% 重定义参考文献样式，来自thu
\makeatletter
\renewenvironment{thebibliography}[1]{%
    \chapter{\bibname}
 \wuhao
 \list{\@biblabel{\@arabic\c@enumiv}}%
 {\renewcommand{\makelabel}[1]{##1\hfill}
   \settowidth\labelwidth{0.5cm}
   \setlength{\labelsep}{0pt}
   \setlength{\itemindent}{0pt}
   \setlength{\leftmargin}{\labelwidth+\labelsep}
   \addtolength{\itemsep}{-0.7em}
   \onehalfspacing
   \usecounter{enumiv}%
   \let\p@enumiv\@empty
   \renewcommand\theenumiv{\@arabic\c@enumiv}}%
 \sloppy\frenchspacing
 \clubpenalty4000%
 \@clubpenalty \clubpenalty
 \widowpenalty4000%
 \interlinepenalty4000%
 \sfcode`\.\@m}
{\def\@noitemerr
 {\@latex@warning{Empty `thebibliography' environment}}%
 \endlist\frenchspacing}
\makeatother


%   \addtolength{\bibsep}{-0.5em} % 缩小参考文献间的垂直间距
%   \setlength{\bibhang}{2em} %每个条目自第二行起缩进的距离

% 参考文献引用作为上标出现
% \newcommand{\citeup}[1]{\textsuperscript{\cite{#1}}}
\makeatletter
\def\@cite#1#2{\textsuperscript{[{#1\if@tempswa , #2\fi}]}}
\makeatother
%% 引用格式
\bibpunct{[}{]}{,}{s}{}{,}

\newcolumntype{.}{D{.}{.}{2.4}}

% 用法： 1 & 2 & \tabincell{c}{aaaaaa\\aaaaaa}
\newcommand{\tabincell}[2]{\begin{tabular}{@{}#1@{}}#2\end{tabular}} % 表格内容可以断行

\input{zjutcls/robust_cmds.cls}

\ifzjutThesis
\else
    \usepackage{chngcntr}
    \counterwithout{equation}{chapter}
    \counterwithout{equation}{section}
    \counterwithout{figure}{chapter}
    \counterwithout{figure}{section}
    \counterwithout{table}{chapter}
    \counterwithout{table}{section}
    \newcommand{\zjutpapertitle}{\reporttitle{\zjuttitlec}}
    \newcommand{\zjutpapertitleEn}{\reporttitle{\zjuttitleEn}}
    \DeclareRobustCommand{\zjutInternshipTitle}[1]{\renewcommand{\zjutInternshipTitle}{#1}}
\fi

%% End of file `zjutclass.cls'.
