#!/usr/bin/env python
# -*- coding: UTF-8 -*-
###
# o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o
# 0    0
# o   Usage : python megaupload-dl [list files] o
# 0 0
# o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o0o
#
###

import cookielib, urllib, urllib2
import time, sys
import subprocess
import re
import os
import ConfigParser

try:
    import pygtk
    pygtk.require("2.0")
    import gtk
    with_gtk = True
except ImportError:
    with_gtk = False



def log(text):
    """Prints a message with the local time and date."""
    date = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(time.time()))
    print "[%s] - %s" % (date, text)

def from_megaupload(url):
    """Check if this is a megaupload link"""
    return (url.startswith("megaupload.com") or
            url.startswith("www.megaupload.com") or
            url.startswith("http://megaupload.com") or
            url.startswith("http://www.megaupload.com"))


class redirectManager(urllib2.HTTPRedirectHandler):
    """Used to manage the redirects we can find when the user selected direct
    downloads at Megaupload"""
    def __init__(self):
        self.redirect = ""

    def http_error_301(self, req, fp, code, msg, headers):
        """Executed when we find a 301 redirect"""
        result = urllib2.HTTPRedirectHandler.http_error_301(self, req, fp, code, msg, headers)
        result.status = code
        self.redirect = result.geturl()
        return result

    def http_error_302(self, req, fp, code, msg, headers):
        """Executed when we find a 302 redirect"""
        result = urllib2.HTTPRedirectHandler.http_error_302(self, req, fp, code, msg, headers)
        result.status = code
        self.redirect = result.geturl()
        return result



# There needs to be at least one argument
if len(sys.argv) < 2:
    print "Too few arguments"
    print "Try --help for more information"
    exit()


# Get the login info from the config file, or ask for it
if os.environ.has_key("APPDATA") and os.path.exists(os.environ["APPDATA"]):
    path = os.environ["APPDATA"] + "/megaupload-dl.ini"
else:
    path = os.path.expanduser("~") + "/.megaupload-dl"

if not os.path.exists(path):
    user = raw_input("Enter your user name: ")
    password = raw_input("Enter your password: ")
    print
else:
    cfg = ConfigParser.SafeConfigParser()
    cfg.readfp(file(path))
    try:
        user = cfg.get("Login", "user")
        password = cfg.get("Login", "password")
    except (ConfigParser.NoOptionError, ConfigParser.NoSectionError):
        print "The config file is corrupt"
        user = raw_input("Enter your user name: ")
        password = raw_input("Enter your password: ")
        print
        os.remove(path)


# Process the arguments
if sys.argv[1] == "-h" or sys.argv[1] == "--help":
    print "megaupload-dl http://megaupload.com/?d=FILE1 ... http://megaupload.com/?d=FILEN"
    print "  Download one or several megaupload links passed as argument\n"

    print "megaupload-dl http://some-web-site.com"
    print "  Download a list of links from an URL\n"

    print "megaupload-dl links.txt"
    print "  Download a list of links from a file\n"

    print "megaupload-dl -c"
    print "  Download a list of links from the clipboard (PyGTK has to be installed)\n"
    exit()

from_file = False
urls = []
if os.path.exists(sys.argv[1]):    # If this is a file
    from_file = True
    l_file = sys.argv[1]
    log("Reading list of links from the file %s" % l_file)
    print "\n"
    list_f = file(l_file, "r")
    urls = list_f.readlines()
    list_f.close()
elif sys.argv[1].startswith("http://"):    # If this is a URL
    if from_megaupload(sys.argv[1]):
        for i in range(1, len(sys.argv)):
            urls.append(sys.argv[i])
    else:
        log("This is not a Megaupload URL. Trying to retrieve links from " + sys.argv[1])
        try:
            source = "\n".join(urllib.urlopen(sys.argv[1]).readlines())
        except IOError:
            print "Operation timed out"
            exit()
        urls_source = re.findall('megaupload\.com/\?d=[\w]{8}', source)
        urls_source += re.findall('megaupload\.com/[\w]{2}/\?d=[\w]{8}', source)
        for url in urls_source:
            url = "http://" + url + "\n"
            if not url in urls:
                urls.append(url)
        print
        if urls:
            log("I found %s links. Saving to megauploadtmp.txt" % len(urls))
            l_file = "megauploadtmp.txt"
            list_f = file(l_file, "w")
            list_f.write("".join(urls))
            list_f.close()
            from_file = True
            print urls
            print
        else:
            log("I found 0 links.")
            exit()
