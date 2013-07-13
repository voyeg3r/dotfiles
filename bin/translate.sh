#!/usr/bin/env bash
#  gtranslate.sh
#  Translate using Google Translate Ajax API:
#  http://ajax.googleapis.com/ajax/services/language/translate?v=1.0 \
#  &langpair=en|es&q=hello+world
#  More Info: http://code.google.com/apis/ajaxlanguage/documentation/
#  ksaver (at identi.ca), March 2010.
#  Licence: Public Domain Code.

progname=$(basename $0)

if [ -z "$3" ]
then
	echo -e "Usage:   $progname lang1 lang2 'string of words to translate...'"
	echo -e "Example: $progname en es 'Hello World!'\n"
	exit
fi

FROM="$1"
TO="$2"

# Google Translate Ajax API Url
TRANSURL='http://ajax.googleapis.com/ajax/services/language/translate?v=1.0'
LANGPAIR="$FROM|$TO"
shift 2

# Parse string to translate, change ' ' to '+'
# STRING: String to translate.
STRING="$@"
PSTRING=$(echo "$STRING" |tr ' ' '+')

# Get translation
RESPONSE=$(/usr/bin/env curl -s -A Mozilla \
		$TRANSURL'&langpair='$LANGPAIR'&q='$PSTRING)

echo -n "$progname> "
# Parse and clean response, to show only translation.
echo "$RESPONSE" |cut -d ':' -f 3 |cut -d '}' -f 1
