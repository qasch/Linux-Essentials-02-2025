# Übungen zu Textströmen und Redirects in Linux

> [!NOTE]
> Hilfe zum Thema Redirects findet ihr in der Manpage der BASH unter dem Abschnitt `REDIRECTION`. Zugegebenermassen ist das alles recht technisch und tiefgehend, aber interessant. Und die gewünschten Informationen lassen sich schon finden...

### 1. Erstellen einer Datei mit `echo` und `>`
Verwendet `echo`, um einen kurzen Text in eine Datei `echo-ausgabe.txt` zu schreiben. Was passiert, wenn ihr anschliessend einen anderen Text auf gleiche Art und Weise in dieselbe Datei umleitet?

### 2. Erstellen einer Datei mit `echo` und `>>`
Leitet nun eine weitere Ausgabe von `echo` an die Datei `echo-ausgabe.txt` um. Verwendet diesmal aber den doppelten Redirect `>>`. Wie unterscheidet sich das Verhalten von `>` und `>>`?

Können wir mit `>>` auch genau wie mit `>` eine Datei erzeugen?

### 3. Umleiten der Standardausgabe in eine Datei
Erzeugt ein neues Verzeichnis mit dem Namen `redirects` und wechselt hinein. Erstellt darin ein oder zwei Testdateien mit `touch`.

1. Leitet die Ausgabe des Kommandos `ls` (ohne Optionen) in die Datei `dateien.txt` um. Prüft anschliessend den Inhalt der Datei. 
Ist die Ausgabe die gleiche, die das Kommando `ls` produziert? Was fällt euch auf? Welche Dateinamen sind in `dateien.txt` enthalten? Was könnt ihr daraus über die Arbeitsweise der Redirects schliessen?
2. Können wir nur die Ausgabe von Kommandos ohne Optionen und Argumente umleiten? Versucht, von euren aktuellen Verzeichnis aus eine detaillierte Liste (`-l`) aller Dateien unter `/etc` in die Datei `inhalt-etc.txt` zu schreiben.

### 4. Umleiten der Standardfehlerausgabe in eine Datei
Probiert ein Kommando aus, das einen Fehler erzeugt. Übergebt z.B. `ls` einen Dateipfad, der nicht existiert und leitet die Fehlermeldung in die Datei `ls-fehler.txt` um.

### 5. Umleiten der Standardausgabe und Standardfehlerausgabe in verschiedene Dateien
Leitet die normale Ausgabe eines Kommandos in `ausgabe.txt` und die Fehlermeldungen in `fehler.txt` um.

Dies könnt ihr erreichen, in dem ihr z.B. `ls` sowohl ein existierendes als auch ein nicht existierendes Verzeichnis übergebt. 
```bash
ls existing-dir non-existing-dir
```
Erstellt dazu ggf. ein Verzeichnis mit dem Namen `existing-dir` mit ein paar Dateien darin. Das Verzeichnis `non-existing-dir` sollte auf eurem System **nicht** vorhanden sein.

### 6. Umleiten der Standardausgabe und Standardfehlerausgabe in dieselbe Datei
Führet ein Kommando aus, das sowohl die normale Ausgabe als auch die Fehlermeldungen in `ausgabe-und-fehler.log` speichert.

Gibt es dafür meherer Möglichkeiten? Welche bzw. wie viele findet ihr heraus bzw. könnt ihr euch herleiten?

### 7. Umleiten des Standardeingabekanals
Erstellt für diese Übung eine CSV-Datei mit folgendem Inhalt:
```csv
vorname, name, kommentar
kai, schell, trainer
gretl, hund, hund
```
Eine CSV-Datei (*Comma-Separated Values*) ist eine textbasierte Datei, in der Daten tabellarisch gespeichert sind. Jede Zeile entspricht einer Datenreihe, und die Werte innerhalb einer Zeile sind durch ein Trennzeichen (meist `,` oder `;`) getrennt.

Wir wollen unsere Datei jetzt so umbauen, dass wir das Semikolon als Trennzeichen benutzen. Hierfür ist das Tool `tr` nützlich, mit welchem wir Zeichen löschen oder *übersetzen* bzw. *ersetzen* können.

