%
% Shahjalal University of Science and Technology
% Dept of EEE

% Version 0.1 released 11/01/2022 % This version is inspired from amu
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sust_eee_report}[11/01/2022 Classe personnelle, V0.1]

%%% Base class (KOMA-Script)
\LoadClass{scrreprt}						    %% classe report KOMA-Script
\KOMAoptions{
	paper=a4,								%% paper size
	fontsize=12pt,							%% font size
	DIV=12,									%% margin size
	BCOR=0mm,								%% binding size
	twoside=off,							    %% both sided
	listof=totoc,							%% LOFT in the TOC
	index=totoc								%% index in the TOC
	}

\RequirePackage{lipsum}						%% lorem ipsum (exemple)


% \RequirePackage[ddmmyyyy]{datetime}			%% the date formate

%%% minimal extensions
\RequirePackage[utf8]{inputenc}				%% text encoding
\RequirePackage[TS1,T1]{fontenc}			%% font encoding
%\RequirePackage{lmodern}					%% Latin fonts (disabled)
\RequirePackage{fourier}					%% Adobe Utopia fonts (enabled)
\RequirePackage[main=english]{babel}	%% typography (English by default)
\RequirePackage[babel]{csquotes}			%% typographic quotes
\MakeAutoQuote{«}{»}						%% automatic quotation mark spacing

%%% typography and layout
\RequirePackage{scrhack}					%% custom macros (KOMA-Script)
\RequirePackage[
	automark,								%% reminder of the chapter title in the header
	autooneside=false						%% necessary for the reminder of the chapter and the header part
	]{scrlayer-scrpage}						%% custom header / footer (KOMA-Script)
\RequirePackage{textcomp}					%% complementary symbols
\RequirePackage{hyphenat}					%% explicit hyphenation
\RequirePackage{microtype}					%% microtypography

\RequirePackage[bottom=10em]{geometry}		%% reduce the footer to be able to number the inserted pdf (reduce more if necessary)
\RequirePackage{setspace}					%% line spacing modification

\pagestyle{scrheadings}						%% page style
%\setkomafont{disposition}{\bfseries}		%% titling in serif font (uncomment)
%\setkomafont{descriptionlabel}{\bfseries}	%% entry of glossaries in serif font (uncomment)

%%% tables and figures
\RequirePackage{float}						%% defines floating objects such as figures and tables
\RequirePackage{graphicx}					%% graphics and figures
\RequirePackage[export]{adjustbox}			%% allows you to define a minimum or maximum size
\RequirePackage{subfig}						%% multiple figures
\RequirePackage{caption}					    %% légendes des figures
\RequirePackage{tabularx}					%% tables
\RequirePackage{colortbl}
\RequirePackage{multirow}					%% merging cells in tables
\RequirePackage{makecell}					%% line breaks in cells	
\RequirePackage{array}						%% improvement of tables
\RequirePackage{booktabs}					%% formal tables
\RequirePackage{tikz}						%% figures in native code
\usetikzlibrary{decorations.markings}

\floatplacement{figure}{!h}					%% place a figure where it was called
\graphicspath{{fig/}{logo/}{Signature}}			    %% paths to image files

%%% tools for the References (except glossaries)
\PassOptionsToPackage{						%% biblatex options
	backend=biber,							%% default compiler for biblatex
%	maxnames=3,								%% max. author names
%	minnames=3,								%% min number author names
	sorting=none,							%% sort by name, year, title
	citestyle=numeric-comp,					%% citation style (Author-year)
%	bibstyle=alphabetic,					%% Bibliographic style (Alphabetic)
%	bibstyle=iso-authoryear,				%% Bibliographic style (ISO 690)
	bibstyle=numeric,
	backref=true							%% 
	}
	{biblatex}
\RequirePackage{biblatex}					%% bibliography management with biblatex
\RequirePackage{enotez}						%% endnotes
\setenotez{
	list-name=Notes,						%% title of notes
	totoc=chapter,							%% 
	backref									%% hyperlink back to notes
	}
