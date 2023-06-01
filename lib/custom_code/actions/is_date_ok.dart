// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> isDateOk(
  DateTime dateStart,
  DateTime dateEnd,
) async {
  int yearS = dateStart.year;
  int monthS = dateStart.month;
  int dayS = dateStart.day;

  int yearE = dateEnd.year;
  int monthE = dateEnd.month;
  int dayE = dateEnd.day;

  int currentYear = DateTime.now().year;
  int currentMonth = DateTime.now().month;
  int currentDay = DateTime.now().day;

  bool output = ((yearS < yearE || monthS < monthE || dayS < dayE) &&
      (!(yearS < currentYear || monthS < currentMonth || dayS < currentDay)));

  return output;
  // Add your function code here!
}
