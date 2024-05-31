#!/usr/bin/env python3
# esse programinha gera senhas randomicas
# de comprimento que varia de 8 a 12 caracteres
# incluindo Letras maiúsculas, minúsculas, dígitos, e pontuação

import string
import random

def randompassword():
  chars = string.ascii_uppercase + string.ascii_lowercase + string.digits + string.punctuation
  size = random.randint(8, 12)
  print(''.join(random.choice(chars) for x in range(size)))

randompassword()