\RequirePackage{imakeidx}					%% index
\RequirePackage[titles,subfigure]{tocloft}	%% functions for TOC LOF LOT
\RequirePackage{etoc}						%% functions for TOC locale (preferable to minitoc with KOMA-Script)
\setuptoc{toc}{totoc}						%% add TOC to TOC
\newcommand{\chaptertoc}[1][Sommaire]{%		%% defines a command for the local TOC (Summary)
	\etocsetnexttocdepth{3}%				    %% 
	\etocsettocstyle{\addsec*{#1}}{}%
	\localtableofcontents%
}

\setcounter{secnumdepth}{3}					%% 
\setcounter{tocdepth}{2}					%% 

\addbibresource{biblio.bib}					%% bibliographic source files
\makeindex[									%% generate index
	program=makeindex,						%% compiler
	options=-s these,						%% settings
	columns=1,								%% number of columns
	intoc									%% index in the TOC
	]

%%% mathematics, physics, chemistry (to be adapted)
\RequirePackage{amsmath}					%% mathematical formulas
\RequirePackage{amssymb}					%% mathematical symbols
\RequirePackage{amsfonts}					%% math fonts

\RequirePackage{xspace}						%% gestions des espaces dans les macros
\RequirePackage{xparse}						%% advanced macros
\RequirePackage{nicefrac}					%% online fractions (see also xfrac)
\RequirePackage{xfrac}

\RequirePackage{siunitx}					%% for SI unit
\sisetup{									%% operation for the units
	list-final-separator = { \translate{and} },	
	list-pair-separator  = { \translate{and} },
	output-decimal-marker = {,},
	exponent-product = {\cdot},
	separate-uncertainty = true
	}
\PassOptionsToPackage{version=4}{mhchem}
\RequirePackage{mhchem}						%% Chemistry
\RequirePackage{chemformula} % newly added 
\RequirePackage{physics}					%% physics

\RequirePackage[b]{esvect}   %%% to have nicer look of the vector arrow
%%% PDF
\RequirePackage{pdfpages}					%% insertion de pdf
\RequirePackage{hyperref}					%% pdf interactifs (charger le package hyperref en dernier)

\pdfminorversion=5							%% PDF en version 1.5
\pdfobjcompresslevel 0						%% Compression of the object
\pdfcompresslevel 0							%% Level of pdf compression

\hypersetup{
	%backref=true,							%% add links (default)
	%pagebackref=true,						%% in the bibliography (by default)
	%hyperindex=true,						%% in index (default)
	%bookmarks=true,						%% Acrobat bookmarks (default)
	breaklinks=true,						%% newline (if link too long)
	colorlinks=true,						%% colorize links
	urlcolor=blue,							%% color of hyperlinks
	citecolor=blue,							%% color links of bibliography
	linkcolor=blue,							%% color of internal links
	anchorcolor=blue,						%% 
	bookmarksopen=false,					%% default folded bookmarks
	linktocpage=false,						%% page number link in TOC
%% métadonnées :							%% BE CAREFUL to complete
	pdftitle={Titre},
	pdfauthor={Prénom NOM},
	pdfsubject={Résumé},
	pdfkeywords = {mot clé, keyword, ...},
	}

%%% glossaires
\RequirePackage[
	acronym,								%% list of acronyms
	xindy,									%% compilateur xindy
	toc,									%% display in the TOC
	style=altlist							%% display of entries
	]
	{glossaries}							%% glossaries (load the glossaries package after the hyperref package)
\newglossary[nlg]{notation}{not}{ntn}{Nomenclature} % Creation of a glossary type 'notation'
\makeglossaries								%% generates glossaries
\loadglsentries{tex/gloss}					%% glossary source files

%%% personal commands (macros)
\newcommand{\langue}{\emph}					%% words in foreign languages ​​in italics
\newcommand{\citital}{\emph}				%% citation in italics

\newcommand{\acc}{\ensuremath{\omega ^{2}=\omega ^{2}_{0}+2\alpha \theta}\xspace}
\newcommand{\emiss}[2][]{\ensuremath{\varepsilon_{#2}^{#1}}\xspace}

%%% controls for title page
\definecolor{blueamu}{RGB}{0, 101, 189}
\definecolor{cyanamu}{RGB}{61, 183, 228}

\newcommand{\dhorline}[3][0]{%
    \tikz[baseline=-2pt]{\path[decoration={markings, 
      mark=between positions 0 and 1 step 2*#3
      with {\node[color=blueamu, fill, circle, minimum width=#3, inner sep=0pt, anchor=south west] {};}},postaction={decorate}]  (0,#1) -- ++(#2,0);}}
\newcommand{\dvertline}[3][0]{%
    \tikz[baseline=2em]{\path[decoration={markings,
      mark=between positions 0 and 1 step 2*#2
      with {\node[color=black!50, fill, circle, minimum width=#2, inner sep=0pt, anchor=south west] {};}},postaction={decorate}] (0, #1) -- ++(0,#3);}}

\newcommand\titel[1]{{\usefont{T1}{tit}{el}{n} #1 }}
\newcommand\titl[1]{{\usefont{T1}{tit}{l}{n} #1 }}
\newcommand\titm[1]{{\usefont{T1}{tit}{m}{n} #1 }}
\newcommand\titsb[1]{{\usefont{T1}{tit}{sb}{n} #1 }}
\newcommand\titb[1]{{\usefont{T1}{tit}{b}{n} #1 }}
\makeatletter\newcommand\HUGE{\@setfontsize\Huge{28}{0}}\makeatother

%%% personalized reconfigurations
\addto\captionsfrench{\def\tablename{Tableau}}		



\renewcommand*{\sfdefault}{phv} % 