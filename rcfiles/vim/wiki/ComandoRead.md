### Introdução
O comando abaixo guarda a senha sem exibi-la

  echo -n "Digite sua senha: "
  read -s senha


### bash - Preenchimento de variáveis
**//Colaboração: Rubens Queiroz de Almeida//**
**//fonte: http://www.dicas-l.com.br/print/20091228.html//**
**//Data de Publicação: 28 de December de 2009//**
Uma dica interessante, para formatar variáveis em shell.
Tomando como exemplo o CEP (Código de Endereçamento Postal), que tem dois componentes, o CEP e seu complemento.

      read -n 5 -p "CEP: " cep; read -n 3 -p"-" comp


Será ecoado para a tela o valor "CEP: ". Ao digitar os números, ao se chegar ao
quinto dígito, será ecoado na tela o caractere "-", quando então se deverá
digitar o complemento do CEP (o que vem depois do "-"). O valor do CEP fica
armazenado na variável "$cep" e na variável "$comp", será armazenado o
complemento.  A diretiva "-n" sinaliza ao comando read quantos caracteres devem
ser lidos. A diretiva "-p" especifica o prompt a ser ecoado para a tela, em
nosso caso, a string "CEP: ". Logo em seguida é encadeado outro comando read,
com função e diretivas similares.  //Observação: Acho que eu peguei esta dica
em uma das palestras do [[http://www.julioneves.com/|Júlio Neves]], o nosso
Papai do Shell, mas não me lembro quando nem onde :-(//