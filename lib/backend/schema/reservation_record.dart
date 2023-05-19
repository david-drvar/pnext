import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReservationRecord extends FirestoreRecord {
  ReservationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "car_code" field.
  String? _carCode;
  String get carCode => _carCode ?? '';
  bool hasCarCode() => _carCode != null;

  // "date_start" field.
  DateTime? _dateStart;
  DateTime? get dateStart => _dateStart;
  bool hasDateStart() => _dateStart != null;

  // "date_end" field.
  DateTime? _dateEnd;
  DateTime? get dateEnd => _dateEnd;
  bool hasDateEnd() => _dateEnd != null;

  // "dimension" field.
  String? _dimension;
  String get dimension => _dimension ?? '';
  bool hasDimension() => _dimension != null;

  // "garage_reference" field.
  DocumentReference? _garageReference;
  DocumentReference? get garageReference => _garageReference;
  bool hasGarageReference() => _garageReference != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "total_price" field.
  double? _totalPrice;
  double get totalPrice => _totalPrice ?? 0.0;
  bool hasTotalPrice() => _totalPrice != null;

  // "date_reservation" field.
  DateTime? _dateReservation;
  DateTime? get dateReservation => _dateReservation;
  bool hasDateReservation() => _dateReservation != null;

  // "total_time" field.
  double? _totalTime;
  double get totalTime => _totalTime ?? 0.0;
  bool hasTotalTime() => _totalTime != null;

  // "chat_reference" field.
  DocumentReference? _chatReference;
  DocumentReference? get chatReference => _chatReference;
  bool hasChatReference() => _chatReference != null;

  void _initializeFields() {
    _carCode = snapshotData['car_code'] as String?;
    _dateStart = snapshotData['date_start'] as DateTime?;
    _dateEnd = snapshotData['date_end'] as DateTime?;
    _dimension = snapshotData['dimension'] as String?;
    _garageReference = snapshotData['garage_reference'] as DocumentReference?;
    _user = snapshotData['user'] as DocumentReference?;
    _totalPrice = castToType<double>(snapshotData['total_price']);
    _dateReservation = snapshotData['date_reservation'] as DateTime?;
    _totalTime = castToType<double>(snapshotData['total_time']);
    _chatReference = snapshotData['chat_reference'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reservation');

  static Stream<ReservationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReservationRecord.fromSnapshot(s));

  static Future<ReservationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReservationRecord.fromSnapshot(s));

  static ReservationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReservationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReservationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReservationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReservationRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createReservationRecordData({
  String? carCode,
  DateTime? dateStart,
  DateTime? dateEnd,
  String? dimension,
  DocumentReference? garageReference,
  DocumentReference? user,
  double? totalPrice,
  DateTime? dateReservation,
  double? totalTime,
  DocumentReference? chatReference,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'car_code': carCode,
      'date_start': dateStart,
      'date_end': dateEnd,
      'dimension': dimension,
      'garage_reference': garageReference,
      'user': user,
      'total_price': totalPrice,
      'date_reservation': dateReservation,
      'total_time': totalTime,
      'chat_reference': chatReference,
    }.withoutNulls,
  );

  return firestoreData;
}
