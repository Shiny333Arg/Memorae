// mapear DB ↔︎ dominio (Alert)

import 'package:drift/drift.dart';
import '../../../db/database.dart';        // Para AlertRow y AlertsCompanion
import '../../../models/alert_item.dart';            // Tu modelo de dominio

// DB (AlertRow) -> Dominio (Alert)
Alert toDomain(AlertRow r) {
  return Alert(
    id: r.id,
    remoteId: r.remoteId,
    orgId: r.orgId,
    title: r.title,
    message: r.message,
    latitude: r.latitude,
    longitude: r.longitude,
    radiusM: r.radiusM,
    startAt: r.startAt.toUtc(),
    expireAt: r.expireAt?.toUtc(),
    deviceActive: r.deviceActive,
    serverActive: r.serverActive,
    updatedAt: r.updatedAt.toUtc(),
  );
}

// Dominio (Alert) -> Companion para INSERT
AlertsCompanion toInsertCompanion(Alert a, {required String clientUid, DateTime? nowUtc}) {
  final ts = (nowUtc ?? DateTime.now().toUtc());
  return AlertsCompanion.insert(
    orgId: Value(a.orgId),
    ownerUid: const Value(null),      // lo usarás cuando respaldes personales
    remoteId: Value(a.remoteId),
    clientUid: clientUid,
    title: a.title,
    message: Value(a.message),
    latitude: a.latitude,
    longitude: a.longitude,
    radiusM: a.radiusM,
    startAt: a.startAt.toUtc(),
    expireAt: Value(a.expireAt?.toUtc()),
    deviceActive: Value(a.deviceActive),
    serverActive: Value(a.serverActive),
    updatedAt: ts,
  );
}

// Dominio (Alert) -> Companion para UPDATE de campos editables (no toca deviceActive)
AlertsCompanion toUpdateFieldsCompanion(Alert a, {DateTime? nowUtc}) {
  final ts = (nowUtc ?? DateTime.now().toUtc());
  return AlertsCompanion(
    title: Value(a.title),
    message: Value(a.message),
    latitude: Value(a.latitude),
    longitude: Value(a.longitude),
    radiusM: Value(a.radiusM),
    startAt: Value(a.startAt.toUtc()),
    expireAt: Value(a.expireAt?.toUtc()),
    updatedAt: Value(ts),
    // NO actualizar: orgId, ownerUid, remoteId, clientUid, deviceActive, serverActive
  );
}
