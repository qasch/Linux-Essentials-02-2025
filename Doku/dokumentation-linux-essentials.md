# Dokumentation Linux Essentials

## Kommandos

### Aufbau von Kommandos:
```
<kommando> [-<kurzoption>]... [<argument>]...
<kommando> [--<langoption>]... [<argument>]...
```
Erklärung zur obigen Syntax (angelehnt an Manpages):

- `[  ]` was in eckigen Klammern steht, ist **optional** -> wir können also Optionen oder Argumente übergeben, **müssen** es aber nicht
- `...` die drei Punkte bedeuten, dass auch mehrere Optionen oder Argumente übergeben werden können

>[!NOTE]
> Es macht fast immer keinen Unterschied, ob wir die Option(en) vor oder nach den Argumenten schreiben:
> ```bash
> rm -r somedir
> rm somedir -r
>```

#### Beispiele
```
ls -l               # Übergabe der Option -l
ls /etc             # Übergabe des Arguments /etc
ls -la              # Übergabe mehrerer Optionen
ls -la /etc /home   # Übergabe mehrerer Optionen und Argumente
```
### Grundlegende Kommandos

- `whoami` gibt den aktuellen Benutzer aus
- `pwd` gibt das aktuelle Verzeichnis aus
- `cat` gibt den Inhalt einer Datei auf der Kommandozeile aus
- `less` ist ein sogenannter *Pager*: gibt den Inhalt einer Datei aus, mit der Möglichkeit zu scrollen, zu suchen etc. (Benutzung siehe Manpages)
- `history` zeigt alle bisher eingegebenen Kommandos inkl. eines Indexes an (s.u.)
- `ls` zeigt den Inhalt von Verzeichnissen an
- einige Optionen von `ls`:
  - `ls -a` ignoriert keine Einträge, die mit einem Punkt beginnen -> zeigt auch "versteckte" Dateien an
  - `ls -l` zeigt ausführliche Details zu den Dateien an
- `su` *Substitue User* -> Benutzer wechseln
  - `su -l root` eine Shell mit Root-Rechten öffnen
- `exit` beendet die aktuell laufende Shell 
- `clear` *leert* die Seite, so dass unser *Prompt* sich ganz oben befindet, wir können aber auch die Tastenkombination `STRG+L` verwenden


- `init 6` -> reboot -> Erklärung später...


## Hilfe auf der Kommandozeile

### Manpages

*Manual Pages*: eine Art Handbuch zu einzelnen Kommandos, mit Erklärungen zur Syntax, allen Optionen, teilweise Beispielen etc.

- `man <kommando>` 
- z.B. `man ls` Handbuchseite zum Kommando `ls`
- Suche in den Manpages: Eingabe von `/` gefolgt vom Suchbegriff, z.B. `/-l` sucht nach der Option `-l`
- zum nächsten Suchbegriff mit `n`
- zum vorherigen Suchbegriff mit `N`
- Manpage schliessen mit `q`
- zum Anfang der Manpage springen mit `g`
- ans Ende mit `G`

### Help

*Kurzhilfe* zu einem Kommando durch Übergabe der Option `--help` -> `ls --help`

## History

Eine Liste aller bisher eingegebenen Kommandos

- Blättern durch die History mit den Pfeiltasten oder `STRG+P` bzw. `STRG+N`
* gezielt ein bestimmtes Kommando aufrufen:
- nach Eingabe von `history` Aufruf von `!<index>` -> `<index>` ist der Index des Kommandos

## SSH

Baut eine Verbindung zu einem entfernten Rechner auf bzw. startet eine Shell auf dem entfernten Rechner.
```
ssh <user>@<ip-adresse>
ssh tux@192.168.10.33
```
Um die Verbindung aufbauen zu können, brauchen wir folgende Informationen:

- IP-Adresse des entfernten Rechners
- Username und Passwort eines dort existierenden Benutzers

## Dateioperationen

### Verzeichnisse erstellen

Mit dem Kommando `mkdir` (*make directory*) können wir Verzeichnisse erstellen.
```bash
mkdir <name-des-verzeichnisses>
mkdir <pfad-zum-verzeichniss>
```
### Dateien erstellen

Dateien können auf vielfältige Art und Weise erstellt werden. Ein einfacher Weg, leere Dateien zu erstellen, ist mit dem Kommando `touch`.
```bash
touch <name-der-datei>
touch <name-der-datei-1> <name-der-datei-2> ...
touch <pfad-zur-datei>
```
Dateien können aber auch z.B. mit einem Editor wie `nano` erstellt werden.
```bash
nano <name-der>
```
### Editor nano

`nano` ist ein einfacher Editor, der auf den meisten Linux Distributionen vorinstalliert ist. Als Hilfe zur Bedienung wird unten ein Menü mit Tastenkürzeln angezeigt. Hier bedeutet das Zeichen `^` die Taste `STRG`.

Einige wichtige Tastenkombinationen:

- `STRG+O` Datei speichern unter...  (Name kann/muss angegeben werden)
- `STRG+S` Datei speichern (unter dem gleichen Namen)
- `STRG+X` Editor verlassen (bei ungespeicherten Änderungen werden wir gefragt, ob wir diese speichern möchten)

### Dateien und Verzeichnisse kopieren

Dateien und Verzeichnisse können mit dem Kommando `cp` (*copy*) kopiert werden.
```bash
cp <quelle> <ziel>
cp <pfad-zur-quelle> <pfad-zum-ziel>
```
**Vorsicht:** Wenn wir eine bestehende Datei als Ziel angeben, wird die Zieldatei **ohne Nachfrage** ersetzt und nicht etwas der Inhalt der Quelldatei an die Zieldatei angefügt.

