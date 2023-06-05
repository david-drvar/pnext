import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_garage_key_model.dart';
export 'edit_garage_key_model.dart';

class EditGarageKeyWidget extends StatefulWidget {
  const EditGarageKeyWidget({
    Key? key,
    this.newGarageRef,
  }) : super(key: key);

  final DocumentReference? newGarageRef;

  @override
  _EditGarageKeyWidgetState createState() => _EditGarageKeyWidgetState();
}

class _EditGarageKeyWidgetState extends State<EditGarageKeyWidget> {
  late EditGarageKeyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditGarageKeyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Align(
            alignment: AlignmentDirectional(-0.4, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'r1kgni7y' /* Modifica Garage */,
              ),
              style: FlutterFlowTheme.of(context).headlineMedium,
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(-0.2, -0.75),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, -0.7),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '56thneew' /* Inserisci le informazioni
per ... */
                          ,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -0.4),
                child: FFButtonWidget(
                  onPressed: () async {
                    final garagesUpdateData = createGaragesRecordData(
                      isKey: false,
                    );
                    await widget.newGarageRef!.update(garagesUpdateData);
                    context.safePop();
                  },
                  text: FFLocalizations.of(context).getText(
                    'puj627an' /* Posto auto sempre accessibile */,
                  ),
                  options: FFButtonOptions(
                    width: 260.0,
                    height: 100.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Urbanist',
                          color: Colors.white,
                        ),
                    elevation: 2.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed(
                      'edit_garage_disclaimer',
                      queryParameters: {
                        'newGarageRef': serializeParam(
                          widget.newGarageRef,
                          ParamType.DocumentReference,
                        ),
                      }.withoutNulls,
                    );
                  },
                  text: FFLocalizations.of(context).getText(
                    's9vu5rhz' /* Servono chiavi o telecomando p... */,
                  ),
                  options: FFButtonOptions(
                    width: 260.0,
                    height: 100.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Urbanist',
                          color: Colors.white,
                        ),
                    elevation: 2.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
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
