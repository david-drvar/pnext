import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FeedbackRecord extends FirestoreRecord {
  FeedbackRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "overall_experience" field.
  int? _overallExperience;
  int get overallExperience => _overallExperience ?? 0;
  bool hasOverallExperience() => _overallExperience != null;

  // "booking_intuitive" field.
  int? _bookingIntuitive;
  int get bookingIntuitive => _bookingIntuitive ?? 0;
  bool hasBookingIntuitive() => _bookingIntuitive != null;

  // "design" field.
  int? _design;
  int get design => _design ?? 0;
  bool hasDesign() => _design != null;

  // "overall_responsiveness" field.
  int? _overallResponsiveness;
  int get overallResponsiveness => _overallResponsiveness ?? 0;
  bool hasOverallResponsiveness() => _overallResponsiveness != null;

  // "any_difficulties_encountered" field.
  String? _anyDifficultiesEncountered;
  String get anyDifficultiesEncountered => _anyDifficultiesEncountered ?? '';
  bool hasAnyDifficultiesEncountered() => _anyDifficultiesEncountered != null;

  // "features_functionalities" field.
  String? _featuresFunctionalities;
  String get featuresFunctionalities => _featuresFunctionalities ?? '';
  bool hasFeaturesFunctionalities() => _featuresFunctionalities != null;

  // "additional_comment" field.
  String? _additionalComment;
  String get additionalComment => _additionalComment ?? '';
  bool hasAdditionalComment() => _additionalComment != null;

  // "recommendation" field.
  String? _recommendation;
  String get recommendation => _recommendation ?? '';
  bool hasRecommendation() => _recommendation != null;

  void _initializeFields() {
    _overallExperience = snapshotData['overall_experience'] as int?;
    _bookingIntuitive = snapshotData['booking_intuitive'] as int?;
    _design = snapshotData['design'] as int?;
    _overallResponsiveness = snapshotData['overall_responsiveness'] as int?;
    _anyDifficultiesEncountered =
        snapshotData['any_difficulties_encountered'] as String?;
    _featuresFunctionalities =
        snapshotData['features_functionalities'] as String?;
    _additionalComment = snapshotData['additional_comment'] as String?;
    _recommendation = snapshotData['recommendation'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('feedback');

  static Stream<FeedbackRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FeedbackRecord.fromSnapshot(s));

  static Future<FeedbackRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FeedbackRecord.fromSnapshot(s));

  static FeedbackRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FeedbackRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FeedbackRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FeedbackRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FeedbackRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createFeedbackRecordData({
  int? overallExperience,
  int? bookingIntuitive,
  int? design,
  int? overallResponsiveness,
  String? anyDifficultiesEncountered,
  String? featuresFunctionalities,
  String? additionalComment,
  String? recommendation,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'overall_experience': overallExperience,
      'booking_intuitive': bookingIntuitive,
      'design': design,
      'overall_responsiveness': overallResponsiveness,
      'any_difficulties_encountered': anyDifficultiesEncountered,
      'features_functionalities': featuresFunctionalities,
      'additional_comment': additionalComment,
      'recommendation': recommendation,
    }.withoutNulls,
  );

  return firestoreData;
}
