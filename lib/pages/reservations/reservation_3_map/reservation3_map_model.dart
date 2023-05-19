import '/backend/backend.dart';
import '/components/bottom_sheet_garages/bottom_sheet_garages_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Reservation3MapModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<GaragesRecord> localGaragesState = [];
  void addToLocalGaragesState(GaragesRecord item) =>
      localGaragesState.add(item);
  void removeFromLocalGaragesState(GaragesRecord item) =>
      localGaragesState.remove(item);
  void removeAtIndexFromLocalGaragesState(int index) =>
      localGaragesState.removeAt(index);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - availableGarages] action in reservation_3Map widget.
  List<GaragesRecord>? filteredGarages;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
