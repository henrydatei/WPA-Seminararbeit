%%****************************************
%%*                                      *
%%* TU Dresden                           *
%%* Lehrstuhl für Wirtschaftsinformatik, *
%%* insb. Informationssysteme in         *
%%* Industrie und Handel                 *
%%*                                      *
%%****************************************
%%
%% LaTeX-Vorlage fuer Abschlussarbeiten am ISIH-Lehrstuhl
%%
%% Versionshistorie:
%%
%% Version 1.01, 22.04.2009, Roy Wendler:
%% Einfügen des hypersetup bei den Titelblättern nur, wenn auch die Option hyperref geladen wird - sonst Abbruch der Kompilierung
%%
%% Version 1.02, 02.03.2010, Roy Wendler:
%% Formatvorgabe für Überschriften der 4. und 5. Ebene hinzugefügt (paragraph und subparagraph)
%%
%% Version 2.00, 03.12.2019, Hendrik Schön:
%% Überarbeitung der Parameter; Layout, etc. angepasst und modernisiert; Aufräumarbeiten
%%
%% Version 2.02, 12.02.2019, Hendrik Schön:
%% weiteres Befüllen des Template-Inhalts mit Infos, Korrekturen



\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{isih}[%
     2008/12/03 Vorlage fuer Lehrstuhl ISIH von Roy Wendler;% 
     2019/12/03 Ueberarbeitung von Hendrik Schoen%
 ]

% scrartcl von Komascript
\LoadClass[toc=listof, toc=idx, toc=bib, abstract=true, numbers=noenddot]{scrartcl}

% Sprache, inputenc für Umlaute
\RequirePackage[english,ngerman]{babel}
\RequirePackage[utf8]{inputenc}

%****************************
%*  Definition der Optionen *
%****************************

% --- Art der Arbeit ---
\newif\if@seminar
    \@seminarfalse
    \DeclareOption{seminar}{%
        \@seminartrue%
    }%

\newif\if@foseminar
    \@foseminarfalse
    \DeclareOption{foseminar}{%
        \@foseminartrue%
    }%

\newif\if@beleg
    \@belegfalse
    \DeclareOption{beleg}{%
        \@belegtrue%
    }%

\newif\if@bachelor
    \@bachelorfalse
    \DeclareOption{bachelor}{%
        \@bachelortrue%
    }%

\newif\if@master
    \@masterfalse
    \DeclareOption{master}{%
        \@mastertrue%
    }%
    
\newif\if@diplom
    \@diplomfalse
    \DeclareOption{diplom}{%
        \@diplomtrue%
    }%
    
% --- andere Parameter --- 

\newif\if@singlespace
    \@singlespacefalse
    \DeclareOption{singlespace}{%
        \@singlespacetrue%
    }%

\newif\if@colorlinks
    \@colorlinksfalse
    \DeclareOption{colorlinks}{%
        \@colorlinkstrue%
    }%
    
\newif\if@nonindent
    \@nonindenttrue
    \DeclareOption{indent}{%
        \@nonindentfalse%
    }%

\newif\if@par
    \@partrue
    \DeclareOption{nopar}{%
        \@parfalse%
    }%
    
\newif\if@compmodern
    \@compmodernfalse
    \DeclareOption{compmodern}{%
        \@compmoderntrue%
    }%

\newif\if@english % this option is not fully implemented yet
    \@englishfalse
    %\DeclareOption{english}{%
    %    \@englishtrue%
    %}%

% --- übrige Optionen an "scrartcl" weiterreichen ---
\DeclareOption*{%
    \typeout{Option \CurrentOption\space is passed to package scrartcl!}
    \PassOptionsToPackage{\CurrentOption}{scrartcl}
}%
\ProcessOptions\relax

%****************************
%*  Auswertung der Settings *
%****************************

\def\title#1{\def\@title{#1}}
\def\author#1{\def\@author{#1}}
\def\address#1{\def\@address{#1}}
\def\startdate#1{\def\@startdate{#1}}
\def\submitdate#1{\def\@submitdate{#1}}
\def\supervisor#1{\def\@supervisor{#1}}
\def\matr#1{\def\@matr{#1}}
\def\semester#1{\def\@semester{#1}}

%********************
%*  Formatierung    *
%********************

%-------------------------------------
% Seitenlayout, Schriftgröße, etc.
%-------------------------------------

% Art der Arbeit
\if@seminar
    \def\examdegree{--}
    \def\examtype{Seminararbeit}
\else
\if@foseminar
    \def\examdegree{--}
    \def\examtype{Forschungsseminar}
