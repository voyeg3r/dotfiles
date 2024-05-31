#!/usr/bin/env python3
# # -*- coding: UTF-8 -*-"
# ------------------------------------------------
#   Creation Date:    05-03-2017
#     Last Change:  ter 29 nov 2016 09:21:52 BRT
#            File:  palindromo.py
#          author:  sergio luiz araujo silva
#            site:  http://vivaotux.blogspot.com
#         twitter:  @voyeg3r
# ------------------------------------------------

'''
Dizemos que um número natural n é palindromo se:
    O 1º algarismo de n é igual ao seu último algarismo,
    O 2º algarismo de n é igual ao penúltimo algarismo,
    e assim sucessivamente.

    pyctonic way to invert a number
    num = 5678
    num = int(str(num)[::-1])
    output --> 8765
'''

# -------------------------------------
#          ABORDAGEM PYTCONICA
# -------------------------------------


# def ispalindromo(n):
      ''' return True if a given number is palindrome'''
#     return n == int(str(n)[::-1])

#  def invertnum(n):
#      num = int(str(n)[::-1])
#      return num
#
#  def main():
#      num = int(input('Digite um número: '))
#      if num == invertnum(num):
#          print(f'{num} é palindromo.')
#      else:
#          print(f'{num} não é palindromo')
#
#  if __name__ == '__main__':
#          main()

## Another pyctonic way to do the same
# def ispalind(n):
#     if n == int(str(n)[::-1]):
#             print(f'{n} is palindrome')
#     else:
#             print(f'{n} is not palindrome')

### ------------------------------------
##         ABORDAGEM TRADICIONAL
### ------------------------------------

n = int(input("Digite de 4 dígitos ou mais: "))

aux, reverso = n, 0

while aux != 0:
    reverso = reverso * 10 + aux % 10
    aux //= 10

if reverso == n:
    print(f'{n} é palindromo')
else:
    print(f'{n} não é palindromo')
