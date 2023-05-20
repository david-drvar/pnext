// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> reservationTimeOk(
  BuildContext context,
  String hour1,
  String min1,
  String hour2,
  String min2,
) async {
  final int hourInt1 = int.parse(hour1);
  final int minuteInt1 = int.parse(min1);
  final int hourInt2 = int.parse(hour2);
  final int minuteInt2 = int.parse(min2);

  DateTime now = DateTime.now();
  int currentHour = now.hour;
  int currentMinute = now.minute;

  bool output = (hourInt2 > hourInt1) ||
      (hourInt2 == hourInt1 && minuteInt2 > minuteInt1) ||
      (hourInt1 >= currentHour && minuteInt1 >= currentMinute);

  return output;
  // Add your function code here!
}
