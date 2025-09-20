import 'package:flutter/material.dart';
import '../../models/alert_item.dart';
import '../../theme/app_theme.dart';
import '../../data/sample_alerts.dart';
import '../widgets/alert_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<AlertItem> _alerts = List.from(sampleAlerts);

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

  void _toggleAlert(int index, bool enabled) {
    setState(() => _alerts[index].enabled = enabled);
  }

  // NUEVO: crear → ir a create_alert.dart (ruta '/create_alert')
  void _createAlert() {
    Navigator.of(context).pushNamed('/create_alert');
  }

  // NUEVO: editar → reusar create_alert.dart en modo edición
  Future<void> _editAlert(int index) async {
    final current = _alerts[index];
    await Navigator.of(context).pushNamed(
      '/create_alert',
      arguments: {
        'mode': 'edit',
        'alert': current, // pasa el objeto actual (o su id)
      },
    );
    // Cuando implementes la pantalla, acá puedes refrescar la lista si volvió editada
    // setState(() {});
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
