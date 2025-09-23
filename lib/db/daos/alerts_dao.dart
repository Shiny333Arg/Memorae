// DAO con operaciones CRUD + streams

import 'package:drift/drift.dart';

import '../database.dart';
import '../schema/alerts.dart';

part 'alerts_dao.g.dart';

@DriftAccessor(tables: [Alerts])
class AlertsDao extends DatabaseAccessor<AppDatabase> with _$AlertsDaoMixin {
  AlertsDao(AppDatabase db) : super(db);

  // INSERT
  Future<int> insertAlert(AlertsCompanion entry) {
    return into(alerts).insert(entry);
  }

  // UPDATE (solo campos que edita el formulario; NO toca device_active)
  Future<void> updateAlertFields(int id, AlertsCompanion fields) async {
    await (update(alerts)..where((t) => t.id.equals(id))).write(fields);
  }

  // SET ACTIVE (switch de la lista)
  Future<void> setAlertActive(int id, bool active, {DateTime? updatedAt}) async {
    await (update(alerts)..where((t) => t.id.equals(id))).write(
      AlertsCompanion(
        deviceActive: Value(active),
        updatedAt: Value((updatedAt ?? DateTime.now().toUtc())),
      ),
    );
  }

  // DELETE
  Future<void> deleteAlert(int id) async {
    await (delete(alerts)..where((t) => t.id.equals(id))).go();
  }

  // GET BY ID (opcional, útil para editar)
  Future<AlertRow?> getById(int id) {
    return (select(alerts)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  // WATCH ALL (para poblar Home en tiempo real)
  Stream<List<AlertRow>> watchAllAlerts() {
    final q = select(alerts)
      ..orderBy([
            (t) => OrderingTerm(expression: t.updatedAt, mode: OrderingMode.desc),
      ]);
    return q.watch();
  }

  // WATCH por organización (opcional)
  Stream<List<AlertRow>> watchByOrg(int orgId) {
    return (select(alerts)..where((t) => t.orgId.equals(orgId))).watch();
  }

  // WATCH personales (opcional)
  Stream<List<AlertRow>> watchPersonal() {
    return (select(alerts)..where((t) => t.orgId.isNull())).watch();
  }
}
