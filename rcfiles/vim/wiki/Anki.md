### O que é o Anki

    File:		 Anki.md
    Created:	 ter 10 jan 2017 12:50:12 BRT
    Last Change: ter 10 jan 2017 12:50:12 BRT
    Author:		 Sergio Araujo
    Site:		 http://vivaotux.blogspot.com
    e-mail:      <voyeg3r ✉ gmail.com>
    Twitter:	 @voyeg3r
    Github:      https://github.com/voyeg3r


E um programa de aprendizado baseado na repetição espaçada

### Decks que podem ser importados do site do anki

as 1000 primeiras frases em ingles
https://ankiweb.net/shared/info/2009669666

    Awesome TTS text to speech  301952613
    Bigger Show Answer Button  1867966335
    Expand and Collapse Decks 2554066128
    Flip cards with shortcut key "0". 844452602
    zoom 1956318463


### Como mudar a pasta padrão do anki
a referência para esta dica veio daqui:
http://danielhnyk.cz/change-default-folder-anki-space-repetition/

Basicamente o local para editar as preferências do anki é na
pasta:

    /usr/share/anki/aqt

Mas se pode fazer de outra forma também:

     crie em --> /usr/local/bin

 um arquivo  chamado 'anki', sem aspas contendo o seguinte:

    #!/usr/bin/bash
    /usr/bin/anki -b $HOME/docs/anki

   Depois atribua SETUID para o arquivo com o comando
   chmod a+sx anki

Outra solução possível seria:
Go to the folder where ANKI is installed, in my case:

    /usr/share/anki

Edit file in aqt folder called profiles.py, you have to find category Helpers and edit appropriate line (it depends which OS you use: Win, Mac, Linux..) you wish:

    def _defaultBase(self):
        if isWin:
        if False: #qtmajor >= 5:
        loc = QStandardPaths.writeableLocation(QStandardPaths.DocumentsLocation)
        else:
            loc = QDesktopServices.storageLocation(QDesktopServices.DocumentsLocation)
            return os.path.join(loc, "Anki")
            elif isMac:
            return os.path.expanduser("~/Documents/Anki")
            else:
            return os.path.expanduser("~/Anki")

    e.g I edited last line to this:

            return os.path.expanduser("~/edu/Anki")

            to change my default folder to ~/edu/Anki.

O Anki é um software de repetição espaçada, a Repetiação espaçada
surge como uma descoberta da Neurociência, é de conhecimento
científico que repetições em intervalos de tempo específicos
aumentam o nível de retenção do conhecimento. Nos foruns em Inglês
eles usam a Sigla SRS, ou spaced repetition system.

### Como instalar o Anki
No site do mairo vergara você encontrará um manual que
lhe mostra como instalar o Anki.
http://www.mairovergara.com/como-instalar-e-usar-o-anki/

### como anexar arquivos de audio aos flashcards

Esta parte é super importante pois o manual de instalação do Mairo
vergara não mostra, é com este simples passo que você se permitir
praticar de uma só vez vocabulário e pronúncia de uma forma
prática e eficiente

Para anexar audio aos seus flashcards do Anki coloque o audio
correspondente à sua frase na pasta:

    Meus Documentos\Anki\collection.media

Crie o seu deck (baralho) e na hora de adicionar uma frase
que tenha um audio relacionado use a seguinte notação:

    [sound:file.mp3]

Um cartão do anki com audio ficaria então assim:

This is the English phrase[sound:nome-do-audio.mp3]

Esta é uma frase em Inglês


