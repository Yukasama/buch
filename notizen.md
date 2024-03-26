# Software Engineering

## Vorlesung 1 (19.03.2024)

### .editorconfig

- end of line: lf -> UNIX
- eslint -> e: ecma script (Verband europäischer Rechnerhersteller)
- ecma: 3 -4- 5 -6-: 2015
  - 2015: Gutes Release (z.B. Einführung von Klassen)
- .cjs: commonjs
- package.json: Versionsnummern dreistellig
  - Letzte Nummer: Bugfix Release
  - Mittlere Nummer: Feature Release
  - Erste Nummer: Breaking Changes Release: Es können sich Klassen, Methoden ändern

### keycloak

- Gruppen: z.B. Europa (Admin in Europa anders als in Amerika)

## Vorlesung 2 (20.03.2024)

- Wichtige Dateien: main.ts bzw. index.ts
- Kein Punkt: Nicht relativer Pfad
- Frameworks, die mit anderen Bibliotheken arbeiten, verwenden oft @<package>
- Maven Dependencies: org - springframework - boot(GroupId) - <package>(ArtifactId)
                                            - security
                          - postgres
- Export default nicht verwenden, da Umbenennen zu keinem Fehler führt

## Vorlesung 3 (21.03.2024)

- ESLint: Statische Codeüberprüfung
npm audit
const -> block scoped (Gültigkeitsbereich in Block): Zeile bis geschweifte Klammer
var -> function scoped (Gültigkeitsbereich in Function)
Brandon Eich
- var, da fehlertolerante Programmiersprache
- ASI = Automatic Semicolon Insertion
- console.log(foo()) => [object Object]
- Jede Funktion hat Rückgabewert
- 2015: Template String, Destructuring, Short-hand properties, const und let
- Nicht Lambda Ausdruck, sondern Arrow function
- this bezieht sich auf Funktion
- async in TS, weil in C#
- Zustände von Promises: pending, fulfilled, rejected
- top level await (außerhalb einer Funktion)
  - anstelledessen 2017: **IIFE immediatly invoked function expression**

## Vorlesung 4 (26.03.2024)

- --watch: Server neustarten bei Änderung
- pino: Loggt asynchron: Logausgaben werden nicht direkt ausgegeben,
  aber bei Serverabsturz geht Fehler eventuell verloren
  - winston: Langsam, loggt synchron, weiterverbreitet
- zertifikat
  - Hostname: host.docker.internal oder localhost
- compression: Dekomprimieren: POST, PUT; Komprimieren: GET
  - GZip = GNUZip = opensource

### cors

- Cross origin, Webserver und Appserver
- 1. Clients: Browser, iOS, Android (! Browser muss Request an anderen Server blocken)
- 2. Webserver: Apache httpd, nginx
- 3. Applikationsserver, Microservice
- 4. DB
  - Alternative: Proxy-Pattern (aber kein Proxyserver, ein Reverse-Proxy),
    Webserver leitet Request weiter an Appserver (SSR)
  - Proxyserver: Puffert Antworten (von Intranet ins Internet)

### Module

- Modul im Sinne von JS: Datei (was nach from kommt), nicht das Gleiche wie bei Nest
- Decorator, nicht mehr Annotation
- Klassenimplementierung: (Properties alle public), daher seit 2019:
  private class mit #
- Nur ein constructor, da im alten JS keine Typen, genau wie keine mehreren
  .catch()-Klauseln
