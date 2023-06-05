import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateGarage1PeppeModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool anyButtonSelected = false;

  String? vehicleType;

  LatLng? garageLocation;

  ///  State fields for stateful widgets in this page.

  // State field(s) for addressNumber widget.
  TextEditingController? addressNumberController;
  String? Function(BuildContext, String?)? addressNumberControllerValidator;
  // State field(s) for city widget.
  TextEditingController? cityController;
  String? Function(BuildContext, String?)? cityControllerValidator;
  // State field(s) for zip widget.
  TextEditingController? zipController;
  String? Function(BuildContext, String?)? zipControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  GaragesRecord? newGarage;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    addressNumberController?.dispose();
    cityController?.dispose();
    zipController?.dispose();
  }

  /// Additional helper methods are added here.

}
