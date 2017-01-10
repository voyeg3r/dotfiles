# A newbie tutorial on UNIX AWK utility

``` markdown
File:		 AwkNewieTutorial.md
Created:	 ter 10 jan 2017 13:16:16 BRT
Last Change: ter 10 jan 2017 13:16:11 BRT
Author:		 Sergio Araujo
Site:		 http://vivaotux.blogspot.com
e-mail:      <voyeg3r ✉ gmail.com>
Twitter:	 @voyeg3r
Github:      https://github.com/voyeg3r
```

source: http://unstableme.blogspot.com/2010/11/newbie-tutorial-on-unix-awk-utility.html

Sharing a few Awk one liners (very basic and random) which will help the Awk newbies to gain a quick confidence on one of the beautiful UNIX tools - Awk. Some of my recommendations for learning UNIX Awk are mentioned at the bottom of this post. Have a great time with Awk.

Meaning of some of the Awk Built-in Variables used below:


NF : Number of fields in current line/record
NR : Ordial number of current line/record
FS : Field Separator (Also -F can be used)
OFS : Output Field Separator (default=blank)
FILENAME : Name of current input file

    All of following Awk one liners are based on the following input file 'test1.txt'


    $ cat test1.txt
    Continent:Val
    AS:12000
    AF:9800
    AS:12300
    NA:3400
    OC:12000
    AF:500
    AS:1000

    A)

# Print 'line number' NR and 'Number of fields' NF for each line


    $ awk -F ":" '{print NR,NF}' test1.txt
    1 2
    2 2
    3 2
    4 2
    5 2
    6 2
    7 2
    8 2

    B)

# Print first field, colon delimited


    $ awk -F ":" '{print $1}' test1.txt
    Continent
    AS
    AF
    AS
    NA
    OC
    AF
    AS

    C)

# Same as B, but excluding the 'first line' (NR!=1)


    $ awk -F ":" 'NR!=1 {print $1}' test1.txt
    AS
    AF
    AS
    NA
    OC
    AF
    AS

    D)

# Same as B but only for line number 1 (NR==1)


    $ awk -F ":" 'NR==1 {print $1}' test1.txt
    Continent

    E)

# Print first and second field


    $ awk -F ":" 'NR!=1 {print $1,$2}' test1.txt
    AS 12000
    AF 9800
    AS 12300
    NA 3400
    OC 12000
    AF 500
    AS 1000

    F)

# Setting output field separator as pipe


    $ awk -F ":" 'BEGIN{OFS="|"} NR!=1 {print $1,$2}' test1.txt
    AS|12000
    AF|9800
    AS|12300
    NA|3400
    OC|12000
    AF|500
    AS|1000

    G)

# FS and OFS can be included in BEGIN section


    $ awk 'BEGIN{FS=":"; OFS="|"} NR!=1 {print $1,$2}' test1.txt
    AS|12000
    AF|9800
    AS|12300
    NA|3400
    OC|12000
    AF|500
    AS|1000

    H)

# Anything on BEGIN executes first


    $ awk 'BEGIN{FS=":"; OFS="|"; print "Con|SomeVal"} NR!=1 {print $1,$2}' test1.txt
    Con|SomeVal
    AS|12000
    AF|9800
    AS|12300
    NA|3400
    OC|12000
    AF|500
    AS|1000

    I)

# Printing FILENAME, will be printed for all the lines


    $ awk -F ":" '{print FILENAME}' test1.txt
    test1.txt
    test1.txt
    test1.txt
    test1.txt
    test1.txt
    test1.txt
    test1.txt
    test1.txt

# Same as above but printing only last instance using END clause


    $ awk -F ":" ' END {print FILENAME}' test1.txt
    test1.txt

    J)

# Revisiting NF, number of fields in each line


    $ awk -F ":" '{print NF}' test1.txt
    2
    2
    2
    2
    2
    2
    2
    2

    K)

# Printing the last field of the file, same as printing $2 as there are only 2 fields


    $ awk -F ":" '{print $NF}' test1.txt
    Val
    12000
    9800
    12300
    3400
    12000
    500
    1000

    L)

# Matching, printing lines begin with "AS"


    $ awk -F ":" '/^AS/' test1.txt
    AS:12000
    AS:12300
    AS:1000

#'Not condition' of the L


    $ awk -F ":" '!/^AS/' test1.txt
    Continent:Val
    AF:9800
    NA:3400
    OC:12000
    AF:500

# Direct matching, first field as "AS"


    $ awk -F ":" '$1=="AS"' test1.txt
    AS:12000
    AS:12300
    AS:1000

    $ awk -F ":" '$1=="AS" {print $2}' test1.txt
    12000
    12300
    1000

#$0 prints the full line, same as {print}


    $ awk -F ":" '$1=="AS" {print $0}' test1.txt
    AS:12000
    AS:12300
    AS:1000

    $ awk -F ":" '$1=="AS" {print}' test1.txt
    AS:12000
    AS:12300
    AS:1000

    M)

