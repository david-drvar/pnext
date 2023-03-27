import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'garage_photos_record.g.dart';

abstract class GaragePhotosRecord
    implements Built<GaragePhotosRecord, GaragePhotosRecordBuilder> {
  static Serializer<GaragePhotosRecord> get serializer =>
      _$garagePhotosRecordSerializer;

  DocumentReference? get garageRef;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(GaragePhotosRecordBuilder builder) => builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('garage_photos');

  static Stream<GaragePhotosRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<GaragePhotosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  GaragePhotosRecord._();
  factory GaragePhotosRecord(
          [void Function(GaragePhotosRecordBuilder) updates]) =
      _$GaragePhotosRecord;

  static GaragePhotosRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createGaragePhotosRecordData({
  DocumentReference? garageRef,
}) {
  final firestoreData = serializers.toFirestore(
    GaragePhotosRecord.serializer,
    GaragePhotosRecord(
      (g) => g..garageRef = garageRef,
    ),
  );

  return firestoreData;
}
