import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/create_property_2/create_property2_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateProperty1CopyModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for propertyName widget.
  TextEditingController? propertyNameController;
  String? Function(BuildContext, String?)? propertyNameControllerValidator;
  // State field(s) for propertyAddress widget.
  TextEditingController? propertyAddressController;
  String? Function(BuildContext, String?)? propertyAddressControllerValidator;
  // State field(s) for propertyNeighborhood widget.
  TextEditingController? propertyNeighborhoodController;
  String? Function(BuildContext, String?)?
      propertyNeighborhoodControllerValidator;
  // State field(s) for propertyDescription widget.
  TextEditingController? propertyDescriptionController;
  String? Function(BuildContext, String?)?
      propertyDescriptionControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PropertiesRecord? newProperty;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  AmenititiesRecord? amenitiesRecord;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    propertyNameController?.dispose();
    propertyAddressController?.dispose();
    propertyNeighborhoodController?.dispose();
    propertyDescriptionController?.dispose();
  }

  /// Additional helper methods are added here.

}
