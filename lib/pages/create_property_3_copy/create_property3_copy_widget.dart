import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/timeslot_monday/timeslot_monday_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_property3_copy_model.dart';
export 'create_property3_copy_model.dart';

class CreateProperty3CopyWidget extends StatefulWidget {
  const CreateProperty3CopyWidget({
    Key? key,
    this.newGarageRef,
  }) : super(key: key);

  final DocumentReference? newGarageRef;

  @override
  _CreateProperty3CopyWidgetState createState() =>
      _CreateProperty3CopyWidgetState();
}

class _CreateProperty3CopyWidgetState extends State<CreateProperty3CopyWidget> {
  late CreateProperty3CopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateProperty3CopyModel());

    _model.pricePerNightController ??= TextEditingController();
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
            Navigator.pop(context);
          },
        ),
        title: Align(
          alignment: AlignmentDirectional(-0.3, 0.0),
          child: Text(
            'Create Garage',
            style: FlutterFlowTheme.of(context).headlineSmall,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Inserisci la tua tariffa oraria',
                            style: FlutterFlowTheme.of(context)
                                .bodySmall
                                .override(
                                  fontFamily: 'Urbanist',
                                  color: FlutterFlowTheme.of(context).gray600,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                      child: TextFormField(
                        controller: _model.pricePerNightController,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: '\$ Price',
                          hintStyle: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Urbanist',
                                color: FlutterFlowTheme.of(context).grayIcon,
                              ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 24.0),
                        ),
                        style: FlutterFlowTheme.of(context).headlineMedium,
                        validator: _model.pricePerNightControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    Divider(
                      height: 32.0,
                      thickness: 2.0,
                      color: FlutterFlowTheme.of(context).lineGray,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Istruzioni su come inserire una tariffa che abbia senso\n\nIstruzioni su cosa rimane in tasca all\'utente al netto \ndelle fee\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
                            style: FlutterFlowTheme.of(context)
                                .bodySmall
                                .override(
                                  fontFamily: 'Urbanist',
                                  color: FlutterFlowTheme.of(context).gray600,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        final garagesUpdateData = createGaragesRecordData(
                          rate: double.tryParse(
                              _model.pricePerNightController.text),
                        );
                        await widget.newGarageRef!.update(garagesUpdateData);
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TimeslotMondayWidget(
                              newGarageRef: widget.newGarageRef,
                            ),
                          ),
                        );
                      },
                      text: 'Conferma',
                      options: FFButtonOptions(
                        width: 130.0,
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
