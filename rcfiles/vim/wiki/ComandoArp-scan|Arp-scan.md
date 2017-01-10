#  Como pegar o ip de uma máquina pelo MAC?

`Last Change:  ter 10 jan 2017 18:10:33 BRT
`

#### Instale o arp-scan e use assim:

``` sh
rode como root!
arp-scan -l | awk '/00:40:a7:0d:cf:fb/ {print $1}'
```


#### Como pingar em um MAC ADDRESS?
Se você já sabe qual o MAC ADDRESS fica fácil, instale o arp-scan e faça como abaixo

``` sh
ping -c 2 `arp-scan 10.1.1.0/24 | awk '/00:1b:11:dc:a9:65/ {print $1}'`
```
