import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentMethodsRecord extends FirestoreRecord {
  PaymentMethodsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "creditDebitCard" field.
  int? _creditDebitCard;
  int get creditDebitCard => _creditDebitCard ?? 0;
  bool hasCreditDebitCard() => _creditDebitCard != null;

  // "PayPal" field.
  int? _payPal;
  int get payPal => _payPal ?? 0;
  bool hasPayPal() => _payPal != null;

  // "Satispay" field.
  int? _satispay;
  int get satispay => _satispay ?? 0;
  bool hasSatispay() => _satispay != null;

  // "ApplePay" field.
  int? _applePay;
  int get applePay => _applePay ?? 0;
  bool hasApplePay() => _applePay != null;

  // "GooglePay" field.
  int? _googlePay;
  int get googlePay => _googlePay ?? 0;
  bool hasGooglePay() => _googlePay != null;

  void _initializeFields() {
    _creditDebitCard = snapshotData['creditDebitCard'] as int?;
    _payPal = snapshotData['PayPal'] as int?;
    _satispay = snapshotData['Satispay'] as int?;
    _applePay = snapshotData['ApplePay'] as int?;
    _googlePay = snapshotData['GooglePay'] as int?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('paymentMethods');

  static Stream<PaymentMethodsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaymentMethodsRecord.fromSnapshot(s));

  static Future<PaymentMethodsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaymentMethodsRecord.fromSnapshot(s));

  static PaymentMethodsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaymentMethodsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaymentMethodsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaymentMethodsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaymentMethodsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createPaymentMethodsRecordData({
  int? creditDebitCard,
  int? payPal,
  int? satispay,
  int? applePay,
  int? googlePay,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'creditDebitCard': creditDebitCard,
      'PayPal': payPal,
      'Satispay': satispay,
      'ApplePay': applePay,
      'GooglePay': googlePay,
    }.withoutNulls,
  );

  return firestoreData;
}
