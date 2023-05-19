import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GaragePhotosRecord extends FirestoreRecord {
  GaragePhotosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "garageRef" field.
  DocumentReference? _garageRef;
  DocumentReference? get garageRef => _garageRef;
  bool hasGarageRef() => _garageRef != null;

  void _initializeFields() {
    _garageRef = snapshotData['garageRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('garage_photos');

  static Stream<GaragePhotosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GaragePhotosRecord.fromSnapshot(s));

  static Future<GaragePhotosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GaragePhotosRecord.fromSnapshot(s));

  static GaragePhotosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GaragePhotosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GaragePhotosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GaragePhotosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GaragePhotosRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createGaragePhotosRecordData({
  DocumentReference? garageRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'garageRef': garageRef,
    }.withoutNulls,
  );

  return firestoreData;
}
