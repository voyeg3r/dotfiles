# Arquivo: dicas de LaTex

``` markdown
Criado: Ter 18/Dez/2012 hs 19:48
Last Change: ter 10 jan 2017 14:05:26 BRT
autor: Sérgio Luiz Araújo Silva
site: vivaotux
twitter: voyeg3r
email: voyeg3r at gmail
```

###  Veja também [[LatexExemplos]]

    pdflatex documment.tex

### como instalar o latex

A COMMUNITY WIKI ANSWER, BASED ON THE OP DAVID'S COMMENTS.

The solution, which worked for the OP and is recommended by him: don't use
(deinstall) the older Ubuntu/Debian repository version and install an
up-to-date version of TeX Live, which also works on Ubuntu/Debian. Additionally
is has the advantage that you can use the TeX Live Manager tlmgr for installing
the most recent updates.

Source for download and installation: http://www.tug.org/texlive/

	``` sh
	wget -c http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
	```

### tlmgr - TeX LIVE PACKAGE MANAGER

tlmgr is the name of the package and configuration manager included in TeX
Live. It operates completely separately from any package manager the operating
system may provide. The full documentation for tlmgr is available (updated nightly),
or you can run

    tlmgr --help

If you installed MacTeX, precede the commands below with sudo, since MacTeX installs as root.
Getting updates

Occasionally we release new versions of tlmgr. Your installed tlmgr will notice
and ask you to update it before updating anything else. The command to do this
is:

    tlmgr update --self

After any updates of tlmgr, you can then run, for instance, tlmgr update --all,
which will update (including additions and removals) all other packages in your
installation that have been changed on the server. Authors frequently release
new versions of their work to CTAN, which we propagate into TeX Live.

We maintain a separate history of tlmgr changes.
Disaster recovery

You may end up in a situation where tlmgr itself does not run due to Perl
errors, failed updates, or some other reason. If this happens, the simplest way
forward is to download and run update-tlmgr-latest.sh (below) (Unix) or
update-tlmgr-latest.exe (Windows). These are self-extracting archives which
include all the infrastructure files. Running them should restore tlmgr to
a coherent state.   http://mirror.ctan.org/systems/texlive/tlnet/update-tlmgr-latest.sh

Before running them, be sure your PATH is set to use the current TeX Live bin
directory; the archives use kpsewhich from PATH to figure out where to unpack
themselves.  Test versions

If you like living on the bleeding edge (and we greatly appreciate any such
testing), you can get the latest tlmgr from a separate repository named
‘tlcritical’. This directory is updated nightly from the development sources.
The TeX Live Utility on MacOSX has a convenient way to try this. Or you can do
it on any platform using tlmgr: the following command will show you what will
be updated, along with commentary that updates to tlmgr itself are present
(ignore the urls in that commentary).

    tlmgr --repository=ftp://tug.org/texlive/tlcritical update --list

To actually do the update, use --self instead of --list, but don't forget to
keep the explicit --repository.

If you have trouble connecting to tug.org via ftp, you can also get tlcritical
via rsync. First copy it into its own separate directory on your machine, and
then tell tlmgr to use that directory, like this:

    rsync rsync://tug.org/tlcritical/ /new/local/dir
    tlmgr --repository=/new/local/dir update --list

Another form of testing is the pretest which we do for a time before each official release.

Please email bug reports or other comments to the tex-live mailing list.

### After install wellcome


See
     /usr/local/texlive/2012/index.html
     for links to documentation.  The TeX Live web site
     contains updates and corrections: http://tug.org/texlive.

     TeX Live is a joint project of the TeX user groups around the world;
     please consider supporting it by joining the group best for you. The
     list of user groups is on the web at http://tug.org/usergroups.html.


     Add /usr/local/texlive/2012/texmf/doc/man to MANPATH, if not dynamically determined.
     Add /usr/local/texlive/2012/texmf/doc/info to INFOPATH.

     Most importantly, add /usr/local/texlive/2012/bin/i386-linux
     to your PATH for current and future sessions.

 ### Welcome to TeX Live!

 Summary of warning messages during installation:
   Partial download of http://linorg.usp.br/CTAN/systems/texlive/tlnet/archive/minitoc.doc.tar.xz found, removing it.

Logfile: /usr/local/texlive/2012/install-tl.log



You can't use tlmgr (or its front-end TeX Live Utility). There is a script
called getnonfreefonts at http://www.tug.org/fonts/getnonfreefonts/ that you
have to download with the Terminal command

    curl -O http://tug.org/fonts/getnonfreefonts/install-getnonfreefonts

and then install with

    sudo texlua install-getnonfreefonts

Then you can get direction on its use by

    getnonfreefonts --help

For example, in order to install URW Garamond for all users you do

    sudo getnonfreefonts-sys garamond

Installing fonts for one user only is not recommended.

