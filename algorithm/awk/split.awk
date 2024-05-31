#!/usr/bin/env awk
# source: https://www.youtube.com/watch?v=FObjsz-7Wao
# Last Change: 2018 mar 14 09:06
#
# Purpuse: Demonstrate how to split a field in awk
#
# File example:
# 1 John Doe jonh@gmail.com
# 2 Mary Jonson maryjonson@yahoo.com

BEGIN {

        FS=" "
        OFS="\011\011"
        print "Fist", "Last", "Domain"

}

{

    split($4, DNS, "@")
    print $2, $3, DNS[2]

}
