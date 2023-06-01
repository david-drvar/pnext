import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

double ratingSummary(
  double totalRatings,
  double rating,
) {
  // get average rating to one decimal point from list of reviews
  if (totalRatings > 0) {
    return (rating +
            (totalRatings - rating) ~/ math.max((totalRatings ~/ 5), 1)) /
        2;
  } else {
    return rating;
  }
}

double rateConversionStripe(double myVar) {
  return myVar * 100;
}

int calculateIncomeEstimation(GaragesRecord garagesRecord) {
  double rate = garagesRecord.rate!;

  int total_hours = 0;
  int monday_hours = 0;
  int tuesday_hours = 0;
  int wednesday_hours = 0;
  int thursday_hours = 0;
  int friday_hours = 0;
  int saturday_hours = 0;
  int sunday_hours = 0;

  for (DateTime date = garagesRecord.startDateValidity!;
      date.isBefore(garagesRecord.endDateValidity!) ||
          date.isAtSameMomentAs(garagesRecord.endDateValidity!);
      date = date.add(Duration(days: 1))) {
    var weekday = date.weekday;

    if (weekday == 1 && garagesRecord.mondayStart != null)
      monday_hours +=
          garagesRecord.mondayEnd!.hour - garagesRecord.mondayStart!.hour;
    else if (weekday == 2 && garagesRecord.tuesdayStart != null)
      tuesday_hours +=
          garagesRecord.tuesdayEnd!.hour - garagesRecord.tuesdayStart!.hour;
    else if (weekday == 3 && garagesRecord.wednesdayStart != null)
      wednesday_hours +=
          garagesRecord.wednesdayEnd!.hour - garagesRecord.wednesdayStart!.hour;
    else if (weekday == 4 && garagesRecord.thursdayStart != null)
      thursday_hours +=
          garagesRecord.thursdayEnd!.hour - garagesRecord.thursdayStart!.hour;
    else if (weekday == 5 && garagesRecord.fridayStart != null)
      friday_hours +=
          garagesRecord.fridayEnd!.hour - garagesRecord.fridayStart!.hour;
    else if (weekday == 6 && garagesRecord.saturdayStart != null)
      saturday_hours +=
          garagesRecord.saturdayEnd!.hour - garagesRecord.saturdayStart!.hour;
    else if (weekday == 7 && garagesRecord.sundayStart != null)
      sunday_hours +=
          garagesRecord.sundayEnd!.hour - garagesRecord.sundayStart!.hour;
  }

  total_hours = monday_hours +
      tuesday_hours +
      wednesday_hours +
      thursday_hours +
      friday_hours +
      saturday_hours +
      sunday_hours;

  double estimated_earning_100_month = total_hours * rate;

  double estimated_earning_60_month = 0.6 * estimated_earning_100_month;

  double net_income = estimated_earning_60_month * 0.47;

  return net_income.round();
}

bool isTextNull(String? myVar) {
  return myVar == null || myVar == "";
}

bool isDocReferenceNull(DocumentReference? myVar) {
  return myVar == null;
}

DateTime hoursAndMinutesToDate(
  String hour,
  String minute,
) {
  // convert hour and minute in format HH:mm to DateTime
  return DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
    int.parse(hour),
    int.parse(minute),
  );
}

bool isDateNull(DateTime? myVar) {
  return myVar == null;
}

String ratingSummaryList(List<ReviewsRecord> rating) {
  if (rating.isEmpty) {
    return '-';
  }
  var ratingsSum = 0.0;
  for (final comment in rating) {
    ratingsSum += comment.rating!;
  }
  return (ratingsSum / rating.length).toStringAsFixed(1);
}

bool isEmpty(String? myVar) {
  return myVar == null || myVar.isEmpty;
}

bool isDateAfter(
  DateTime? date1,
  DateTime? date2,
) {
  if (date1 == null || date2 == null) {
    return false;
  }
  return date2.isAfter(date1);
}

List<DocumentReference> returnUsersListForChatCreation(
  DocumentReference user1,
  DocumentReference user2,
) {
  List<DocumentReference> usersList = [user1, user2];
  return usersList;
}
