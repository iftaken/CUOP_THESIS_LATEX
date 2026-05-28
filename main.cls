% ============================================================
% 心河大学学位论文 LaTeX 文档类模板
% ============================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{main}[2026/03/11 v1.0 University Thesis Template]

% ------------------------------------------------------------
% 选项处理
% ------------------------------------------------------------
\DeclareOption{print}{\PassOptionsToClass{twoside}{ctexbook}}
\DeclareOption{draft}{\PassOptionsToClass{draft}{ctexbook}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ExecuteOptions{}
\ProcessOptions\relax

% ------------------------------------------------------------
% 基础文档类 (ctexbook 提供中文支持)
% ------------------------------------------------------------
\LoadClass[UTF8,a4paper,12pt,openany]{ctexbook}

% ------------------------------------------------------------
% 页面设置
% ------------------------------------------------------------
\RequirePackage{geometry}
\geometry{
    paperwidth=210mm,
    paperheight=297mm,
    left=2.5cm,
    right=2.5cm,
    top=2.5cm,
    bottom=2.5cm,
    headheight=15pt,
    headsep=0pt,
    footskip=30pt
}

% ------------------------------------------------------------
% 基础宏包
% ------------------------------------------------------------
\RequirePackage{xeCJK}
\RequirePackage{setspace}           % 行距设置
\RequirePackage{fancyhdr}           % 页眉页脚
\RequirePackage{titlesec}           % 标题格式
\RequirePackage{tocloft}            % 目录格式
\RequirePackage{graphicx}           % 图片支持
\RequirePackage{amsmath,amssymb,amsfonts} % 数学公式
\RequirePackage{booktabs}           % 表格
\RequirePackage{longtable}          % 跨页表格
\RequirePackage{multirow}           % 表格多行合并
\RequirePackage{array}              % 表格增强
\RequirePackage{float}              % 浮动体控制
\RequirePackage{caption}            % 图表标题
\RequirePackage{subcaption}         % 子图标题
\RequirePackage{bicaption}           % 双语图表标题
\RequirePackage{hyperref}           % 超链接
\RequirePackage{enumitem}           % 列表环境
\RequirePackage{xcolor}             % 颜色
\RequirePackage{listings}           % 代码 listings
\RequirePackage{algorithm}          % 算法环境
\RequirePackage{algpseudocode}      % 算法伪代码
\RequirePackage{dirtree}            % 目录树结构

% ------------------------------------------------------------
% 参考文献设置
% ------------------------------------------------------------
\RequirePackage[sort&compress,numbers,super]{natbib}

% ------------------------------------------------------------
% 超链接设置
% ------------------------------------------------------------
\hypersetup{
    colorlinks=true,
    linkcolor=black,
    citecolor=black,
    urlcolor=blue,
    bookmarksopen=true,
    bookmarksnumbered=true,
    pdfborder={0 0 0}
}

% ------------------------------------------------------------
% 字体设置
% ------------------------------------------------------------
% 中文字体：宋体(正文)、黑体(标题)、楷体(页眉)
\setCJKmainfont{SimSun}[AutoFakeBold=true,AutoFakeSlant=true]     % 宋体 - 正文
\setCJKsansfont{SimHei}[AutoFakeBold=true]                         % 黑体 - 标题
\setCJKmonofont{SimSun}                                             % 宋体 - 等宽备选

% 英文字体：Times New Roman
\setmainfont{Times New Roman}
\setsansfont{Times New Roman}
\setmonofont{Courier New}

% 楷体_GB2312（页眉专用）
\setCJKfamilyfont{kaitigb2312}{kaiti_GB2312.TTF}[Path=./font/,AutoFakeBold=true]

% 仿宋字体
\setCJKfamilyfont{myfangsong}{SIMFANG.TTF}[Path=./font/,AutoFakeBold=true]
\setCJKfamilyfont{myfangsonggb}{fangsong_GB2312.ttf}[Path=./font/,AutoFakeBold=true]
\newcommand{\myfangsong}{\CJKfamily{myfangsong}}
\newcommand{\myfangsonggb}{\CJKfamily{myfangsonggb}}

% ------------------------------------------------------------
% 字号设置 (pt)
% ------------------------------------------------------------
\newcommand{\chuhao}{\fontsize{42pt}{50.4pt}\selectfont}      % 初号
\newcommand{\xiaochu}{\fontsize{36pt}{43.2pt}\selectfont}    % 小初
\newcommand{\yihao}{\fontsize{26pt}{31.2pt}\selectfont}      % 一号
\newcommand{\xiaoyi}{\fontsize{24pt}{28.8pt}\selectfont}     % 小一
\newcommand{\erhao}{\fontsize{22pt}{26.4pt}\selectfont}      % 二号
\newcommand{\xiaoer}{\fontsize{18pt}{21.6pt}\selectfont}     % 小二
\newcommand{\sanhao}{\fontsize{16pt}{19.2pt}\selectfont}     % 三号
\newcommand{\xiaosan}{\fontsize{15pt}{18pt}\selectfont}      % 小三
\newcommand{\sihao}{\fontsize{14pt}{16.8pt}\selectfont}      % 四号
\newcommand{\xiaosi}{\fontsize{12pt}{14.4pt}\selectfont}     % 小四
\newcommand{\wuhao}{\fontsize{10.5pt}{12.6pt}\selectfont}    % 五号
\newcommand{\xiaowu}{\fontsize{9pt}{10.8pt}\selectfont}      % 小五

% ------------------------------------------------------------
% 行距设置
% ------------------------------------------------------------
\setstretch{1.5}    % 1.5倍行距

% ------------------------------------------------------------
% 章节标题格式设置
% ------------------------------------------------------------
\ctexset{
    chapter = {
        format = \centering\sffamily\sanhao,
        name = {第,章},
        number = \arabic{chapter},
        beforeskip = 1.04pt,
        afterskip = 25.65pt,
        pagestyle = fancy
    },
    section = {
        format = \setstretch{1.5}\sffamily\sihao,
        beforeskip = 12pt,
        afterskip = 6pt
    },
    subsection = {
        format = \setstretch{1.5}\sffamily\xiaosi,
        beforeskip = 6pt,
        afterskip = 6pt
    },
    subsubsection = {
        number = \relax,
        format = \normalfont,
        beforeskip = 6pt,
        afterskip = 6pt
    }
}

% ------------------------------------------------------------
% 目录格式设置
% ------------------------------------------------------------
% 重定义目录命令，完全手动控制目录页标题格式：
% 三号黑体居中，中间空两个空格（\qquad），1.5倍行距，段前后0.5行距
% 注意：tocloft 宏包会在加载时覆盖 \tableofcontents，因此使用 \AtBeginDocument
% 确保在所有宏包初始化完成后再应用自定义定义。
\AtBeginDocument{%
  \renewcommand{\tableofcontents}{%
      \clearpage
      \thispagestyle{nofoot}%
      \pagestyle{nofoot}%
      \bgroup
        \sffamily\sanhao
        % 在页面顶部用零高度 hrule 锚定 vspace，防止被 TeX 丢弃
        \hrule height 0pt depth 0pt
        \nobreak
        \vspace{\dimexpr 0.5\baselineskip-3.4pt\relax}%
        {\centering 目\hspace{1em}录\par}%
        \vspace{\dimexpr 0.5\baselineskip-6.5pt\relax}%
      \egroup
      \@starttoc{toc}%
      \clearpage
      \pagestyle{fancy}%
  }%
}

\renewcommand{\cftchapfont}{\sffamily\xiaosi}
\renewcommand{\cftsecfont}{\xiaosi}
\renewcommand{\cftsubsecfont}{\xiaosi}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\setlength{\cftbeforechapskip}{6pt}
\setlength{\cftbeforesecskip}{3pt}
\setlength{\cftbeforesubsecskip}{3pt}

% ------------------------------------------------------------
% 页眉页脚设置
% ------------------------------------------------------------

% 页眉标志：true=固定文字，false=章节名
\newif\if@thesisfixedheader
\@thesisfixedheadertrue

\newcommand{\thesisheaderfixed}{%
  \wuhao\CJKfamily{kaitigb2312}
  中国石油大学（华东）本科毕业设计(论文)%
}

\pagestyle{fancy}
\fancyhf{}
\fancyhead[C]{%
  \if@thesisfixedheader
    \thesisheaderfixed
  \else
    \wuhao\CJKfamily{kaitigb2312}\leftmark
  \fi
}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0pt}

