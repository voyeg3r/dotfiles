#!/usr/bin/env python3
#  -*- coding: utf-8 -*-
#         vim: ai ts=4 sts=4 et sw=4
#    Filename: test.py
#      Author: Sergio Araujo
#     Purpose: simple selenium login at instagram
# Last Change: qui 09 jan 2020 12:36:30 -03
#     Created: qui 09 jan 2020 12:36:30 -03
#       email: <voyeg3r ✉ gmail.com>
#      Github: https://github.com/voyeg3r
#     twitter: @voyeg3r
#   Reference: https://stackoverflow.com/a/57513626/2571881

# OBS: the credentials.py should contain:
# username = "username"
# password = "password"
# this way you can separete your script from your credentials

import credentials
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from time import sleep
#Select the driver, In our case we will use Chrome.
webdriver = webdriver.Firefox()

sleep(2)

webdriver.get('https://www.instagram.com/accounts/login/?source=auth_switcher')
sleep(3)

username = webdriver.find_element_by_name('username')
username.send_keys(credentials.USERNAME)
password = webdriver.find_element_by_name('password')
password.send_keys(credentials.PASSWORD)

# instead of searching for the Button (Log In) you can simply press enter when
# you already selected the password or the username input element.
submit = webdriver.find_element_by_tag_name('form')
submit.submit()
