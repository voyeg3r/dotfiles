# Arquivo: Dicas sobre ambientes de trabalho no linux

```
Criado: Sáb 11/Ago/2012 hs 11:14
Last Change: ter 10 jan 2017 13:20:30 BRT
autor: Sérgio Luiz Araújo Silva
site: http://vivaotux.blogspot.com
twitter: http://www.twitter.com/voyeg3r
email: <voyeg3r ✉ gmail.com>
```

### altere o modo de escalonamento dos discos para desempenho

fonte ibm develop networks: http://www.readability.com/articles/q2jiwjfe

#### Escalonadores de disco

O kernel Linux oferece diversos algoritmos de escalonamento de disco. Um
escalonador de disco é necessário para o sistema decidir quais dados buscar
no(s) disco(s) rígido(s), de que forma buscá-los e como tratar buscas
concomitantes, do tipo "busque os primeiros 10 KB do arquivo arq1.txt na
partição sda2 e o binário /usr/bin/firefox em sda6".

Nas versões mais recentes do kernel, as opções de algoritmos de escalonamento
(também chamados simplesmente de "escalonadores") são três: cfq (completely
fair queue, ou fila completamente justa), deadline (prazo final) e noop (nenhum
algoritmo).

O escalonador padrão na maioria das distribuições GNU/Linux é o cfq, que tem
como objetivo ser o mais justo possível, distribuindo os acessos a disco por
todos os processos de forma igualitária. No caso de servidores, o cfq é, sem
dúvida, o mais adequado, pois evita que os processos (mesmo que apenas alguns)
fiquem sem acesso aos discos.

O escalonador deadline tem foco na reordenação dos pedidos de acesso a disco
para reduzir sua latência. Porém, ele não garante que todos os processos tenham
igual latência ou sequer iguais prioridades no acesso ao disco. Em desktops,
o deadline tende a oferecer melhor desempenho.

O escalonador noop é adequado apenas para dispositivos SSD (solid-state
device), que não sofrem de variação nos tempos de busca. Como o noop é apenas
uma fila do tipo FIFO (first in, first out, ou "o primeiro a chegar
é o primeiro a sair"), ele se encaixa bem nas propriedades dos SSDs e reduz
o processamento necessário para o escalonador decidir quais requisições de
acesso a disco devem ser atendidas primeiro. Contudo, em discos giratórios,
evite o noop ao máximo.

Para conferir o escalonador de um disco (sda, no exemplo):

      $ cat /sys/block/sda/queue/scheduler
      noop deadline [cfq]

Para conferir o escalonador de todos os discos:

      $ cat /sys/block/*/queue/scheduler

Para alterar o escalonador de um disco (novamente sda, no exemplo) — note que
é preciso ser root:

    # echo deadline > /sys/block/sda/queue/scheduler

Feito isso, confira se a alteração foi feita:

      $ cat /sys/block/sda/queue/scheduler
      noop [deadline] cfq


### alterando o dpi (resolução)
# fonte: http://www.vivaolinux.com.br/dica/Ubuntu-1204-com-Gnome-3-Tunando-a-Aparencia-com-Temas-e-Ferramentas/
gsettings set org.gnome.desktop.interface text-scaling-factor 0.9

### local das extensoes
visiting this site just click on button to install extensions
on gnome-shell
https://extensions.gnome.org/

http://www.fpmurphy.com/gnome-shell-extensions/

    ~/.local/share/gnome-shell/extensions/

### links
http://www.techdrivein.com/2011/11/8-things-i-did-after-installing-gnome.html

### in my computer the best workspaces is gnome shell

   sudo apt-fast install gnome-shell

### set number of workspaces on gnome-shell

    gsettings set org.gnome.desktop.wm.preferences num-workspaces 4
    gsettings set org.gnome.shell.overrides dynamic-workspaces false

### install gnome-sushi

GNOME Sushi is a simple file preview application for GNOME. GNOME Sushi lets
you take a peek into files and folders quickly and easily. After installing
GNOME Sushi, all you need to do is, select the file you want to preview and hit
space bar.

       sudo apt-fast install gnome-sushi


# função para o bashrc para mudar o papel de parede
    # adapte para o crontab
    chwall () {
    # change img folder according to their system
    gsettings set org.gnome.desktop.background picture-uri file://`ls ~/Imagens/wallpapers/* | shuf | tail -1`
    }
