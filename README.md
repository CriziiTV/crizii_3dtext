# ✨ crizii_3dtext for RedM (VORP)

A lightweight and optimized script to display 3D /me messages above your character in RedM (VORP). Messages are also shown in chat and logged server-side. Each /me message can be up to 80 characters long; if you exceed this limit, you will receive an error message.

---

## 🇬🇧 English

### 🚀 Features
- Use `/me <message>` to display a 3D text above your character
- Message is visible to nearby players and shown in chat
- All messages are logged in `log.txt`
- Maximum 80 characters per /me message (error message if exceeded)
- Display time: 7 seconds
- Resource-friendly and proximity-based
- Log file is created automatically if missing

### 🛠️ Installation
1. Place `client.lua`, `server.lua` and `fxmanifest.lua` in your resource folder.
2. Create an empty `log.txt` in the same folder (will be created automatically if missing).
3. Add the resource to your `server.cfg`:
   ```
   ensure crizii_3dtext
   ```

### 💬 Usage
Type in chat:
```
/me Your message
```

### 🙏 Credits
- Based on the original script by Ktoś (DrawText3D function)
- Optimized and extended by crizi & AI

------------------------------

# ✨ crizii_3dtext für RedM (VORP)

Ein leichtgewichtiges und optimiertes Script, um 3D-/me-Nachrichten über deinem Charakter in RedM (VORP) anzuzeigen. Die Nachrichten erscheinen auch im Chat und werden serverseitig geloggt. Jede /me-Nachricht darf maximal 80 Zeichen lang sein; bei Überschreitung erhältst du eine Fehlermeldung.

---

## 🇩🇪 Deutsch

### 🚀 Features
- Nutze `/me <Nachricht>`, um einen 3D-Text über deinem Charakter anzuzeigen
- Nachricht ist für nahe Spieler sichtbar und erscheint im Chat
- Alle Nachrichten werden in `log.txt` gespeichert
- Maximal 80 Zeichen pro /me-Nachricht (Fehlermeldung bei Überschreitung)
- Anzeigezeit: 7 Sekunden
- Ressourcenschonend und distanzbasiert
- Logdatei wird automatisch erstellt, falls nicht vorhanden

### 🛠️ Installation
1. Lege `client.lua`, `server.lua` und `fxmanifest.lua` in deinen Ressourcenordner.
2. Erstelle eine leere Datei `log.txt` im selben Ordner (wird sonst automatisch erstellt).
3. Füge die Ressource zu deiner `server.cfg` hinzu:
   ```
   ensure crizii_3dtext
   ```

### 💬 Nutzung
Schreibe im Chat:
```
/me Deine Nachricht
```

### 🙏 Credits
- Basierend auf dem ursprünglichen Script von Ktoś (DrawText3D Funktion)
- Optimiert und erweitert von crizi & AI

------------------------------

## 📜 Changelog

---

### 🟢 **Version 1.1.4**

#### English
- Added 8 second cooldown per player for /me messages (anti-spam)
- Dynamic display distance: the visible range for 3D text now adapts to the number of players (more players = smaller range)

#### Deutsch
- 8 Sekunden Cooldown pro Spieler für /me-Nachrichten (Anti-Spam)
- Dynamische Sichtweite: Die Sichtweite für 3D-Text passt sich jetzt automatisch an die Spielerzahl an (mehr Spieler = kleinere Reichweite)

---

### 🟢 **Version 1.1.3**

#### English
- Maximum character count for /me messages reduced to 80
- Players now receive an error message if they enter more than 80 characters
- The box width is now more generous, so text no longer overlaps the border even for long messages

#### Deutsch
- Maximale Zeichenanzahl für /me-Nachrichten auf 80 reduziert
- Spieler erhalten eine Fehlermeldung, wenn sie mehr als 80 Zeichen eingeben
- Die Box-Breite wird jetzt großzügiger berechnet, damit der Text auch bei langen Nachrichten nicht mehr über den Rahmen hinausgeht

---

### 🟡 **Version 1.1.2**

#### English
- The border and background now precisely fit the text width
- No more text overlapping the border for long messages

#### Deutsch
- Rahmen und Hintergrund passen sich jetzt exakt der Textlänge an
- Kein Überlappen des Textes über den Rahmen bei langen Nachrichten mehr

---

### 🔵 **Version 1.1.1**

#### English
- Removed fade-in/fade-out: text is now always fully visible
- Fixed flickering: background and text are stable
- Background is now solid black (no tiling, no gradient)
- Removed rounded corners for a clean look

#### Deutsch
- Kein Fade-in/Fade-out mehr: Text ist immer vollständig sichtbar
- Flackern behoben: Hintergrund und Text sind stabil
- Hintergrund jetzt einfarbig schwarz (kein Kachel-Effekt, kein Verlauf)
- Keine abgerundeten Ecken mehr, klarer Look

---

### ⚪ **Version 1.1**

#### English
- Added fade-in and fade-out animation for 3D text
- Black transparent background with sand-colored text (Western look)
- Rounded corners and a subtle border for the text box
- Config file (`config.lua`) for easy customization (colors, time, distance, font size, border, max displays)
- Thread pooling for efficient handling of multiple simultaneous /me messages

#### Deutsch
- Sanftes Ein- und Ausblenden (Fade-in/Fade-out) für 3D-Text
- Schwarzer transparenter Hintergrund mit sandfarbenem Text (Western-Look)
- Abgerundete Ecken und dezenter Rahmen um die Textbox
- Konfigurationsdatei (`config.lua`) für einfache Anpassung (Farben, Zeit, Distanz, Schriftgröße, Rahmen, max. Anzeigen)
- Thread-Pooling für effiziente Anzeige vieler gleichzeitiger /me-Nachrichten