Nach einem Blick in die Manpage von `tr` stellen wir jedoch fest, das `tr` keine Datei als Parameter akzeptiert. Wir müssen `tr` die Datei also über `stdin`, den Standardeingabekanal reichen.

Versucht das doch mal. 

Prüft anschliessend, ob die Änderungen, die `tr` gemacht hat, auch wirklich in die Datei übernommen wurden. Falls nicht - wie könnt ihr trotzdem eine Datei erhalten, die Semikolons anstatt Kommas als Trennzeichen nutzt?

## Weiterführende Übungen

### 8. Umleitung an `>/dev/null`
Führt ein Kommando aus und leitet die Ausgabe nach `/dev/null` um. Wofür könnte dies nützlich sein?

### 9. Kommando `tee`
Öffnet die Manpage zum Kommando `tee` und informiert euch darüber. Wofür könnte dieses Kommando nützlich sein und wie funktioniert es? Was sind die Unterschiede zu den Redirects `>` und `>>`?

### 10. Überprüfung, wann eine Datei geleert wird
Erstelle eine Datei `test.txt` mit dem Inhalt `hallo`. Führe dann `cat test.txt > test.txt` aus, um den Inhalt von `test.txt` erneut in `test.txt` zu schreiben. Hier sollte doch jetzt auch `hallo` drin stehen. Warum nicht? Was ist passiert?

### 11. Fehlersuche: Leeren einer Datei durch Umleitung
Was passiert, wenn du `> datei.txt` ohne ein vorhergehendes Kommando ausführst? Warum passiert das? Könnte das sogar auch irgendeinen Nutzen haben?

### 12. Reihenfolge der Redirects testen
Wenn wir sowohl den Standardausgabekanal als auch den Standardfehlerkanal in dieselbe Datei leiten wollen, sollte doch folgendes möglich sein:
```bash
ls somedir/ not-existant-dir 2>&1 > datei.txt
```
Wir leiten hier doch zuerst `stdout` nach `stdin` um und dann `stdin` in die Datei. Warum klappt das nicht? Wie ist die korrekte Syntax?

### 13. Datei mit Redirects erstellen
Erstellt eine Datei `i-am-and-it-is.txt` (ohne Editor, nur über Redirects) mit folgendem Inhalt:
```bash
Hallo, ich bin <username> und heute ist der <dd.mm.JJJJ>, es ist <hh:mm>.
```
Nutzt dafür `echo`, `date`, eine Systemvariable und Redirects. Löst die Aufgabe ruhit in 3 Schritten, nicht auf einmal.

## Profi Übungen

### 14. Verwendung von `exec` zur Umleitung

Führt einmal folgendes Kommando in einer Shell aus:
```bash
exec > ~/exec-ausgabe.txt
```
Es scheint nichts zu passieren. Tippt nun `whoami` ein. Hm, keine Ausgabe. Vielleicht klappt ja `ls`? Auch nicht? Eieiei. Öffnet eine weitere Shell und führt dort folgendes Kommando aus `tail -f ~/exec-ausgabe.txt`.

Wechselt nun zurück in die Shell, in der ihr `exec > ~/exec-ausgabe.txt` ausgeführt habt und führt weitere Kommandos aus. Was beobachtet ihr in der anderen Shell mit `tail`? Könnt ihr euch das erklären? Wie bringen wir die Shell dazu, wieder die Ausgabe von Kommandos anzuzeigen? Probiert vielleicht einaml `exec /dev/tty`. Puuh...

### 15. Nutzung von Descriptoren zur Umleitung
Experimentiert mit Datei-Deskriptoren (`3>`, `4>`), um zusätzliche Umleitungen zu erstellen und den Inhalt in mehrere Dateien zu schreiben.

1. Leitet den Filedesciptor 3 auf die Datei `output.txt` um:
```bash
exec 3> output.txt
```
Leitet nun die Ausgabe eines Kommandos an den Filedesciptor 3 um.

2. Leitet File Descriptor 3 an die Datei `stdout.log` und File Descriptor 4 an `stderr.log` um. Erzeugt jeweils eine Meldung mit `echo` an File Descriptor 3 und File Descriptor 4.

Schliesst die File Desciptoren wieder mit:
```bash
exec 3>&- 4>&-  # Beide Deskriptoren schließen
```