Beim Kopieren von Verzeichnissen müssen wir an die Option `-r` (*rekursiv*) denken. 
```bash
cp -r <quellverzeichnis> <zielverzeichnis>
```
Der Grund ist, dass ein Verzeichnis nicht leer ist, die Kopieraktion also wiederholt/rekursiv ausgeführt werden muss.

### Dateien und Verzeichnisse löschen

Dateien und Verzeichnisse können mit dem Kommando `rm` (*remove*) gelöscht werden.

Analog zum Kopieren von Verzeichnissen müssen wir auch beim Löschen von Verzeichnissen die Option `-r` angeben.

> [!NOTE] 
> Dies gilt übrigens für sehr viele Kommandos: funktioniert die Anwendung eines Kommandos auf eine Datei, nicht aber auf ein Verzeichnis, so feht oft einfach nur die Option `-r`.

```bash
rm <pfad-zur-datei>
rm -r <pfad-zum-verzeichniss>
```
>[!NOTE]
> Wenn wir eine Datei löschen, so löschen wir nicht die Datei an sich. Wir entfernen lediglich den Dateinamen bzw. Pointer auf die Daten der Datei auf dem Speichermedium. Dieser Bereich im Speicher wird dann als wieder überschreibbar gemeldet.
>
> Die Daten könnten also solange keine weitere Schreiboperation auf diesen Speicherbereich erfolgt ist wiederhergestellt werden.

### Dateien und Verzeichnisse verschieben / umbenennen

Dateien und Verzeichnisse können mit dem Kommando `mv` (*move*) verschoben und umbenannt werden.

Beim Verschieben von Verzeichnissen dürfen wir die Option `-r` *nicht* angeben. Der Grund dafür ist, dass beim Verschieben nicht wie vielleicht angenommen eine Art *ausschneiden* und *einfügen* stattfindet, sondern wie beim Löschen lediglich der Dateiname ersetzt wird. 

Es muss also keine rekursive Operation auf dem Speichermedium stattfinden. Das ist auf unten stehendender Illustration vielleicht besser zu erkennen.
```bash
mv <quelle> <ziel>
mv <quellverzeichnis> <zielverzeichnis>
mv <alter-name> <neuer-name>
```
### Illustration kopieren, löschen, verschieben

![illustration-cp-rm-mv](./images/cp-mv-rm.png)

### relative und absolute Pfadangaben

Immer wenn wir eine Dateioperation durchführen, müssen wir den Pfad (eine Art *Wegbeschreibung*) zu der jeweiligen Datei angeben. Diese Angabe können wir auf zwei unterschiedliche Arten und Weisen machen: *relativ* oder *absolut*.

#### relative Pfadangaben

Eine *relative Pfadangabe* beschreibt den Weg ausgehend vom **aktuellen Standort** (aktuelles Verzeichnis) im Dateisystem.
```bash
cp somefile Somedir/
```
##### spezielle Verzeichniseinträge (Special Directory Entries) . und ..

- Sie gehören zur Kategorie der relativen Pfadangaben (Relative Pathnames)
- Sie werden auch als *Pseudodirektoren* (Pseudo-Directories) bezeichnet
- Manchmal nennt man sie auch *Implizite Links* oder *Selbstreferenzierende Einträge*
- Formal sind sie aber einfach reguläre Einträge im Dateisystem, die bei jedem Verzeichnis automatisch vorhanden sind.

- `.` (Punkt) symbolisiert das aktuelle Verzeichnis
- `..` (doppelter Punkt) symbolisiert das übergeordnete Verzeichnis (Parent Directory)

#### absolute Pfadangaben

