import 'package:flutter/material.dart';

class CreateAlertPage extends StatefulWidget {
  const CreateAlertPage({
    super.key,
    this.isEditing = false,
    this.initialTitle,
    this.initialMessage,
    this.initialLatitude,
    this.initialLongitude,
    this.initialRadiusM = 150,
    this.initialStartAt,
    this.initialExpireAt,
    this.onPickLocation, // callback para abrir el mapa → devuelve {'latitude': double, 'longitude': double, 'label': String?}
    this.onDelete,       // opcional: lógica extra al borrar
  });

  final bool isEditing;
  final String? initialTitle;
  final String? initialMessage;
  final double? initialLatitude;
  final double? initialLongitude;
  final int initialRadiusM;
  final DateTime? initialStartAt;
  final DateTime? initialExpireAt;

  final Future<Map<String, dynamic>?> Function()? onPickLocation;
  final VoidCallback? onDelete;

  @override
  State<CreateAlertPage> createState() => _CreateAlertPageState();
}

class _CreateAlertPageState extends State<CreateAlertPage> {
  late final TextEditingController _titleCtrl;
  late final TextEditingController _messageCtrl;
  double? _lat;
  double? _lon;
  String _locLabel = 'Sin ubicación seleccionada';
  int _radiusM = 150;

  DateTime? _startAt;
  DateTime? _expireAt;

  @override
  void initState() {
    super.initState();
    _titleCtrl = TextEditingController(text: widget.initialTitle ?? '');
    _messageCtrl = TextEditingController(text: widget.initialMessage ?? '');
    _lat = widget.initialLatitude;
    _lon = widget.initialLongitude;
    _radiusM = widget.initialRadiusM;
    _startAt = widget.initialStartAt;
    _expireAt = widget.initialExpireAt;

    if (_lat != null && _lon != null) {
      _locLabel =
      '(${_lat!.toStringAsFixed(5)}, ${_lon!.toStringAsFixed(5)})';
    }
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    _messageCtrl.dispose();
    super.dispose();
  }

  // ----- Helpers -----
  String _fmtDateTime(DateTime? dt) {
    if (dt == null) return 'No establecido';
    final y = dt.year.toString().padLeft(4, '0');
    final m = dt.month.toString().padLeft(2, '0');
    final d = dt.day.toString().padLeft(2, '0');
    final h = dt.hour.toString().padLeft(2, '0');
    final mi = dt.minute.toString().padLeft(2, '0');
    return '$d/$m/$y $h:$mi';
  }

