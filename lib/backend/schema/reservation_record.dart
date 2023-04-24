import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'reservation_record.g.dart';

abstract class ReservationRecord
    implements Built<ReservationRecord, ReservationRecordBuilder> {
  static Serializer<ReservationRecord> get serializer =>
      _$reservationRecordSerializer;

  @BuiltValueField(wireName: 'car_code')
  String? get carCode;

  @BuiltValueField(wireName: 'date_start')
  DateTime? get dateStart;

  @BuiltValueField(wireName: 'date_end')
  DateTime? get dateEnd;

  String? get dimension;

  @BuiltValueField(wireName: 'garage_reference')
  DocumentReference? get garageReference;

  DocumentReference? get user;

  @BuiltValueField(wireName: 'total_price')
  double? get totalPrice;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ReservationRecordBuilder builder) => builder
    ..carCode = ''
    ..dimension = ''
    ..totalPrice = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reservation');

  static Stream<ReservationRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ReservationRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ReservationRecord._();
  factory ReservationRecord([void Function(ReservationRecordBuilder) updates]) =
      _$ReservationRecord;

  static ReservationRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createReservationRecordData({
  String? carCode,
  DateTime? dateStart,
  DateTime? dateEnd,
  String? dimension,
  DocumentReference? garageReference,
  DocumentReference? user,
  double? totalPrice,
}) {
  final firestoreData = serializers.toFirestore(
    ReservationRecord.serializer,
    ReservationRecord(
      (r) => r
        ..carCode = carCode
        ..dateStart = dateStart
        ..dateEnd = dateEnd
        ..dimension = dimension
        ..garageReference = garageReference
        ..user = user
        ..totalPrice = totalPrice,
    ),
  );

  return firestoreData;
}
