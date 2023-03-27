// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'garages_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GaragesRecord> _$garagesRecordSerializer =
    new _$GaragesRecordSerializer();

class _$GaragesRecordSerializer implements StructuredSerializer<GaragesRecord> {
  @override
  final Iterable<Type> types = const [GaragesRecord, _$GaragesRecord];
  @override
  final String wireName = 'GaragesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, GaragesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.userRef;
    if (value != null) {
      result
        ..add('userRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.city;
    if (value != null) {
      result
        ..add('city')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.zip;
    if (value != null) {
      result
        ..add('zip')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dimensions;
    if (value != null) {
      result
        ..add('dimensions')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.videos;
    if (value != null) {
      result
        ..add('videos')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.rate;
    if (value != null) {
      result
        ..add('rate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.startDateValidity;
    if (value != null) {
      result
        ..add('startDateValidity')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.endDateValidity;
    if (value != null) {
      result
        ..add('endDateValidity')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.isKey;
    if (value != null) {
      result
        ..add('isKey')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  GaragesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GaragesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userRef':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'zip':
          result.zip = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'dimensions':
          result.dimensions = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'videos':
          result.videos.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'rate':
          result.rate = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'startDateValidity':
          result.startDateValidity = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'endDateValidity':
          result.endDateValidity = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'isKey':
          result.isKey = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$GaragesRecord extends GaragesRecord {
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final String? city;
  @override
  final String? address;
  @override
  final String? zip;
  @override
  final String? dimensions;
  @override
  final String? description;
  @override
  final BuiltList<String>? videos;
  @override
  final double? rate;
  @override
  final DateTime? startDateValidity;
  @override
  final DateTime? endDateValidity;
  @override
  final bool? isKey;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$GaragesRecord([void Function(GaragesRecordBuilder)? updates]) =>
      (new GaragesRecordBuilder()..update(updates))._build();

  _$GaragesRecord._(
      {this.userRef,
      this.city,
      this.address,
      this.zip,
      this.dimensions,
      this.description,
      this.videos,
      this.rate,
      this.startDateValidity,
      this.endDateValidity,
      this.isKey,
      this.ffRef})
      : super._();

  @override
  GaragesRecord rebuild(void Function(GaragesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GaragesRecordBuilder toBuilder() => new GaragesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GaragesRecord &&
        userRef == other.userRef &&
        city == other.city &&
        address == other.address &&
        zip == other.zip &&
        dimensions == other.dimensions &&
        description == other.description &&
        videos == other.videos &&
        rate == other.rate &&
        startDateValidity == other.startDateValidity &&
        endDateValidity == other.endDateValidity &&
        isKey == other.isKey &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userRef.hashCode);
    _$hash = $jc(_$hash, city.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, zip.hashCode);
    _$hash = $jc(_$hash, dimensions.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, videos.hashCode);
    _$hash = $jc(_$hash, rate.hashCode);
    _$hash = $jc(_$hash, startDateValidity.hashCode);
    _$hash = $jc(_$hash, endDateValidity.hashCode);
    _$hash = $jc(_$hash, isKey.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GaragesRecord')
          ..add('userRef', userRef)
          ..add('city', city)
          ..add('address', address)
          ..add('zip', zip)
          ..add('dimensions', dimensions)
          ..add('description', description)
          ..add('videos', videos)
          ..add('rate', rate)
          ..add('startDateValidity', startDateValidity)
          ..add('endDateValidity', endDateValidity)
          ..add('isKey', isKey)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class GaragesRecordBuilder
    implements Builder<GaragesRecord, GaragesRecordBuilder> {
  _$GaragesRecord? _$v;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  String? _city;
  String? get city => _$this._city;
  set city(String? city) => _$this._city = city;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _zip;
  String? get zip => _$this._zip;
  set zip(String? zip) => _$this._zip = zip;

  String? _dimensions;
  String? get dimensions => _$this._dimensions;
  set dimensions(String? dimensions) => _$this._dimensions = dimensions;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  ListBuilder<String>? _videos;
  ListBuilder<String> get videos =>
      _$this._videos ??= new ListBuilder<String>();
  set videos(ListBuilder<String>? videos) => _$this._videos = videos;

  double? _rate;
  double? get rate => _$this._rate;
  set rate(double? rate) => _$this._rate = rate;

  DateTime? _startDateValidity;
  DateTime? get startDateValidity => _$this._startDateValidity;
  set startDateValidity(DateTime? startDateValidity) =>
      _$this._startDateValidity = startDateValidity;

  DateTime? _endDateValidity;
  DateTime? get endDateValidity => _$this._endDateValidity;
  set endDateValidity(DateTime? endDateValidity) =>
      _$this._endDateValidity = endDateValidity;

  bool? _isKey;
  bool? get isKey => _$this._isKey;
  set isKey(bool? isKey) => _$this._isKey = isKey;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  GaragesRecordBuilder() {
    GaragesRecord._initializeBuilder(this);
  }

  GaragesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userRef = $v.userRef;
      _city = $v.city;
      _address = $v.address;
      _zip = $v.zip;
      _dimensions = $v.dimensions;
      _description = $v.description;
      _videos = $v.videos?.toBuilder();
      _rate = $v.rate;
      _startDateValidity = $v.startDateValidity;
      _endDateValidity = $v.endDateValidity;
      _isKey = $v.isKey;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GaragesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GaragesRecord;
  }

  @override
  void update(void Function(GaragesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GaragesRecord build() => _build();

  _$GaragesRecord _build() {
    _$GaragesRecord _$result;
    try {
      _$result = _$v ??
          new _$GaragesRecord._(
              userRef: userRef,
              city: city,
              address: address,
              zip: zip,
              dimensions: dimensions,
              description: description,
              videos: _videos?.build(),
              rate: rate,
              startDateValidity: startDateValidity,
              endDateValidity: endDateValidity,
              isKey: isKey,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'videos';
        _videos?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GaragesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
