%%==============================================================================
%% ntuthesis.cls  —  Unofficial LaTeX class for National Taiwan University (NTU)
%% master's theses and doctoral dissertations. 國立臺灣大學碩、博士學位論文範本。
%%
%% Implements the university-wide format regulation
%%   《國立臺灣大學碩、博士學位論文格式規範》(112.10.20 / 2023-10-20, current)
%% Works for ANY college / department — set everything via \ntusetup{...}.
%%
%% Engine: XeLaTeX only (uses xeCJK + fontspec). Compile: latexmk -xelatex.
%% License: MIT. This is an unofficial template; verify against the library's
%% latest rules before submission: https://www.lib.ntu.edu.tw/node/103
%%==============================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ntuthesis}[2026/07/20 v1.0 Unofficial NTU thesis class]

%------------------------------------------------------------------------------
% Class options
%   degree : master (default) | doctor   (also settable via \ntusetup{degree=...})
%   side   : oneside (default) | twoside  (regulation: <=80pp may be single-sided)
%------------------------------------------------------------------------------
\newif\ifntu@doctor \ntu@doctorfalse
\DeclareOption{master}{\ntu@doctorfalse}
\DeclareOption{doctor}{\ntu@doctortrue}
\DeclareOption{oneside}{\PassOptionsToClass{oneside}{report}}
\DeclareOption{twoside}{\PassOptionsToClass{twoside}{report}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ExecuteOptions{oneside}
\ProcessOptions\relax
\LoadClass[12pt,a4paper]{report}

%------------------------------------------------------------------------------
% Packages
%------------------------------------------------------------------------------
\RequirePackage{fontspec}
\RequirePackage{xeCJK}
\RequirePackage[top=3cm,bottom=2cm,left=3cm,right=3cm,includehead,includefoot]{geometry}
\RequirePackage{setspace}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{graphicx}
\RequirePackage{adjustbox}   % shrink-to-fit book spine
\RequirePackage{caption}
\RequirePackage{booktabs}
\RequirePackage{array}
\RequirePackage{ragged2e}
\RequirePackage{keyval}
\RequirePackage[hidelinks]{hyperref}

%------------------------------------------------------------------------------
% Fonts (regulation §10: Chinese 12pt Kai 楷書, English 12pt Times New Roman).
% Auto-detects real system fonts and falls back to faces bundled with TeX Live
% / Overleaf, so the template compiles anywhere. Override in \ntusetup or the
% preamble with \setmainfont / \setCJKmainfont if you want exact fonts.
%------------------------------------------------------------------------------
\IfFontExistsTF{Times New Roman}{\setmainfont{Times New Roman}}{\setmainfont{TeX Gyre Termes}}
\IfFontExistsTF{BiauKai}{\setCJKmainfont{BiauKai}}{%
  \IfFontExistsTF{TW-Kai}{\setCJKmainfont{TW-Kai}}{%
    \IfFontExistsTF{AR PL UKai TW}{\setCJKmainfont{AR PL UKai TW}}{%
      \IfFontExistsTF{FandolKai}{\setCJKmainfont{FandolKai}}{%
        \setCJKmainfont{WenQuanYi Zen Hei}}}}}
\IfFontExistsTF{BiauKai}{\newCJKfontfamily\ntukai{BiauKai}}{%
  \IfFontExistsTF{TW-Kai}{\newCJKfontfamily\ntukai{TW-Kai}}{%
    \IfFontExistsTF{AR PL UKai TW}{\newCJKfontfamily\ntukai{AR PL UKai TW}}{%
      \IfFontExistsTF{FandolKai}{\newCJKfontfamily\ntukai{FandolKai}}{\let\ntukai\relax}}}}

\XeTeXlinebreaklocale "zh"
\XeTeXlinebreakskip = 0pt plus 1pt
\linespread{1.5}   % regulation §10: Chinese 1.5 line spacing

%------------------------------------------------------------------------------
% Metadata — defaults are demonstrative placeholders; set real values via
% \ntusetup{ key = value, ... } (see main.tex).
%------------------------------------------------------------------------------
\def\ntu@collegeCH{○○學院}          \def\ntu@collegeEN{College of \dots}
\def\ntu@deptCH{○○系（所、學位學程）} \def\ntu@deptEN{Department / Graduate Institute of \dots}
\def\ntu@titleCH{論文中文題目}         \def\ntu@titleEN{English Title of the Thesis}
\def\ntu@authorCH{撰者中文姓名}        \def\ntu@authorEN{Author English Name}
\def\ntu@studentID{RXXXXXXXX}
\def\ntu@advisorCH{指導教授姓名}       \def\ntu@advisorEN{Advisor Name}
\def\ntu@advisortitleCH{博士}         \def\ntu@advisortitleEN{Ph.D.}
\def\ntu@coadvisorCH{}               \def\ntu@coadvisorEN{}
\def\ntu@dateCH{中華民國一一五年七月}    \def\ntu@dateEN{July 2026}
\def\ntu@examdateCH{一一五年七月一日}    \def\ntu@examdateEN{July 1, 2026}
\def\ntu@keywordsCH{}                \def\ntu@keywordsEN{}

\def\ntu@doctorstr{doctor}
\define@key{ntu}{degree}{\def\ntu@tmp{#1}\ifx\ntu@tmp\ntu@doctorstr\ntu@doctortrue\else\ntu@doctorfalse\fi}
\define@key{ntu}{collegeCH}{\def\ntu@collegeCH{#1}}
\define@key{ntu}{collegeEN}{\def\ntu@collegeEN{#1}}
\define@key{ntu}{deptCH}{\def\ntu@deptCH{#1}}
\define@key{ntu}{deptEN}{\def\ntu@deptEN{#1}}
\define@key{ntu}{titleCH}{\def\ntu@titleCH{#1}}
\define@key{ntu}{titleEN}{\def\ntu@titleEN{#1}}
\define@key{ntu}{authorCH}{\def\ntu@authorCH{#1}}
\define@key{ntu}{authorEN}{\def\ntu@authorEN{#1}}
\define@key{ntu}{studentID}{\def\ntu@studentID{#1}}
\define@key{ntu}{advisorCH}{\def\ntu@advisorCH{#1}}
\define@key{ntu}{advisorEN}{\def\ntu@advisorEN{#1}}
\define@key{ntu}{advisortitleCH}{\def\ntu@advisortitleCH{#1}}
\define@key{ntu}{advisortitleEN}{\def\ntu@advisortitleEN{#1}}
\define@key{ntu}{coadvisorCH}{\def\ntu@coadvisorCH{#1}}
\define@key{ntu}{coadvisorEN}{\def\ntu@coadvisorEN{#1}}
\define@key{ntu}{dateCH}{\def\ntu@dateCH{#1}}
\define@key{ntu}{dateEN}{\def\ntu@dateEN{#1}}
\define@key{ntu}{examdateCH}{\def\ntu@examdateCH{#1}}
\define@key{ntu}{examdateEN}{\def\ntu@examdateEN{#1}}
\define@key{ntu}{keywordsCH}{\def\ntu@keywordsCH{#1}}
\define@key{ntu}{keywordsEN}{\def\ntu@keywordsEN{#1}}
% Single centralised configuration command.
\newcommand{\ntusetup}[1]{\setkeys{ntu}{#1}}

% Degree label helpers (evaluated at use-time so \ntusetup{degree=...} works).
\newcommand{\ntu@degreeCH}{\ifntu@doctor 博士論文\else 碩士論文\fi}
\newcommand{\ntu@degreeEN}{\ifntu@doctor Doctoral Dissertation\else Master's Thesis\fi}

%------------------------------------------------------------------------------
% Page numbering (regulation §10: page number centred at the foot).
% cover/spine/certificate: hidden Alph namespace (avoids hyperref anchor
% clashes) · front matter: roman · body: arabic.
%------------------------------------------------------------------------------
\fancypagestyle{ntufoot}{\fancyhf{}\renewcommand{\headrulewidth}{0pt}\fancyfoot[C]{\thepage}}
\pagestyle{ntufoot}
\setlength{\headheight}{15pt}
\renewcommand{\ps@plain}{\ps@fancy\fancyhf{}\renewcommand{\headrulewidth}{0pt}\fancyfoot[C]{\thepage}}
\AtBeginDocument{\pagenumbering{Alph}}
\newcommand{\frontmatter}{\clearpage\pagenumbering{roman}\pagestyle{ntufoot}}
\newcommand{\mainmatter}{\clearpage\pagenumbering{arabic}\pagestyle{ntufoot}}

%------------------------------------------------------------------------------
% Cover / title page (regulation 附件1–2): all lines centred, top margin 4cm,
% specified point sizes with 1.5× leading; Chinese in Kai, English in Times.
%------------------------------------------------------------------------------
\newcommand{\ntu@sz}[2]{\fontsize{#1}{#2}\selectfont}
\newcommand{\maketitlepage}{%
  \clearpage\thispagestyle{empty}%
  \begingroup
    \newgeometry{top=4cm,bottom=3cm,left=3cm,right=3cm}%
    \centering\singlespacing
    {\ntukai\ntu@sz{18}{27}國立臺灣大學\ntu@collegeCH\ntu@deptCH\par}
    {\ntukai\ntu@sz{18}{27}\ntu@degreeCH\par}
    \vspace{6pt}
    {\ntu@sz{14}{21}\ntu@deptEN\par}
    {\ntu@sz{14}{21}\ntu@collegeEN\par}
    {\ntu@sz{16}{24}National Taiwan University\par}
    {\ntu@sz{16}{24}\ntu@degreeEN\par}
    \vfill
    {\ntukai\ntu@sz{18}{27}\ntu@titleCH\par}
    \vspace{10pt}
    {\ntu@sz{18}{27}\ntu@titleEN\par}
    \vfill
    {\ntukai\ntu@sz{18}{27}\ntu@authorCH\par}
    {\ntu@sz{18}{27}\ntu@authorEN\par}
    \vfill
    {\ntukai\ntu@sz{18}{27}指導教授：\ntu@advisorCH\ \ntu@advisortitleCH\par}
    {\ntu@sz{18}{27}Advisor: \ntu@advisorEN, \ntu@advisortitleEN\par}
    \ifx\ntu@coadvisorCH\empty\else
      {\ntukai\ntu@sz{18}{27}共同指導教授：\ntu@coadvisorCH\par}
      {\ntu@sz{18}{27}Co-advisor: \ntu@coadvisorEN\par}
    \fi
    \vfill
    {\ntukai\ntu@sz{18}{27}\ntu@dateCH\par}
    {\ntu@sz{18}{27}\ntu@dateEN\par}
    \restoregeometry
  \endgroup
  \clearpage\linespread{1.5}\normalsize
}

%------------------------------------------------------------------------------
% Book spine / 書背（側邊）— regulation §2. 校名、系所、學位、論文中文題目、
% 撰者姓名、提出年月, set vertically and auto-shrunk to fit \spineheight.
% Callable standalone (see bookspine.tex) or inside the thesis after the cover.
%------------------------------------------------------------------------------
\newlength{\spineheight}\setlength{\spineheight}{25cm}
\newcommand{\makespine}{%
  \clearpage\thispagestyle{empty}%
  \begingroup
    \newgeometry{margin=1cm}%
    \null\vfill
    \begin{center}\singlespacing
    \fbox{\rotatebox{-90}{\adjustbox{max width=\spineheight}{%
      \ntukai\fontsize{12}{18}\selectfont
      國立臺灣大學\,\ntu@deptCH\quad \ntu@degreeCH\quad
      {\fontsize{14}{21}\selectfont \ntu@titleCH}\quad
      \ntu@authorCH\ 撰\quad \ntu@dateCH}}}%
    \end{center}
    \vfill
    \restoregeometry
  \endgroup
  \clearpage\linespread{1.5}\normalsize
}

%------------------------------------------------------------------------------
% Oral examination committee acceptance certificate (regulation 附件3).
% Replaced by a scanned signed copy before submission; here for completeness.
%------------------------------------------------------------------------------
\newcommand{\makecertificate}{%
  \clearpage\thispagestyle{empty}%
  \begin{center}\singlespacing
    {\ntukai\ntu@sz{18}{27}國立臺灣大學\ifntu@doctor 博士\else 碩士\fi 學位論文\par}
    {\ntukai\ntu@sz{18}{27}口試委員會審定書\par}\vspace{6pt}
    {\ntu@sz{14}{21}\ifntu@doctor DOCTORAL DISSERTATION\else MASTER'S THESIS\fi\ ACCEPTANCE CERTIFICATE\par}
    {\ntu@sz{14}{21}NATIONAL TAIWAN UNIVERSITY\par}
  \end{center}
  \vspace{1.2em}
  \begin{center}
    {\ntukai\ntu@sz{14}{21}\ntu@titleCH\par}\vspace{0.6em}
    {\ntu@sz{14}{21}\ntu@titleEN\par}
  \end{center}
  \vspace{1.2em}
  \noindent\ntukai
  本論文係\underline{\ \ntu@authorCH\ }（\underline{\ \ntu@studentID\ }）在國立臺灣大學\underline{\ \ntu@deptCH\ }%
  完成之\ifntu@doctor 博士\else 碩士\fi 學位論文，於民國\underline{\ \ntu@examdateCH\ }%
  承下列考試委員審查通過及口試及格，特此證明。
  \vspace{1em}

  \noindent The undersigned, appointed by the \ntu@deptEN\ on \ntu@examdateEN, have examined a
  \ifntu@doctor doctoral dissertation\else master's thesis\fi\ entitled above presented by
  \ntu@authorEN\ (\ntu@studentID) and hereby certify that it is worthy of acceptance.
  \vspace{2.5em}

  \noindent 口試委員 Oral examination committee:
  \vspace{3em}

  \noindent\hfill\rule{5cm}{0.4pt}\hfill\rule{5cm}{0.4pt}\hfill\null
  \vspace{0.4em}

  \noindent\hspace*{1.2cm}（指導教授 Advisor）\hfill\null
  \vspace{3em}

  \noindent\hfill\rule{5cm}{0.4pt}\hfill\rule{5cm}{0.4pt}\hfill\null
  \vspace{3em}

  \begin{flushright}系主任／所長 Director:\ \rule{5cm}{0.4pt}\end{flushright}
  \linespread{1.5}\normalsize
}

%------------------------------------------------------------------------------
% Front-matter environments.
%------------------------------------------------------------------------------
% \chapter* 不呼叫 \refstepcounter，因此不會建立 hyperref 錨點；若直接
% \addcontentsline，目次連結會沿用「上一個」錨點而整整早一頁。必須在
% \chapter* 之後（已換頁）、\addcontentsline 之前插入 \phantomsection。
\newcommand{\ntu@tocentry}[1]{\phantomsection\addcontentsline{toc}{chapter}{#1}}
\newenvironment{acknowledgements}{\chapter*{誌\hspace{1em}謝}\ntu@tocentry{誌謝}}{\clearpage}
\newenvironment{abstractCH}{\chapter*{摘\hspace{1em}要}\ntu@tocentry{中文摘要}}{%
  \ifx\ntu@keywordsCH\empty\else\par\vspace{1em}\noindent\textbf{關鍵詞：}\ntu@keywordsCH\fi\clearpage}
\newenvironment{abstractEN}{\chapter*{Abstract}\ntu@tocentry{Abstract}}{%
  \ifx\ntu@keywordsEN\empty\else\par\vspace{1em}\noindent\textbf{Keywords:}\ \ntu@keywordsEN\fi\clearpage}
\newenvironment{denotation}[1][2.5cm]{%
  \chapter*{符號說明}\ntu@tocentry{符號說明}%
  \begin{list}{}{\setlength{\labelwidth}{#1}\setlength{\labelsep}{0.5em}\setlength{\itemindent}{0pt}%
    \setlength{\leftmargin}{\labelwidth}\addtolength{\leftmargin}{\labelsep}\setlength{\rightmargin}{0pt}%
    \renewcommand{\makelabel}[1]{##1\hfil}}}{\end{list}\clearpage}

%------------------------------------------------------------------------------
% Contents / figures / tables.
%------------------------------------------------------------------------------
\renewcommand{\contentsname}{目\hspace{1em}次}
\renewcommand{\listfigurename}{圖\hspace{1em}次}
\renewcommand{\listtablename}{表\hspace{1em}次}
\renewcommand{\bibname}{參考文獻}
\renewcommand{\appendixname}{附錄}
% \addcontentsline 必須在 \listoffigures 之「前」且已換頁後才呼叫：
% 寫在後面時記錄的是清單最後一頁，圖次一旦超過一頁連結就會指錯。
\newcommand{\maketoc}{%
  \singlespacing
  \clearpage\pdfbookmark[0]{目次}{ntu@toc}%   目次本身也要有 PDF 書籤
  \tableofcontents\clearpage
  \ntu@tocentry{圖次}\listoffigures\clearpage
  \ntu@tocentry{表次}\listoftables\clearpage
  \linespread{1.5}\normalsize}

% 參考文獻同樣需要自己的錨點，否則會沿用最後一章的錨點。
\newcommand{\makebibheading}{\clearpage\phantomsection}

\endinput
