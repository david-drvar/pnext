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
    value = object.mondayStart;
    if (value != null) {
      result
        ..add('monday_start')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.mondayEnd;
    if (value != null) {
      result
        ..add('monday_end')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.photos;
    if (value != null) {
      result
        ..add('photos')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.videos;
    if (value != null) {
      result
        ..add('videos')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.tuesdayStart;
    if (value != null) {
      result
        ..add('tuesday_start')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.tuesdayEnd;
    if (value != null) {
      result
        ..add('tuesday_end')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.wednesdayStart;
    if (value != null) {
      result
        ..add('wednesday_start')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.wednesdayEnd;
    if (value != null) {
      result
        ..add('wednesday_end')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.thursdayStart;
    if (value != null) {
      result
        ..add('thursday_start')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.thursdayEnd;
    if (value != null) {
      result
        ..add('thursday_end')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.fridayStart;
    if (value != null) {
      result
        ..add('friday_start')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.fridayEnd;
    if (value != null) {
      result
        ..add('friday_end')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.saturdayStart;
    if (value != null) {
      result
        ..add('saturday_start')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.saturdayEnd;
    if (value != null) {
      result
        ..add('saturday_end')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.sundayStart;
    if (value != null) {
      result
        ..add('sunday_start')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.sundayEnd;
    if (value != null) {
      result
        ..add('sunday_end')
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
        case 'monday_start':
          result.mondayStart = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'monday_end':
          result.mondayEnd = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'photos':
          result.photos.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'videos':
          result.videos.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'tuesday_start':
          result.tuesdayStart = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'tuesday_end':
          result.tuesdayEnd = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'wednesday_start':
          result.wednesdayStart = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'wednesday_end':
          result.wednesdayEnd = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'thursday_start':
          result.thursdayStart = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'thursday_end':
          result.thursdayEnd = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'friday_start':
          result.fridayStart = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'friday_end':
          result.fridayEnd = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'saturday_start':
          result.saturdayStart = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'saturday_end':
          result.saturdayEnd = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'sunday_start':
          result.sundayStart = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'sunday_end':
          result.sundayEnd = serializers.deserialize(value,
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
  final double? rate;
  @override
  final DateTime? startDateValidity;
  @override
  final DateTime? endDateValidity;
  @override
  final bool? isKey;
  @override
  final DateTime? mondayStart;
  @override
  final DateTime? mondayEnd;
  @override
  final LatLng? location;
  @override
  final BuiltList<String>? photos;
  @override
  final BuiltList<String>? videos;
  @override
  final DateTime? tuesdayStart;
  @override
  final DateTime? tuesdayEnd;
  @override
  final DateTime? wednesdayStart;
  @override
  final DateTime? wednesdayEnd;
  @override
  final DateTime? thursdayStart;
  @override
  final DateTime? thursdayEnd;
  @override
  final DateTime? fridayStart;
  @override
  final DateTime? fridayEnd;
  @override
  final DateTime? saturdayStart;
  @override
  final DateTime? saturdayEnd;
  @override
  final DateTime? sundayStart;
  @override
  final DateTime? sundayEnd;
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
      this.rate,
      this.startDateValidity,
      this.endDateValidity,
      this.isKey,
      this.mondayStart,
      this.mondayEnd,
      this.location,
      this.photos,
      this.videos,
      this.tuesdayStart,
      this.tuesdayEnd,
      this.wednesdayStart,
      this.wednesdayEnd,
      this.thursdayStart,
      this.thursdayEnd,
      this.fridayStart,
      this.fridayEnd,
      this.saturdayStart,
      this.saturdayEnd,
      this.sundayStart,
      this.sundayEnd,
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
        rate == other.rate &&
        startDateValidity == other.startDateValidity &&
        endDateValidity == other.endDateValidity &&
        isKey == other.isKey &&
        mondayStart == other.mondayStart &&
        mondayEnd == other.mondayEnd &&
        location == other.location &&
        photos == other.photos &&
        videos == other.videos &&
        tuesdayStart == other.tuesdayStart &&
        tuesdayEnd == other.tuesdayEnd &&
        wednesdayStart == other.wednesdayStart &&
        wednesdayEnd == other.wednesdayEnd &&
        thursdayStart == other.thursdayStart &&
        thursdayEnd == other.thursdayEnd &&
        fridayStart == other.fridayStart &&
        fridayEnd == other.fridayEnd &&
        saturdayStart == other.saturdayStart &&
        saturdayEnd == other.saturdayEnd &&
        sundayStart == other.sundayStart &&
        sundayEnd == other.sundayEnd &&
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
    _$hash = $jc(_$hash, rate.hashCode);
    _$hash = $jc(_$hash, startDateValidity.hashCode);
    _$hash = $jc(_$hash, endDateValidity.hashCode);
    _$hash = $jc(_$hash, isKey.hashCode);
    _$hash = $jc(_$hash, mondayStart.hashCode);
    _$hash = $jc(_$hash, mondayEnd.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, photos.hashCode);
    _$hash = $jc(_$hash, videos.hashCode);
    _$hash = $jc(_$hash, tuesdayStart.hashCode);
    _$hash = $jc(_$hash, tuesdayEnd.hashCode);
    _$hash = $jc(_$hash, wednesdayStart.hashCode);
    _$hash = $jc(_$hash, wednesdayEnd.hashCode);
    _$hash = $jc(_$hash, thursdayStart.hashCode);
    _$hash = $jc(_$hash, thursdayEnd.hashCode);
    _$hash = $jc(_$hash, fridayStart.hashCode);
    _$hash = $jc(_$hash, fridayEnd.hashCode);
    _$hash = $jc(_$hash, saturdayStart.hashCode);
    _$hash = $jc(_$hash, saturdayEnd.hashCode);
    _$hash = $jc(_$hash, sundayStart.hashCode);
    _$hash = $jc(_$hash, sundayEnd.hashCode);
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
          ..add('rate', rate)
          ..add('startDateValidity', startDateValidity)
          ..add('endDateValidity', endDateValidity)
          ..add('isKey', isKey)
          ..add('mondayStart', mondayStart)
          ..add('mondayEnd', mondayEnd)
          ..add('location', location)
          ..add('photos', photos)
          ..add('videos', videos)
          ..add('tuesdayStart', tuesdayStart)
          ..add('tuesdayEnd', tuesdayEnd)
          ..add('wednesdayStart', wednesdayStart)
          ..add('wednesdayEnd', wednesdayEnd)
          ..add('thursdayStart', thursdayStart)
          ..add('thursdayEnd', thursdayEnd)
          ..add('fridayStart', fridayStart)
          ..add('fridayEnd', fridayEnd)
          ..add('saturdayStart', saturdayStart)
          ..add('saturdayEnd', saturdayEnd)
          ..add('sundayStart', sundayStart)
          ..add('sundayEnd', sundayEnd)
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

  DateTime? _mondayStart;
  DateTime? get mondayStart => _$this._mondayStart;
  set mondayStart(DateTime? mondayStart) => _$this._mondayStart = mondayStart;

  DateTime? _mondayEnd;
  DateTime? get mondayEnd => _$this._mondayEnd;
  set mondayEnd(DateTime? mondayEnd) => _$this._mondayEnd = mondayEnd;

  LatLng? _location;
  LatLng? get location => _$this._location;
  set location(LatLng? location) => _$this._location = location;

  ListBuilder<String>? _photos;
  ListBuilder<String> get photos =>
      _$this._photos ??= new ListBuilder<String>();
  set photos(ListBuilder<String>? photos) => _$this._photos = photos;

  ListBuilder<String>? _videos;
  ListBuilder<String> get videos =>
      _$this._videos ??= new ListBuilder<String>();
  set videos(ListBuilder<String>? videos) => _$this._videos = videos;

  DateTime? _tuesdayStart;
  DateTime? get tuesdayStart => _$this._tuesdayStart;
  set tuesdayStart(DateTime? tuesdayStart) =>
      _$this._tuesdayStart = tuesdayStart;

  DateTime? _tuesdayEnd;
  DateTime? get tuesdayEnd => _$this._tuesdayEnd;
  set tuesdayEnd(DateTime? tuesdayEnd) => _$this._tuesdayEnd = tuesdayEnd;

  DateTime? _wednesdayStart;
  DateTime? get wednesdayStart => _$this._wednesdayStart;
  set wednesdayStart(DateTime? wednesdayStart) =>
      _$this._wednesdayStart = wednesdayStart;

  DateTime? _wednesdayEnd;
  DateTime? get wednesdayEnd => _$this._wednesdayEnd;
  set wednesdayEnd(DateTime? wednesdayEnd) =>
      _$this._wednesdayEnd = wednesdayEnd;

  DateTime? _thursdayStart;
  DateTime? get thursdayStart => _$this._thursdayStart;
  set thursdayStart(DateTime? thursdayStart) =>
      _$this._thursdayStart = thursdayStart;

  DateTime? _thursdayEnd;
  DateTime? get thursdayEnd => _$this._thursdayEnd;
  set thursdayEnd(DateTime? thursdayEnd) => _$this._thursdayEnd = thursdayEnd;

  DateTime? _fridayStart;
  DateTime? get fridayStart => _$this._fridayStart;
  set fridayStart(DateTime? fridayStart) => _$this._fridayStart = fridayStart;

  DateTime? _fridayEnd;
  DateTime? get fridayEnd => _$this._fridayEnd;
  set fridayEnd(DateTime? fridayEnd) => _$this._fridayEnd = fridayEnd;

  DateTime? _saturdayStart;
  DateTime? get saturdayStart => _$this._saturdayStart;
  set saturdayStart(DateTime? saturdayStart) =>
      _$this._saturdayStart = saturdayStart;

  DateTime? _saturdayEnd;
  DateTime? get saturdayEnd => _$this._saturdayEnd;
  set saturdayEnd(DateTime? saturdayEnd) => _$this._saturdayEnd = saturdayEnd;

  DateTime? _sundayStart;
  DateTime? get sundayStart => _$this._sundayStart;
  set sundayStart(DateTime? sundayStart) => _$this._sundayStart = sundayStart;

  DateTime? _sundayEnd;
  DateTime? get sundayEnd => _$this._sundayEnd;
  set sundayEnd(DateTime? sundayEnd) => _$this._sundayEnd = sundayEnd;

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
      _rate = $v.rate;
      _startDateValidity = $v.startDateValidity;
      _endDateValidity = $v.endDateValidity;
      _isKey = $v.isKey;
      _mondayStart = $v.mondayStart;
      _mondayEnd = $v.mondayEnd;
      _location = $v.location;
      _photos = $v.photos?.toBuilder();
      _videos = $v.videos?.toBuilder();
      _tuesdayStart = $v.tuesdayStart;
      _tuesdayEnd = $v.tuesdayEnd;
      _wednesdayStart = $v.wednesdayStart;
      _wednesdayEnd = $v.wednesdayEnd;
      _thursdayStart = $v.thursdayStart;
      _thursdayEnd = $v.thursdayEnd;
      _fridayStart = $v.fridayStart;
      _fridayEnd = $v.fridayEnd;
      _saturdayStart = $v.saturdayStart;
      _saturdayEnd = $v.saturdayEnd;
      _sundayStart = $v.sundayStart;
      _sundayEnd = $v.sundayEnd;
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
              rate: rate,
              startDateValidity: startDateValidity,
              endDateValidity: endDateValidity,
              isKey: isKey,
              mondayStart: mondayStart,
              mondayEnd: mondayEnd,
              location: location,
              photos: _photos?.build(),
              videos: _videos?.build(),
              tuesdayStart: tuesdayStart,
              tuesdayEnd: tuesdayEnd,
              wednesdayStart: wednesdayStart,
              wednesdayEnd: wednesdayEnd,
              thursdayStart: thursdayStart,
              thursdayEnd: thursdayEnd,
              fridayStart: fridayStart,
              fridayEnd: fridayEnd,
              saturdayStart: saturdayStart,
              saturdayEnd: saturdayEnd,
              sundayStart: sundayStart,
              sundayEnd: sundayEnd,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'photos';
        _photos?.build();
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
