import 'package:flutter/material.dart';
import '../../models/alert_item.dart';
import '../../theme/app_theme.dart';
import '../../data/sample_alerts.dart';
import '../widgets/alert_tile.dart';
import 'create_alert.dart';
import 'data/alerts_repository.dart';
import '../../db/database.dart';
import '../../models/alert_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final AppDatabase _db;
  late final AlertsRepository _repo;

  @override
  void initState() {
    super.initState();
    _db = AppDatabase();
    _repo = AlertsRepository(_db);
  }

  @override
  void dispose() {
    _db.dispose(); // cierra la DB
    super.dispose();
  }

  // Estado de sesión (placeholder)
  bool _loggedIn = false;

  Future<void> _handleLoginLogout() async {
    if (_loggedIn) {
      setState(() => _loggedIn = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sesión cerrada')),
        );
      }
      return;
    }
    final ok = await Navigator.of(context).pushNamed<bool>('/login');
    if (ok == true && mounted) {
      setState(() => _loggedIn = true);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sesión iniciada')),
      );
    }
  }

  void _goToOrganizations() {
    Navigator.of(context).pushNamed('/orgs');
  }

  // CREAR alerta → usa CreateAlertPage y luego repo.create(...)
  Future<void> _createAlert() async {
    final res = await Navigator.of(context).push<Map<String, dynamic>>(
      MaterialPageRoute(
        builder: (_) => const CreateAlertPage(isEditing: false),
      ),
    );
    if (!mounted || res == null) return;

    final startRaw = res['startAt'];
    final expireRaw = res['expireAt'];
    final startAt = startRaw is String ? DateTime.parse(startRaw) : startRaw as DateTime;
    final expireAt = expireRaw == null
        ? null
        : (expireRaw is String ? DateTime.tryParse(expireRaw) : expireRaw as DateTime?);

    final draft = Alert.create(
      title: (res['title'] as String).trim(),
      message: (res['message'] as String?)?.trim(),
      latitude: (res['latitude'] as num).toDouble(),
      longitude: (res['longitude'] as num).toDouble(),
      radiusM: (res['radiusM'] as num).toInt(),
      startAt: startAt,
      expireAt: expireAt,
      // orgId: null // personal por ahora
    );

    await _repo.create(draft);
  }

  // EDITAR alerta → reusa CreateAlertPage en modo edición y luego repo.update(...)
  Future<void> _editAlert(Alert a) async {
    final res = await Navigator.of(context).push<dynamic>(
      MaterialPageRoute(
        builder: (_) => CreateAlertPage(
          isEditing: true,
          initialTitle: a.title,
          initialMessage: a.message,
          initialLatitude: a.latitude,
          initialLongitude: a.longitude,
          initialRadiusM: a.radiusM,
          initialStartAt: a.startAt,
          initialExpireAt: a.expireAt,
          onDelete: () async {
            if (a.id != null) {
              await _repo.delete(a.id!);
            }
          },
        ),
      ),
    );

    if (!mounted || res == null || res == '__DELETE__') return;

    if (res is Map<String, dynamic>) {
      final startRaw = res['startAt'];
      final expireRaw = res['expireAt'];
      final newStartAt = startRaw is String ? DateTime.parse(startRaw) : startRaw as DateTime;
      final newExpireAt = expireRaw == null
          ? null
          : (expireRaw is String ? DateTime.tryParse(expireRaw) : expireRaw as DateTime?);

      final updated = a.copyWith(
        title: (res['title'] as String).trim(),
        message: (res['message'] as String?)?.trim(),
        latitude: (res['latitude'] as num).toDouble(),
        longitude: (res['longitude'] as num).toDouble(),
        radiusM: (res['radiusM'] as num).toInt(),
        startAt: newStartAt,
        expireAt: newExpireAt,
        updatedAt: DateTime.now().toUtc(),
      );

      await _repo.update(updated);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memorae'),
        actions: [
          IconButton(
            tooltip: 'Organizaciones',
            onPressed: _goToOrganizations,
            icon: const Icon(Icons.groups),
          ),
          IconButton(
            tooltip: _loggedIn ? 'Cerrar sesión' : 'Iniciar sesión',
            onPressed: _handleLoginLogout,
            icon: Icon(_loggedIn ? Icons.logout : Icons.login),
          ),
        ],
      ),
      body: StreamBuilder<List<Alert>>(
        stream: _repo.watchAll(),
        builder: (context, snap) {
          final alerts = snap.data ?? const <Alert>[];
          if (alerts.isEmpty) {
            return const Center(child: Text('No hay alertas aún',
                style: TextStyle(color: Colors.white)));
          }
          return Scrollbar(
            thumbVisibility: true,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: alerts.length,
              separatorBuilder: (_, __) => const SizedBox(height: 6),
              itemBuilder: (context, index) {
                final alert = alerts[index];
                return AlertTile(
                  alert: alert,
                  onChanged: (val) {
                    if (alert.id != null) {
                      _repo.setActive(alert.id!, val);
                    }
                  },
                  onTap: () => _editAlert(alert),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createAlert,
        backgroundColor: const Color(0xFFFFFFFF),
        foregroundColor: const Color(0xFF000000),
        child: const Icon(Icons.add),
      ),
    );
  }
}
