import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FeedbackPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for RatingBarExp widget.
  double? ratingBarExpValue;
  // State field(s) for RatingBarIntuitive widget.
  double? ratingBarIntuitiveValue;
  // State field(s) for RatingBarDesign widget.
  double? ratingBarDesignValue;
  // State field(s) for RatingBarResponsiveness widget.
  double? ratingBarResponsivenessValue;
  // State field(s) for difficulties widget.
  TextEditingController? difficultiesController;
  String? Function(BuildContext, String?)? difficultiesControllerValidator;
  // State field(s) for recomemndation widget.
  TextEditingController? recomemndationController;
  String? Function(BuildContext, String?)? recomemndationControllerValidator;
  // State field(s) for functionalities widget.
  TextEditingController? functionalitiesController;
  String? Function(BuildContext, String?)? functionalitiesControllerValidator;
  // State field(s) for comment widget.
  TextEditingController? commentController;
  String? Function(BuildContext, String?)? commentControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    difficultiesController?.dispose();
    recomemndationController?.dispose();
    functionalitiesController?.dispose();
    commentController?.dispose();
  }

  /// Additional helper methods are added here.

}
