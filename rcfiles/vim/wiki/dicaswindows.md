# Arquivo: dicas windows

```
Criado: Ter 11/Dez/2012 hs 15:31
Last Change: ter 10 jan 2017 13:32:48 BRT
autor: sergio
site: vivaotux
twitter: voyeg3r
email: voyeg3r at gmail.com
```
### A good terminal emulator
+ https://github.com/cmderdev/cmder

You also should use babun "oh-my-zsh" framework on windows:
+ http://babun.github.io/

### Exibe os programas que estão abertos (possibilitando mata-los)

    Ctrl + shift + Esc


    Outro modo:
    Abra o command e digite

    tasklist.

    Pegue o PID do programa e faça

    taskkill /pid PID

    Matar programa pelo nome:
    taskkill /IM utorrent.exe /F

### Desfragmentar no linux
+ https://www.howtoforge.com/tutorial/linux-filesystem-defrag/

    sudo apt-get install e2fsprogs

To do this I use the following command:

    sudo e4defrag

### Recording a desktop session

    http://goo.gl/lbwM9G
    On execute menu open:  psr.exe
    In English "Step recorder" em portugues Gravador de passos

### adding a new dir to windows path

first to see the path

    echo %path%

    setx /M PATH "%PATH%;C:\Program Files\MySQL\MySQL Server 5.5\bin"

### todos os atalhos de configuração em uma única pasta

1. Crie uma pasta em qualquer lugar;
2. De a essa pasta o seguinte nome (sem aspas):

    GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}

3. O ícone da pasta deve mudar, indicante que o processo foi realizado com sucesso.

### Limpando o spool de de impressão

    net stop spooler
    cd %systemroot%\system32\spool\PRINTERS
    del /f /s *.SHD
    del /f /s *.SPL
    net start spooler
    exit

### colar na linha de comando do windows

alt + espaço + e + l

### consertando pastas ocultas no pendrive

(considere neste caso o pendrive como sendo letra 'g')

    attrib -h -r -s /s /d g:\*.*

 Outra versão
 -------------------------8<---------------------------
    @ECHO OFF
    ECHO Digite a letra do seu dispositivo e pressione enter.
    ECHO (Verifique a letra atraves do Windows Explorer)
    ECHO.
    ECHO Digite somente a letra:
    set /p letter=

    ECHO.
    ECHO %letter%: selecionado.

    ECHO.
    ECHO Fechando o Explorer para evitar problemas.
    ECHO (Sera aberto novamente ao finalizar o processo)
    ECHO Aproveite para acessar os blogs: www.thiagomedeiros.com e o www.ogestor.eti.br
    ECHO.
    taskkill /im explorer.exe /f
    ECHO.
    ECHO.
    ECHO Processando arquivos, aguarde...
    ECHO.
    -------------------------8<---------------------------

    attrib -r -a -s -h /s /d %letter%:*.*
    del %letter%:*.lnk .vbs. .js .com /f /q
    ECHO.
    ECHO ------------CONCLUIDO!------------
    ECHO.
    pause
    start explorer
    start explorer %letter%:
    taskkill /im cmd.exe /f