\else
\if@beleg
    \def\examdegree{--}
    \def\examtype{Belegarbeit}
\else
\if@bachelor
    \def\examdegree{B.Sc.}
    \def\examtype{Bachelorarbeit}
\else
\if@master
    \def\examdegree{M.Sc.}
    \def\examtype{Masterarbeit}
\else
\if@diplom
    \def\examdegree{Dipl.-Wirt.-Inf.}
    \def\examtype{Diplomarbeit}
\else
    \def\examdegree{--}
    \def\examtype{--}
\fi
\fi
\fi
\fi
\fi
\fi    

% Sprache
\if@english
    \selectlanguage{english}
\else
    \selectlanguage{ngerman}
\fi

% Schriftart
\if@compmodern\else
    \RequirePackage{mathptmx}%
\fi          
\RequirePackage[scaled=.90]{helvet} 
\RequirePackage{courier}            

% Absatzabstand 8pt, kein Einzug
\if@par
    \setlength{\parskip}{8pt}
\fi
\if@nonindent
    \setlength{\parindent}{0pt}
\fi

% Seitenaufteilung
\RequirePackage{geometry}
\geometry{a4paper, tmargin=13mm, bmargin=20mm, lmargin=40mm, rmargin=20mm, headheight=10mm, headsep=7mm, ignorefoot, includehead}

% Kopfzeile
\RequirePackage[headsepline, automark]{scrpage2}
\clearscrheadfoot
\ohead{\pagemark}                   %rechts Seitenzahl
\ihead{\headmark}                   %links Section-Überschriften
\setkomafont{pagehead}{\normalfont}
\setkomafont{pagenumber}{\normalfont}
\renewcommand\sectionmarkformat{}   % Nummerierung in der Kopfzeile ausblenden
\pagestyle{scrheadings}             % Kopfzeile einschalten
\addtokomafont{section}{\clearpage\thispagestyle{scrheadings}} % große Überschriften auf neuer Seite
\addtokomafont{section}{\Large\bfseries}                
\addtokomafont{subsection}{\normalsize\bfseries}        
\addtokomafont{subsubsection}{\normalfont}              
\addtokomafont{paragraph}{\normalfont\bfseries\itshape} 
\addtokomafont{subparagraph}{\normalfont\itshape}       

% Abbildungs- und Tabellenunterschriften
\RequirePackage[singlelinecheck=false,justification=raggedright,font=small]{caption}

% Fußnoten
\deffootnote{2em}{1em}{\makebox[2em][l]{\thefootnotemark.}}

% Zeilenabstand (+ Tabellen)
\RequirePackage{setspace}
    \if@singlespace
        \setstretch{1,0}
        \renewcommand{\arraystretch}{1.05}
    \else
        \setstretch{1,3}
        \renewcommand{\arraystretch}{1.3}
    \fi

% Links und Verweise mit \href
\AtEndOfPackage{
    \if@colorlinks
        \RequirePackage[colorlinks=true,breaklinks]{hyperref}
    \else
        \RequirePackage[colorlinks=true,linkcolor=black,urlcolor=black,citecolor=black,breaklinks]{hyperref}
    \fi
}
\AtEndOfPackage{
    \RequirePackage{breakurl}
}

%-----------
% Umgebungen
%-----------

% Zusammenfassung (Abstract)
\renewenvironment{abstract}{%
    \pagestyle{empty}%
    \if@english
        \section*{Abstract}%
    \else
        \section*{Zusammenfassung}%
    \fi
    \vspace*{2cm}
}{%
  \pagestyle{scrheadings}
  \setcounter{page}{0}
}

% Vorspann und Abspann mit römischer Seitennummerierung
% .. Vorspann und Zwischenspeicherung der Seitenzahl
\newenvironment{preface}{%
  \cleardoublepage
  \pagenumbering{Roman}
}{%
  \newcounter{RomanSave}
  \setcounter{RomanSave}{\value{page}}
  \cleardoublepage
  \pagenumbering{arabic}
}

% .. Abspann, römische Nummerierung um 1 erhöhen und fortsetzen
\newenvironment{closing}{%
  \cleardoublepage
  \pagenumbering{Roman}
  \addtocounter{RomanSave}{1}
  \setcounter{page}{\value{RomanSave}}
}

% Anhänge
\RequirePackage[toc, title, titletoc, header]{appendix}
\if@english\else
    \renewcommand{\appendixtocname}{Anhänge}