Eine *absolute Pfadangabe* beschreibt den Weg ausgehend von der Wurzel `/` (bzw. `\` in Windows) des Dateisystembaums.
```bash
cp /home/tux/somefile /home/tux/Somedir
```
Absolute Pfadangaben können wir immer daran erkennen, dass das erste Zeichen des Pfades ein Slash `/` ist.

Einzige Ausnahme ist die Tilde `~`, welche den absoluten Pfad zum Heimatverzeichnis des aufrufenden Benutzers symbolisiert. Folgende Pfadangaben sind identisch:
```bash
cd ~/Somedir
cd /home/tux/Somedir
```
### Alles ist eine Datei

"Alles ist eine Datei" ist ein zentrales Konzept in Unix/Linux, das bedeutet, dass nahezu alle Ressourcen im System – einschließlich regulärer Dateien, Verzeichnisse, Geräte, Prozesse und Sockets – über das Dateisystem als Datei abstrahiert werden. Dadurch können viele Systemkomponenten über einheitliche Schnittstellen (z. B. Dateioperationen wie `open`, `read`, `write`) angesprochen werden.

### Pattern Matching

Ein *Pattern* ist ein *Muster*, bzw. ein *Platzhalter* welches auf eine Zeichenfolge passt, so dass wir damit z.B. nach Dateien bzw. Pfadangaben suchen können (mit entsprechenden Kommandos).

Wir können in einem *Pattern* bestimmte Sonderzeichen verwenden, um dieses allgemeingültiger zu machen:

*Globbing Characters:*

- `*` (*Asterisk*) -> Steht für beliebige Zeichen, welche beliebig oft vorkommen können (auch keinmal)
- `?` -> Steht für jedes beliebige Zeichen welches, **exakt** einmal vorkommt

Weitere Möglichkeiten für Pattern Matching:

- `!(pattern)` Exkludiert das angegebene Pattern (in dem Pattern dürfen auch wieder die oben angegebenen *Globbing Characters* vorkommen

Beispiele:
```bash
rm *.jpg       # löscht alle Dateien mit der Endung .jpg
ls datei?.txt  # zeigt nur Dateien an, bei denen nach der Zeichenfolge datei noch ein weiteres beliebiges Zeichen folgt und die die Endung .txt haben
mv !(o*) ../somdir/    # verschiebt alle Dateien des aktullen Verzeichnisses nach ../somedir, ausser Dateien, die mit einem o beginnen
```
## Aliase

Aliase sind selbstdefinierte Abkürzungen für Kommandos mit Optionen. Wir verwenden Aliase z.B. für häufig verwendete Kommandos mit Optionen oder auch Argumenten wie Pfadangaben.

Das Kommando `alias` an sich zeigt alle in der aktullen Shell gültigen Aliase an.

### Definition von Aliasen
```bash
alias <name-des-aliases>='<kommando> -<option> <argument>'
alias la='ls -a'
alias rm='rm -i'
alias somedir='cd ~/path/to/specific/dir/'
```
Wenn wir Aliase einfach so auf der Kommandozeile definieren, sind diese nur in der aktullen Shell gültig. Wollen wir Aliase persistent definieren (für alle neu geöffneten Shells bzw. auch nach einem Reboot), so müssen wir die Definition in dafür vorgesehene Dateien eintragen.

Dieses Konzept gilt nicht nur für Aliase, sondern generell für die Konfiguration unseres Systems.

Aliase werden z.B. direkt in der Datei `~/.bashrc` oder besser noch in der Datei `~/.bash_aliase` definiert (wenn wir als Shell die BASH verwenden).

## Subshells

Innerhalb einer laufenden Shell können weitere Shells gestartet werden. Dies sind sogenannte *Subshell* oder *Kindshells*. Diese können entweder aktiv, z.B. durch die Eingabe des Kommandos `bash` gestartet werden, Subshells werden aber auch oft gestartet, ohne dass wir dies aktiv machen.

Es ist wichtig zu wissen, dass z.B. Aliase und Variablen *nicht* in Subshells vererbt werden!

Subshells begegnen uns ziemlich oft - z.B. werden Kommandos, Funktionen, Skripte usw. in Subshells ausgeführt, auch wenn wir davon direkt gar nichts mitbekommen.

Auch beim Wechsel in einen anderen Benutzeraccount wird eine Subshell mit den Berechtigungen dieses Benutzers gestartet.

Wir können uns einen Überblick über die momentan laufenden Shells bzw. Subshells mit dem Kommando `ps` verschaffen.

#### Ausgabe aller Prozesse des Benutzers, die mit einem Terminal verbunden sind
```bash
ps -a
```
## Variablen

### Umgebungsvariablen / Environment Variables

Sind systemweit gültig, enthalten wichtige Informationen, damit unser System wie gewünscht funktioniert, bestimmte Kommandos greifen auf diese Variablen zurück. Umgebungsvariablen werden nach Konvention komplett in Grossbuchstaben geschrieben.

Einige Beispiele:
```bash
$HOME       # Heimatverzeichnis des aktuellen Benutzers
$PWD        # absoluter Pfad des aktuellen Verzeichnisses
$USER       # Login Name des aktuellen Benutzers
$SHELL      # Shell des aktuellen Benutzers
$PATH       # Liste der Verzeichnisse, die nach ausführbaren Dateien durchsucht werden, so dass wir diese ohne eine Pfadangabe aufrufen können
```
Systemvariablen können unterschiedliche Werte enthalten, je nachdem welcher Benutzer angemeldet ist. 

### Shellvariablen / Shell Variables

Sind nur gültig in der aktuellen Shell, können vom Benutzer selbst definiert werden. Werden *nicht* automatisch in Subshells vererbt, es sei denn sie werden mit dem Kommando `export` exportiert.
```bash
foo=bar         # weist der Variablen foo den Wert bar zu
export foo      # macht die Variable foo auch in Subshells gültig
export hallo=huhu # weist der Variablen hallo den Wert huhu zu und macht diese in Subshells gültig
```
### Variablensubstitution

Bei der Variablensubstitution wird der Name der Variablen mit dem in ihr hinterlegten Wert ersetzt.

```bash
echo $foo       # gibt den Wert der Variablen foo aus
echo ${foo}     # gibt den Wert der Variablen foo aus
```

### Kommandosubstitution

Durch die *Kommandosubstitution* können wir Variablen die Ausgabe eines Kommandos zuweisen. Genauer gesagt wird eine *Subshell* gestartet, in welcher das Kommando ausgeführt wird.
```bash
aktuelles_datum=$(date)
aktuelles_datum=`date`     # veraltete Syntax
```
### Rechnen mir Variablen / Arithmetic Operations

Wir können auch einfache Rechenoperationen in der BASH durchführen:
```bash
zahl1=3
zahl2=4
summe=$(( zahl1 + zahl2 ))
summe=$((zahl1+zahl2))
let summe = $zahl1 + $zahl2 
```
## Escaping / Maskieren von Sonderzeichen
Bestimmte Zeichen haben eine Sonderbedeutung für die BASH. Das wohl wichtigste Sonderzeichen ist das *Leerzeichen*: 

> Das Leerzeichen ist ein Sonderzeichen. Das Leerzeichen ist das **Trennzeichen**.

Weitere Sonderzeichen sind:
```bash
*       # Asterisk
?       
#       # Kommentarzeichen
$       # Subsitution
!       # History Expansion
\       # Backslash
'
''
```
Sonderzeichen können durch das sogenannte *Escaping* oder *Maskieren* ihrer Sonderbedeutung entledigt werden, so dass sie von der Shell wie reguläre Satzzeichen behandelt werden.

Zum Maskieren gibt es drei verschiedene Wege:

1. Maskieren mit dem Backslash `\`: Der Backslash maskiert (nur) das **direkt darauffolgende** Zeichen

2. Maskieren mit einfachen Hochkommata `'`: Einfache Hochkommata maskieren **jedes** in ihnen eingeschlossene Zeichen.

3. Maskieren mit doppelten Hochkommata `"`: Doppelte Hochkommata maskieren **fast** alle in ihnen eingeschlossene Zeichen, nicht aber das Dollarzeichen `$`, Backticks `\`` für die Kommandosubstitution und der Backslash `/` vor bestimmten Zeichen.

## Archivierung und Komprimierung

### Archivierung mit `tar`

*Archivierung* bezeichnet das Zusammenfassen **mehrerer** Dateien und Verzeichnisse in eine **einzige** Datei, ohne zwingende Kompression. Dadurch bleibt die ursprüngliche Struktur der Dateien erhalten, so können mehrere Dateien einfacher gespeichert oder übertragen werden.

Unter Linux wird das Kommando `tar` (*Tape Archiver*) zur Archivierung verwendet. `tar` ist ein sehr altes Programm und die Syntax (freundlich ausgedrückt) etwas gewöhnungsbedürftig. Kurzoptionen haben oft keine direkte Entsprechung zu den Langoptionen.

Ein `tar`-Archiv kann man sich mit dem Kommando `cat` anzeigen lassen:

![Ausgabe tar Archiv mit cat](./images/ausgabe-tar-archiv-mit-cat.png)

> [!NOTE]
> Alle numerischen Angaben hier sind im *Oktalformat*. Dies hat historische Gründe. Möchte man den Zeitstempel umrechnen, kann man sich von der BASH helfen lassen:
> ```bash
> echo $(( 8#14757403716 ))
> ```

Einige wichtige Optioenen zu `tar`:
#### Archiv aus Dateien erstellen
```bash
tar -cf archive.tar file1.txt file2.txt file3.txt 
tar --create --file archive.tar file1.txt file2.txt file3.txt 
```
#### Dateien aus Archiv extrahieren
```bash
tar -xf archive.tar
tar --extract --file archive.tar
```
#### Die Option -v / --verbose gibt eine Rückmeldung darüber, was tar macht
```bash
tar -xvf archive.tar
tar --extract --verbose --file archive.tar
```
#### Einzelne Datei aus Archiv extrahieren
```bash
tar -xf archive.tar file_to_extract.txt
```
#### Inhalt eines Archivs anzeigen/auflisten
```bash
tar -tf archiv.tar
tar --list --file archive.tar
```
#### Datei einem bestehenden Archiv hinzufügen
```bash
tar -rf archive.tar other_file.txt
tar --append --file archive.tar other_file.txt
```
#### Archiv aus einem Verzeichnis erstellen
```bash
tar -cf archive.tar /absolute/path/to/dir
tar -cf archive.tar relativ/path/to/dir
```
#### Differentielles Archiv erstellen

#### Bestimmte Dateien *nicht* hinzufügen

#### Archiv an einem bestimmten Ort extrahieren

#### Teile des Pfades beim entpacken weglassen
```bash
--strip-components=NUMBER
```
> [!NOTE] 
> Pfadangaben werden immer mit archiviert! Wir müssen uns also im Vorhinein Gedanken machen, ob wir z.B. einen relativen oder absoluten Pfad angeben.

> [!IMPORTANT]
> Die Option `-f` erfordert **zwingend** ein direkt darauffolgendes Argument - den Namen des Archivs. Insofern ist die Reihenfolge der Optionen hier **nicht** egal.

#### Unix Epoch Time

Die *Unix Epoch Time* (auch *POSIX-Zeit* oder *Unix-Zeitstempel*) ist die Anzahl der Sekunden, die seit dem 1. Januar 1970, 00:00:00 UTC vergangen sind. Sie wird oft in Betriebssystemen und Programmiersprachen verwendet, um Zeitangaben als einfache Ganzzahlen zu speichern und zu verarbeiten.

So ist es möglich, Daten in unterschiedlichen Formaten (z.B. Zeitzonen) anzugeben oder Differenzen zwischen zwei Zeitpunkten zu berechnen.

### Komprimierung

Durch die Komprimierung können wir **eine einzelne** Datei mit Hilfe bestimmter Algorithmen verlustfrei in ihrer Grösse verkleinern.

*Analogie Komprimierung:* getrocknete Handtücher, die im Wasser wieder gross werden

*Analogie Archivierung:* einzelne Blumen werden zu einem Strauss gebunden

Um **mehrere** Dateien oder ganze Verzeichnisse zu komprimieren, müssen wir zusätzlich im Vorfeld die *Archivierung* anwenden. Bestimmte Programme in Windows-Systemen vereinen diese beiden Konzepte unter einer Haube. Wir müssen uns jedoch merken, dass dies grundsätzlich zwei komplett verschiedene Konzepte sind.

Auch unter Linux ist es möglich beide Schritte auf einmal mit dem Kommando `tar` durchzuführen, dabei ruft `tar` im Hintergrund jedoch die jeweiligen Kommandos zur Komprimierung auf.

Unter Linux nutzen wir standardmässig drei verschiedene Tools zur Komprimierung: `gzip`, `bzip2` und `xz`.

Die Optionen der drei Kommandos sind mehr oder weniger identisch.
#### Datei komprimieren:
```bash
gzip somefile
bzip2 somefile
xz somefile
```
#### Datei dekomprimieren:
```bash
gzip -d somefile.gz
bzip2 -d somefile.bz2
xz -d somefile.xz

gunzip somefile.gz
bunzip2  somefile.bz2
unxz -d somefile.xz
```
>[!NOTE]
> Sowohl bei der Komprimierung als auch bei der Dekomprimierung wird die jeweilige Originaldatei nicht behalten, sondern ersetzt.
> Dies können wir mit der Option `-k` (`--keep`) umgehen.

>[!NOTE]
> Es gibt für alle drei Algorithmen auch die Option `-l` bzw.  `--list`. Hiermit können wir uns einen Überblick/Vergleich der komprimierten und unkomprimierten Datei und die Kompressionsrate anzeigen lassen.
> 
> Interessanterweise ist dies nur ein *Listing*, es findet zwar eine Dekomprimierung der Datei statt, allerdings nur im RAM, selbst wenn wir zusätzlich die Option `-d` zur Dekomprimierung angeben.

### Vergleich der drei Komprimierungsalgorithmen

Vergleich der Geschwindigkeiten und resultierenden Grössen beim Komprimieren:

![vergleich-komprimierung](./images/vergleich-komprimierung.png)
Vergleich der Geschwindigkeiten beim Dekomprimieren:

![vergleich-dekomprimierung](./images/vergleich-dekomprimierung.png)
Zusammenfassend lassen sich folgende Aussagen über die drei Komprimierungsalgorithmen treffen:

- `gzip` ist am schnellsten bei der Komprimierung, die komprimierte Datei ist aber nicht besonders klein
- `bzip2` braucht lange für die Komprimierung und die Dekomprimierung, erzeugt aber eine ziemlich kleine Datei
- `xz` braucht ziemlich lange bei der Komprimierung, erzeugt liegt bei der Kompressionsrate zwischen den beiden anderen, ist aber sehr schnell bei der Dekomprimierung

Es gibt also für alle drei bestimmte Anwendungsfälle, in denen sie ihre Stärken ausspielen können.

### Erstellen und Entpacken eines komprimierten Archivs direkt mit `tar`

#### Komprimiertes Archiv erzeugen
```bash
##### gzip komprimiertes Archiv erstellen
```bash
tar -czf archiv.tar.gz somdir/
tar -czvf archiv.tar.gz somdir/     # verboser Output

##### bzip2 komprimiertes Archiv erstellen
```bash
tar -cjf archiv.tar.bz2 somdir/
tar -czjf archiv.tar.bz2 somdir/     # verboser Output

##### xz komprimiertes Archiv erstellen
```bash
tar -cJf archiv.tar.xz somdir/
tar -cJvf archiv.tar.xz somdir/     # verboser Output
```
#### Komprimiertes Archiv entpacken
##### mit gzip komprimiertes Archiv entpacken
```bash
tar -xzf archiv.tar.gz
tar -xzvf archiv.tar.gz
```
##### mit bzip2 komprimiertes Archiv entpacken
```bash
tar -xjf archiv.tar.bz2
tar -xzjf archiv.tar.bz2
```
##### mit xz komprimiertes Archiv entpacken
```bash
tar -xJf archiv.tar.xz
tar -xJvf archiv.tar.xz
```
##### automatisch jeweiligen Algorithmus anhand der Dateiendung anwenden lassen (Dateiendung muss stimmen!)
```bash
tar -xf archiv.tar.gz
tar -xf archiv.tar.bz2
tar -xf archiv.tar.xz
```
## Textströme und Standardkanäle

Es gibt drei Standardkanäle unter Linux:

| Kanalbezeichnung | Filedescriptor | Nummer |
| ---------------- | -------------- | ------ |
| *Standareingabekanal*  | `stdin` | 0 |
| *Standardausgabekanal*|  `stdout` | 1 |
| *Standardfehlerkanal*  | `stderr` | 2 |

Jeder Prozess der gestartet wird, wird mit diesen drei Standardkanälen verbunden. Über diese Kanäle erhält der Prozess Daten und gibt sie auch wieder aus. So können Ein- und Ausgaben unabhängig voneinander verarbeitet und auch umgeleitet werden.

Die Kanäle jedes Prozesses, der in einer Shell gestartet wird, sind automatisch mit der Shell verbunden.

Durch dieses Konzept können wir durch die Kombination simpler Kommandos komplexe Aufaben lösen (-> *Kommandopipelines*) 

Wir könne so z.B. auch Ausgaben von Kommandos in Dateien umleiten (-> *Redirects*).

### Redirects

Mit Redirects kann die der Standardausgabekanal oder der Standardfehlerkanal in eine **Datei** umgeleitet werden. Es gibt zwei Arten von Redirects:

- `>` - einfacher Redirect: Erstellt eine Datei falls nicht vorhanden, **leert** eine bereits vorhandene Datei
- `>>` - doppelter Redirect: Erstellt eine Datei falls nicht vorhanden, **hängt Ausgabe an**

#### Umleitung des Standareingabekanals
```bash
echo huhu 1> hallo.txt   # die 1 gibt hier die Kanalnummer an
echo huhu 1>> hallo.txt  # die 1 gibt hier die Kanalnummer an
echo huhu > hallo.txt    # kann bei stdout auch weggelassen werden

ls -l /etc > ls-ausgabe.txt
ls -l /etc >> ls-ausgabe.txt
```
#### Umleitung des Standardfehlerkanals
```bash
ls mich-gibts-nicht  2> ls-fehler.txt     # hier muss die 2 stehen, da wir stderr umleiten
ls mich-gibts-nicht  2>> ls-fehler.txt    # hier muss die 2 stehen, da wir stderr umleiten
```
#### Umleitung beider Kanäle
##### in separate Dateien
```bash
ls mich-gibts/ mich-gibts-nicht/ > ergebnis.txt 2>fehler.txt
```
##### in die gleiche Datei
```bash
ls mich-gibts/ mich-gibts-nicht/ > ausgabe-und-fehler.txt 2>&1
```
>[!NOTE]
> Das `&` gibt hier an, dass wir einen *Kanal*/*Filedescriptor* meinen, ansonsten würden die Fehler in eine Datei mit dem Namen `1` umgeleitet werden.

### /dev/null

`/dev/null` ist soetwas wie das *Schwarze Loch* eines Linux Systems. Alles was wir dorthin leiten, verschwindet. Wir nutzen einen Redirect nach `/dev/null` ganz bewusst, um z.B. Fehlermeldungen eines Kommandos zu unterdrücken. Oder auch in Skripten, um den normalen Output eines Kommandos zu unterdrücken.

#### Beispiel find und 2>/dev/null
Wir wollen als regulärer Benutzer mit `find` unser gesamtes Dateisystem nach `.tar` Dateien durchsuchen. Mit folgendem Kommando erhalten wir aber sehr viele `Permission Denied` Fehlermeldungen:
```bash
find / -name "*.tar"
```
Wir leiten also ganz bewusst alle Fehler nach `/dev/null` um die Ergebnisse klarer sehen zu können:
```bash
find / -name "*.tar* 2>/dev/null
```
## UNIX Philosophie

1. eine Aufgabe, diese gut
2. mit anderen Programmen kommunizieren
3. zur Kommunikation soll Text verwendet werden

## KISS Prinzip

- Keep it stupid simple
- Keep it super simple
- Keep it simple, stupid!

## Kommandopipelines

Syntax:
```bash
<kommando1> | <kommando2>
```
Mit der *Pipe* (`|`) wird `stdout` von `<kommando1>` mit `stdin` von `<kommando2>` verbunden, so dass `<kommando2>` die Ausgabe von `<kommando1>` entgegenehmen und weiterverarbeiten kann.

### Beispiele:
```bash
ls -l /etc/ | less       # der Output von ls -l wird an den Pager less geleitet
cat /etc/passwd | wc -l  # Anzahl der Benutzer ausgeben
```
## Filterkommandos

### grep

Mit `grep` können wir Textströme zeilenweise filtern. 

`grep` nimmt ein `PATTERN`, also einen Suchbegriff bzw. genauer gesagt einen *Regulären Ausdruck* entgegen und gibt nur die Zeilen eines Textstroms aus, in denen dieses `PATTERN` vorkommt.

#### Beispiele:
##### nur die Benutzerkonfiguration von root ausgeben
```bash
grep "root" /etc/passwd     
```
##### -c --count 
`grep` zählt die Ergebnisse, hier also die Anzahl der Benutzer, die BASH als Login-Shell nutzen, es wird nur die Anzahl ausgegeben, nicht die Zeilen, die PATTERN enthalten
```bash
grep -c bash /etc/passwd    
```
##### -v --invert 
`grep` gibt all das aus, was *nicht* auf das PATTERN passt.

hier: Ausgabe aller Benutzerkonfigurationen, die *nicht* die BASH nutzen
```bash
grep -v bash /etc/passwd
```
##### -i --ignore-case 
`grep` ignoriert Gross-und Kleinschreibung

hier: sowohl alias als auch Alias wird gefunden
```bash
grep -i alias ~/.bashrc
```
##### -n --line-number 
`grep` zeigt zusätzlich die Zeilennummer an, in der PATTERN gefunden wurde. Sehr praktisch.
```bash
grep -n alias ~/.bashrc
```
##### -r --recursive 
`grep` kann so auch ganze Verzeichnisse durchsuchen

hier: gesamtes Home-Verzeichnis von tux nach etwas zu aliasen durchsuchen
```bash
grep -r alias /home/tux 
```
### cut

Mit `cut` können wir Textströme **spaltenweise** filtern. 

Für `cut` können wir ein Trennzeichen / *Delimiter* definieren, anhand dessen `cut` einen Textstrom in Spalten / *Fields* unterteilt und nur das oder die gewünschten Felder ausgibt.

#### Beispiele
```bash
cut -d: -f1 /etc/passwd     # nur die Login-Namen der Benutzer ausgeben
cut -d: -f7 /etc/passwd     # nur die Shells der Benutzer ausgeben

cat /etc/passwd | cut -d: -f1 # geht auch, sog. Useless Use of Cat
```
### tail

`tail` gibt standardmässig die letzten 10 Zeilen einer Datei aus. 

Die Anzahl der Zeilen kann über die Option `-n` angegeben werden.

Eine sehr nützliche Option von `tail` ist die Option `-f` / `--follow`. Damit können wir Änderungen an einer Datei sozusagen *live* beobachten. Wird oft in Verbindung mit Log-Dateien genutzt, um zu verfolgen, was gerade passiert. 

#### Beispiele
```bash
tail -n 5 ~/.bashrc     # die letzten 5 Zeilen der bashrc ausgeben
tail -f /var/log/apache2/access.log   # Zugriffe auf den Webserver verfolgen
```
### head

`head` gibt standardmässig die ersten 10 Zeilen einer Datei aus. 

Die Anzahl der Zeilen kann über die Option `-n` angegeben werden.

#### Beispiele
```bash
head -n 5 ~/.bashrc     # die ersten 5 Zeilen der bashrc ausgeben
```
### sort

Mit `sort` können wir Textströme (nach bestimmten Kriterien) sortiert ausgeben.

### uniq

Mit `uniq` könne wir direkt aufeinanderfolgende gleiche Zeilen zu einer einzigen zusammenfassen.

Um z.B. alle Dublikate/gleiche Zeilen aus einem Textstrom zu entfernen, kombinieren wir (KISS Prinzip) `uniq` und `sort`

>[!NOTE] 
> `sort` hat übrigens die Option `-u` eingebaut, mit der wir gleiches erreichen können.

#### Beispiele
Anzahl der verschiedenen Shells in /etc/passwd zählen
```bash
cut -d: -f7 /etc/passwd | sort | uniq | wc -l 
```
## Dateisystembaum / Verzeichnisstruktur

| Verzeichnis | Bedeutung | enthält |
| ----------- |:-------------: | --------- |
| `/bin` | *binary* |  ausführbare Dateien, die von allen Benutzern ausgeführt werden können. Normalerweise ein *Symlink* auf `/usr/bin`. |
| `/sbin` | *superuser binary* |  auch ausführbare Dateien, die allerdings nur von `root` genutzt werden können. Auch ein Symlink auf `/usr/sbin`. |
| `/boot` | |  den/die Linux Kernel (`vmlinuz-6.1.0-25.amd64`), die zugehörige Initiale RAM Disk (`initrd.img-6.1.0-25-amd64`), weitere für den Bootvorgang wichtige Dateien und die Konfiguration des Bootloaders, z.B. `grub`. |
| `/dev` | *devices* |  *Gerätedateien*, z.B. für die vorhanden Speichermedien und Partitionen, `/dev/null`, `/dev/random`, die Filedescriptoren `stdin`, `stdout`, `stderr`, Terminals etc. Dieses Verzeichnis wird automatisch vom Dienst `udev` (*Userspace Dev*) überwacht und gepflegt. |
| `/etc` | *et cetera* / *etsy* |  systemweite Konfigurationsdateien. Diese können für gewisse Programme durch die benutzerspezifischen Konfigurationsdateien (im Heimatverzeichnis der Benutzer) überschrieben werden (`/etc/bash.bashrc` -> `~/.bashrc`). |
| `/home` | | Heimatverzeichnisse der regulären Benutzer |
| `/media` `/mnt` | *mount* |  Verzeichnisse für die *Mountpoints* weiterer/externer Datenträger |
| `/opt` | *optional* | hier können Pakete ihre Dateien ablegen, die nicht über die Standardpaketquellen installiert wurden |
| `/proc` | *processes* |  Dateien/Informationen über das laufende System: laufende Prozesse, Hardware, Kernelkonfiguration. Existiert nur im RAM, ist ein sog. *virtuelles* oder *Pseudodateisystem* |
| `/root` | | Heimatverzeichnis des *Superusers* `root` |
| `/sys` | *system* | ähnlich wie `/proc` bzw. eine nachträgliche Erweiterung,  vor allem Dateien/Informationen zur Hardware, auch ein *virtuelles-* bzw. *Pseudodateisystem*. |
| `/tmp` | *temp* |  temporäre Dateien |
| `/usr` | *Unix System Resources* |  Verzeichnisse für die ausführbaren Dateien, Libraries, Source Code, Dokumentationen etc. |
| `/var` | *variable* |  viele wichtige Dateien wie z.B. *Logdateien* (`/var/log`), E-Mails (`/var/mail`), Cache (`/var/cache`) ... |

## Benutzerkonten

### Root Acount

Der Benutzer `root` ist der *SuperUser* eines Linux Systems. Er ist der einzige Benutzer, welcher volle Rechte auf das System hat, also alles darf. Er muss auf jedem System existieren, damit dieses lauffähig ist, beispielsweise um während des Bootvorgangs einzelne Dienste zu starten usw.

### Reguläre Benutzer

Alle *regulären* Benutzer haben **eingeschränkte** Rechte. Sie dürfen z.B. nicht alle Kommandos ausführen oder generell irgendwelche Änderungen am System vornehmen. 

Im Hintergrund wird das mehr oder weniger alles über die Berechtigungen an Dateien geregelt.

Reguläre Benutzer können sich am System anmelden und interaktiv Kommandos ausführen. Dazu haben sie in der `/etc/passwd` eine *Login Shell* zugewiesen.

### Systembenutzer / Servicenutzer / Pseudobenutzer

Es gibt eine weitere Bentuzergruppe mit eingeschränkten Rechten. Das fällt uns auf, wenn wir die Datei `/etc/passwd` inspizieren. Die Mehrzahl der Benutzer haben wir gar nicht selbst angelegt, sie wurden automatisch vom System erzeugt, als bestimmte Dienste/Services installiert wurden.

Genau das ist der Sinn dieser Benutzer: So können bestimmte Dienste bzw. Prozesse mit deren Berechtigungen ausgeführt werden um die Sicherheit des Systems zu erhöhen. Ein kompromittierter Dienst erhält so also nicht direkt Zugriff auf das gesamte System.

Beispiel: `www-data` für Webserver wie *Apache oder Nginx* - selbst wenn ein Angreifer den Webserver übernimmt, kann er nicht auf andere Systemdateien zugreifen.

Pseudobenutzer haben keine Login-Shell, ihnen wird `/usr/sbin/nologin` zugewiesen. Sie können sich also nicht am System anmelden und Kommandos ausführen.

### Benutzer anlegen 

Zum Anlegen von Benutzern existiert auf jedem System das Kommando `useradd`. Mit diesem Kommando können ausschliesslich Benutzer angelegt werden, aber z.B. keine Passwörter generiert werden (*KISS Prinzip*).

Die grundlegende Syntax von `useradd` ist nicht wirklich kompliziert, hier einige der gängigen Optionen:

#### useradd

Benutzer anlegen. Obwohl ein Eintrag für ein Home-Verzeichnis in der `/etc/passwd` erzeugt wird, wird dies **nicht** angelegt
```bash
useradd <user>
```
Die Option `-m` bewirkt, dass unterhalb von `/home` ein Verzeichnis mit dem Namen des Benutzers erzeugt und alle Dateien aus `/etc/skel` dorthin kopiert werden 
```bash
useradd -m <user>
useradd --make-home <user>
```
Benutzer eine Login-Shell zuweisen
```bash
useradd -s /bin/bash <user>
useradd --shell /bin/bash <user>
```
Kommentarfeld für den vollen Namen des Benutzers und weitere Informationen
```bash
useradd -c "Voller Name des Benutzers" <user>
useradd --comment "Voller Name des Benutzers" <user>
```
Wir können dem Benutzer auch bereits beim erzeugen ein Passwort mitgeben. **Wichtig:** Hier muss ein für das System passender *gesaltener* HASH angegeben werden. Der Eintrag wird exakt so in die `/etc/shadow` eingetragen.
```bash
useradd -p "PASSWORDHASH" <user>
useradd --password "PASSWORDHASH" <user>
```
Schwer ist das nicht wirklich - wir können dazu das Kommando `openssl` verweden:
```bash
openssl passwd -6 PASSWORT
```
Die Option `-6` weist `openssl` an, den für Linux empfohlenen sicheren *SHA-512* Algorithmus zu verwenden.

In einem Rutsch sähe das folgendermassen aus:
```bash
useradd -m -c "User mit Passwort" -p $(openssl passwd -6 'My!Secret#Password' -s /bin/bash userwithpass
```

Neuen User eine bestimmte Primäre Gruppe zuordnen:
```bash
useradd -g <primary-group> <user>
```
Neuen User einer Liste von zusätzlichen Gruppen zuordnen:
```bash
useradd -G <list-of-supplementary-groups> <user>
```
Standarbeispiel zum Anlegen eines Benutzers

- `useradd -m -c "Tux Tuxedo" -s /bin/bash tux`

#### passwd
Das Kommando ermöglicht die Änderung von Passwörtern. Mit Root-Rechten können so die Passwörter aller Benutzer geändert werden:
```bash
passwd <user>
```

Als regulärer Benutzer kann man damit sein eigenes Paswsort ändern:
```bash
passwd
```
#### adduser

`adduser` ist ein Perl-Skript, welches u.a. die Kommandos  `useradd` und `passwd` ausführt. Es ist *interaktiv* und fragt direkt nach einem Passwort für den neuen Benutzer. Es sind andere Default-Werte gesetzt als bei `useradd`.

Dieses Kommando ist aber standardmässig nur auf Debian-basierten Distributionen vorinstalliert!

#### Relevante Dateien

- `/etc/passwd`
- `/etc/shadow`
- `/etc/group`
- `/etc/gshadow`

### Gruppen

TODO

- `groups`
- `id -u`
- `id -g`
- `id -G`
- `id -n`
- `id- Gn`

Gruppe erstellen:
- `groupadd`

Benutzer einer Gruppe hinzufügen:
```bash
usermod -g <primary-group> <user>
usermod -G <list-of-supplementary-groups> <user>
usermod -aG <list-of-supplementary-groups> <user>
```
Benutzer muss sich neu anmelden / eine neue Login-Shell starten. Oder Kommando `newgrp`.

### sudo

TODO

- Super User Do
- Kommandos als ein andere Benutzer ausführen
- kann so konfiuriert werden, dass KEIN Passwort eingegeben werden muss
- eingegebenes Passwort wird für eine gewisse Zeit (15 min) gespeichert
- es wird das EIGENE Passwort eingegeben, nicht das ROOt-PW
- User der Gruppe `sudo` (oder `wheel`) hinzufügen
- Datei **immer** mit dem Kommando `visudo` bearbeiten
- `sudo !!`


## Berechtigungen

TODO

- Berechtigungen werden auf Datein angewendet

  u  g  o
-rw-r--r-- 1 tux tux 5 Feb 12 13:09 file1.txt

### Bedeutung der Berechtigungen für Dateien

User darf:

`r` -> read -> Dateiinhalt lesen
`w` -> write -> Dateiinhalt ändern -> **nicht** Datei löschen
`x` -> eXecute -> Datei ausführen

### Bedeutung der Berechtigungen für Verzeichnisse

`r` -> read -> Verzeichnisinhalt lesen bzw. auflisten der Namen der Dateien
`w` -> write -> Verzeichnisinhalt ändern -> Dateien hinzufügen und löschen
`x` -> eXecute -> Verzeichnis betreten -> es macht **keinen wirkliche Sinn** wenn dieses Bit bei Verzeichnissen **nicht** gesetzt ist. Dann wird alles etwas seltsam... Wir brauchen dieses Bit, damit Verzeichnisse wir gewünscht funktionieren.

### Symbolische Rechtevergabe

r -> read
w -> write
x -> eXecute

u -> user/owner
g -> group
o -> others (weder owner noch group)
a -> all

`+` -> hinzufügen
`-` -> entziehen
`=` -> setzten

`chmod g+w file1.txt`
`chmod o-r file1.txt`

### Numerische/Oktale Rechtevergabe

`r` -> 4    100
`w` -> 2    010
`x` -> 1    001
`-` -> 0    000

```bash
  7  6  4
 111110100
-rwxr--r-- 1 tux tux 5 Feb 12 13:09 file1.txt
```
### Sonderbits

#### SUID Bit

Auf eine **ausführbare Binärdatei** gesetzt, bewirkt das SUID Bit, dass die Datei mit den Berechtigungen des **Besitzers** der Datei ausgeführt wird und **nicht** mit den Berechtigungen des aufrufenden Users.
```bash
ls -l /usr/bin/passwd

-rwsr-xr-x 1 root root 68248 Mar 23  2023 /usr/bin/passwd
```

#### SGID Bit

Auf eine **ausführbare Binärdatei** gesetzt, bewirkt das SGID Bit, dass die Datei mit den Berechtigungen der **Gruppe** der Datei ausgeführt wird und **nicht** mit den Berechtigungen des aufrufenden Users.

Auf ein Verzeichnis gesetzt, bewirkt es, dass neu darin erstellte Dateien der Gruppe zugewiesen werden, der das Verzeichnis gehört und nicht der Gruppe des erstellenden Users.

```bash
ls -ld /var/mail

drwxrwsr-x 2 root mail 4096 Feb 20 09:26 /var/mail/
```

#### Sticky Bit

Auf ein Verzeichnis gesetzt, bewirkt es, dass darin enthaltene Dateien nur noch vom Besitzer der Datei genändert oder gelöscht werden dürfen.
```bash
ls -ld tmp

drwxrwxrwt 8 root root 4096 Feb 20 09:30 /tmp
```
# Links

TODO

















