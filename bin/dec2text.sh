#!/bin/bash
#function dec2text() {
###### number --- convert decimal integer to english words
# total number
# Usage:	dec2text 1234 -> one thousand two hundred thirty-four
# Author: Noah Friedman <friedman@prep.ai.mit.edu>

prog=`echo "$0" | sed -e 's/[^\/]*\///g'`
garbage=`echo "$*" | sed -e 's/[0-9,.]//g'`
if test ".$garbage" != "."; then
  echo "$prog: Invalid character in argument." 1>&2
fi
case "$*" in
# This doesn't always seem to work.
#   *[!0-9,.]* ) echo "$prog: Invalid character in argument." 1>&2; ;;
   *.* ) echo "$prog: fractions not supported (yet)." 1>&2; ;;
   '' ) echo "Usage: $prog [decimal integer]" 1>&2; ;;
esac
result=
eval set - "`echo ${1+\"$@\"} | sed -n -e '
  s/[, ]//g
  s/^00*/0/g
  s/\(.\)\(.\)\(.\)$/\"\1 \2 \3\"/
  :l
  /[0-9][0-9][0-9]/{
     s/\([^\" ][^\" ]*\)\([^\" ]\)\([^\" ]\)\([^\" ]\)/\1\"\2 \3 \4\"/g
     t l
  }
  /^[0-9][0-9][0-9]/s/\([^\" ]\)\([^\" ]\)\([^\" ]\)/\"\1 \2 \3\"/
  /^[0-9][0-9]/s/\([^\" ]\)\([^\" ]\)/\"\1 \2\"/
  /^[0-9]/s/^\([^\" ][^\" ]*\)/\"\1\"/g;s/\"\"/\" \"/g
  p'`"
while test $# -ne 0 ; do
  eval `set - $1;
        d3='' d2='' d1=''
        case $# in
          1 ) d1=$1 ;;
          2 ) d2=$1 d1=$2 ;;
          3 ) d3=$1 d2=$2 d1=$3 ;;
        esac
        echo "d3=\"$d3\" d2=\"$d2\" d1=\"$d1\""`
  val1='' val2='' val3=''
  case "$d3" in
    1 ) val3=one   ;;     6 ) val3=six   ;;
    2 ) val3=two   ;;     7 ) val3=seven ;;
    3 ) val3=three ;;     8 ) val3=eight ;;
    4 ) val3=four  ;;     9 ) val3=nine  ;;
    5 ) val3=five  ;;
  esac
  case "$d2" in
    1 ) val2=teen   ;;    6 ) val2=sixty   ;;
    2 ) val2=twenty ;;    7 ) val2=seventy ;;
    3 ) val2=thirty ;;    8 ) val2=eighty  ;;
    4 ) val2=forty  ;;    9 ) val2=ninety  ;;
    5 ) val2=fifty  ;;
  esac
  case "$val2" in
    teen )
      val2=
      case "$d1" in
        0 ) val1=ten      ;;     5 ) val1=fifteen   ;;
        1 ) val1=eleven   ;;     6 ) val1=sixteen   ;;
        2 ) val1=twelve   ;;     7 ) val1=seventeen ;;
        3 ) val1=thirteen ;;     8 ) val1=eighteen  ;;
        4 ) val1=fourteen ;;     9 ) val1=nineteen  ;;
      esac
     ;;
    0 ) : ;;
    * )
      test ".$val2" != '.' -a ".$d1" != '.0' \
       && val2="${val2}-"
      case "$d1" in
        0 ) val2="$val2 " ;;     5 ) val1=five  ;;
        1 ) val1=one      ;;     6 ) val1=six   ;;
        2 ) val1=two      ;;     7 ) val1=seven ;;
        3 ) val1=three    ;;     8 ) val1=eight ;;
        4 ) val1=four     ;;     9 ) val1=nine  ;;
      esac
     ;;
  esac
  test ".$val3" != '.' && result="$result$val3 hundred "
  test ".$val2" != '.' && result="$result$val2"
  test ".$val1" != '.' && result="$result$val1 "
  if test ".$d1$d2$d3" != '.000' ; then
    case $# in
       0 | 1 ) ;;
       2 ) result="${result}thousand "          ;;
       3 ) result="${result}million "           ;;
       4 ) result="${result}billion "           ;;
       5 ) result="${result}trillion "          ;;
       6 ) result="${result}quadrillion "       ;;
       7 ) result="${result}quintillion "       ;;
       8 ) result="${result}sextillion "        ;;
       9 ) result="${result}septillion "        ;;
      10 ) result="${result}octillion "         ;;
      11 ) result="${result}nonillion "         ;;
      12 ) result="${result}decillion "         ;;
      13 ) result="${result}undecillion "       ;;
      14 ) result="${result}duodecillion "      ;;
      15 ) result="${result}tredecillion "      ;;
      16 ) result="${result}quattuordecillion " ;;
      17 ) result="${result}quindecillion "     ;;
      18 ) result="${result}sexdecillion "      ;;
      19 ) result="${result}septendecillion "   ;;
      20 ) result="${result}octodecillion "     ;;
      21 ) result="${result}novemdecillion "    ;;
      22 ) result="${result}vigintillion "      ;;
      * ) echo "Error: number too large (66 digits max)." 1>&2; ;;
    esac
  fi
  shift
done
set $result > /dev/null
case "$*" in
  '') set zero ;;
esac
echo ${1+"$@"}
# number ends here
#}
