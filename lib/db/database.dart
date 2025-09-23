// clase AppDatabase (instancia Drift, schemaVersion, migraciones)
// lib/db/database.dart
import 'package:drift/drift.dart';
import 'package:drift_sqflite/drift_sqflite.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'schema/alerts.dart';

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final dbPath = p.join(dir.path, 'memorae.db');
    // Usamos Sqflite como ejecutor para Flutter
    return SqfliteQueryExecutor(
      path: dbPath,
      logStatements: kDebugMode,
    );

  });
}

@DriftDatabase(tables: [Alerts])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Estrategia de creación/migración
  @override
  MigrationStrategy get migration => MigrationStrategy(
    beforeOpen: (details) async {
      // Activa FKs cuando más adelante agregues tablas relacionadas
      await customStatement('PRAGMA foreign_keys = ON');
    },
    onCreate: (m) async {
      await m.createAll(); // crea tablas, índices y uniqueKeys definidos
    },
    onUpgrade: (m, from, to) async {
      // Aquí irán migraciones cuando subas schemaVersion
    },
  );

  // Útil para cerrar la DB (por ejemplo en tests)
  Future<void> dispose() => close();
}
