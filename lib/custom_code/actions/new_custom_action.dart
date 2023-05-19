// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!

Future<List<GaragesRecord>> newCustomAction(
    DocumentReference reservationRef) async {
  // Add your function code here!

  //DocumentSnapshot reservationSnapshot = await reservationRef.get();
  ReservationRecord reservationRecord =
      await ReservationRecord.getDocumentOnce(reservationRef);

  ReservationRecord.getDocumentOnce(reservationRef);

  //get all garages
  var garages = await queryGaragesRecord(
      queryBuilder: (garagesRecord) =>
          garagesRecord.where('isActive', isEqualTo: true)).first;

  //1. filter garage dimensions
  var garagesWithSuitableDimension = List<GaragesRecord>.empty(growable: true);
  for (GaragesRecord garagesRecord in garages) {
    if (garagesRecord.dimensions == reservationRecord.dimension)
      garagesWithSuitableDimension.add(garagesRecord);
  }

  //2. filter garages that are available on that day with that hours
  var weekday = reservationRecord.dateStart?.weekday;
  //monday 1
  //sunday 7
  // hour 0..23
  var availableGaragesConsideringWorkingHours =
      List<GaragesRecord>.empty(growable: true);
  for (GaragesRecord garagesRecord in garagesWithSuitableDimension) {
    if (weekday == 1 &&
        isTimeInRange(garagesRecord.mondayStart, garagesRecord.mondayEnd,
            reservationRecord.dateStart!, reservationRecord.dateEnd!)) {
      availableGaragesConsideringWorkingHours.add(garagesRecord);
    } else if (weekday == 2 &&
        isTimeInRange(garagesRecord.tuesdayStart, garagesRecord.tuesdayEnd,
            reservationRecord.dateStart!, reservationRecord.dateEnd!)) {
      availableGaragesConsideringWorkingHours.add(garagesRecord);
    } else if (weekday == 3 &&
        isTimeInRange(garagesRecord.wednesdayStart, garagesRecord.wednesdayEnd,
            reservationRecord.dateStart!, reservationRecord.dateEnd!)) {
      availableGaragesConsideringWorkingHours.add(garagesRecord);
    } else if (weekday == 4 &&
        isTimeInRange(garagesRecord.thursdayStart, garagesRecord.thursdayEnd,
            reservationRecord.dateStart!, reservationRecord.dateEnd!)) {
      availableGaragesConsideringWorkingHours.add(garagesRecord);
    } else if (weekday == 5 &&
        isTimeInRange(garagesRecord.fridayStart, garagesRecord.fridayEnd,
            reservationRecord.dateStart!, reservationRecord.dateEnd!)) {
      availableGaragesConsideringWorkingHours.add(garagesRecord);
    } else if (weekday == 6 &&
        isTimeInRange(garagesRecord.saturdayStart, garagesRecord.saturdayEnd,
            reservationRecord.dateStart!, reservationRecord.dateEnd!)) {
      availableGaragesConsideringWorkingHours.add(garagesRecord);
    } else if (weekday == 7 &&
        isTimeInRange(garagesRecord.sundayStart, garagesRecord.sundayEnd,
            reservationRecord.dateStart!, reservationRecord.dateEnd!)) {
      availableGaragesConsideringWorkingHours.add(garagesRecord);
    }
  }

  //3. filter - check if garages have other reservations in that time range
  var availableGaragesConsideringReservations =
      List<GaragesRecord>.empty(growable: true);
  for (GaragesRecord garagesRecord in availableGaragesConsideringWorkingHours) {
    var garageReservations = await queryReservationRecord(
        queryBuilder: (reservationRecord) => reservationRecord.where(
            'garage_reference',
            isEqualTo: garagesRecord.reference)).first;

    bool isTaken = false;
    for (ReservationRecord reservation in garageReservations)
      if (isTimeInRange(
          reservation.dateStart,
          reservation.dateEnd,
          reservationRecord.dateStart!,
          reservationRecord.dateEnd!)) isTaken = true;

    if (!isTaken) availableGaragesConsideringReservations.add(garagesRecord);
  }

  return availableGaragesConsideringReservations;
}

// we check if the second(shorter) falls in the first. First one is garage availability, second is reservation
bool isTimeInRange(DateTime? firstStart, DateTime? firstEnd,
    DateTime secondStart, DateTime secondEnd) {
  if (firstStart == null || firstEnd == null) return false;

  TimeOfDay firstStartTime = TimeOfDay.fromDateTime(firstStart);
  TimeOfDay firstEndTime = TimeOfDay.fromDateTime(firstEnd);
  TimeOfDay secondStartTime = TimeOfDay.fromDateTime(secondStart);
  TimeOfDay secondEndTime = TimeOfDay.fromDateTime(secondEnd);

  int firstStartMinutes = firstStartTime.hour * 60 + firstStartTime.minute;
  int firstEndMinutes = firstEndTime.hour * 60 + firstEndTime.minute;
  int secondStartMinutes = secondStartTime.hour * 60 + secondStartTime.minute;
  int secondEndMinutes = secondEndTime.hour * 60 + secondEndTime.minute;

  return secondStartMinutes >= firstStartMinutes &&
      secondEndMinutes <= firstEndMinutes;
}
