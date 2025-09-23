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

  //final List<Alert> _alerts = List.from(sampleAlerts);

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

  void _toggleAlert(int index, bool active) {
    setState(() {
      final a = _alerts[index];
      _alerts[index] = a.copyWith(
        deviceActive: active,
        updatedAt: DateTime.now().toUtc(),
      );
    });
  }


  // NUEVO: crear → ir a create_alert.dart (ruta '/create_alert')
  void _createAlert() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const CreateAlertPage(
          isEditing: false,
          // Puedes prellenar si quieres:
          // initialTitle: 'Nueva alerta',
          // initialLatitude: -24.18560,
          // initialLongitude: -65.29950,
          initialRadiusM: 150,
          // initialIsActive: true,
          // initialStartAt: null,    // se elige en la pantalla
          // initialExpireAt: null,   // opcional
        ),
      ),
    );
  }

  // NUEVO: editar → reusar create_alert.dart en modo edición
  Future<void> _editAlert(int index) async {
    final a = _alerts[index];

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
          onDelete: () {
            setState(() => _alerts.removeAt(index));
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

      setState(() {
        _alerts[index] = a.copyWith(
          title: (res['title'] as String).trim(),
          message: (res['message'] as String?)?.trim(),
          latitude: (res['latitude'] as num).toDouble(),
          longitude: (res['longitude'] as num).toDouble(),
          radiusM: (res['radiusM'] as num).toInt(),
          startAt: newStartAt,
          expireAt: newExpireAt,
          updatedAt: DateTime.now().toUtc(),
        );
      });
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
      body: _alerts.isEmpty
          ? const Center(
        child: Text("No hay alertas aún",
            style: TextStyle(color: Colors.white)),
      )
          : Scrollbar(
        thumbVisibility: true,
        child: ListView.separated(
          padding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          itemCount: _alerts.length,
          separatorBuilder: (_, __) => const SizedBox(height: 6),
          itemBuilder: (context, index) {
            final alert = _alerts[index];
            return AlertTile(
              alert: alert,
              onChanged: (val) => _toggleAlert(index, val),
              onTap: () => _editAlert(index),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createAlert, // ← antes abría el selector; ahora navega directo
        backgroundColor: const Color(0xFFFFFFFF),
        foregroundColor: const Color(0xFF000000),
        child: const Icon(Icons.add),
      ),
    );
  }
}
