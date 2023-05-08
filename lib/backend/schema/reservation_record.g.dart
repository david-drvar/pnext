// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ReservationRecord> _$reservationRecordSerializer =
    new _$ReservationRecordSerializer();

class _$ReservationRecordSerializer
    implements StructuredSerializer<ReservationRecord> {
  @override
  final Iterable<Type> types = const [ReservationRecord, _$ReservationRecord];
  @override
  final String wireName = 'ReservationRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ReservationRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.carCode;
    if (value != null) {
      result
        ..add('car_code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dateStart;
    if (value != null) {
      result
        ..add('date_start')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.dateEnd;
    if (value != null) {
      result
        ..add('date_end')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.dimension;
    if (value != null) {
      result
        ..add('dimension')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.garageReference;
    if (value != null) {
      result
        ..add('garage_reference')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.totalPrice;
    if (value != null) {
      result
        ..add('total_price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.dateReservation;
    if (value != null) {
      result
        ..add('date_reservation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  ReservationRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReservationRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'car_code':
          result.carCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'date_start':
          result.dateStart = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'date_end':
          result.dateEnd = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'dimension':
          result.dimension = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'garage_reference':
          result.garageReference = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'total_price':
          result.totalPrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'date_reservation':
          result.dateReservation = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$ReservationRecord extends ReservationRecord {
  @override
  final String? carCode;
  @override
  final DateTime? dateStart;
  @override
  final DateTime? dateEnd;
  @override
  final String? dimension;
  @override
  final DocumentReference<Object?>? garageReference;
  @override
  final DocumentReference<Object?>? user;
  @override
  final double? totalPrice;
  @override
  final DateTime? dateReservation;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ReservationRecord(
          [void Function(ReservationRecordBuilder)? updates]) =>
      (new ReservationRecordBuilder()..update(updates))._build();

  _$ReservationRecord._(
      {this.carCode,
      this.dateStart,
      this.dateEnd,
      this.dimension,
      this.garageReference,
      this.user,
      this.totalPrice,
      this.dateReservation,
      this.ffRef})
      : super._();

  @override
  ReservationRecord rebuild(void Function(ReservationRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReservationRecordBuilder toBuilder() =>
      new ReservationRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReservationRecord &&
        carCode == other.carCode &&
        dateStart == other.dateStart &&
        dateEnd == other.dateEnd &&
        dimension == other.dimension &&
        garageReference == other.garageReference &&
        user == other.user &&
        totalPrice == other.totalPrice &&
        dateReservation == other.dateReservation &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, carCode.hashCode);
    _$hash = $jc(_$hash, dateStart.hashCode);
    _$hash = $jc(_$hash, dateEnd.hashCode);
    _$hash = $jc(_$hash, dimension.hashCode);
    _$hash = $jc(_$hash, garageReference.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, totalPrice.hashCode);
    _$hash = $jc(_$hash, dateReservation.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReservationRecord')
          ..add('carCode', carCode)
          ..add('dateStart', dateStart)
          ..add('dateEnd', dateEnd)
          ..add('dimension', dimension)
          ..add('garageReference', garageReference)
          ..add('user', user)
          ..add('totalPrice', totalPrice)
          ..add('dateReservation', dateReservation)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ReservationRecordBuilder
    implements Builder<ReservationRecord, ReservationRecordBuilder> {
  _$ReservationRecord? _$v;

  String? _carCode;
  String? get carCode => _$this._carCode;
  set carCode(String? carCode) => _$this._carCode = carCode;

  DateTime? _dateStart;
  DateTime? get dateStart => _$this._dateStart;
  set dateStart(DateTime? dateStart) => _$this._dateStart = dateStart;

  DateTime? _dateEnd;
  DateTime? get dateEnd => _$this._dateEnd;
  set dateEnd(DateTime? dateEnd) => _$this._dateEnd = dateEnd;

  String? _dimension;
  String? get dimension => _$this._dimension;
  set dimension(String? dimension) => _$this._dimension = dimension;

  DocumentReference<Object?>? _garageReference;
  DocumentReference<Object?>? get garageReference => _$this._garageReference;
  set garageReference(DocumentReference<Object?>? garageReference) =>
      _$this._garageReference = garageReference;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  double? _totalPrice;
  double? get totalPrice => _$this._totalPrice;
  set totalPrice(double? totalPrice) => _$this._totalPrice = totalPrice;

  DateTime? _dateReservation;
  DateTime? get dateReservation => _$this._dateReservation;
  set dateReservation(DateTime? dateReservation) =>
      _$this._dateReservation = dateReservation;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ReservationRecordBuilder() {
    ReservationRecord._initializeBuilder(this);
  }

  ReservationRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _carCode = $v.carCode;
      _dateStart = $v.dateStart;
      _dateEnd = $v.dateEnd;
      _dimension = $v.dimension;
      _garageReference = $v.garageReference;
      _user = $v.user;
      _totalPrice = $v.totalPrice;
      _dateReservation = $v.dateReservation;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReservationRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReservationRecord;
  }

  @override
  void update(void Function(ReservationRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReservationRecord build() => _build();

  _$ReservationRecord _build() {
    final _$result = _$v ??
        new _$ReservationRecord._(
            carCode: carCode,
            dateStart: dateStart,
            dateEnd: dateEnd,
            dimension: dimension,
            garageReference: garageReference,
            user: user,
            totalPrice: totalPrice,
            dateReservation: dateReservation,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
