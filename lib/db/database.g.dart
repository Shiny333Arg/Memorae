// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $AlertsTable extends Alerts with TableInfo<$AlertsTable, Alert> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AlertsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _orgIdMeta = const VerificationMeta('orgId');
  @override
  late final GeneratedColumn<int> orgId = GeneratedColumn<int>(
    'org_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ownerUidMeta = const VerificationMeta(
    'ownerUid',
  );
  @override
  late final GeneratedColumn<String> ownerUid = GeneratedColumn<String>(
    'owner_uid',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _remoteIdMeta = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _clientUidMeta = const VerificationMeta(
    'clientUid',
  );
  @override
  late final GeneratedColumn<String> clientUid = GeneratedColumn<String>(
    'client_uid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messageMeta = const VerificationMeta(
    'message',
  );
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
    'message',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _radiusMMeta = const VerificationMeta(
    'radiusM',
  );
  @override
  late final GeneratedColumn<int> radiusM = GeneratedColumn<int>(
    'radius_m',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startAtMeta = const VerificationMeta(
    'startAt',
  );
  @override
  late final GeneratedColumn<DateTime> startAt = GeneratedColumn<DateTime>(
    'start_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expireAtMeta = const VerificationMeta(
    'expireAt',
  );
  @override
  late final GeneratedColumn<DateTime> expireAt = GeneratedColumn<DateTime>(
    'expire_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deviceActiveMeta = const VerificationMeta(
    'deviceActive',
  );
  @override
  late final GeneratedColumn<bool> deviceActive = GeneratedColumn<bool>(
    'device_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("device_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _serverActiveMeta = const VerificationMeta(
    'serverActive',
  );
  @override
  late final GeneratedColumn<bool> serverActive = GeneratedColumn<bool>(
    'server_active',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("server_active" IN (0, 1))',
    ),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    orgId,
    ownerUid,
    remoteId,
    clientUid,
    title,
    message,
    latitude,
    longitude,
    radiusM,
    startAt,
    expireAt,
    deviceActive,
    serverActive,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'alerts';
  @override
  VerificationContext validateIntegrity(
    Insertable<Alert> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('org_id')) {
      context.handle(
        _orgIdMeta,
        orgId.isAcceptableOrUnknown(data['org_id']!, _orgIdMeta),
      );
    }
    if (data.containsKey('owner_uid')) {
      context.handle(
        _ownerUidMeta,
        ownerUid.isAcceptableOrUnknown(data['owner_uid']!, _ownerUidMeta),
      );
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _remoteIdMeta,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta),
      );
    }
    if (data.containsKey('client_uid')) {
      context.handle(
        _clientUidMeta,
        clientUid.isAcceptableOrUnknown(data['client_uid']!, _clientUidMeta),
      );
    } else if (isInserting) {
      context.missing(_clientUidMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('message')) {
      context.handle(
        _messageMeta,
        message.isAcceptableOrUnknown(data['message']!, _messageMeta),
      );
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('radius_m')) {
      context.handle(
        _radiusMMeta,
        radiusM.isAcceptableOrUnknown(data['radius_m']!, _radiusMMeta),
      );
    } else if (isInserting) {
      context.missing(_radiusMMeta);
    }
    if (data.containsKey('start_at')) {
      context.handle(
        _startAtMeta,
        startAt.isAcceptableOrUnknown(data['start_at']!, _startAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startAtMeta);
    }
    if (data.containsKey('expire_at')) {
      context.handle(
        _expireAtMeta,
        expireAt.isAcceptableOrUnknown(data['expire_at']!, _expireAtMeta),
      );
    }
    if (data.containsKey('device_active')) {
      context.handle(
        _deviceActiveMeta,
        deviceActive.isAcceptableOrUnknown(
          data['device_active']!,
          _deviceActiveMeta,
        ),
      );
    }
    if (data.containsKey('server_active')) {
      context.handle(
        _serverActiveMeta,
        serverActive.isAcceptableOrUnknown(
          data['server_active']!,
          _serverActiveMeta,
        ),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {clientUid},
    {orgId, remoteId},
    {ownerUid, remoteId},
  ];
  @override
  Alert map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Alert(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      orgId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}org_id'],
      ),
      ownerUid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_uid'],
      ),
      remoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_id'],
      ),
      clientUid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_uid'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      message: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}message'],
      ),
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      )!,
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      )!,
      radiusM: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}radius_m'],
      )!,
      startAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_at'],
      )!,
      expireAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expire_at'],
      ),
      deviceActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}device_active'],
      )!,
      serverActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}server_active'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $AlertsTable createAlias(String alias) {
    return $AlertsTable(attachedDatabase, alias);
  }
}

