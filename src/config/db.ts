/*
 * Copyright (C) 2020 - present Juergen Zimmermann, Hochschule Karlsruhe
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

/**
 * Das Modul enthält die Konfiguration für das DB-System.
 * @packageDocumentation
 */
import { config } from './app.js';

// eslint-disable-next-line @typescript-eslint/no-unsafe-assignment
const dbConfig = config.db;

type DbType = 'postgres' | 'mysql' | 'oracle' | 'sqlite';

// eslint-disable-next-line @typescript-eslint/no-unsafe-assignment
const type: DbType | undefined = dbConfig?.type;

// 'better-sqlite3' erfordert node-gyp, wenn das Docker-Image gebaut wird
export const dbType =
  type === 'postgres' ||
  type === 'mysql' ||
  type === 'oracle' ||
  type === 'sqlite'
    ? type
    : 'postgres';
