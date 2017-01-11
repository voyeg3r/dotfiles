### Introdução

o comando comm compara arquivos (ordenados) sorted files

How can I get all lines that are: in both of two files (set intersection) or in
only one of two files (set subtraction).

Use the comm(1) command.

# Bash
# intersection of file1 and file2
comm -12 <(sort file1) <(sort file2)
# subtraction of file1 from file2
comm -13 <(sort file1) <(sort file2)

### lines that are in file1 that not are in file2

comm -23 <(sort name-that-i-have.txt) <(sort nome-sige.txt)



