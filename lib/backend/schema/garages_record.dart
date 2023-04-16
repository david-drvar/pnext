import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'garages_record.g.dart';

abstract class GaragesRecord
    implements Built<GaragesRecord, GaragesRecordBuilder> {
  static Serializer<GaragesRecord> get serializer => _$garagesRecordSerializer;

  DocumentReference? get userRef;

  String? get city;

  String? get address;

  String? get zip;

  String? get dimensions;

  String? get description;

  double? get rate;

  DateTime? get startDateValidity;

  DateTime? get endDateValidity;

  bool? get isKey;

  @BuiltValueField(wireName: 'monday_start')
  DateTime? get mondayStart;

  @BuiltValueField(wireName: 'monday_end')
  DateTime? get mondayEnd;

  LatLng? get location;

  BuiltList<String>? get photos;

  BuiltList<String>? get videos;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(GaragesRecordBuilder builder) => builder
    ..city = ''
    ..address = ''
    ..zip = ''
    ..dimensions = ''
    ..description = ''
    ..rate = 0.0
    ..isKey = false
    ..photos = ListBuilder()
    ..videos = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('garages');

  static Stream<GaragesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<GaragesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  GaragesRecord._();
  factory GaragesRecord([void Function(GaragesRecordBuilder) updates]) =
      _$GaragesRecord;

  static GaragesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createGaragesRecordData({
  DocumentReference? userRef,
  String? city,
  String? address,
  String? zip,
  String? dimensions,
  String? description,
  double? rate,
  DateTime? startDateValidity,
  DateTime? endDateValidity,
  bool? isKey,
  DateTime? mondayStart,
  DateTime? mondayEnd,
  LatLng? location,
}) {
  final firestoreData = serializers.toFirestore(
    GaragesRecord.serializer,
    GaragesRecord(
      (g) => g
        ..userRef = userRef
        ..city = city
        ..address = address
        ..zip = zip
        ..dimensions = dimensions
        ..description = description
        ..rate = rate
        ..startDateValidity = startDateValidity
        ..endDateValidity = endDateValidity
        ..isKey = isKey
        ..mondayStart = mondayStart
        ..mondayEnd = mondayEnd
        ..location = location
        ..photos = null
        ..videos = null,
    ),
  );

  return firestoreData;
}