% 章节首页页眉页脚
\fancypagestyle{plain}{
    \fancyhf{}
    \fancyhead[C]{%
      \if@thesisfixedheader
        \thesisheaderfixed
      \else
        \wuhao\CJKfamily{kaitigb2312}\leftmark
      \fi
    }
    \fancyfoot[C]{\thepage}
    \renewcommand{\headrulewidth}{0.4pt}
}

% 有页眉但无页码的页眉页脚（摘要页、目录页使用）
\fancypagestyle{nofoot}{
    \fancyhf{}
    \fancyhead[C]{%
      \if@thesisfixedheader
        \thesisheaderfixed
      \else
        \wuhao\CJKfamily{kaitigb2312}\leftmark
      \fi
    }
    \renewcommand{\headrulewidth}{0.4pt}
    \renewcommand{\footrulewidth}{0pt}
}

% 自动切换页眉模式
\let\orig@frontmatter\frontmatter
\renewcommand{\frontmatter}{\orig@frontmatter\@thesisfixedheadertrue}

\let\orig@mainmatter\mainmatter
% 移除 \cleardoublepage 以避免产生空白页，同时保留其他初始化
\renewcommand{\mainmatter}{%
    \clearpage
    \@mainmattertrue
    \pagenumbering{arabic}%
    \@thesisfixedheaderfalse
    \pagestyle{fancy}%
}

