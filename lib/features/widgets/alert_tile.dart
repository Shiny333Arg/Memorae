import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../models/alert_item.dart';

class AlertTile extends StatelessWidget {
  const AlertTile({
    super.key,
    required this.alert,
    required this.onChanged,
    this.onTap, //callback opcional
  });

  final Alert alert;
  final ValueChanged<bool> onChanged;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.location_on, color: Colors.red),
        title: Text(alert.title),
        trailing: Switch.adaptive(
          value: alert.deviceActive,
          onChanged: onChanged,
          activeColor: kSwitchActive,
          inactiveThumbColor: kSwitchThumbInactive,
          inactiveTrackColor: kSwitchTrackInactive,
        ),
        onTap: onTap, // abre la edición
      ),
    );
  }
}