class Alert extends DataClass implements Insertable<Alert> {
  final int id;
  final int? orgId;
  final String? ownerUid;
  final String? remoteId;
  final String clientUid;
  final String title;
  final String? message;
  final double latitude;
  final double longitude;
  final int radiusM;
  final DateTime startAt;
  final DateTime? expireAt;
  final bool deviceActive;
  final bool? serverActive;
  final DateTime updatedAt;
  const Alert({
    required this.id,
    this.orgId,
    this.ownerUid,
    this.remoteId,
    required this.clientUid,
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
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || orgId != null) {
      map['org_id'] = Variable<int>(orgId);
    }
    if (!nullToAbsent || ownerUid != null) {
      map['owner_uid'] = Variable<String>(ownerUid);
    }
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    map['client_uid'] = Variable<String>(clientUid);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || message != null) {
      map['message'] = Variable<String>(message);
    }
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    map['radius_m'] = Variable<int>(radiusM);
    map['start_at'] = Variable<DateTime>(startAt);
    if (!nullToAbsent || expireAt != null) {
      map['expire_at'] = Variable<DateTime>(expireAt);
    }
    map['device_active'] = Variable<bool>(deviceActive);
    if (!nullToAbsent || serverActive != null) {
      map['server_active'] = Variable<bool>(serverActive);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AlertsCompanion toCompanion(bool nullToAbsent) {
    return AlertsCompanion(
      id: Value(id),
      orgId: orgId == null && nullToAbsent
          ? const Value.absent()
          : Value(orgId),
      ownerUid: ownerUid == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerUid),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      clientUid: Value(clientUid),
      title: Value(title),
      message: message == null && nullToAbsent
          ? const Value.absent()
          : Value(message),
      latitude: Value(latitude),
      longitude: Value(longitude),
      radiusM: Value(radiusM),
      startAt: Value(startAt),
      expireAt: expireAt == null && nullToAbsent
          ? const Value.absent()
          : Value(expireAt),
      deviceActive: Value(deviceActive),
      serverActive: serverActive == null && nullToAbsent
          ? const Value.absent()
          : Value(serverActive),
      updatedAt: Value(updatedAt),
    );
  }

