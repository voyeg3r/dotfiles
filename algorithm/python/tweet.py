#!/usr/bin/python
# tweet.py
# usage:
# tweet.py message
#
# inpired by: 

import sys 
from os import popen

def tweet( message, user, password ):
  print 'posting %s for %s' % (message, user)
 
  url = 'http://twitter.com/statuses/update.xml' 
  curl = 'curl -s -u %s:%s -d status="%s" %s' % (user,password,message,url)

  pipe = popen(curl, 'r')

if __name__ == '__main__':
  if len(sys.argv) != 2:
    print "Usage: tweet.py <message>"
    sys.exit()

  message = sys.argv[1]
  if len(message) > 140:
    print "Message too long"
    sys.exit()

  user = raw_input('Username: ')
  password = raw_input('Password: ')

  tweet(message, user, password)
