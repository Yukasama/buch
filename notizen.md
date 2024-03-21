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
