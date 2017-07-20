### Introdução
Este comando recodifica caracteres entre formatos. Para recodificar de utf-8 para iso faça:

    recode -d u8..l1 arquivo   (mais adequador para arquivos latex)

    recode iso-8859-15..utf8 file_to_change.txt	Latin9 (western europe) para utf8

    recode utf8..iso-8859-15 file_to_change.txt

    recode u8..pc file
    recode mac..pc


