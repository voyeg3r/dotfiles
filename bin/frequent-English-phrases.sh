#!/usr/bin/env bash
# =================================================
# CREATED:          Sáb 29/Dez/2012 hs 10:25
# LAST CHANGE:      2012 Dez 29 10:25:13
# THIS SCRIPT AIMS: describe here
# AUTHOR:           Sérgio Luiz Araújo Silva
# SITE:             http://vivaotux.blogspot.com
# TWITTER:          @voyeg3r
# SKYPE:            sergioaraujosilva
# =================================================

# site: http://www.english-for-students.com/Frequently-Used-Sentences.html

for ((i=1;i<=60;i++)){

    echo criando o arquivo $(printf "%03d" ${i})
    lynx -dump http://www.english-for-students.com/Frequently-Used-Sentences-${i}.html > file-$(printf "%03d" ${i}).txt

}
