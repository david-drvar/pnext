import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AvailabilityBottomSheetIntervalsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDownStartHours widget.
  String? dropDownStartHoursValue;
  FormFieldController<String>? dropDownStartHoursValueController;
  // State field(s) for DropDownStartMinutes widget.
  String? dropDownStartMinutesValue;
  FormFieldController<String>? dropDownStartMinutesValueController;
  // State field(s) for DropDownEndHours widget.
  String? dropDownEndHoursValue;
  FormFieldController<String>? dropDownEndHoursValueController;
  // State field(s) for DropDownEndMinutes widget.
  String? dropDownEndMinutesValue;
  FormFieldController<String>? dropDownEndMinutesValueController;
  // Stores action output result for [Custom Action - hoursAndMinutesToDateAction] action in Button widget.
  DateTime? startDateTime;
  // Stores action output result for [Custom Action - hoursAndMinutesToDateAction] action in Button widget.
  DateTime? endDateTime;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
