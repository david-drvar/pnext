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

  BuiltList<String>? get videos;

  double? get rate;

  DateTime? get startDateValidity;

  DateTime? get endDateValidity;

  bool? get isKey;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(GaragesRecordBuilder builder) => builder
    ..city = ''
    ..address = ''
    ..zip = ''
    ..dimensions = ''
    ..description = ''
    ..videos = ListBuilder()
    ..rate = 0.0
    ..isKey = false;

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
        ..videos = null
        ..rate = rate
        ..startDateValidity = startDateValidity
        ..endDateValidity = endDateValidity
        ..isKey = isKey,
    ),
  );

  return firestoreData;
}
