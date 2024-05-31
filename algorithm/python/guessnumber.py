#!/usr/bin/env python3
#  -*- coding: utf-8 -*-
#         vim: ai ts=4 sts=4 et sw=4
#    Filename: guessnumber.py
#      Author: Sergio Araujo
#     Purpose: guess a number
#      source: https://www.w3resource.com/python-exercises/python-conditional-exercise-3.php

import random

def guess():
    target_num, guess_num = random.randint(1, 10), 0
    while target_num != guess_num:
        guess_num = int(input('Guess a number between 1 and 10 until you get it right : '))
    print('Well guessed!')

guess()
