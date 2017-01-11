Arquivo: plugin tabular
Criado: Seg 24/Jan/2011 hs 13:18
Last Change: dom 08 jan 2017 12:03:32 BRT
autor: Sérgio Luiz Araújo Silva
site: http://vivaotux.blogspot.com
twitter: http://www.twitter.com/voyeg3r

veja essa discussão no stackoverflow
http://stackoverflow.com/questions/4796721/

O plugin tabular faz tabulações de modo bem interessante no vim


    one = 1
    two = 2
    three = 3
    four = 4

    :Tab /=<Enter>

var video = {
metadata: {
       title: "Aligning assignments"
       h264Src: "/media/alignment.mov",
       oggSrc: "/media/alignment.ogv"
       posterSrc: "/media/alignment.png"
       duration: 320,
     }
}

    :Tab /:\zs<Enter>

Para tabular o trecho abaixo

width: 215px;
height: 22px;
margin-top: 3px;
background-color: white;
border: 1px solid #999999;


:Tab /:\zs

width:             215px;
height:            22px;
margin-top:        3px;
background-color:  white;
border:            1px solid #999999;


### como alinhar isto 

    john,betty,wally,beth
    walter,george,thomas,john
    herbert,bob,petty,mick`

Para ficar assim:

    john,     etty,   ally,   beth
    walter,   eorge,  homas,  john
    herbert,  ob,     etty,   mick`

Basta usar:

  :Tabularize /,zs


