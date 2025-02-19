# Übungen zu Berechtigungen unter Linux

>[!NOTE]
> Um die Übungen richtig durchführen zu können, könnte es sein, dass ihr die Berechtigungen auf euer Home-Verzeichnis anpassen müsst. Falls es nicht möglich ist, mit einem anderen User in das Verzeichnis zu wechseln, schaut euch die Berechtigungen auf das Verzeichnis mit `ls -ld $HOME` an und versucht zu verstehen, warum das so ist.
> Um dies dennoch möglich zu machen, könnte das Kommando `chmod 755 $HOME` hilfreich sein.
>
> Ihr könnt fast jedem Kommando die Option `-v` übergeben. Probiert das doch auch hier mal aus, um genauer zu sehen, was passiert.

## **Übung 1: Rechte einer Datei anzeigen**
Erstellt die Datei `datei.txt` und prüft die Berechtigungen mit `ls -l`.

🔹 Was bedeuten die einzelnen Zeichen in der Ausgabe?

## **Übung 2: Berechtigungen ändern**
Fügt der Datei Schreibrechte für die Gruppe hinzu.

🔹 Ist hier die symbolische oder die oktale Rechtevergabe sinnvoller? Warum?

## **Übung 3: Berechtigungen setzen**
Setze die Berechtigungen der Datei `datei.txt` auf `rw-r-----`.

🔹 Ist hier die symbolische oder die oktale Rechtevergabe sinnvoller? Warum?

## **Übung 4: Ausführrechte für ein Skript setzen**
Erstellt eine neue Datei mit dem Namen `script.sh`.

Sorgt nun dafür, dass die Datei die folgenden Berechtigungen erhält:

- Der Besitzer darf die Datei *lesen* und *schreiben*
- Mitglieder der Gruppe der Datei dürfen die Datei nur `lesen`
- Alle anderen haben *keine Zugriffsrechte* auf die Datei

Öffnet die Datei nun mit einem Editor und fügt folgenden Inhalt hinzu:
```bash
#!/bin/bash
echo Ich bin ein Script!
```
Glückwunsch, ihr habt nun ein Script erstellt. Versucht es mit folgendem Kommando auszuführen:
```bash
./script.sh
```
Ihr solltet nun eine Fehlermeldung erhalten. Welches Recht könnte hier fehlen? Fügt der Datei das entsprechende Recht hinzu und versucht sie erneut auszuführen.

## **Übung 5: Verzeichnisse und ihre Berechtigungen**
Was passiert mit `r`, `w` und `x` auf Verzeichnisse?
```bash
mkdir testdir
chmod 400 testdir
cd testdir
```
🔹 Welche Fehlermeldung tritt auf und warum?

## **Übung 6: Unterschied zwischen Datei- und Verzeichnisrechten**
Erstellt eine Datei `testfile` im Verzeichnis `testdir` und schreibt mit einem Editor oder über einen Redirect etwas hinein. Weist diese Datei mit dem Kommando `sudo chown <otheruser> testdir/testfile` einem anderen Benutzer zu. Mit `<otheruser>` ist ein beliebiger anderer User auf eurem System gemeint, welcher sich anmelden kann und die BASH als Login-Shell verwendet. 

Versucht, nun mit eurem regulären User erneut etwas in diese Datei zu schreiben. Funktioniert das noch?

Könnt ihr diese Datei denn trotzdem **löschen**? Obwohl die einem anderen User gehört? Warum?

## **Übung 7: Rekursive Änderung von Berechtigungen**
Erstellt ein Verzeichnis mit Namen `permissions` und  erstellt darin drei Dateien `file1`, `file2` und `file3`. Sorgt nun dafür, dass alle Dateien im Verzeichnis `permissions` *schreibbar* für andere sind. Wendet das Kommando `chmod` also auf das gesamte  **Verzeichnis** inklusve Inhalt an.

## **Übung 8: Rekursive Änderung von Berechtigungen**
Wir wollen nun erreichen, dass alle im Verzeichnis enthaltenen Dateien die Berechtigungen `640` erhalten. Führt nun das Kommando `chmod -R 640 permissions` aus. Prüft anschliessend die Berechtigungen mit `ls -l permissions`. 

🔹 Was ist passiert?

## **Übung 9: Typische Fehlerquelle – Kein Ausführrecht auf Verzeichnis**
Verstehen, warum `ls` nicht funktioniert, wenn `x` fehlt.
```sh
chmod -x testdir
ls testdir
```
🔹 Was passiert und warum?

## **Übung 10: credentials Datei erstellen**
Erstellt die Datei `credentials.txt` mit dem Inhalt `ganz doll geheim` und sorgt dafür, dass deren Inhalt von niemnaden ausser euch selbst mehr gelesen oder verändert werden darf. Probiert das im Anschluss mit einem anderen Benutzer aus.

## Übung 11: Datei ohne Schreibrechte löschen
Erstellt mit dem Kommando `echo hallo > protected.txt` eine Datei mit Inhalt. Ändert nun die Berechtigungen so, dass nur noch der Besitzer der Datei Leserechte hat. Am schnellsten geht das mit dem Kommando `chmod 400 protected.txt`. Prüft ob ihr das `echo` Kommando erneut ausführen könnt. 

🔹 Könnt ihr den Inhalt der Datei noch lesen? 
🔹 Könnt ihr die Datei denn löschen? Probiert es aus mit `rm protected.txt`.

## Übung 12: Oktale Rechtevergabe
Erstellt die Datei `oktal.test` und führt folgendes Kommando aus `chmod 42 oktal.test` aus. Prüft anschliessend die Berechtigungen mit `ls -l`.

🔹 Was fällt euch auf? Was lernt ihr daraus, wie die oktale Rechtevergabe funktioniert?