  factory Alert.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Alert(
      id: serializer.fromJson<int>(json['id']),
      orgId: serializer.fromJson<int?>(json['orgId']),
      ownerUid: serializer.fromJson<String?>(json['ownerUid']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      clientUid: serializer.fromJson<String>(json['clientUid']),
      title: serializer.fromJson<String>(json['title']),
      message: serializer.fromJson<String?>(json['message']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      radiusM: serializer.fromJson<int>(json['radiusM']),
      startAt: serializer.fromJson<DateTime>(json['startAt']),
      expireAt: serializer.fromJson<DateTime?>(json['expireAt']),
      deviceActive: serializer.fromJson<bool>(json['deviceActive']),
      serverActive: serializer.fromJson<bool?>(json['serverActive']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'orgId': serializer.toJson<int?>(orgId),
      'ownerUid': serializer.toJson<String?>(ownerUid),
      'remoteId': serializer.toJson<String?>(remoteId),
      'clientUid': serializer.toJson<String>(clientUid),
      'title': serializer.toJson<String>(title),
      'message': serializer.toJson<String?>(message),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'radiusM': serializer.toJson<int>(radiusM),
      'startAt': serializer.toJson<DateTime>(startAt),
      'expireAt': serializer.toJson<DateTime?>(expireAt),
      'deviceActive': serializer.toJson<bool>(deviceActive),
      'serverActive': serializer.toJson<bool?>(serverActive),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Alert copyWith({
    int? id,
    Value<int?> orgId = const Value.absent(),
    Value<String?> ownerUid = const Value.absent(),
    Value<String?> remoteId = const Value.absent(),
    String? clientUid,
    String? title,
    Value<String?> message = const Value.absent(),
    double? latitude,
    double? longitude,
    int? radiusM,
    DateTime? startAt,
    Value<DateTime?> expireAt = const Value.absent(),
    bool? deviceActive,
    Value<bool?> serverActive = const Value.absent(),
    DateTime? updatedAt,
  }) => Alert(
    id: id ?? this.id,
    orgId: orgId.present ? orgId.value : this.orgId,
    ownerUid: ownerUid.present ? ownerUid.value : this.ownerUid,
    remoteId: remoteId.present ? remoteId.value : this.remoteId,
    clientUid: clientUid ?? this.clientUid,
    title: title ?? this.title,
    message: message.present ? message.value : this.message,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    radiusM: radiusM ?? this.radiusM,
    startAt: startAt ?? this.startAt,
    expireAt: expireAt.present ? expireAt.value : this.expireAt,
    deviceActive: deviceActive ?? this.deviceActive,
    serverActive: serverActive.present ? serverActive.value : this.serverActive,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Alert copyWithCompanion(AlertsCompanion data) {
    return Alert(
      id: data.id.present ? data.id.value : this.id,
      orgId: data.orgId.present ? data.orgId.value : this.orgId,
      ownerUid: data.ownerUid.present ? data.ownerUid.value : this.ownerUid,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      clientUid: data.clientUid.present ? data.clientUid.value : this.clientUid,
      title: data.title.present ? data.title.value : this.title,
      message: data.message.present ? data.message.value : this.message,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      radiusM: data.radiusM.present ? data.radiusM.value : this.radiusM,
      startAt: data.startAt.present ? data.startAt.value : this.startAt,
      expireAt: data.expireAt.present ? data.expireAt.value : this.expireAt,
      deviceActive: data.deviceActive.present
          ? data.deviceActive.value
          : this.deviceActive,
      serverActive: data.serverActive.present
          ? data.serverActive.value
          : this.serverActive,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Alert(')
          ..write('id: $id, ')
          ..write('orgId: $orgId, ')
          ..write('ownerUid: $ownerUid, ')
          ..write('remoteId: $remoteId, ')
          ..write('clientUid: $clientUid, ')
          ..write('title: $title, ')
          ..write('message: $message, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('radiusM: $radiusM, ')
          ..write('startAt: $startAt, ')
          ..write('expireAt: $expireAt, ')
          ..write('deviceActive: $deviceActive, ')
          ..write('serverActive: $serverActive, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    orgId,
    ownerUid,
    remoteId,
    clientUid,
    title,
    message,
    latitude,
    longitude,
    radiusM,
    startAt,
    expireAt,
    deviceActive,
    serverActive,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Alert &&
          other.id == this.id &&
          other.orgId == this.orgId &&
          other.ownerUid == this.ownerUid &&
          other.remoteId == this.remoteId &&
          other.clientUid == this.clientUid &&
          other.title == this.title &&
          other.message == this.message &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.radiusM == this.radiusM &&
          other.startAt == this.startAt &&
          other.expireAt == this.expireAt &&
          other.deviceActive == this.deviceActive &&
          other.serverActive == this.serverActive &&
          other.updatedAt == this.updatedAt);
}

class AlertsCompanion extends UpdateCompanion<Alert> {
  final Value<int> id;
  final Value<int?> orgId;
  final Value<String?> ownerUid;
  final Value<String?> remoteId;
  final Value<String> clientUid;
  final Value<String> title;
  final Value<String?> message;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<int> radiusM;
  final Value<DateTime> startAt;
  final Value<DateTime?> expireAt;
  final Value<bool> deviceActive;
  final Value<bool?> serverActive;
  final Value<DateTime> updatedAt;
  const AlertsCompanion({
    this.id = const Value.absent(),
    this.orgId = const Value.absent(),
    this.ownerUid = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.clientUid = const Value.absent(),
    this.title = const Value.absent(),
    this.message = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.radiusM = const Value.absent(),
    this.startAt = const Value.absent(),
    this.expireAt = const Value.absent(),
    this.deviceActive = const Value.absent(),
    this.serverActive = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  AlertsCompanion.insert({
    this.id = const Value.absent(),
    this.orgId = const Value.absent(),
    this.ownerUid = const Value.absent(),
    this.remoteId = const Value.absent(),
    required String clientUid,
    required String title,
    this.message = const Value.absent(),
    required double latitude,
    required double longitude,
    required int radiusM,
    required DateTime startAt,
    this.expireAt = const Value.absent(),
    this.deviceActive = const Value.absent(),
    this.serverActive = const Value.absent(),
    required DateTime updatedAt,
  }) : clientUid = Value(clientUid),
       title = Value(title),
       latitude = Value(latitude),
       longitude = Value(longitude),
       radiusM = Value(radiusM),
       startAt = Value(startAt),
       updatedAt = Value(updatedAt);
  static Insertable<Alert> custom({
    Expression<int>? id,
    Expression<int>? orgId,
    Expression<String>? ownerUid,
    Expression<String>? remoteId,
    Expression<String>? clientUid,
    Expression<String>? title,
    Expression<String>? message,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<int>? radiusM,
    Expression<DateTime>? startAt,
    Expression<DateTime>? expireAt,
    Expression<bool>? deviceActive,
    Expression<bool>? serverActive,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (orgId != null) 'org_id': orgId,
      if (ownerUid != null) 'owner_uid': ownerUid,
      if (remoteId != null) 'remote_id': remoteId,
      if (clientUid != null) 'client_uid': clientUid,
      if (title != null) 'title': title,
      if (message != null) 'message': message,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (radiusM != null) 'radius_m': radiusM,
      if (startAt != null) 'start_at': startAt,
      if (expireAt != null) 'expire_at': expireAt,
      if (deviceActive != null) 'device_active': deviceActive,
      if (serverActive != null) 'server_active': serverActive,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  AlertsCompanion copyWith({
    Value<int>? id,
    Value<int?>? orgId,
    Value<String?>? ownerUid,
    Value<String?>? remoteId,
    Value<String>? clientUid,
    Value<String>? title,
    Value<String?>? message,
    Value<double>? latitude,
    Value<double>? longitude,
    Value<int>? radiusM,
    Value<DateTime>? startAt,
    Value<DateTime?>? expireAt,
    Value<bool>? deviceActive,
    Value<bool?>? serverActive,
    Value<DateTime>? updatedAt,
  }) {
    return AlertsCompanion(
      id: id ?? this.id,
      orgId: orgId ?? this.orgId,
      ownerUid: ownerUid ?? this.ownerUid,
      remoteId: remoteId ?? this.remoteId,
      clientUid: clientUid ?? this.clientUid,
      title: title ?? this.title,
      message: message ?? this.message,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      radiusM: radiusM ?? this.radiusM,
      startAt: startAt ?? this.startAt,
      expireAt: expireAt ?? this.expireAt,
      deviceActive: deviceActive ?? this.deviceActive,
      serverActive: serverActive ?? this.serverActive,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (orgId.present) {
      map['org_id'] = Variable<int>(orgId.value);
    }
    if (ownerUid.present) {
      map['owner_uid'] = Variable<String>(ownerUid.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (clientUid.present) {
      map['client_uid'] = Variable<String>(clientUid.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (radiusM.present) {
      map['radius_m'] = Variable<int>(radiusM.value);
    }
    if (startAt.present) {
      map['start_at'] = Variable<DateTime>(startAt.value);
    }
    if (expireAt.present) {
      map['expire_at'] = Variable<DateTime>(expireAt.value);
    }
    if (deviceActive.present) {
      map['device_active'] = Variable<bool>(deviceActive.value);
    }
    if (serverActive.present) {
      map['server_active'] = Variable<bool>(serverActive.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AlertsCompanion(')
          ..write('id: $id, ')
          ..write('orgId: $orgId, ')
          ..write('ownerUid: $ownerUid, ')
          ..write('remoteId: $remoteId, ')
          ..write('clientUid: $clientUid, ')
          ..write('title: $title, ')
          ..write('message: $message, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('radiusM: $radiusM, ')
          ..write('startAt: $startAt, ')
          ..write('expireAt: $expireAt, ')
          ..write('deviceActive: $deviceActive, ')
          ..write('serverActive: $serverActive, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AlertsTable alerts = $AlertsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [alerts];
}

typedef $$AlertsTableCreateCompanionBuilder =
    AlertsCompanion Function({
      Value<int> id,
      Value<int?> orgId,
      Value<String?> ownerUid,
      Value<String?> remoteId,
      required String clientUid,
      required String title,
      Value<String?> message,
      required double latitude,
      required double longitude,
      required int radiusM,
      required DateTime startAt,
      Value<DateTime?> expireAt,
      Value<bool> deviceActive,
      Value<bool?> serverActive,
      required DateTime updatedAt,
    });
typedef $$AlertsTableUpdateCompanionBuilder =
    AlertsCompanion Function({
      Value<int> id,
      Value<int?> orgId,
      Value<String?> ownerUid,
      Value<String?> remoteId,
      Value<String> clientUid,
      Value<String> title,
      Value<String?> message,
      Value<double> latitude,
      Value<double> longitude,
      Value<int> radiusM,
      Value<DateTime> startAt,
      Value<DateTime?> expireAt,
      Value<bool> deviceActive,
      Value<bool?> serverActive,
      Value<DateTime> updatedAt,
    });

class $$AlertsTableFilterComposer
    extends Composer<_$AppDatabase, $AlertsTable> {
  $$AlertsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orgId => $composableBuilder(
    column: $table.orgId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerUid => $composableBuilder(
    column: $table.ownerUid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clientUid => $composableBuilder(
    column: $table.clientUid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get radiusM => $composableBuilder(
    column: $table.radiusM,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startAt => $composableBuilder(
    column: $table.startAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expireAt => $composableBuilder(
    column: $table.expireAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get deviceActive => $composableBuilder(
    column: $table.deviceActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get serverActive => $composableBuilder(
    column: $table.serverActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AlertsTableOrderingComposer
    extends Composer<_$AppDatabase, $AlertsTable> {
  $$AlertsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orgId => $composableBuilder(
    column: $table.orgId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerUid => $composableBuilder(
    column: $table.ownerUid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clientUid => $composableBuilder(
    column: $table.clientUid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get radiusM => $composableBuilder(
    column: $table.radiusM,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startAt => $composableBuilder(
    column: $table.startAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expireAt => $composableBuilder(
    column: $table.expireAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get deviceActive => $composableBuilder(
    column: $table.deviceActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get serverActive => $composableBuilder(
    column: $table.serverActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AlertsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AlertsTable> {
  $$AlertsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get orgId =>
      $composableBuilder(column: $table.orgId, builder: (column) => column);

  GeneratedColumn<String> get ownerUid =>
      $composableBuilder(column: $table.ownerUid, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<String> get clientUid =>
      $composableBuilder(column: $table.clientUid, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<int> get radiusM =>
      $composableBuilder(column: $table.radiusM, builder: (column) => column);

  GeneratedColumn<DateTime> get startAt =>
      $composableBuilder(column: $table.startAt, builder: (column) => column);

  GeneratedColumn<DateTime> get expireAt =>
      $composableBuilder(column: $table.expireAt, builder: (column) => column);

  GeneratedColumn<bool> get deviceActive => $composableBuilder(
    column: $table.deviceActive,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get serverActive => $composableBuilder(
    column: $table.serverActive,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$AlertsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AlertsTable,
          Alert,
          $$AlertsTableFilterComposer,
          $$AlertsTableOrderingComposer,
          $$AlertsTableAnnotationComposer,
          $$AlertsTableCreateCompanionBuilder,
          $$AlertsTableUpdateCompanionBuilder,
          (Alert, BaseReferences<_$AppDatabase, $AlertsTable, Alert>),
          Alert,
          PrefetchHooks Function()
        > {
  $$AlertsTableTableManager(_$AppDatabase db, $AlertsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AlertsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AlertsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AlertsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> orgId = const Value.absent(),
                Value<String?> ownerUid = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                Value<String> clientUid = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> message = const Value.absent(),
                Value<double> latitude = const Value.absent(),
                Value<double> longitude = const Value.absent(),
                Value<int> radiusM = const Value.absent(),
                Value<DateTime> startAt = const Value.absent(),
                Value<DateTime?> expireAt = const Value.absent(),
                Value<bool> deviceActive = const Value.absent(),
                Value<bool?> serverActive = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => AlertsCompanion(
                id: id,
                orgId: orgId,
                ownerUid: ownerUid,
                remoteId: remoteId,
                clientUid: clientUid,
                title: title,
                message: message,
                latitude: latitude,
                longitude: longitude,
                radiusM: radiusM,
                startAt: startAt,
                expireAt: expireAt,
                deviceActive: deviceActive,
                serverActive: serverActive,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> orgId = const Value.absent(),
                Value<String?> ownerUid = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                required String clientUid,
                required String title,
                Value<String?> message = const Value.absent(),
                required double latitude,
                required double longitude,
                required int radiusM,
                required DateTime startAt,
                Value<DateTime?> expireAt = const Value.absent(),
                Value<bool> deviceActive = const Value.absent(),
                Value<bool?> serverActive = const Value.absent(),
                required DateTime updatedAt,
              }) => AlertsCompanion.insert(
                id: id,
                orgId: orgId,
                ownerUid: ownerUid,
                remoteId: remoteId,
                clientUid: clientUid,
                title: title,
                message: message,
                latitude: latitude,
                longitude: longitude,
                radiusM: radiusM,
                startAt: startAt,
                expireAt: expireAt,
                deviceActive: deviceActive,
                serverActive: serverActive,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AlertsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AlertsTable,
      Alert,
      $$AlertsTableFilterComposer,
      $$AlertsTableOrderingComposer,
      $$AlertsTableAnnotationComposer,
      $$AlertsTableCreateCompanionBuilder,
      $$AlertsTableUpdateCompanionBuilder,
      (Alert, BaseReferences<_$AppDatabase, $AlertsTable, Alert>),
      Alert,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AlertsTableTableManager get alerts =>
      $$AlertsTableTableManager(_db, _db.alerts);
}
