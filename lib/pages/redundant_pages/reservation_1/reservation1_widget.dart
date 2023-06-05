import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
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
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.05, 0.05),
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, -0.9),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '3o9sbu15' /* Indica quando hai bisogno del ... */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.03, -0.77),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (kIsWeb) {
                        final _datePicked1Date = await showDatePicker(
                          context: context,
                          initialDate: getCurrentTimestamp,
                          firstDate: getCurrentTimestamp,
                          lastDate: DateTime(2050),
                        );

                        TimeOfDay? _datePicked1Time;
                        if (_datePicked1Date != null) {
                          _datePicked1Time = await showTimePicker(
                            context: context,
                            initialTime:
                                TimeOfDay.fromDateTime(getCurrentTimestamp),
                          );
                        }

                        if (_datePicked1Date != null &&
                            _datePicked1Time != null) {
                          setState(() {
                            _model.datePicked1 = DateTime(
                              _datePicked1Date.year,
                              _datePicked1Date.month,
                              _datePicked1Date.day,
                              _datePicked1Time!.hour,
                              _datePicked1Time.minute,
                            );
                          });
                        }
                      } else {
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
                          locale: LocaleType.values.firstWhere(
                            (l) =>
                                l.name ==
                                FFLocalizations.of(context).languageCode,
                            orElse: () => LocaleType.en,
                          ),
                        );
                      }
                    },
                    text: FFLocalizations.of(context).getText(
                      'ha283qkp' /* Data e orario di arrivo */,
                    ),
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
                    FFLocalizations.of(context).getText(
                      'brfl8xpp' /* Seleziona orario fine sosta */,
                    ),
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

                      context.pushNamed(
                        'reservation_2',
                        queryParameters: {
                          'reservationref': serializeParam(
                            _model.newReservation!.reference,
                            ParamType.DocumentReference,
                          ),
                        }.withoutNulls,
                      );

                      setState(() {});
                    },
                    text: FFLocalizations.of(context).getText(
                      'sgd6knz9' /* Conferma */,
                    ),
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
                      if (kIsWeb) {
                        final _datePicked2Date = await showDatePicker(
                          context: context,
                          initialDate: _model.datePicked1!,
                          firstDate: _model.datePicked1!,
                          lastDate: DateTime(2050),
                        );

                        TimeOfDay? _datePicked2Time;
                        if (_datePicked2Date != null) {
                          _datePicked2Time = await showTimePicker(
                            context: context,
                            initialTime:
                                TimeOfDay.fromDateTime(_model.datePicked1!),
                          );
                        }

                        if (_datePicked2Date != null &&
                            _datePicked2Time != null) {
                          setState(() {
                            _model.datePicked2 = DateTime(
                              _datePicked2Date.year,
                              _datePicked2Date.month,
                              _datePicked2Date.day,
                              _datePicked2Time!.hour,
                              _datePicked2Time.minute,
                            );
                          });
                        }
                      } else {
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
                          locale: LocaleType.values.firstWhere(
                            (l) =>
                                l.name ==
                                FFLocalizations.of(context).languageCode,
                            orElse: () => LocaleType.en,
                          ),
                        );
                      }
                    },
                    text: FFLocalizations.of(context).getText(
                      'fakstugh' /* Data e orario fine sosta */,
                    ),
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