\fi
%beim original appendix-package wird die Formatierung der Kopfzeile ohne Einstellmöglichkeit vorgegeben
%daher definieren wir den Befehl hier einfach um (MakeUpperCase wurde entfernt)
\renewcommand{\@formatsecmark@pp}[1]{%
    \appendixname\space
    \ifnum \c@secnumdepth >\z@
        \thesection\quad
    \fi
    #1}

%********************
%*  weitere Pakete  *
%********************

\RequirePackage{graphicx}                   
\RequirePackage{url}      
\AtEndOfPackage{\RequirePackage{apacite}}   
\AtEndOfPackage{\RequirePackage{natbib}}
\RequirePackage{tabularx}                   
\RequirePackage{xcolor}
\RequirePackage{microtype}
\RequirePackage{amsmath}
\RequirePackage{listings}
\RequirePackage[titles]{tocloft}

%-----------------------
% Verzeichnisanpassungen
%-----------------------

% Benennungen und Zeichensatz
\renewcommand{\cfttabpresnum}{Tabelle }         % schreibt vor jeden Eintrag den Namen
\renewcommand{\cftfigpresnum}{Abbildung }       %
\renewcommand{\cftfigaftersnum}{:}              % setzt einen Doppelpunkt
\renewcommand{\cfttabaftersnum}{:}              %
\cftsetindents{figure}{0em}{6em}                % lässt das Verzeichnis ganz links beginnen und vergrößert Abstand zum Bild-/Tabellenname
\cftsetindents{table}{0em}{6em}                 %

\renewcommand{\cftdotsep}{1}                    % verringert den Abstand der Punkte in Verzeichnissen
\renewcommand{\cftsecdotsep}{1}                 % erzeugt auch Punkte hinter "section"-Überschriften

% Erweiterung des Platzes für Seitenzahlen
\renewcommand{\@pnumwidth}{2em}
\renewcommand{\@tocrmarg}{3em}

% Abkürzungsverzeichnis (mit Eintrag ins Inhaltsverzeichnis)
\if@english
    \RequirePackage[intoc, english]{nomencl}
\else
    \RequirePackage[intoc, german]{nomencl}
    \renewcommand{\nomname}{Abkürzungsverzeichnis}
\fi
\let\abbrev\nomenclature % für "\abbrev"-Befehl
\setlength{\nomlabelwidth}{6em}
\setlength{\nomitemsep}{-\parsep}
\makenomenclature
\newcommand{\listofabbreviations}{%
    \cleardoublepage
    \markright{\nomname}
    \printnomenclature
}

% Formelverzeichnis
\newlistof{usedequations}{equ}{Formelverzeichnis}
\newcommand{\equationlist}[1]{%
    \addcontentsline{equ}{usedequations}{\protect\numberline{\theequation}#1}\par
}

% Quellcodeverzeichnis
\begingroup\let\newcounter\@gobble\let\setcounter\@gobbletwo
  \globaldefs\@ne \let\c@loldepth\@ne
  \newlistof{listings}{lol}{\lstlistlistingname}
\endgroup
\let\l@lstlisting\l@listings
\AtBeginDocument{\addtocontents{lol}{\protect\addvspace{10\p@}}}
\renewcommand{\lstlistoflistings}{\listoflistings}
\renewcommand{\lstlistingname}{Quellcode}
\renewcommand{\lstlistlistingname}{Quellcodeverzeichnis}
\renewcommand{\cftlistingsaftersnum}{:}     % das gleiche wie oben, nur für Quellcode
\renewcommand{\cftlistingspresnum}{Quellcode }
\cftsetindents{listings}{0em}{6em}  

%---------------------------
% sonstige (Re-)Definitionen
%---------------------------

% Literaturverzeichnis im TOC
\AtEndOfPackage{\renewcaptionname{ngerman}{\refname}{Literaturverzeichnis}}

% vereinfachter Befehl für die grauen Tabellenzeilen
\RequirePackage{colortbl}
\newcommand{\grayrow}{\rowcolor[gray]{0.85}}

% Quellcode
\lstset{
    captionpos=b,
    numbers=left,
    numberstyle=\scriptsize\color{gray},
    showstringspaces=false,
    xleftmargin=17pt,
    basicstyle=\ttfamily\small
}

%-------
% Farben
%-------

% TU Dresden CI Farben
\definecolor{hausfarbe}{cmyk}{1,.7,.1,.5}
\definecolor{auszeichnung1}{cmyk}{1,.5,0,0}
\definecolor{auszeichnung2}{cmyk}{.8,.9,0,0}
\definecolor{auszeichnung3}{cmyk}{.5,1,0,0}
\definecolor{auszeichnung4}{cmyk}{1,0,.9,.2}
\definecolor{auszeichnung5}{cmyk}{.65,0,1,0}
\definecolor{ausnahmefarbe}{cmyk}{0,.6,1,0}
\definecolor{white}{gray}{1.00}
\definecolor{black}{gray}{0.00}
\definecolor{skyblue}{rgb}{0.80, 0.80, 1.00}
\definecolor{blue}{rgb}{0.20, 0.20, 0.80}
\definecolor{darkblue}{rgb}{0.04, 0.16, 0.32}
\definecolor{extradarkblue}{cmyk}{1.00, 0.70, 0.10, 0.50}
\definecolor{turquoise}{rgb}{0.00, 0.80, 0.60}
\definecolor{gray}{gray}{0.59}

%****************************************
%*  Deckblätter, Textbausteine, etc...  *
%****************************************

% Institution
\newcommand\institution{
    \begin{center}
        \LARGE
        TECHNISCHE UNIVERSITÄT DRESDEN\\
        \bigskip
        {\color{hausfarbe}\hrule }
        \vspace{1cm}
        \large
        Fakultät Wirtschaftswissenschaften\\
        Professur für Wirtschaftsinformatik,\\
        insbesondere Informationssysteme in Industrie und Handel
    \end{center}
}

% Titelblatt
\newcommand{\isihtitlepage}{
    % Metadaten im PDF
    \if@seminar
        \hypersetup {%
                pdftitle={\@title},%
                pdfauthor={\@author},%
                pdfsubject={\examtype\ ISIH (\@semester)},%
        }%
    \else
        \hypersetup {%
                pdftitle={\@title},%
                pdfauthor={\@author},%
                pdfsubject={\examtype\ ISIH (\@startdate\ -- \@submitdate)},%
        }%
    \fi
    {\setstretch{1,3}
    % Header
    \thispagestyle{empty}
    \institution
    \vspace{2cm}
    % Body
    \begin{center}
        \Large
        \examtype\\
        \normalsize
        \if@seminar
            %Forschungsseminar\\
            \@semester\\
        %\else
        %\if@beleg
        %    \@semester\\
        %\else
        %    zur Erlangung des akademischen Grades\\
        %    \glqq \examdegree \grqq\ \\
        %\fi
        \fi
        \vspace{2cm}
        \LARGE\textbf{\emph{\@title}}
        \vfill
    \end{center}}
    {\setstretch{1,1}
    % Footer
    \if@seminar
        \begin{tabular}{l l}
            Name:               & \@author\\
            Übermittelt an:     & \@supervisor \\
            Bearbeitungszeit:   & \@startdate\ -- \@submitdate\\
        \end{tabular}
    \else
        \begin{tabular}{l l}
            Name:               & \@author\\
            Adresse:            & \@address\\
            Matrikelnummer:     & \@matr\\
            Übermittelt an:     & \@supervisor \\
            Bearbeitungszeit:   & \@startdate\ -- \@submitdate\\
        \end{tabular}
    \fi
    }\cleardoublepage
}

% Ehrenwörtliche Erklärung
\newcommand\declaration{
    \addsec{Ehrenwörtliche Erklärung}
    Hiermit versichere ich, die vorliegende Arbeit mit dem Titel\par

    \begin{quote}
    \emph{\@title}
    \end{quote}

    selbständig, ohne fremde Hilfe und ohne Benutzung anderer als der von
    mir angegebenen Quellen angefertigt zu haben. Alle aus fremden Quellen
    direkt oder indirekt übernommenen Gedanken sind als solche gekennzeichnet.\par

    Die Arbeit wurde noch keiner Prüfungsbehörde in gleicher oder ähnlicher
    Form vorgelegt und wurde noch nicht veröffentlicht.%

    \vspace{2cm}%
    \noindent Dresden, \today\par
    \vspace{1,5cm}
    \rule{10cm}{1pt}
}

%**************
%*  Hinweise  *
%**************

% Achtung!
%
% Im apacite-package vom 18.03.2009 fehlt das Leerzeichen nach dem Präfix in Literaturangaben.
% Der entsprechende Befehl "\renewcommand{\BAP}{}" wird in der Datei ngerman.apc überschrieben.
% Daher führt ein renewcommand nicht zum Erfolg. Auch nicht in Kombination mit "AtEndOfPackage" oder "AfterPackage".
% Die Datei ngerman.apc scheint viel später geladen zu werden.
% Daher der Workaround den entsprechenden Befehl DIREKT in ngerman.apc nach "\renewcommand{\BAP}{ }" zu ändern.
%
% RW (1.01), RW (1.02), HS (2.0), HS (2.02)
