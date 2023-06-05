import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Reservation1CopyModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  DateTime? datePicked;
  // Stores action output result for [Custom Action - hoursAndMinutesToDateAction] action in Button widget.
  DateTime? startR;
  // Stores action output result for [Custom Action - hoursAndMinutesToDateAction] action in Button widget.
  DateTime? endR;
  // Stores action output result for [Custom Action - reservationTimeOk] action in Button widget.
  bool? reservationTimeCheck;
  // Stores action output result for [Custom Action - parkingTimeCalculation] action in Button widget.
  double? totalTime;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ReservationRecord? reservationDoc;
  // State field(s) for DropDownOre1 widget.
  String? dropDownOre1Value;
  FormFieldController<String>? dropDownOre1ValueController;
  // State field(s) for DropDownMin1 widget.
  String? dropDownMin1Value;
  FormFieldController<String>? dropDownMin1ValueController;
  // State field(s) for DropDownOre2 widget.
  String? dropDownOre2Value;
  FormFieldController<String>? dropDownOre2ValueController;
  // State field(s) for DropDownMin2 widget.
  String? dropDownMin2Value;
  FormFieldController<String>? dropDownMin2ValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
