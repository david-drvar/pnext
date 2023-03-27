// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'garage_photos_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GaragePhotosRecord> _$garagePhotosRecordSerializer =
    new _$GaragePhotosRecordSerializer();

class _$GaragePhotosRecordSerializer
    implements StructuredSerializer<GaragePhotosRecord> {
  @override
  final Iterable<Type> types = const [GaragePhotosRecord, _$GaragePhotosRecord];
  @override
  final String wireName = 'GaragePhotosRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GaragePhotosRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.garageRef;
    if (value != null) {
      result
        ..add('garageRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  GaragePhotosRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GaragePhotosRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'garageRef':
          result.garageRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$GaragePhotosRecord extends GaragePhotosRecord {
  @override
  final DocumentReference<Object?>? garageRef;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$GaragePhotosRecord(
          [void Function(GaragePhotosRecordBuilder)? updates]) =>
      (new GaragePhotosRecordBuilder()..update(updates))._build();

  _$GaragePhotosRecord._({this.garageRef, this.ffRef}) : super._();

  @override
  GaragePhotosRecord rebuild(
          void Function(GaragePhotosRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GaragePhotosRecordBuilder toBuilder() =>
      new GaragePhotosRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GaragePhotosRecord &&
        garageRef == other.garageRef &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, garageRef.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GaragePhotosRecord')
          ..add('garageRef', garageRef)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class GaragePhotosRecordBuilder
    implements Builder<GaragePhotosRecord, GaragePhotosRecordBuilder> {
  _$GaragePhotosRecord? _$v;

  DocumentReference<Object?>? _garageRef;
  DocumentReference<Object?>? get garageRef => _$this._garageRef;
  set garageRef(DocumentReference<Object?>? garageRef) =>
      _$this._garageRef = garageRef;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  GaragePhotosRecordBuilder() {
    GaragePhotosRecord._initializeBuilder(this);
  }

  GaragePhotosRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _garageRef = $v.garageRef;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GaragePhotosRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GaragePhotosRecord;
  }

  @override
  void update(void Function(GaragePhotosRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GaragePhotosRecord build() => _build();

  _$GaragePhotosRecord _build() {
    final _$result =
        _$v ?? new _$GaragePhotosRecord._(garageRef: garageRef, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