### comandos do windows

    control userpasswords2
    Abre filtro AC3 (se instalado) = ac3filter.cpl
    Acerca do Windows (Ver a versão do Windows) = winver
    Actualizações automáticas = wuaucpl.cpl
    Adicionar ou remover programas = appwiz.cpl
    Administrador da origem de dados de ODBC = odbccp32.cpl
    Ajuda e suporte = msinfo32
    Armazenamento amovível = ntmsmgr.msc
    Assistente de acessibilidade = accwiz
    Assistente de câmara ou scanner = wiaacmgr
    Assistente de configuração de rede = netsetup.cpl
    Assistente de cópia de segurança ou restauro = ntbackup
    Assistente de ligação à Internet = icwconn1 / inetwiz
    Assistente de transferência de definições e de ficheiros = migwiz
    Assistente de transferência de ficheiros do Bluetooth = fsquirt
    Assistente para adicionar hardware = hdwwiz.cpl
    Calculadora= calc
    Centro de segurança do Windows = wscui.cpl
    Certificados = certmgr.msc
    Cliente Telnet = telnet
    Configuração de protocolo de Internet (apagar informações de DNS ) = ipconfig /flushdns
    Configuração de protocolo de Internet (Todas as conexões ) = ipconfig /release
    Configuração de protocolo de Internet (ver DNS ) = ipconfig /displaydns
    Configuração de protocolo de Internet (ver tudo) = ipconfig /all
    Configuração de protocolo de Internet (Modificar DHCP Class ID) = ipconfig /setclassid
    Configuração do IP = ipconfig
    Conjunto de politicas resultante (XP Prof) = rsop.msc
    Constas de utilizadores = nusrmgr.cpl
    Controladores de jogos = joy.cpl
    Definições da segurança local = secpol.msc
    Desfragmentador do disco = dfrg.msc
    Desliga o utilizador do Windows = logoff
    Editor de carácter privado = eudcedit
    Editor de configuração do sistema = sysedit
    Editor de registo = regedit / regedit32
    Encerramento do Windows = shutdown
    Explorador do Windows = explorer
    Ferramenta de diagnóstico do Direct X = dxdiag
    Ferramenta de importação de livro de endereços = wabmig
    Ferramenta de remoção de software malicioso Microsoft Windows = mrt
    Ferramentas administrativas = control admintools
    Firewall do Windows = firewall.cpl
    Fontes = fonts
    Gestão de computadores = compmgmt.msc
    Gestão de discos = diskmgmt.msc
    Gestor de dispositivos = devmgmt.msc
    Gestor de objectos – pacote = packager
    Gestor de partições do disco = diskpart
    Gestor de tarefas do Windows = taskmgr
    Gestor de utilitários = utilman
    Gestor de verificador de controladores = verifier
    HyperTerminal = hypertrm
    Iexpress Wizard = iexpress
    Impressoras e faxes = control printers
    Infra-estrutura de gestão do Windows = wmimgmt.msc
    Iniciar Windows Update = wupdmgr
    Itens a sincronizar = mobsync
    Internet Explorer = iexplore
    Introdução do Windows XP = tourstart
    Jogo de cartas Copas = mshearts
    Jogo de cartas FreeCell = freecell
    Jogo de cartas Spider Solitare = spider
    Jogo Minesweeper = winmine
    Ligação ao ambiente de trabalho remoto = mstsc
    Ligações de rede = ncpa.cpl / control netconnections
    Limpeza do disco = cleanmgr
    Linha de comandos = cmd
    Lista telefónica = rasphone
    Livro de endereços = wab
    Mapa de caracteres = charmap
    Marcador telefónico = dialer
    Microsoft Access (se instalado ) = access.cpl
    Microsoft Chat = winchat
    Microsoft Excel (se instalado ) = excel
    Microsoft Frontpage (se instalado ) = frontpg
    Microsoft Movie Maker = moviemk
    Microsoft Paint = mspaint
    Microsoft Powerpoint (se instalado ) = powerpnt
    Microsoft Word (se instalado ) = winword
    Nero (se instalado) = nero
    Netmeeting = conf
    Notepad = notepad
    Nview Desktop Manager (se instalado) = nvtuicpl.cpl
    Opções de acessibilidade = access.cpl
    Opções de pastas = control folders
    Opções regionais e de idioma = intl.cpl
    Outlook Express = msimn
    Painel de controlo = control
    Painel de controlo Direct X (se instalado) = directx.cpl
    Painel de controlo Java (se instalado) = jpicpl32.cpl
    Paint = pbrush
    Partilhas DDE = ddeshare
    Pasta de impressoras = printers
    ver pastas compartilhadas no cmd = "net share" ou compmgmt.msc graficamente
    Pastas partilhadas = fsmgmt.msc
    Pedidos do operador de armazenamento amovível = ntmsoprq.msc
    Performance Monitor = perfmon
    Performance Monitor = perfmon.msc
    Phone and Modem Options = telephon.cpl
    Pinball para Windows = pinball
    Politica de grupo (XP Prof) = gpedit.msc
    Power Configuration = powercfg.cpl
    Procura rápida (quando ligada) = findfast.cpl
    Propriedade des visualização = control color
    Propriedades da internet = inetcpl.cpl
    Propriedades de data e hora = timedate.cpl
    Propriedades de senhas = password.cpl
    Propriedades de som e dispositivos de áudio = mmsys.cpl
    Propriedades de visualização = control desktop/desk.cpl
    Propriedades do rato = main.cpl / control mouse
    Propriedades do sistema = sysdm.cpl
    Propriedades do teclado = control keyboard
    Protecção de base de dados do Windows = syskey
    Protecção de ficheiros do Windows (analisar em cada arranque) sfc /scanboot
    Protecção de ficheiros do Windows (analisar no próximo arranque) = sfc /scanonce
    Protecção de ficheiros do Windows (analisar) = sfc /scannow
    Protecção de ficheiros do Windows (repor configuração de fábrica) = sfc /revert
    Quicktime (se instalado) = QuickTime.cpl
    Real Player (se instalado) = realplay
    Scanners e câmaras = sticpl.cpl
    Serviço de indexação = ciadv.msc
    Serviços = services.msc
    Serviços componentes = dcomcnfg
    Tarefas agendadas = control schedtasks
    Teclado de ecrã = osk
    Tipos de letra = control fonts
    Tweak UI (se instalado ) = tweakui
    Utilitário de configuração do sistema = msconfig
    Utilitário de rede do cliente de SQL Server = cliconfg
    Utilitário de verificação de ficheiros do sistema = sfc
    Utilitário de verificação do disco = chkdsk
    Utilitário Dr. Watson para o Windows = drwtsn32
    Utilizadores e grupos locais = lusrmgr.msc
    Verificação de assinatura do ficheiro = sigverif
    Visualizador da área de armazenamento = clipbrd
    Visualizador de aplicações de java (se instalado) = javaws
    Visualizador de eventos = eventvwr.msc
    Windows Magnifier = magnify
    Windows Media Player = wmplayer
    Windows Messenger (Executar MSN) = msmsgs
    Windows XP Tour Wizard (Tour Windows) = tourstart
    Wordpad = write
