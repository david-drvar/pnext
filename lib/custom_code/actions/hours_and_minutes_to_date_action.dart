// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<DateTime> hoursAndMinutesToDateAction(
  String hour,
  String minute,
) async {
  // convert hour and minute in format HH:mm to DateTime and return it from action

  final int hourInt = int.parse(hour);
  final int minuteInt = int.parse(minute);
  final DateTime dateTime = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
    hourInt,
    minuteInt,
  );
  return dateTime;
}
