import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FeedbackPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for RatingBar widget.
  double? ratingBarValue1;
  // State field(s) for RatingBar widget.
  double? ratingBarValue2;
  // State field(s) for RatingBar widget.
  double? ratingBarValue3;
  // State field(s) for RatingBar widget.
  double? ratingBarValue4;
  // State field(s) for surname widget.
  TextEditingController? surnameController1;
  String? Function(BuildContext, String?)? surnameController1Validator;
  // State field(s) for surname widget.
  TextEditingController? surnameController2;
  String? Function(BuildContext, String?)? surnameController2Validator;
  // State field(s) for surname widget.
  TextEditingController? surnameController3;
  String? Function(BuildContext, String?)? surnameController3Validator;
  // State field(s) for surname widget.
  TextEditingController? surnameController4;
  String? Function(BuildContext, String?)? surnameController4Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    surnameController1?.dispose();
    surnameController2?.dispose();
    surnameController3?.dispose();
    surnameController4?.dispose();
  }

  /// Additional helper methods are added here.

}
