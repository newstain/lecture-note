\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sybook}[2023/04/12 physical note]

\LoadClass[onecolumn,12pt,a4paper]{book}

\linespread{1.3}  % 默认字体10pt，单倍行距，为方便显示这里改为1.3倍行距

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%% 参考文献 %%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% \RequirePackage[sectionbib]{chapterbib}
\RequirePackage[numbers,square,sort&compress,sectionbib]{natbib}
% \setcitestyle{numbers,square}
\RequirePackage{chapterbib}
% \RequirePackage[backend=biber,url=false,doi=false]{biblatex}

\RequirePackage{xcolor}
\definecolor{black}{RGB}{0,0,0}
\definecolor{gray}{RGB}{243,243,244}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%% 页面设置 %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% \RequirePackage{showframe}  % 显示页面框架
\RequirePackage{geometry}   % 设置页面
\geometry{
    a4paper,
    top=18mm, bottom=18mm,
    left=16mm,  right=16mm,
    headheight=12.7pt,
    headsep=4mm,
    includehead,
    includefoot
    % footskip=12mm
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%% 页眉页脚设置 %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{fancyhdr}                   % fancyhdr宏包，页眉和页脚的相关定义
\pagestyle{fancy}                           % 页面样式设置为 fancy
\fancyhf{}                                  % 清除原页眉页脚样式

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%% 超链接 %%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{url,hyperref}
\hypersetup{colorlinks=true, linkcolor=black,citecolor=black} % 去掉目录红框

% 设置页眉
\fancyhead[RO]{\leftmark}                   % R：页面右边；O：奇数页；\leftmark：表示“一级标题”
\fancyhead[LE]{\rightmark}                  % L：页面左边；E：偶数页；\rightmark：表示“二级标题”
\fancyhead[LO, RE]{Southwest University}    % L：页面左边；E：偶数页；\rightmark：表示“二级标题”

% 设置页脚，页眉的位置上也可以放置页码
\fancyfoot[CO, CE]{\thepage}
\fancyfoot[LO, RE]{SY-Chen}
\fancyfoot[RO, LE]{sychenphy@163.com}
\let\cleardoublepage\clearpage

% 设置页眉页脚横线及样式
\renewcommand{\headrulewidth}{0.5mm}        %页眉线宽，设为0可以去页眉线
\renewcommand{\footrulewidth}{0.5mm}        %页脚线宽，设为0可以去页眉线


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%% 数学模式 %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{amsmath, amssymb, bm, empheq, bookman, mathfont}  % 数学模式
\RequirePackage{units}
\RequirePackage[framemethod=tikz]{mdframed}
\RequirePackage{enumitem}
\RequirePackage{slashed, mathtools, cancel, wrapfig}
\RequirePackage[mathscr]{euscript}
\RequirePackage{extarrows}
\RequirePackage{simpler-wick}
\AddEnumerateCounter{\chinese}{\chinese}{}

% Dirac symbols
\RequirePackage{braket}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%% 引用 %%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{cleveref}
\crefname{equation}{Eq.}{Eq.}
\crefname{figure}{Fig.}{Fig.}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%% 定义、定理、例子的设置 %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{amsthm}                     % 证明、定理环境等所需要的宏包

\newcommand*\mymathbox[1]{\fcolorbox{black}{gray}{\hspace{1em}#1\hspace{0em}}}

% 自定义环境 用于 定理和定义
\newtheoremstyle{defstyle}                      % 名字
                {3pt}{3pt}                      % 距文字的上、下垂直距离
                {\normalfont}                   % 主体字体
                {0pt}                           % 定理头 缩进量
                {\sffamily\bfseries}            % 定理头字体
                {}                              % 定理头后标点符号
                {0mm}                           % 定理头后的空间
                {                               % 定理头规范，可以为空，表示normal
                    {\color{black}\thmname{#1}~\thmnumber{#2}}\thmnote{\fs\,-\,#3\,}
                }%
% \newtheoremstyle{exmstyle}                      % 名字
%                 {0pt}{0pt}                      % 距文字的上、下垂直距离
%                 {\normalfont}                   % 主体字体
%                 {0pt}                           % 定理头 缩进量
%                 {\sffamily\bfseries}            % 定理头字体
%                 {}                              % 定理头后标点符号
%                 {0mm}                           % 定理头后的空间
%                 {                               % 定理头规范，可以为空，表示normal
%                     {\color{black}\thmname{#1}~\thmnumber{#2}}
%                 }%

\theoremstyle{defstyle} \newmdtheoremenv[
                                            backgroundcolor=gray,
                                            linecolor=black,
                                            % leftmargin=0pt,
                                            % innerleftmargin=1pt,
                                            % innerrightmargin=1pt,
                                        ]
                                        {definition}
                                        {\noindent\bf 定义}
                                        [chapter]

\theoremstyle{defstyle} \newmdtheoremenv[
                                            backgroundcolor=gray,
                                            linecolor=black,
                                            leftmargin=0pt,
                                            innerleftmargin=1pt,
                                            innerrightmargin=1pt,
                                        ]
                                        {theorem}
                                        {\noindent\bf 定理}
                                        [chapter]

\theoremstyle{definition} \newtheorem{example}
                                    {\noindent\bf 例}
                                    [chapter]
\renewenvironment*{proof}
                {{\par\noindent\bf Proof:\,}}
                {\hfill $\square$\par}

\newenvironment*{note}
                {%开始部分定义
                    \par\noindent
                    \color{blue}{\S Note:}
                }
                {\par}%结束部分定义

%% Exercise with counter
\newcounter{exer}[chapter]
\setcounter{exer}{0}
\renewcommand{\theexer}{\thechapter.\arabic{exer}}
\newenvironment{exercise}[1][]
               {
                \refstepcounter{exer}
                \par\noindent\makebox[-3pt][r]
                {\quad}
                \textbf{Exercise. \theexer\ (\textcolor{blue}{#1}) }\rmfamily
               }
               {\par\ignorespacesafterend}

\newenvironment{exercise*}[1][]
               {
                \par\noindent\makebox[-3pt][r]
                {\quad}
                \textbf{Exercise.\ #1 }\rmfamily
               }
               {\par\ignorespacesafterend}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%   文字   %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
\RequirePackage[UTF8, fontset=none]{ctex}    % 使用汉字
\xeCJKsetup{AutoFakeBold=true}

\setCJKfamilyfont{msyh}{Microsoft YaHei}          % 微软雅黑 msyh
\setCJKfamilyfont{tnr}{Times New Roman}
\setCJKfamilyfont{fs}{NSimSun}                    % 新宋体
\setCJKfamilyfont{song}{SimSun}                   % 宋体 song
\setCJKfamilyfont{hei}{SimHei}                    % 黑体  hei
\setCJKfamilyfont{hwxh}{STXihei}                  % 华文细黑  hwxh

\newcommand*{\song}{\CJKfamily{song}}
\newcommand*{\tnr}{\CJKfamily{tnr}}                     
\newcommand*{\fs}{\CJKfamily{fs}}                            
\newcommand*{\msyh}{\CJKfamily{yh}}  
\newcommand*{\hei}{\CJKfamily{hei}}     
\newcommand*{\hwxh}{\CJKfamily{hwxh}}

\setmainfont{Times New Roman}                       % 全局英文字体
\setCJKmainfont[ItalicFont={KaiTi}]{SimSun}         % 全局中文字体
\setCJKmonofont{NSimSun}
\setCJKsansfont{SimHei}


\RequirePackage{CJKfntef}

% \RequirePackage{mathpazo}
% \RequirePackage{fontspec}
% \newfontfamily\jbmr{JetBrainsMono Regular}


\RequirePackage{ulem}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%   代码   %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{listings}

\newfontfamily\jbmr{JetBrains Mono Regular}

\definecolor{commentColor}{RGB}{53,129,34}
\definecolor{keywordColor}{RGB}{172, 62, 158}
\definecolor{stringColor}{RGB}{194, 62, 42}
\definecolor{preprocessorColor}{RGB}{114, 75, 48}
\definecolor{characterColor}{RGB}{31, 53, 207}
\definecolor{numberColor}{RGB}{166, 166, 166}
\definecolor{oglobalColor}{RGB}{97, 64, 154}
\definecolor{globalColor}{RGB}{89, 127, 134}
\definecolor{functionColor}{RGB}{56,36,124}

\lstdefinestyle{styleC}{
    language=C++,
    backgroundcolor=\color{gray},
    basicstyle=\jbmr,
    keywordstyle=\color{keywordColor}\jbmr,
    commentstyle=\color{commentColor}\jbmr,
    stringstyle=\color{stringColor}\jbmr,
    showstringspaces=false,
    columns=fullflexible,keepspaces,
    numbers=left,                                       % 代码左侧显示行号
    numberstyle=\color{numberColor}\footnotesize\jbmr,
    escapechar='',
    % morecomment=*[s][\color{stringColor}\sffamily\jbmr]{<}{>},
    morecomment=[s][\color{characterColor}\sffamily\jbmr]{'}{'},
    keywords=[2]{std, cout, cin},
    keywordstyle = [2]{\color{oglobalColor}\jbmr},
    keywords=[3]{endl, printf, scanf, setw, setfill, setbase, setprecision, time, ctime, rand},
    keywordstyle = [3]{\color{functionColor}\jbmr},
    keywords=[4]{\#include},
    keywordstyle =[4]{\color{preprocessorColor}\jbmr},
    literate={
        {<<}{{{\color{black}<<}}}1
        {>>}{{{\color{black}>>}}}1
        {*}{{{*}}}1
        {0}{{{\color{characterColor}0}}}1
        {1}{{{\color{characterColor}1}}}1
        {2}{{{\color{characterColor}2}}}1
        {3}{{{\color{characterColor}3}}}1
        {4}{{{\color{characterColor}4}}}1
        {5}{{{\color{characterColor}5}}}1
        {6}{{{\color{characterColor}6}}}1
        {7}{{{\color{characterColor}7}}}1
        {8}{{{\color{characterColor}8}}}1
        {9}{{{\color{characterColor}9}}}1
    },
    tabsize=4
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%   图形   %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{tikz} %% load tikz without tikz
\usetikzlibrary{backgrounds,calc,shadows,positioning,fit,shapes.geometric
                ,arrows.meta,angles,quotes}

% \RequirePackage{transparent}
\RequirePackage{graphicx, float, subfig}
\graphicspath{
              {./figure/}{./figure/math/}{./figure/symbols/}
              {./figure/electrodynamics}
              {./figure/nuclear}
              {./classical-mechanics}
             }


%%%%%  my newcommand %%%%%%
\newcommand{\inkfig}[2]{\def\svgwidth{\columnwidth}
                        \scalebox{#1}{\input{#2}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%% 章节设置 %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{titlesec}
\RequirePackage[title,titletoc,header]{appendix}
\renewcommand{\appendixname}{Appendix}


\titleformat{\chapter}                              %定义标题类型和标题样式，字体
            [hang]
            {\centering \hei \LARGE \bfseries}    %定义标题格式:字号（大小），加粗，斜体
            {                                     %定义标题的标签，即标题的标号等 
                \bfseries\filcenter\LARGE\enspace \chaptertitlename{} \thechapter \enspace
            }
            {8pt}                                   %定义标题和标号之间的水平距离
            {}                                      %定义标题前的内容
            []                                      %定义标题后的内容

\titleformat{\section}
            [hang]
            {\normalfont\hei\Large\bfseries}
            {\thesection}
            {4pt}
            {}
            []

\titleformat{\subsection}
            [hang]
            {\hei\bfseries}
            {\thesubsection}
            {4pt}
            {}
            []

\titleformat{\subsubsection}
            [hang]
            {\hei\bfseries}
            {\thesubsubsection}
            {4pt}
            {}
            []

\titleformat{\paragraph}
            [hang]
            {\bf\bfseries}
            {}
            {0pt}
            {}
            []

\titlespacing{\chapter}{0pt}{-20pt}{1.3\baselineskip}
\titlespacing{\paragraph}{0pt}{8.0\lineskip}{\lineskip}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%% 章节引用 %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%
%%%%% 自定义符号 %%%%%
%%%%%%%%%%%%%%%%%%%%%%

% Griffiths书中的 矢量间隔
\def\rcurs{{\mbox{$\resizebox{.15in}{.08in}{\includegraphics{./figure/symbols/ScriptR}}$}}}
\def\brcurs{{\mbox{$\resizebox{.15in}{.08in}{\includegraphics{./figure/symbols/BoldR}}$}}}
\def\hrcurs{{\mbox{$\hat \brcurs$}}}

\newcommand{\bSigma}{\bm{\Sigma}}

\newcommand{\balpha}{\bm{\alpha}}
\newcommand{\bsigma}{\bm{\sigma}}

\newcommand{\vbA}{\vec{\bm{A}}}
\newcommand{\vbB}{\vec{\bm{B}}}
\newcommand{\vbC}{\vec{\bm{C}}}
\newcommand{\vbD}{\vec{\bm{D}}}
\newcommand{\vbE}{\vec{\bm{E}}}
\newcommand{\vbF}{\vec{\bm{F}}}
\newcommand{\vbG}{\vec{\bm{G}}}
\newcommand{\vbH}{\vec{\bm{H}}}
\newcommand{\vbI}{\vec{\bm{I}}}
\newcommand{\vbJ}{\vec{\bm{J}}}
\newcommand{\vbK}{\vec{\bm{K}}}
\newcommand{\vbL}{\vec{\bm{L}}}
\newcommand{\vbM}{\vec{\bm{M}}}
\newcommand{\vbN}{\vec{\bm{N}}}
\newcommand{\vbO}{\vec{\bm{O}}}
\newcommand{\vbP}{\vec{\bm{P}}}
\newcommand{\vbQ}{\vec{\bm{Q}}}
\newcommand{\vbR}{\vec{\bm{R}}}
\newcommand{\vbS}{\vec{\bm{S}}}
\newcommand{\vbT}{\vec{\bm{T}}}
\newcommand{\vbU}{\vec{\bm{U}}}
\newcommand{\vbV}{\vec{\bm{V}}}
\newcommand{\vbW}{\vec{\bm{W}}}
\newcommand{\vbX}{\vec{\bm{X}}}
\newcommand{\vbY}{\vec{\bm{Y}}}
\newcommand{\vbZ}{\vec{\bm{Z}}}

\newcommand{\vba}{\vec{\bm{a}}}
\newcommand{\vbb}{\vec{\bm{b}}}
\newcommand{\vbc}{\vec{\bm{c}}}
\newcommand{\vbd}{\vec{\bm{d}}}
\newcommand{\vbe}{\vec{\bm{e}}}
\newcommand{\vbf}{\vec{\bm{f}}}
\newcommand{\vbg}{\vec{\bm{g}}}
\newcommand{\vbh}{\vec{\bm{h}}}
\newcommand{\vbi}{\vec{\bm{i}}}
\newcommand{\vbj}{\vec{\bm{j}}}
\newcommand{\vbk}{\vec{\bm{k}}}
\newcommand{\vbl}{\vec{\bm{l}}}
\newcommand{\vbm}{\vec{\bm{m}}}
\newcommand{\vbn}{\vec{\bm{n}}}
\newcommand{\vbo}{\vec{\bm{o}}}
\newcommand{\vbp}{\vec{\bm{p}}}
\newcommand{\vbq}{\vec{\bm{q}}}
\newcommand{\vbr}{\vec{\bm{r}}}
\newcommand{\vbs}{\vec{\bm{s}}}
\newcommand{\vbt}{\vec{\bm{t}}}
\newcommand{\vbu}{\vec{\bm{u}}}
\newcommand{\vbv}{\vec{\bm{v}}}
\newcommand{\vbw}{\vec{\bm{w}}}
\newcommand{\vbx}{\vec{\bm{x}}}
\newcommand{\vby}{\vec{\bm{y}}}
\newcommand{\vbz}{\vec{\bm{z}}}

\newcommand{\bmA}{\bm{A}}
\newcommand{\bmB}{\bm{B}}
\newcommand{\bmC}{\bm{C}}
\newcommand{\bmD}{\bm{D}}
\newcommand{\bmE}{\bm{E}}
\newcommand{\bmF}{\bm{F}}
\newcommand{\bmG}{\bm{G}}
\newcommand{\bmH}{\bm{H}}
\newcommand{\bmI}{\bm{I}}
\newcommand{\bmJ}{\bm{J}}
\newcommand{\bmK}{\bm{K}}
\newcommand{\bmL}{\bm{L}}
\newcommand{\bmM}{\bm{M}}
\newcommand{\bmN}{\bm{N}}
\newcommand{\bmO}{\bm{O}}
\newcommand{\bmP}{\bm{P}}
\newcommand{\bmQ}{\bm{Q}}
\newcommand{\bmR}{\bm{R}}
\newcommand{\bmS}{\bm{S}}
\newcommand{\bmT}{\bm{T}}
\newcommand{\bmU}{\bm{U}}
\newcommand{\bmV}{\bm{V}}
\newcommand{\bmW}{\bm{W}}
\newcommand{\bmX}{\bm{X}}
\newcommand{\bmY}{\bm{Y}}
\newcommand{\bmZ}{\bm{Z}}

\newcommand{\bma}{\bm{a}}
\newcommand{\bmb}{\bm{b}}
\newcommand{\bmc}{\bm{c}}
\newcommand{\bmd}{\bm{d}}
\newcommand{\bme}{\bm{e}}
\newcommand{\bmf}{\bm{f}}
\newcommand{\bmg}{\bm{g}}
\newcommand{\bmh}{\bm{h}}
\newcommand{\bmi}{\bm{i}}
\newcommand{\bmj}{\bm{j}}
\newcommand{\bmk}{\bm{k}}
\newcommand{\bml}{\bm{l}}
\newcommand{\bmm}{\bm{m}}
\newcommand{\bmn}{\bm{n}}
\newcommand{\bmo}{\bm{o}}
\newcommand{\bmp}{\bm{p}}
\newcommand{\bmq}{\bm{q}}
\newcommand{\bmr}{\bm{r}}
\newcommand{\bms}{\bm{s}}
\newcommand{\bmt}{\bm{t}}
\newcommand{\bmu}{\bm{u}}
\newcommand{\bmv}{\bm{v}}
\newcommand{\bmw}{\bm{w}}
\newcommand{\bmx}{\bm{x}}
\newcommand{\bmy}{\bm{y}}
\newcommand{\bmz}{\bm{z}}
