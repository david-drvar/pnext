// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<String>> dateToHoursAndMinutesAction(DateTime date) async {
  // convert hour and minute in format HH:mm to DateTime and return it from action
  final List<String> hourAndMinute = [];
  hourAndMinute.add(date.hour.toString());

  hourAndMinute.add(date.minute.toString());

  return hourAndMinute;
}
