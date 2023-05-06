import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/reservations/reservation_2/reservation2_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reservation1_model.dart';
export 'reservation1_model.dart';

class Reservation1Widget extends StatefulWidget {
  const Reservation1Widget({
    Key? key,
    this.datestart,
  }) : super(key: key);

  final DateTime? datestart;

  @override
  _Reservation1WidgetState createState() => _Reservation1WidgetState();
}

class _Reservation1WidgetState extends State<Reservation1Widget> {
  late Reservation1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Reservation1Model());
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
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          child: Align(
            alignment: AlignmentDirectional(0.05, 0.05),
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, -0.9),
                  child: Text(
                    'Indica quando hai bisogno del parcheggio',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.03, -0.77),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await DatePicker.showDateTimePicker(
                        context,
                        showTitleActions: true,
                        onConfirm: (date) {
                          setState(() {
                            _model.datePicked1 = date;
                          });
                        },
                        currentTime: getCurrentTimestamp,
                        minTime: getCurrentTimestamp,
                      );
                    },
                    text: 'Data e orario di arrivo',
                    options: FFButtonOptions(
                      width: 280.0,
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
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.1, -0.17),
                  child: Text(
                    'Seleziona orario fine sosta',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.85),
                  child: FFButtonWidget(
                    onPressed: () async {
                      final reservationCreateData = createReservationRecordData(
                        dateStart: _model.datePicked1,
                        dateEnd: _model.datePicked2,
                        user: currentUserReference,
                      );
                      var reservationRecordReference =
                          ReservationRecord.collection.doc();
                      await reservationRecordReference
                          .set(reservationCreateData);
                      _model.newReservation =
                          ReservationRecord.getDocumentFromData(
                              reservationCreateData,
                              reservationRecordReference);
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Reservation2Widget(
                            reservationref: _model.newReservation!.reference,
                            documentref: _model.newReservation!,
                          ),
                        ),
                      );

                      setState(() {});
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
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.04, -0.01),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await DatePicker.showDateTimePicker(
                        context,
                        showTitleActions: true,
                        onConfirm: (date) {
                          setState(() {
                            _model.datePicked2 = date;
                          });
                        },
                        currentTime: _model.datePicked1!,
                        minTime: _model.datePicked1!,
                      );
                    },
                    text: 'Data e orario fine sosta',
                    options: FFButtonOptions(
                      width: 280.0,
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
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.02, -0.59),
                  child: Text(
                    valueOrDefault<String>(
                      _model.datePicked1?.toString(),
                      'Date time',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.05, 0.14),
                  child: Text(
                    valueOrDefault<String>(
                      _model.datePicked2?.toString(),
                      'Date time',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