\let\orig@backmatter\backmatter
\renewcommand{\backmatter}{\orig@backmatter\@thesisfixedheadertrue}

\let\orig@appendix\appendix
\renewcommand{\appendix}{\orig@appendix\@thesisfixedheadertrue}

% ------------------------------------------------------------
% 图表标题格式
% ------------------------------------------------------------
\captionsetup{
    font={small},
    labelfont={bf},
    labelsep=quad,
    skip=10pt
}
\captionsetup[figure]{name={图}}
\captionsetup[table]{name={表}}

% ------------------------------------------------------------
% 非浮动图表环境（严格跟随正文，禁止浮动到其他章节）
% ------------------------------------------------------------
% 图片：不浮动，紧跟正文位置
\newenvironment{herefig}{%
    \par\addvspace{\intextsep}%
    \centering%
    \captionsetup{type=figure}%
}{%
    \par\addvspace{\intextsep}%
}

% 表格：不浮动，紧跟正文位置
\newenvironment{heretab}{%
    \par\addvspace{\intextsep}%
    \centering%
    \captionsetup{type=table}%
}{%
    \par\addvspace{\intextsep}%
}

% 续表标记命令（用于 longtable 的 \endhead 之前）
% 参数：表格总列数
\newcommand{\continuedcaption}[1]{%
    \multicolumn{#1}{r}{\small 续表\thetable} \\%
}

% ------------------------------------------------------------
% 双语图表标题设置
% ------------------------------------------------------------
\DeclareCaptionOption{bi-first}[]{%
    \def\figurename{图}%
    \def\tablename{表}%
}
\DeclareCaptionOption{bi-second}[]{%
    \def\figurename{Figure}%
    \def\tablename{Table}%
}
\captionsetup[bi-first]{bi-first}
\captionsetup[bi-second]{bi-second}

% ------------------------------------------------------------
% 图表编号格式: 章-序号
% ------------------------------------------------------------
\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\renewcommand{\thetable}{\thechapter-\arabic{table}}
\renewcommand{\theequation}{\thechapter-\arabic{equation}}
\@addtoreset{figure}{chapter}
\@addtoreset{table}{chapter}
\@addtoreset{equation}{chapter}

% ------------------------------------------------------------
% 列表环境设置
% ------------------------------------------------------------
\setlist[enumerate]{
    label=(\arabic*),
    leftmargin=2em,
    itemsep=0pt,
    parsep=0pt
}
\setlist[itemize]{
    leftmargin=2em,
    itemsep=0pt,
    parsep=0pt
}

% ------------------------------------------------------------
% 代码环境设置
% ------------------------------------------------------------
\lstset{
    basicstyle=\small\ttfamily,
    keywordstyle=\color{blue}\bfseries,
    commentstyle=\color{gray},
    stringstyle=\color{red},
    numbers=left,
    numberstyle=\tiny,
    numbersep=8pt,
    frame=single,
    breaklines=true,
    showstringspaces=false,
    tabsize=4,
    captionpos=b
}

% ------------------------------------------------------------
% 数学定理环境
% ------------------------------------------------------------
\RequirePackage{amsthm}
\theoremstyle{definition}
\newtheorem{definition}{定义}[chapter]
\newtheorem{theorem}{定理}[chapter]
\newtheorem{lemma}{引理}[chapter]
\newtheorem{corollary}{推论}[chapter]
\newtheorem{proposition}{命题}[chapter]
\newtheorem{example}{例}[chapter]
\newtheorem{remark}{注}[chapter]

% ------------------------------------------------------------
% 封面信息命令
% ------------------------------------------------------------
\newcommand{\university}[1]{\gdef\@university{#1}}
\newcommand{\college}[1]{\gdef\@college{#1}}
\newcommand{\major}[1]{\gdef\@major{#1}}
\newcommand{\advisor}[1]{\gdef\@advisor{#1}}
\newcommand{\studentid}[1]{\gdef\@studentid{#1}}
\newcommand{\degree}[1]{\gdef\@degree{#1}}
\newcommand{\submitdate}[1]{\gdef\@submitdate{#1}}

\university{XX大学}
\college{XX学院}
\major{XX专业}
\advisor{XXX教授}
\studentid{20XXXXXXXX}
\degree{硕士学位论文}
\submitdate{2026年3月}

% ------------------------------------------------------------
% 本科毕业设计封面专用列类型
% ------------------------------------------------------------
\newcolumntype{M}[1]{>{\centering\arraybackslash}m{#1}}

% ------------------------------------------------------------
% 封面生成命令
% ------------------------------------------------------------
\newcommand{\makecover}{%
    \begin{titlepage}
        \thispagestyle{empty}
        
        % 顶部Logo
        \noindent
        \includegraphics[width=7.31cm, height=1.80cm]{figture/logo.png}
        
        \vspace{1.5cm}
        
        % 标题：本科毕业设计（论文）
        \begin{center}
            {\sffamily\xiaochu\bfseries
             本\hspace{0.5em}科\hspace{0.5em}毕\hspace{0.5em}业\hspace{0.5em}设\hspace{0.5em}计（论文）}
        \end{center}
        
        \vspace{1.5cm}
        
        % 题目（悬挂缩进：文本前缩进5.92字符，右侧缩进0.15cm，单倍行距，黑体小二不加粗）
        \noindent
        \bgroup
            \linespread{1}\selectfont
            \sffamily\xiaoer
            \leftskip=5.92\ccwd
            \rightskip=0.15cm
            \noindent\llap{题\hspace{1em}目：}%
            \@title\par
            \ifx\@subtitle\@empty\else
                \vspace{0.3em}
                \noindent\hspace*{5.92\ccwd}%
                ——\@subtitle\par
            \fi
        \egroup
        
        \vspace{3cm}
        
        % 作者信息表格
        \begin{center}
        \renewcommand{\arraystretch}{1.0}
        \begin{tabular}{M{3.44cm}M{8.32cm}}
            \rule{0pt}{1.13cm}{\myfangsong\sanhao\bfseries 姓\hspace{2em}名：} & 
            \rule{0pt}{1.13cm}{\myfangsong\sanhao\bfseries \@author} \\ \cline{2-2}
            \rule{0pt}{1.13cm}{\myfangsong\sanhao\bfseries 学\hspace{2em}号：} & 
            \rule{0pt}{1.13cm}{\myfangsong\sanhao\bfseries \@studentid} \\ \cline{2-2}
            \rule{0pt}{1.13cm}{\myfangsong\sanhao\bfseries 学\hspace{2em}院：} & 
            \rule{0pt}{1.13cm}{\myfangsong\sanhao\bfseries \@college} \\ \cline{2-2}
            \rule{0pt}{1.13cm}{\myfangsong\sanhao\bfseries 专\hspace{2em}业：} & 
            \rule{0pt}{1.13cm}{\myfangsong\sanhao\bfseries \@major} \\ \cline{2-2}
            \rule{0pt}{1.13cm}{\myfangsong\sanhao\bfseries 指导教师：} & 
            \rule{0pt}{1.13cm}{\myfangsong\sanhao\bfseries \@advisor} \\ \cline{2-2}
        \end{tabular}
        \end{center}
        
        \vfill
        
        % 日期
        \begin{center}
            {\myfangsonggb\sanhao \@submitdate}
        \end{center}
        
    \end{titlepage}
}

% ------------------------------------------------------------
% 封面信息命令扩展
% ------------------------------------------------------------
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}
\subtitle{}

% ------------------------------------------------------------
% 英文标题命令
% ------------------------------------------------------------
\newcommand{\etitle}[1]{\gdef\@etitle{#1}}
\newcommand{\esubtitle}[1]{\gdef\@esubtitle{#1}}
\etitle{}
\esubtitle{}

% ------------------------------------------------------------
% 中文摘要页环境
% ------------------------------------------------------------
\newenvironment{cabstractpage}{%
  \clearpage
  \thispagestyle{nofoot}%
  % 最上方距离页眉20pt
  \hrule height 0pt depth 0pt
  \nobreak
  \vspace{20pt}%
  % 正标题：小二号黑体居中，不加粗，1.5倍行距，段前、段后0.5行间距
  \bgroup
    \xiaoer\sffamily
    \vspace{2pt}%
    {\centering\@title\par}
    \vspace{2pt}%
  \egroup
  % 副标题：右对齐，小二黑体不加粗，1.5倍行距，段前、段后0.5行间距
  \ifx\@subtitle\@empty\else
    \bgroup
      \xiaoer\sffamily
      \vspace{2pt}%
      {\raggedleft——\@subtitle\par}
      \vspace{2pt}%
    \egroup
  \fi
  % 摘要标题：三号黑体居中，中间空两个空格，1.5倍行距，段前、段后0.5行间距
  \bgroup
    \sanhao\sffamily
    \vspace{2pt}%
    {\centering 摘\qquad 要\par}
    \vspace{2pt}%
  \egroup
  % 摘要正文格式
  \setlength{\parindent}{2\ccwd}%
  \normalfont\xiaosi
}{%
  \par
}

% ------------------------------------------------------------
% 英文摘要页环境
% ------------------------------------------------------------
\newenvironment{eabstractpage}{%
  \clearpage
  \thispagestyle{nofoot}%
  % 最上方距离页眉20pt
  \hrule height 0pt depth 0pt
  \nobreak
  \vspace{20pt}%
  % 英文标题：小二居中，不加粗
  \ifx\@etitle\@empty\else
    \bgroup
      \xiaoer\rmfamily
      \vspace{2pt}%
      {\centering\@etitle\par}
      \vspace{2pt}%
    \egroup
  \fi
  % 英文副标题：右对齐，小二不加粗
  \ifx\@esubtitle\@empty\else
    \bgroup
      \xiaoer\rmfamily
      \vspace{2pt}%
      {\raggedleft——\@esubtitle\par}
      \vspace{2pt}%
    \egroup
  \fi
  % Abstract标题：三号粗体居中
  \bgroup
    \sanhao\rmfamily\bfseries
    \vspace{2pt}%
    {\centering Abstract\par}
    \vspace{2pt}%
  \egroup
  % 摘要正文格式
  \setlength{\parindent}{2\ccwd}%
  \normalfont\xiaosi
}{%
  \par
}

% ============================================================
% 文档类结束
% ============================================================
