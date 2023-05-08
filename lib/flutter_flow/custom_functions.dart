import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/firebase_auth/auth_util.dart';

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
