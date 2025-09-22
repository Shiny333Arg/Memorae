// lib/features/alerts/domain/alert.dart
import 'package:flutter/foundation.dart';

@immutable
class Alert {
  // Identificadores
  final int? id;                 // id local (DB)
  final String? remoteId;        // id del servidor (si aplica)
  final int? orgId;              // null = personal; valor = organizacional

  // Contenido
  final String title;            // requerido
  final String? message;         // opcional

  // Ubicación
  final double latitude;         // requerido [-90..90]
  final double longitude;        // requerido [-180..180]
  final int radiusM;             // requerido (>0, ej. 50..2000)

  // Tiempo (UTC en modelo)
  final DateTime startAt;        // requerido (UTC)
  final DateTime? expireAt;      // opcional (UTC)

  // Estado
  final bool deviceActive;       // switch local (lista). DEFAULT true
  final bool? serverActive;      // solo org (viene del backend)
  final DateTime updatedAt;      // UTC, para sincronización

  Alert({
    this.id,
    this.remoteId,
    this.orgId,
    required this.title,
    this.message,
    required this.latitude,
    required this.longitude,
    required this.radiusM,
    required this.startAt,
    this.expireAt,
    required this.deviceActive,
    this.serverActive,
    required this.updatedAt,
  })  : assert(radiusM > 0),
        assert(latitude >= -90 && latitude <= 90),
        assert(longitude >= -180 && longitude <= 180),
        assert(expireAt == null || !expireAt.isBefore(startAt));

  /// Activa “real” en el dispositivo:
  /// - Personal: depende solo de deviceActive
  /// - Org: depende de deviceActive **y** de que serverActive sea true
  bool get effectiveActive =>
      orgId == null ? deviceActive : (deviceActive && (serverActive ?? false));

  Alert copyWith({
    int? id,
    String? remoteId,
    int? orgId,
    String? title,
    String? message,
    double? latitude,
    double? longitude,
    int? radiusM,
    DateTime? startAt,
    DateTime? expireAt,
    bool? deviceActive,
    bool? serverActive,
    DateTime? updatedAt,
  }) {
    return Alert(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      orgId: orgId ?? this.orgId,
      title: title ?? this.title,
      message: message ?? this.message,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      radiusM: radiusM ?? this.radiusM,
      startAt: (startAt ?? this.startAt).toUtc(),
      expireAt: (expireAt ?? this.expireAt)?.toUtc(),
      deviceActive: deviceActive ?? this.deviceActive,
      serverActive: serverActive ?? this.serverActive,
      updatedAt: (updatedAt ?? this.updatedAt).toUtc(),
    );
  }

  /// Creador cómodo para “nueva alerta” desde la UI (activa por defecto).
  factory Alert.create({
    required String title,
    String? message,
    required double latitude,
    required double longitude,
    required int radiusM,
    required DateTime startAt,
    DateTime? expireAt,
    int? orgId,
  }) {
    final now = DateTime.now().toUtc();
    return Alert(
      id: null,
      remoteId: null,
      orgId: orgId,
      title: title,
      message: message,
      latitude: latitude,
      longitude: longitude,
      radiusM: radiusM,
      startAt: startAt.toUtc(),
      expireAt: expireAt?.toUtc(),
      deviceActive: true,          // por defecto, se puede apagar en la lista
      serverActive: orgId == null ? null : true, // o null hasta sync; tu elección
      updatedAt: now,
    );
  }

  /// Aplicar datos del servidor (upsert)
  Alert applyServer({
    String? remoteId,
    bool? serverActive,
    DateTime? serverUpdatedAt,
  }) {
    return copyWith(
      remoteId: remoteId ?? this.remoteId,
      serverActive: serverActive ?? this.serverActive,
      updatedAt: (serverUpdatedAt ?? DateTime.now()).toUtc(),
    );
  }

  // -------- JSON (para API/local storage simple) --------
  factory Alert.fromJson(Map<String, dynamic> json) {
    DateTime? parseDt(dynamic v) =>
        v == null ? null : DateTime.parse(v as String).toUtc();

    return Alert(
      id: json['id'] as int?,
      remoteId: json['remoteId'] as String?,
      orgId: json['orgId'] as int?,
      title: json['title'] as String,
      message: json['message'] as String?,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      radiusM: (json['radiusM'] as num).toInt(),
      startAt: DateTime.parse(json['startAt'] as String).toUtc(),
      expireAt: parseDt(json['expireAt']),
      deviceActive: json['deviceActive'] as bool? ?? true,
      serverActive: json['serverActive'] as bool?,
      updatedAt: DateTime.parse(json['updatedAt'] as String).toUtc(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'remoteId': remoteId,
    'orgId': orgId,
    'title': title,
    'message': message,
    'latitude': latitude,
    'longitude': longitude,
    'radiusM': radiusM,
    'startAt': startAt.toUtc().toIso8601String(),
    'expireAt': expireAt?.toUtc().toIso8601String(),
    'deviceActive': deviceActive,
    'serverActive': serverActive,
    'updatedAt': updatedAt.toUtc().toIso8601String(),
  };
}
