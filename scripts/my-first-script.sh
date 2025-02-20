#!/bin/bash

#set -x

# Mein Name ist Kai und ich mag Linux
# Mein Name ist Michaela und ich liebe Linux

if test $# -ge 2 ; then
  echo "Mein Name ist $1 und ich $2 Linux."
else
  echo "Dem Skript müssten bitte zwei Argumente übergeben werden."
  exit 1
fi

if [ $# -gt 2 ]; then
  echo "Dem Skript wurden folgende Argumente übergeben: $@"
fi

echo "Ich schreibe gerade ein Skript mit dem Namen $0"
echo "Diesem Skript wurden insgesamt $# Argumente übergeben."
echo
echo "Ich befasse mich mit einigen Standardvariablen, die für's Skripting genutzt werden."
echo 'Unter anderem "$?" welches den Exit-Code zurückgibt.'
echo
echo "Und Verzweigungen!"
echo

echo -e "Und Loops!\n"
echo "Und Arrays!"
echo
echo "Ich möchte alle Dateien in diesem Verzeichnis auflisten und ausgeben und durchnummerieren."
echo

COUNTER=1
for FILE in $(ls)
do
  echo $COUNTER $FILE
  (( COUNTER++ ))
done
