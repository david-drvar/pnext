import '/auth/firebase_auth/auth_util.dart';
import '/components/email_verification_component/email_verification_component_widget.dart';
import '/components/socials_sign_in_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main.dart';
import '/pages/create_account/create_account_widget.dart';
import '/pages/forgot_password/forgot_password_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  // State field(s) for password widget.
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // Stores action output result for [Custom Action - authFlutterFire] action in Button-Login widget.
  String? returnAuth;
  // Model for socialsSignIn component.
  late SocialsSignInModel socialsSignInModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility = false;
    socialsSignInModel = createModel(context, () => SocialsSignInModel());
  }

  void dispose() {
    emailAddressController?.dispose();
    passwordController?.dispose();
    socialsSignInModel.dispose();
  }

  /// Additional helper methods are added here.

}
