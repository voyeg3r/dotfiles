Fonte: [[http://crv.educacao.mg.gov.br/sistema_crv/index.asp?id_projeto=27&ID_OBJETO=51695&tipo=ob&cp=000000&cb=&n1=&n2=Biblioteca%20Virtual&n3=Cadernos%20de%20Inform%E1tica&n4=&b=s|Centro de Referência Virtual do professor]]

a2ps (any to PostScript) programa de conversão de vários tipos de arquivos
para o formato PostScript. O objetivo é a impressão de vários tipos de
arquivos, com opções como duas páginas por folha, pretty printing,
significando que determinados tipos de arquivos são impressos com regras de
impressão melhorando a legibilidade de programas por exemplo. Isto também é
conhecido como syntax highlight (destaque dos elementos sintáticos). Além
disso são impressas informações úteis como nome do arquivo, data etc.

Observação: Como já deve ter sido notado, muitos programas são identificados
como a2ps, ps2pdf etc. O «2» (two, pronunciado em inglês como to)
significando «para», ou seja a2ps (any to postScript, qualquer coisa para
PostScript), ps2pdf (PostScript to PDF, PostScript para PDF. O a2ps envia a
saída para a impressora (spooler de impressão na verdade). Para salvar a
saída deve-se utilizar as opções -o arquivo_ps ou --output=arquivo_ps


echo "teste" | a2ps -R  -1 -o teste.ps - && ps2pdf teste.ps; rm -f teste.ps


### opção para o cups-pdf

sudo dpkg-statoverride –update –add root root 4755 /usr/lib/cups/backend/cups-pdf
