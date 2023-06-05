import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_garage_disclaimer_page_model.dart';
export 'create_garage_disclaimer_page_model.dart';

class CreateGarageDisclaimerPageWidget extends StatefulWidget {
  const CreateGarageDisclaimerPageWidget({
    Key? key,
    this.newGarageRef,
  }) : super(key: key);

  final DocumentReference? newGarageRef;

  @override
  _CreateGarageDisclaimerPageWidgetState createState() =>
      _CreateGarageDisclaimerPageWidgetState();
}

class _CreateGarageDisclaimerPageWidgetState
    extends State<CreateGarageDisclaimerPageWidget> {
  late CreateGarageDisclaimerPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateGarageDisclaimerPageModel());

    _model.keyboxPasswordController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          buttonSize: 46.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF95A1AC),
            size: 24.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(45.0, 0.0, 0.0, 0.0),
          child: Text(
            FFLocalizations.of(context).getText(
              'awl3lx92' /* Crea un Garage */,
            ),
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: Align(
          alignment: AlignmentDirectional(0.0, -0.15),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, -0.11),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 25.0, 0.0),
                  child: TextFormField(
                    controller: _model.keyboxPasswordController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: FFLocalizations.of(context).getText(
                        'rygpw1p8' /* Keybox password */,
                      ),
                      labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                      hintText: FFLocalizations.of(context).getText(
                        'naw0tsyy' /* Password */,
                      ),
                      hintStyle: FlutterFlowTheme.of(context).bodyMedium,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).lineGray,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 0.0, 24.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodySmall,
                    keyboardType: TextInputType.number,
                    validator: _model.keyboxPasswordControllerValidator
                        .asValidator(context),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.78, -0.24),
                child: Theme(
                  data: ThemeData(
                    checkboxTheme: CheckboxThemeData(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                    ),
                    unselectedWidgetColor: FlutterFlowTheme.of(context).accent2,
                  ),
                  child: Checkbox(
                    value: _model.checkboxValue ??= false,
                    onChanged: (newValue) async {
                      setState(() => _model.checkboxValue = newValue!);
                    },
                    activeColor: FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.02, 0.84),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (_model.checkboxValue! &&
                        (functions.isTextNull(
                                _model.keyboxPasswordController.text) ==
                            false)) {
                      final garagesUpdateData = createGaragesRecordData(
                        isKey: true,
                        keyboxPassword: _model.keyboxPasswordController.text,
                      );
                      await widget.newGarageRef!.update(garagesUpdateData);

                      context.pushNamed(
                        'create_garage_4_price',
                        queryParameters: {
                          'newGarageRef': serializeParam(
                            widget.newGarageRef,
                            ParamType.DocumentReference,
                          ),
                        }.withoutNulls,
                      );
                    }
                  },
                  text: FFLocalizations.of(context).getText(
                    'rnztlife' /* Conferma */,
                  ),
                  options: FFButtonOptions(
                    width: 130.0,
                    height: 40.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Urbanist',
                          color: Colors.white,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.43, -0.24),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'd7gbb2fe' /* Confermo di aver preso visione... */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Urbanist',
                        color: FlutterFlowTheme.of(context).gray600,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -0.8),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '0ty3cktg' /* Attenzione! Se per raggiungere... */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Urbanist',
                          color: FlutterFlowTheme.of(context).gray600,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
