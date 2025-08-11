\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{edison_template}[2024/07/25 Literature Review Class]

%======================================================================
% 0. 选项与公共命令
%======================================================================
\RequirePackage{kvoptions}
\SetupKeyvalOptions{family=edison,prefix=edison@}
\DeclareStringOption[浙江大学电气工程学院爱迪生班科研训练]{lefthead}
\DeclareStringOption[\@title]{righthead}
\DeclareBoolOption[false]{colorlinks}
\DeclareBoolOption[false]{unimath}
\ProcessKeyvalOptions*

% 标题与章节大字样
\renewcommand{\title}[1]{\def\@title{#1}}
\newcommand{\LargeSection}[1]{\clearpage\begin{center}\zihao{3}\bfseries #1 \end{center}}
\newcommand{\blankpage}{\clearpage\null\clearpage}

%======================================================================
% 1. 基类与页面设置
%======================================================================
\LoadClass[twoside]{article}

\RequirePackage{geometry}
\geometry{
  top=3.0cm,
  bottom=2.94cm,
  left=3.17cm,
  right=3.17cm,
  bindingoffset=0cm
}

%======================================================================
% 2. 字体与行距
%======================================================================
\RequirePackage[heading=true,zihao=-4]{ctex}
\RequirePackage{iftex}
\ifPDFTeX
  \PackageError{edison_template}{请使用 XeLaTeX 或 LuaLaTeX 编译}{本模板依赖 ctex + fontspec。}
\fi
\RequirePackage{fontspec}

% 中文与西文字体（保持你原有设定）
\setCJKmainfont{FangSong}[AutoFakeBold=3.0]
\setmainfont{Times New Roman}

% 行距
\RequirePackage{setspace}
\setstretch{1.5}

%======================================================================
% 3. 目录格式
%======================================================================
\RequirePackage{tocloft}
\renewcommand{\cftdotsep}{0.5}
\renewcommand{\cftsecfont}{\bfseries}
\renewcommand{\cftsecpagefont}{\bfseries}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftsubsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftsubsubsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftsecindent}{0em}
\renewcommand{\cftsubsecindent}{0.39cm}
\renewcommand{\cftsubsubsecindent}{0.78cm}
\renewcommand\contentsname{\LargeSection{目\quad 录}}

%======================================================================
% 4. 图表标题与表格字体钩子
%======================================================================
\RequirePackage{caption}
\RequirePackage{subcaption}

\setCJKfamilyfont{song}[AutoFakeBold=2.5]{SimSun}
\newcommand{\bfsong}{\CJKfamily{song}\bfseries\zihao{5}\selectfont}

% Caption 使用 CJK 宋体加粗小五
\DeclareCaptionFont{CJKcap}{\bfsong}
\captionsetup{
  labelfont={CJKcap},
  textfont={CJKcap},
  labelsep=space
}
\captionsetup[sub]{labelfont={CJKcap}, textfont={CJKcap}}

% 表格进入钩子（可开关）
\newif\ifSongTable
\SongTabletrue % 默认开启
\AddToHook{env/tabular/begin}{\ifSongTable\CJKfamily{song}\zihao{5}\selectfont\fi}
\AddToHook{env/tabular*/begin}{\ifSongTable\CJKfamily{song}\zihao{5}\selectfont\fi}

%======================================================================
% 5. 编号、浮动体与分节
%======================================================================
\RequirePackage{chngcntr}
\counterwithin{figure}{section}
\counterwithin{table}{section}
\renewcommand{\theequation}{\thesection-\arabic{equation}}

\RequirePackage{placeins}
\RequirePackage{etoolbox}
\preto\section{\FloatBarrier}

%======================================================================
% 6. 参考文献
%======================================================================
\RequirePackage[
  style=gb7714-2015,
  backend=biber,
  gbfootbib=true,
  gbalign=gb7714-2015,
  url=false,
  doi=false
]{biblatex}

\renewcommand*{\bibfont}{\songti\zihao{5}\selectfont}
\setlength{\bibitemsep}{0pt}
\setlength{\bibhang}{0.74cm}
\defbibheading{bibliography}[\bibname]{\LargeSection{#1}}

% 学位论文类型去 URL/urldate
\DeclareSourcemap{
  \maps[datatype=bibtex]{
    \map{
      \pertype{thesis}
      \step[fieldset=url, null]
      \step[fieldset=urldate, null]
    }
  }
}

%======================================================================
% 7. 页眉页脚
%======================================================================
\RequirePackage{fancyhdr}
\fancypagestyle{plain}{
  \fancyhf{}
  \fancyhead[RO]{\zihao{-5}\songti \edison@righthead}
  \fancyhead[LE]{\zihao{-5}\songti \edison@lefthead}
  \fancyfoot[C]{\zihao{-5}\thepage}
  \renewcommand{\headrulewidth}{1.0pt}
  \renewcommand{\footrulewidth}{0pt}
}

%======================================================================
% 8. 标题样式
%======================================================================
\RequirePackage{titlesec}
\titleformat{\section}{\zihao{3}\bfseries}{\thesection}{1em}{}
\titlespacing{\section}{0pt}{10pt}{10pt}
\titleformat{\subsection}{\zihao{-3}\bfseries}{\thesubsection}{1em}{}
\titlespacing{\subsection}{0pt}{10pt}{10pt}
\titleformat{\subsubsection}{\zihao{4}\bfseries}{\thesubsubsection}{1em}{}
\titlespacing{\subsubsection}{0pt}{.5\baselineskip}{.5\baselineskip}
\newcommand{\sectionbreak}{\clearpage}

%======================================================================
% 9. 常用宏包
%======================================================================
\RequirePackage{graphicx}
\RequirePackage{pdfpages}
\RequirePackage{enumerate}
\RequirePackage{booktabs}
\RequirePackage{multicol}
\RequirePackage{multirow}
\RequirePackage{afterpage}
\RequirePackage{float}
\RequirePackage{physics}
\RequirePackage{siunitx}
\RequirePackage{eso-pic}
\RequirePackage{diagbox}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{mathtools}
\RequirePackage{microtype}

%======================================================================
% 10. 超链接与引用
%======================================================================
\RequirePackage{hyperref}
\ifedison@colorlinks
  \hypersetup{colorlinks=true, linkcolor=blue, citecolor=blue, urlcolor=blue}
\else
  \hypersetup{hidelinks}
\fi

\RequirePackage[nameinlink]{cleveref}
\crefname{figure}{图}{图}
\Crefname{figure}{图}{图}
\crefname{table}{表}{表}
\Crefname{table}{表}{表}
\crefname{equation}{公式}{公式}
\Crefname{equation}{公式}{公式}

%======================================================================
% 11. 用户信息命令
%======================================================================
\newcommand{\stuname}[1]{\def\@stuname{#1}}
\newcommand{\stuid}[1]{\def\@stuid{#1}}
\newcommand{\teacher}[1]{\def\@teacher{#1}}
\newcommand{\grade}[1]{\def\@grade{#1}}
\newcommand{\major}[1]{\def\@major{#1}}
\newcommand{\college}[1]{\def\@college{#1}}

%======================================================================
% 12. 表格列类型
%======================================================================
\RequirePackage{array}
\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}}

%======================================================================
% 13. 封面与尾页
%======================================================================
\newcommand{\maketitlepage}{
  \pagestyle{empty}
  \begin{center}
    \null
    \vspace{0.8cm}
    \includegraphics[width=0.7\textwidth]{images/zju-heading.png} \\
    {\CJKfontspec{SimHei}[AutoFakeBold=3.0]\bfseries\zihao{-1}
      电气工程学院爱迪生班科研训练 \\[1.5em]
      中期报告}
    \\[3.0em]
    \includegraphics[width=0.2\textwidth]{images/zju.png} \\[2.0em]
    {\zihao{3}\bfseries \underline{\@title} \\[2.0em]
      \renewcommand{\arraystretch}{1.3}
      \setCJKfamilyfont{fangsong}[AutoFakeBold=2.5]{FangSong}
      \CJKfamily{fangsong}
      \setlength{\arrayrulewidth}{1.0pt}
      % —— 关闭表格钩子，避免被统一宋体小五影响 ——
      \SongTablefalse
      \begin{tabular}{lC{8.5cm}}
        姓名与学号 & \@stuname \hspace{1em} \@stuid \\ \cline{2-2}
        指导教师   & \@teacher \\ \cline{2-2}
        年级与专业 & \@grade \hspace{1em} \@major \\ \cline{2-2}
        所在学院   & \@college \\ \cline{2-2}
      \end{tabular}
      \SongTabletrue
    }
  \end{center}
  \blankpage
}

\newcommand{\maketailpage}{
  \pagestyle{empty}
  \null
  \vspace{-2cm}
  \bfseries
  \begin{center}
    \zihao{-2}
    浙江大学电气工程学院 \\
    爱迪生班科研训练中期报告考核表 \\[1.6em]
  \end{center}

  {
    \zihao{4}\noindent 对中期报告评语及成绩评定 \\[2.0em]
    \renewcommand{\arraystretch}{1.15}
    % —— 关闭表格钩子 ——
    \SongTablefalse
    \begin{tabular}{|l|p{3.5cm}|}
      \hline
      学~生~学~号 &  \\
      \hline
      中期报告成绩 &  \\
      \hline
    \end{tabular}
    \SongTabletrue
  }

  \zihao{-4}\vspace{10.5\baselineskip}
  \begin{flushright}
    指导教师（签名）\underline{\hspace{3.5cm}}\\
    \hspace{0.7cm} 年 \hspace{0.7cm} 月 \hspace{0.7cm} 日 \\
  \end{flushright}
}

%======================================================================
% 14. 子文件
%======================================================================
\RequirePackage{subfiles}

%======================================================================
% 15. 其他辅助
%======================================================================
\newcommand{\EdisonLeftHead}[1]{\renewcommand{\edison@lefthead}{#1}}
\newcommand{\EdisonRightHead}[1]{\renewcommand{\edison@righthead}{#1}}

\AtBeginDocument{\RenewCommandCopy\qty\SI}
\ExplSyntaxOn
\msg_redirect_name:nnn { siunitx } { physics-pkg } { none }
\ExplSyntaxOff

\endinput
