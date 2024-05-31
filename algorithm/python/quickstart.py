#!/usr/bin/env python3
#  -*- coding: utf-8 -*-
#         vim: ai ts=4 sts=4 et sw=4
#    Filename: quickstart.py
#      Author: Sergio Araujo
#     Purpose: comment and like some posts on instagram
#              using InstPy
# Last Change: qui 09 jan 2020 13:31:38 -03
#     Created: qui 09 jan 2020 13:31:38 -03
#       email: <voyeg3r ✉ gmail.com>
#      Github: https://github.com/voyeg3r
#     twitter: @voyeg3r
#        site: https://dev.to/voyeg3r

# your credentials should be like:
# user = 'username'
# passoword = 'password'

import credentials
from instapy import InstaPy

insta_username = credentials.USERNAME
insta_password = credentials.PASSWORD

# if you want to run this script on a server,
# simply add nogui=True to the InstaPy() constructor
session = InstaPy(username=insta_username, password=insta_password)
session.login()

# set up all the settings
session.set_relationship_bounds(enabled=True,
				 potency_ratio=-1.21,
				  delimit_by_numbers=True,
				   max_followers=4590,
				    max_following=5555,
				     min_followers=45,
				      min_following=77)
session.set_do_comment(True, percentage=10)
# session.set_comments(['aMEIzing!', 'So much fun!!', 'Nicey!'])
session.set_comments(['Nice shot! @{}'], media='Photo')
session.set_dont_include(['friend1', 'friend2', 'friend3'])
session.set_dont_like(['pizza', 'girl'])

# do the actual liking
session.like_by_tags(['python_language', 'algorithm', 'nvim', 'coding'], amount=100)
# session.follow_user_followers(['michelycarv', 'samilacavalcantte', 'cris_biodesign'], amount=10, randomize=False, sleep_delay=60)

# end the bot session
session.end()