elif sys.argv[1] == "-c" or sys.argv[1] == "--clipboard":
    if not with_gtk:
        print "PyGTK is not available in your system. This feature cannot be used"
        exit()
    else:
        log("Trying to retrieve links from the clipboard")
        clipboard = gtk.clipboard_get()
        text = clipboard.wait_for_text()
        urls_source = re.findall('megaupload\.com/\?d=[\w]{8}', text)
        for url in urls_source:
            url = "http://" + url + "\n"
            if not url in urls:
                urls.append(url)
        print
        if urls:
            log("I found %s links. Saving to megauploadtmp.txt" % len(urls))
            l_file = "megauploadtmp.txt"
            list_f = file(l_file, "w")
            list_f.write("".join(urls))
            list_f.close()
            from_file = True
            print urls
            print
        else:
            log("I found 0 links.")
            exit()
else:
    print "%s is not a valid argument." % sys.argv[1]
    print "Please use a URL or URLs from Megaupload, a file with a list of Megaupload URLs, or the address of a site with Megaupload URLs."
    print "If this is a URL, please ensure that it starts with http://"
    print "If this is a file, please ensure that it exists"
    exit()


# Log in to get the cookie
cred = urllib.urlencode({"login": user, "password": password})
req = urllib2.urlopen("http://megaupload.com", cred)
cookie = req.headers.get("set-cookie", "")

if cookie:
    (cookie,_) = cookie.split(";",1)
    log("Logged in as %s" % user)
    print
    if not os.path.exists(path):
        config = "[Login]\n"
        config += "user = %s\n" % user
        config += "password = %s\n" % password
        config_file = open(path, "w")
        config_file.write(config)
        config_file.close()
else:
    log("Invalid user name or password")
    exit()


# Download the files
current = urls
errors = ""
for url in urls:
    try:
        if url[:-1] == "\n":
            url = url[:-1]

        parts = url.split("/")
        if len(parts) > 4:
            url = "http://megaupload.com/" + parts[-1]

        print url

        req = urllib2.Request(url)
        req.add_header("Cookie", cookie)
        req.add_header("User-Agent", "Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.6) Gecko/20061201 Firefox/2.0.0.8 (Ubuntu-gutsy)")
        gr = redirectManager()
        opener = urllib2.build_opener(gr)
        source = opener.open(req)

        if gr.redirect and url != gr.redirect:
            # If this is a redirect, the user selected Direct Downloads at Megaupload's preferences
            # so we can download the file already
            real_url = gr.redirect
        else:
            # If this is not a redirect, we have to look for the direct download link
            source = source.read()

            prefixes = re.findall("document.getElementById\(\"download_html\"\).innerHTML = '<a href=\"http://www(\d*).*</a>", source)
            if prefixes:
                prefix = prefixes[-1]
            else:
                log("This file cannot be downloaded")
                errors = errors + current[0]
                current = current[1:]
                print "\n\n"
                continue

            real_url = re.findall("document.getElementById\(\"downloadhtml\"\).innerHTML = '<a href=\"http://www\d*\.(.*)\" class=\"downloadlink\"", source)[0]
            real_url = "www" + prefix + "." + real_url
            real_url = urllib.quote(real_url)

        if from_file:
            current = current[1:]
            list_f = file(l_file, "w")
            list_f.writelines(real_url)
            list_f.close()
            log("List updated")

        print "\n\n"
    except KeyboardInterrupt:
        print "\n\nBye"
        exit()
    except ValueError:
        log("This doesn't look like an url. We won't get its direct links\n\n")
        if from_file:
            errors = errors + current[0]
            current = current[1:]
    except urllib2.URLError, e:
        log("URLError, we can't get the direct links\n\n")
        print e
        if from_file:
            errors = errors + current[0]
            current = current[1:]
    except:
        log("Unexpected error.")
        raise

if errors:
    log("The following links could not be got")
    print errors
else:
    log("All links were got")

log("Finished")




Edit this page (if you have permission) |
Google Docs -- Web word processing, presentations and spreadsheets.



