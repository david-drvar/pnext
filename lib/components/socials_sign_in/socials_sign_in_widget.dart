import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'socials_sign_in_model.dart';
export 'socials_sign_in_model.dart';

class SocialsSignInWidget extends StatefulWidget {
  const SocialsSignInWidget({Key? key}) : super(key: key);

  @override
  _SocialsSignInWidgetState createState() => _SocialsSignInWidgetState();
}

class _SocialsSignInWidgetState extends State<SocialsSignInWidget> {
  late SocialsSignInModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SocialsSignInModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: Color(0xFF090F13),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5.0,
                  color: Color(0x3314181B),
                  offset: Offset(0.0, 2.0),
                )
              ],
              shape: BoxShape.circle,
            ),
            alignment: AlignmentDirectional(0.0, 0.0),
            child: FaIcon(
              FontAwesomeIcons.google,
              color: Colors.white,
              size: 24.0,
            ),
          ),
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: Color(0xFF090F13),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5.0,
                  color: Color(0x3314181B),
                  offset: Offset(0.0, 2.0),
                )
              ],
              shape: BoxShape.circle,
            ),
            alignment: AlignmentDirectional(0.0, 0.0),
            child: FaIcon(
              FontAwesomeIcons.apple,
              color: Colors.white,
              size: 24.0,
            ),
          ),
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: Color(0xFF090F13),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5.0,
                  color: Color(0x3314181B),
                  offset: Offset(0.0, 2.0),
                )
              ],
              shape: BoxShape.circle,
            ),
            alignment: AlignmentDirectional(0.0, 0.0),
            child: FaIcon(
              FontAwesomeIcons.facebookF,
              color: Colors.white,
              size: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}
