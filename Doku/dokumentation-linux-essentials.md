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