# 'Or' condition


    $ awk -F ":" '$1=="AS" || $1=="OC" {print}' test1.txt
    AS:12000
    AS:12300
    OC:12000
    AS:1000

# 'Or' and 'AND' together


    $ awk -F ":" '($1=="AS" || $1=="OC") && $NF > 11000 {print}' test1.txt
    AS:12000
    AS:12300
    OC:12000

    $ awk -F ":" '($1=="AS" || $1=="OC") && $NF > 11000 {print $2-10000}' test1.txt
    2000
    2300
    2000

    $ awk -F ":" '($1=="AS" || $1=="OC") && $NF > 11000 {print ($2-($2%100))}' test1.txt
    12000
    12300
    12000

    N)

# Partial Matching


    $ awk -F ":" '$1 ~ /AS/ {print}' test1.txt
    AS:12000
    AS:12300
    AS:1000

    $ awk -F ":" '$1 ~ /A/ {print}' test1.txt
    AS:12000
    AF:9800
    AS:12300
    NA:3400
    AF:500
    AS:1000

    O)

# Reading from STDOUT


    $ cat test1.txt | awk -F ":" '!/Continent/ {print $1}' | sort | uniq
    AF
    AS
    NA
    OC

    P)

# Add value 1000 to the 2nd field, where first field is "AF" and then print the output file


    $ awk -F ":" '$1=="AF" {$2+=1000} {print}' test1.txt
    Continent:Val
    AS:12000
    AF 10800
    AS:12300
    NA:3400
    OC:12000
    AF 1500
    AS:1000

# As no OFS is mentioned above, by default, OFS is blank, specifying it now


    $ awk -F ":" 'BEGIN {OFS=":"} $1=="AF" {$2+=1000} {print}' test1.txt
    Continent:Val
    AS:12000
    AF:10800
    AS:12300
    NA:3400
    OC:12000
    AF:1500
    AS:1000

    Q)

# Sum of 2nd fields, exclude first line


    $ awk -F ":" 'NR!=1 {sum+=$NF} END {print sum}' test1.txt
    51000

# If END is not mentioned ?


    $ awk -F ":" 'NR!=1 {sum+=$NF} {print sum}' test1.txt
    12000
    21800
    34100
    37500
    49500
    50000
    51000

# Average of 2nd field, as first field is excluded, (NR-1) instead of NR for total number of items


    $ awk -F ":" 'NR!=1 {sum+=$NF} END {print sum/(NR-1)}' test1.txt
    7285.71

    $ awk -F ":" 'NR!=1 && $1=="AS" {sum+=$NF} END {print sum}' test1.txt
    25300

    R) 'Group by' and 'Count' using associative array in awk


    $ awk ' BEGIN {FS=OFS=":"}
    NR==1 {print "Continent:Count:Sum(val)"}
    NR>1 {a[$1]++;b[$1]=b[$1]+$2} END{for (i in a) print i,a[i],b[i]}' test1.txt

Continent:Count:Sum(val)
    OC:1:12000
    NA:1:3400
    AF:2:10300
    AS:3:25300

# Count of each of the continents(1st field)


    $ awk -F ":" '
    NR==1 {next}
    NR>1 {a[$1]++} END{for (i in a) print i,a[i]}' test1.txt
    OC 1
    NA 1
    AF 2
    AS 3

# An alternative


    $ awk -F ":" 'NR!=1 {print $1}' test1.txt  | sort | uniq -c
    2 AF
    3 AS
    1 NA
    1 OC

# Reading from STDOUT


    $ cat test1.txt | awk 'BEGIN {OFS=":"} {print NR-1,$0}'
    0:Continent:Val
    1:AS:12000
    2:AF:9800
    3:AS:12300
    4:NA:3400
    5:OC:12000
    6:AF:500
    7:AS:1000

    S)

# Accessing external variable in awk:


    $ awk -F ":" '$1=="AS" {print $2}' test1.txt
    12000
    12300
    1000

# Suppose value of filterval is "AS"


    $ filterval="AS"
    $ echo $filterval
    AS

# Accessing value of variable filterval inside Awk


    $ awk -F ":" -v con=$filterval '$1==con {print $2}' test1.txt
    12000
    12300
    1000

# Set 2nd value as 0 where first field is "AS"


    $ awk -F ":" 'BEGIN {OFS=":"} $1=="AS" {$2=0} {print}' test1.txt
    Continent:Val
    AS:0
    AF:9800
    AS:0
    NA:3400
    OC:12000
    AF:500
    AS:0

    My recommendation for AWK:

    -
    A complete tutorial on AWK from vectorsite

    -
    Awk One line page

    - Peteris Krumins has done a great job by explaining each and every one lines in details, a must read :
    part1part2

    Related posts from my blog:
    - A post on awk substr function
    - Difference between awk NR and FNR variables
