# Übungen: Benutzer anlegen unter Linux mit `useradd`

>[!NOTE]
> Sämtliche für die Übungen nötigen Informationen sollten in der Manpage von `useradd` zu finden sein. Falls nicht direkt, schaut doch mal ganz unten in die `SEE ALSO` Sektion...

## Übung 1: Einfachen Benutzer anlegen
Legt einen neuen Benutzer `testuser` ohne weitere Optionen an und prüft, was passiert.

🔹 **Fragen:**
- Wurde das Home-Verzeichnis erstellt?
- Könnt ihr euch als dieser Benutzer anmelden (vorausgesetzt, ihr seit nicht `root`)?
- Was steht in `/etc/passwd` und `/etc/shadow` für diesen Benutzer?

## Übung 2: Benutzer mit Home-Verzeichnis anlegen
Einen Benutzer `user1` mit automatisch erstelltem Home-Verzeichnis und darin enthaltenen Standarddateien anlegen.

🔹 **Fragen:**
- Wo befindet sich das Home-Verzeichnis?
- Welche Dateien sind darin enthalten?
- Wo kommen diese Datein her?

## Übung 3: Benutzer mit individuellem Home-Verzeichnis
Benutzer `user2` mit einem Home-Verzeichnis mit Standarddateien angeben, das unter `/srv` und nicht unter `/home` liegt.

🔹 **Fragen:**
- Was passiert, wenn man sich mit `su - user2` anmeldet?

## Übung 4: Benutzer mit BASH als Login-Shell anlegen
Benutzer `user3` mit der BASH als Login-Shell anlegen.

🔹 **Fragen:**
- Welche Shell wird standardmäßig verwendet, wenn `-s` nicht angegeben wird?
- Wie kann `user3` die Shell später ändern?

## Übung 5: Benutzer mit Kommentar (GECOS-Feld) anlegen
Beim Anlegen eines Benutzers `user7` zusätzlich den Namen `User Sieben, Abteilung GFN` speichern.

🔹 **Fragen:**
- Wo wird diese Information gespeichert?
- Wie kann man sie später ändern?

## Übung 6: Ein Passwort für den Benutzer setzen
Sorgt nachträglich dafür, dass ihr ein Passwort für einen der neu angelegten Benutzer setzt.

🔹 **Fragen:**
- Geht das mit dem Kommando `useradd`? Oder brauchen wir dazu ein anderes Kommando?

## Übung 7: Benutzer einer bestimmten Gruppe zuweisen
Einen Benutzer `user5` anlegen und direkt der Gruppe `games` zuweisen.

🔹 **Fragen:**
- Wie kann überprüft werden, ob der Benutzer in der Gruppe ist?
- Was ist der Unterschied zwischen `-G` und `-g`?

## Übung 8: Benutzer sicher entfernen
Den Benutzer `user3` samt Home-Verzeichnis löschen.

🔹 **Fragen:**
- Was passiert mit `/home/user3`?
- Was passiert, wenn `-r` weggelassen wird?

## Übung 9: Benutzer mit bestimmter Benutzer-ID (UID) anlegen
Eine feste UID (`1500`) für einen neu angelegten Benutzer `user4` bestimmen.

🔹 **Fragen:**
- Welche UID hat ein neuer Benutzer ohne diese Option?

## Übung 10: Benutzer mit Ablaufdatum erstellen
Einen Benutzer `user6` anlegen, dessen Konto am 31.12.2025 abläuft.

🔹 **Fragen:**
- Wo kann das Ablaufdatum überprüft werden?
- Was passiert nach dem Ablaufdatum?

## Übung 11: Benutzer mit adduser anlegen
Einen neuen Benutzer `newbi` mit dem Kommando `adduser` anlegen.

🔹 **Fragen:**
- Was ist der Unterschied zur Verwendung des Kommandos `useradd`?
- Warum lernen wir nicht einfach nur die Verwendung von `adduser`?

## Übung 12: "Vollwertigen" Benutzer anlegen
Einen neuen Benutzer so anlegen, dass er ein Heimatverzeichnis mit Standarddateien erhält, im Kommentarfeld sein Vor- und Nachname eingetragen ist, er die BASH als Login Shell nutzt und ein Passwort erhält.

🔹 **Fragen:**
* Wie könnte man vorgehen, um einerseits einen neuen Benutzer mit Passwort anzulegen, diesen Benutzer bei der ersten Anmeldung aber dazu zu bringen, dass Passwort zu ändern, so dass wir nachträglich keine Kenntnis über das Passwort des Benutzer haben?

## Übung 13: Verwendete Dateien
Mal angenommen, ihr habt weder das Kommando `useradd`, noch `adduser` zur Verfügung, jedoch einen Texteditor, zufälligerweise einen gesaltenen Passworthash und Root-Rechte. 

Könntet ihr auch so einen vollwertigen Benutzeraccount erstellen?

Macht euch Gedanken, welche Dateien bei der Erstellung eines Benutzers editiert werden und probiert es doch einfach mal aus.

Tipp: Als Passwort-Hash könnt ihr ja mal versuchen, einen bereits vorhandenen zu kopieren oder so...
