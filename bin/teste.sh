#!/bin/bash

   if [ $# -ne 2 ]; then
         echo "uso: $0 arquivo1 arquivo2" 
         sleep 2
         exit 1 
   fi

   echo 
   echo "================================="
   echo " você digitou dois parâmetros"
   echo " sendo que o primeiro foi $1"
   echo " e o segundo foi $2"
   echo "================================="


