// repositorio (usa el DAO)

import 'dart:math';

import '../../../db/database.dart';
import '../../../db/daos/alerts_dao.dart';
import '../../../models/alert_item.dart';
import 'mappers.dart';

class AlertsRepository {
  final AppDatabase _db;
  final AlertsDao _dao;

  AlertsRepository(this._db) : _dao = AlertsDao(_db);

  // Utilidad: generar un client_uid único (sin dependencias externas)
  String _genClientUid() {
    final ts = DateTime.now().microsecondsSinceEpoch.toRadixString(16);
    final rnd = Random().nextInt(0x7fffffff).toRadixString(16).padLeft(8, '0');
    return '$ts-$rnd';
  }

  /// Crear alerta desde un borrador de dominio.
  /// Devuelve la alerta con `id` y `updatedAt` definitivos.
  Future<Alert> create(Alert draft) async {
    final now = DateTime.now().toUtc();
    final companion = toInsertCompanion(
      draft.copyWith(updatedAt: now),
      clientUid: _genClientUid(),
      nowUtc: now,
    );
    final id = await _dao.insertAlert(companion);
    // Recupera la fila para devolver el dominio “real”
    final row = await _dao.getById(id);
    return toDomain(row!);
  }

  /// Actualiza SOLO los campos editables del formulario.
  /// No toca `deviceActive`, ni los identificadores/sync.
  Future<void> update(Alert alert) async {
    if (alert.id == null) {
      throw ArgumentError('Alert.id es null: no se puede actualizar sin id');
    }
    final companion = toUpdateFieldsCompanion(alert);
    await _dao.updateAlertFields(alert.id!, companion);
  }

  /// Activa/Desactiva a nivel dispositivo (switch de la lista)
  Future<void> setActive(int id, bool active) {
    return _dao.setAlertActive(id, active);
  }

  /// Borra una alerta por id
  Future<void> delete(int id) {
    return _dao.deleteAlert(id);
  }

  /// Stream de todas las alertas (para Home)
  Stream<List<Alert>> watchAll() {
    return _dao.watchAllAlerts().map((rows) => rows.map(toDomain).toList());
  }

  /// (Opcional) Obtener una alerta puntual
  Future<Alert?> getById(int id) async {
    final row = await _dao.getById(id);
    return row == null ? null : toDomain(row);
  }
}
