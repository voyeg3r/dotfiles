### Introdução
Filtra pacotes na rede (sniffer)
O ngrep possui um amplo conjunto de argumentos permitindo diversas maneiras de coleta de tráfego e filtragem utilizando expressões regulares.

# ngrep -h
usage: ngrep <-hNXViwqpevxlDtTRM> <-IO pcap_dump> <-n num> <-d dev> <-A num>
<-s snaplen> <-S limitlen> <-W normal|byline|single|none> <-c cols>
<-P char> <-F file>
-h is help/usage
-V is version information
-q is be quiet (don't print packet reception hash marks)
-e is show empty packets
-i is ignore case
-v is invert match
-R is don't do privilege revocation logic
-x is print in alternate hexdump format
-X is interpret match expression as hexadecimal
-w is word-regex (expression must match as a word)
-p is don't go into promiscuous mode
-l is make stdout line buffered
-D is replay pcap_dumps with their recorded time intervals
-t is print timestamp every time a packet is matched
-T is print delta timestamp every time a packet is matched
-M is don't do multi-line match (do single-line match instead)
-I is read packet stream from pcap format file pcap_dump
-O is dump matched packets in pcap format to pcap_dump
-n is look at only num packets
-A is dump num packets after a match
-s is set the bpf caplen
-S is set the limitlen on matched packets
-W is set the dump format (normal, byline, single, none)
-c is force the column width to the specified size
-P is set the non-printable display char to what is specified
-F is read the bpf filter from the specified file
-N is show sub protocol number
-d is use specified device instead of the pcap default

Irei explicar alguns dos mais importantes argumentos:

# ngrep -d eth0 -W byline port 80
A opção:-d = diz de qual interface de rede será feita a captura. Para todas as interfaces usar o valor any (qualquer)
-W = Diz qual será o formato da saida, byline interpreta os caracteres especiais, podendo visualizar melhor o texto capturado. Entre as opções teremos normal, single e none.
port = Captura o tráfego de uma determinada porta..

# ngrep -wi "user|pass" port 21
Exibe todos os pacotes de todas as interfaces cuja o tráfego existe na porta 21 (FTP pra TCP), e que contenha as palavras user OU pass no seu interior.