  Future<void> _pickStartAt() async {
    final now = DateTime.now();
    final base = _startAt ?? now;
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: base,
      firstDate: now.subtract(const Duration(days: 1)),
      lastDate: now.add(const Duration(days: 365 * 2)),
    );
    if (pickedDate == null) return;
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(base),
    );
    if (pickedTime == null) return;
    setState(() {
      _startAt = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );
    });
  }

  Future<void> _pickExpireAt() async {
    final base = _expireAt ?? (_startAt ?? DateTime.now()).add(const Duration(hours: 1));
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: base,
      firstDate: _startAt ?? DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
    );
    if (pickedDate == null) return;
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(base),
    );
    if (pickedTime == null) return;
    setState(() {
      _expireAt = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );
    });
  }

  Future<void> _pickLocation() async {
    if (widget.onPickLocation == null) return;
    final res = await widget.onPickLocation!.call();
    if (res == null) return;
    final lat = res['latitude'] as double?;
    final lon = res['longitude'] as double?;
    final label = res['label'] as String?;
    if (lat == null || lon == null) return;
    setState(() {
      _lat = lat;
      _lon = lon;
      _locLabel = label ??
          '(${_lat!.toStringAsFixed(5)}, ${_lon!.toStringAsFixed(5)})';
    });
  }

  void _save() {
    final title = _titleCtrl.text.trim();
    final message = _messageCtrl.text.trim();

    if (title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Escribe un título')),
      );
      return;
    }
    if (_lat == null || _lon == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecciona una ubicación en el mapa')),
      );
      return;
    }
    if (_radiusM <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('El radio debe ser mayor a 0')),
      );
      return;
    }
    if (_startAt == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecciona fecha y hora de inicio')),
      );
      return;
    }
    if (_expireAt != null && _expireAt!.isBefore(_startAt!)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('La fecha/hora de fin debe ser posterior al inicio')),
      );
      return;
    }

    Navigator.of(context).pop(<String, dynamic>{
      'title': title,
      'message': message.isEmpty ? null : message,
      'latitude': _lat,
      'longitude': _lon,
      'radiusM': _radiusM,
      'startAt': _startAt!.toIso8601String(),
      'expireAt': _expireAt?.toIso8601String(),
      // 'isActive' eliminado: la activación se gestiona en la lista
    });
  }

  void _delete() {
    widget.onDelete?.call();
    Navigator.of(context).pop('__DELETE__');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(widget.isEditing ? 'Editar alerta' : 'Nueva alerta'),
        actions: [
          if (widget.isEditing)
            IconButton(
              tooltip: 'Eliminar',
              onPressed: _delete,
              icon: const Icon(Icons.delete),
            ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bottomInset = MediaQuery.of(context).viewInsets.bottom;
          return SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + bottomInset),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Título
                    TextField(
                      controller: _titleCtrl,
                      autofocus: !widget.isEditing,
                      minLines: 2,
                      maxLines: 2,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        hintText: 'Título de la alerta. Ej: Retirar material en biblioteca',
                        counterStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Mensaje (opcional)
                    TextField(
                      controller: _messageCtrl,
                      minLines: 4,
                      maxLines: 4,
                      maxLength: 200,
                      decoration: const InputDecoration(
                        hintText: 'Mensaje adicional (opcional)',
                        counterStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Ubicación (placeholder de mapa)
                    Text('Ubicación', style: theme.textTheme.titleMedium?.copyWith(color: Colors.white)),
                    const SizedBox(height: 8),
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF3B4148),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFF5A6068)),
                        ),
                        child: Stack(
                          children: [
                            const Center(
                              child: Text(
                                'Mapa (placeholder)',
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                            Positioned(
                              left: 12,
                              right: 12,
                              bottom: 12,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      _locLabel,
                                      style: const TextStyle(color: Colors.white),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  OutlinedButton.icon(
                                    onPressed: _pickLocation,
                                    icon: const Icon(Icons.place),
                                    label: const Text('Seleccionar en el mapa'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Radio
                    Text('Radio (m)', style: theme.textTheme.titleMedium?.copyWith(color: Colors.white)),
                    Row(
                      children: [
                        Expanded(
                          child: Slider(
                            value: _radiusM.toDouble(),
                            min: 50,
                            max: 2000,
                            divisions: 39, // pasos de 50m
                            label: '$_radiusM m',
                            onChanged: (v) => setState(() => _radiusM = v.round()),
                          ),
                        ),
                        SizedBox(
                          width: 72,
                          child: Text(
                            '$_radiusM',
                            textAlign: TextAlign.end,
                            style: theme.textTheme.bodyLarge?.copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // Horario
                    Text('Horario', style: theme.textTheme.titleMedium?.copyWith(color: Colors.white)),
                    const SizedBox(height: 8),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.schedule, color: Colors.white),
                      title: const Text('Inicio', style: TextStyle(color: Colors.white)),
                      subtitle: Text(_fmtDateTime(_startAt), style: const TextStyle(color: Colors.white70)),
                      onTap: _pickStartAt,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.event_busy, color: Colors.white),
                      title: const Text('Fin (opcional)', style: TextStyle(color: Colors.white)),
                      subtitle: Text(_fmtDateTime(_expireAt), style: const TextStyle(color: Colors.white70)),
                      onTap: _pickExpireAt,
                    ),

                    const Spacer(),

                    // Botonera
                    SafeArea(
                      top: false,
                      child: Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('Cancelar'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: FilledButton(
                              onPressed: _save,
                              child: Text(widget.isEditing ? 'Guardar cambios' : 'Guardar'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
