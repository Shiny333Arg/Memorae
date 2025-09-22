// lista inicial de alertas
import '../models/alert_item.dart';

final List<Alert> sampleAlerts = [
  // Personal: entregar TP
  Alert.create(
    title: 'Recordar entregar el trabajo práctico',
    message: null, // mejor null que '', así no aparece subtítulo vacío
    latitude: -24.18560,
    longitude: -65.29950,
    radiusM: 300,
    startAt: DateTime.now().add(const Duration(hours: 3)),
    expireAt: DateTime.now().add(const Duration(hours: 8)),
  ).copyWith(
    deviceActive: false,                         // ← apagada en la lista
    updatedAt: DateTime.now().toUtc(),           // opcional: refresca timestamp
  ),


  // Personal: comprar hojas A4 (sin fin)
  Alert.create(
    title: 'Comprar hojas A4',
    message: 'Resma de 500 hojas',
    latitude: -24.19010,
    longitude: -65.30220,
    radiusM: 150,
    startAt: DateTime.now().add(const Duration(days: 1, hours: 1)),
    // expireAt: null,
  ).copyWith(
    deviceActive: true,
    updatedAt: DateTime.now().toUtc(),           // opcional: refresca timestamp
  ),

  // Personal: visitar la biblioteca (08:00–20:00 de pasado mañana)
  Alert.create(
    title: 'Visitar la biblioteca',
    message: 'Horario 08:00–20:00',
    latitude: -24.18690,
    longitude: -65.29710,
    radiusM: 400,
    startAt: DateTime.now().add(const Duration(days: 2, hours: 8)),
    expireAt: DateTime.now().add(const Duration(days: 2, hours: 20)),
  ).copyWith(
    deviceActive: true,
    updatedAt: DateTime.now().toUtc(),           // opcional: refresca timestamp
  ),
];