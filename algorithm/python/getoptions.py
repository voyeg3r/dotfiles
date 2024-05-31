#!/usr/bin/env python3
# # -*- coding: UTF-8 -*-"
# ------------------------------------------------
#   Creation Date:    01-03-2017
#     Last Change: ter 29 nov 2016 09:21:52 BRT
# this script aim:  help you to learn how to get parameters
#          author:  sergio luiz araujo silva
#            site:  http://vivaotux.blogspot.com
#         twitter:  @voyeg3r
# ------------------------------------------------

import os
import sys
import sys, getopt

# Returns the script name without complete path
script_name = os.path.basename(__file__)

def main(argv):
    inputfile = ''
    outputfile = ''
    try:
        opts, args = getopt.getopt(argv,"hi:o:",["ifile=","ofile="])
    except getopt.GetoptError:
        print (script_name , ' -i <inputfile> -o <outputfile>')
        sys.exit(2)
    for opt, arg in opts:
            if opt == '-h':
                print (script_name ,' -i <inputfile> -o <outputfile>')
                sys.exit()
            elif opt in ("-i", "--ifile"):
                inputfile = arg
            elif opt in ("-o", "--ofile"):
                outputfile = arg
    print ('Input file is "', inputfile)
    print ('Output file is "', outputfile)

if __name__ == "__main__":
    main(sys.argv[1:])
