import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import '/pages/create_garage_pages/create_garage_2_foto_video/create_garage2_foto_video_widget.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateGarage1PlacePickerModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool anyButtonSelected = false;

  String? vehicleType;

  LatLng? garageLocation;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  GaragesRecord? newGarage;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
