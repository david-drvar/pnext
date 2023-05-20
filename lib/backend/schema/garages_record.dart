import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GaragesRecord extends FirestoreRecord {
  GaragesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "zip" field.
  String? _zip;
  String get zip => _zip ?? '';
  bool hasZip() => _zip != null;

  // "dimensions" field.
  String? _dimensions;
  String get dimensions => _dimensions ?? '';
  bool hasDimensions() => _dimensions != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "rate" field.
  double? _rate;
  double get rate => _rate ?? 0.0;
  bool hasRate() => _rate != null;

  // "startDateValidity" field.
  DateTime? _startDateValidity;
  DateTime? get startDateValidity => _startDateValidity;
  bool hasStartDateValidity() => _startDateValidity != null;

  // "endDateValidity" field.
  DateTime? _endDateValidity;
  DateTime? get endDateValidity => _endDateValidity;
  bool hasEndDateValidity() => _endDateValidity != null;

  // "isKey" field.
  bool? _isKey;
  bool get isKey => _isKey ?? false;
  bool hasIsKey() => _isKey != null;

  // "monday_start" field.
  DateTime? _mondayStart;
  DateTime? get mondayStart => _mondayStart;
  bool hasMondayStart() => _mondayStart != null;

  // "monday_end" field.
  DateTime? _mondayEnd;
  DateTime? get mondayEnd => _mondayEnd;
  bool hasMondayEnd() => _mondayEnd != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "photos" field.
  List<String>? _photos;
  List<String> get photos => _photos ?? const [];
  bool hasPhotos() => _photos != null;

  // "videos" field.
  List<String>? _videos;
  List<String> get videos => _videos ?? const [];
  bool hasVideos() => _videos != null;

  // "tuesday_start" field.
  DateTime? _tuesdayStart;
  DateTime? get tuesdayStart => _tuesdayStart;
  bool hasTuesdayStart() => _tuesdayStart != null;

  // "tuesday_end" field.
  DateTime? _tuesdayEnd;
  DateTime? get tuesdayEnd => _tuesdayEnd;
  bool hasTuesdayEnd() => _tuesdayEnd != null;

  // "wednesday_start" field.
  DateTime? _wednesdayStart;
  DateTime? get wednesdayStart => _wednesdayStart;
  bool hasWednesdayStart() => _wednesdayStart != null;

  // "wednesday_end" field.
  DateTime? _wednesdayEnd;
  DateTime? get wednesdayEnd => _wednesdayEnd;
  bool hasWednesdayEnd() => _wednesdayEnd != null;

  // "thursday_start" field.
  DateTime? _thursdayStart;
  DateTime? get thursdayStart => _thursdayStart;
  bool hasThursdayStart() => _thursdayStart != null;

  // "thursday_end" field.
  DateTime? _thursdayEnd;
  DateTime? get thursdayEnd => _thursdayEnd;
  bool hasThursdayEnd() => _thursdayEnd != null;

  // "friday_start" field.
  DateTime? _fridayStart;
  DateTime? get fridayStart => _fridayStart;
  bool hasFridayStart() => _fridayStart != null;

  // "friday_end" field.
  DateTime? _fridayEnd;
  DateTime? get fridayEnd => _fridayEnd;
  bool hasFridayEnd() => _fridayEnd != null;

  // "saturday_start" field.
  DateTime? _saturdayStart;
  DateTime? get saturdayStart => _saturdayStart;
  bool hasSaturdayStart() => _saturdayStart != null;

  // "saturday_end" field.
  DateTime? _saturdayEnd;
  DateTime? get saturdayEnd => _saturdayEnd;
  bool hasSaturdayEnd() => _saturdayEnd != null;

  // "sunday_start" field.
  DateTime? _sundayStart;
  DateTime? get sundayStart => _sundayStart;
  bool hasSundayStart() => _sundayStart != null;

  // "sunday_end" field.
  DateTime? _sundayEnd;
  DateTime? get sundayEnd => _sundayEnd;
  bool hasSundayEnd() => _sundayEnd != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "keybox_password" field.
  String? _keyboxPassword;
  String get keyboxPassword => _keyboxPassword ?? '';
  bool hasKeyboxPassword() => _keyboxPassword != null;

  // "isCreationFinished" field.
  bool? _isCreationFinished;
  bool get isCreationFinished => _isCreationFinished ?? false;
  bool hasIsCreationFinished() => _isCreationFinished != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _city = snapshotData['city'] as String?;
    _address = snapshotData['address'] as String?;
    _zip = snapshotData['zip'] as String?;
    _dimensions = snapshotData['dimensions'] as String?;
    _description = snapshotData['description'] as String?;
    _rate = castToType<double>(snapshotData['rate']);
    _startDateValidity = snapshotData['startDateValidity'] as DateTime?;
    _endDateValidity = snapshotData['endDateValidity'] as DateTime?;
    _isKey = snapshotData['isKey'] as bool?;
    _mondayStart = snapshotData['monday_start'] as DateTime?;
    _mondayEnd = snapshotData['monday_end'] as DateTime?;
    _location = snapshotData['location'] as LatLng?;
    _photos = getDataList(snapshotData['photos']);
    _videos = getDataList(snapshotData['videos']);
    _tuesdayStart = snapshotData['tuesday_start'] as DateTime?;
    _tuesdayEnd = snapshotData['tuesday_end'] as DateTime?;
    _wednesdayStart = snapshotData['wednesday_start'] as DateTime?;
    _wednesdayEnd = snapshotData['wednesday_end'] as DateTime?;
    _thursdayStart = snapshotData['thursday_start'] as DateTime?;
    _thursdayEnd = snapshotData['thursday_end'] as DateTime?;
    _fridayStart = snapshotData['friday_start'] as DateTime?;
    _fridayEnd = snapshotData['friday_end'] as DateTime?;
    _saturdayStart = snapshotData['saturday_start'] as DateTime?;
    _saturdayEnd = snapshotData['saturday_end'] as DateTime?;
    _sundayStart = snapshotData['sunday_start'] as DateTime?;
    _sundayEnd = snapshotData['sunday_end'] as DateTime?;
    _country = snapshotData['country'] as String?;
    _isActive = snapshotData['isActive'] as bool?;
    _keyboxPassword = snapshotData['keybox_password'] as String?;
    _isCreationFinished = snapshotData['isCreationFinished'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('garages');

  static Stream<GaragesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GaragesRecord.fromSnapshot(s));

  static Future<GaragesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GaragesRecord.fromSnapshot(s));

  static GaragesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GaragesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GaragesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GaragesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GaragesRecord(reference: ${reference.path}, data: $snapshotData)';
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
  DateTime? tuesdayStart,
  DateTime? tuesdayEnd,
  DateTime? wednesdayStart,
  DateTime? wednesdayEnd,
  DateTime? thursdayStart,
  DateTime? thursdayEnd,
  DateTime? fridayStart,
  DateTime? fridayEnd,
  DateTime? saturdayStart,
  DateTime? saturdayEnd,
  DateTime? sundayStart,
  DateTime? sundayEnd,
  String? country,
  bool? isActive,
  String? keyboxPassword,
  bool? isCreationFinished,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'city': city,
      'address': address,
      'zip': zip,
      'dimensions': dimensions,
      'description': description,
      'rate': rate,
      'startDateValidity': startDateValidity,
      'endDateValidity': endDateValidity,
      'isKey': isKey,
      'monday_start': mondayStart,
      'monday_end': mondayEnd,
      'location': location,
      'tuesday_start': tuesdayStart,
      'tuesday_end': tuesdayEnd,
      'wednesday_start': wednesdayStart,
      'wednesday_end': wednesdayEnd,
      'thursday_start': thursdayStart,
      'thursday_end': thursdayEnd,
      'friday_start': fridayStart,
      'friday_end': fridayEnd,
      'saturday_start': saturdayStart,
      'saturday_end': saturdayEnd,
      'sunday_start': sundayStart,
      'sunday_end': sundayEnd,
      'country': country,
      'isActive': isActive,
      'keybox_password': keyboxPassword,
      'isCreationFinished': isCreationFinished,
    }.withoutNulls,
  );

  return firestoreData;
}
