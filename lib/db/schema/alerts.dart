// definición de tabla alerts

import 'package:drift/drift.dart';

@DataClassName('AlertRow')
class Alerts extends Table {
  // Identificadores
  IntColumn get id         => integer().autoIncrement()();
  IntColumn get orgId      => integer().nullable().named('org_id')();     // NULL = personal
  TextColumn get ownerUid  => text().nullable().named('owner_uid')();     // UID del dueño (si respaldas personales)
  TextColumn get remoteId  => text().nullable().named('remote_id')();     // ID del doc en servidor (cuando exista)
  TextColumn get clientUid => text().named('client_uid')();               // UUID local (único)

  // Contenido
  TextColumn get title     => text()();
  TextColumn get message   => text().nullable()();

  // Ubicación
  RealColumn get latitude  => real()();                                    // [-90..90]
  RealColumn get longitude => real()();                                    // [-180..180]
  IntColumn  get radiusM   => integer().named('radius_m')();               // > 0

  // Tiempos (UTC)
  DateTimeColumn get startAt  => dateTime().named('start_at')();
  DateTimeColumn get expireAt => dateTime().nullable().named('expire_at')();

  // Estado
  BoolColumn get deviceActive => boolean()
      .named('device_active')
      .withDefault(const Constant(true))();                                // switch local
  BoolColumn get serverActive => boolean().nullable().named('server_active')(); // solo org

  // Sync
  DateTimeColumn get updatedAt => dateTime().named('updated_at')();

  @override
  Set<Column> get primaryKey => {id};

  // Validaciones a nivel DB
  @override
  List<String> get customConstraints => [
    'CHECK (radius_m > 0)',
    'CHECK (latitude BETWEEN -90 AND 90)',
    'CHECK (longitude BETWEEN -180 AND 180)',
    'CHECK (expire_at IS NULL OR expire_at >= start_at)',
  ];

  // Índices para consultas comunes
  @override
  List<Index> get indexes => [
    Index('idx_alerts_org_id',
        'CREATE INDEX idx_alerts_org_id ON alerts (org_id)'),
    Index('idx_alerts_owner_uid',
        'CREATE INDEX idx_alerts_owner_uid ON alerts (owner_uid)'),
    Index('idx_alerts_active_start',
        'CREATE INDEX idx_alerts_active_start ON alerts (device_active, start_at)'),
  ];


  // Unicidad para sincronización
  @override
  List<Set<Column>> get uniqueKeys => [
    {clientUid},              // cada alerta local tiene un UUID único
    {orgId, remoteId},        // remoto único dentro de una org
    {ownerUid, remoteId},     // remoto único dentro de un usuario (personales respaldadas)
  ];
}
