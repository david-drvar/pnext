import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'timeslot_calendar_model.dart';
export 'timeslot_calendar_model.dart';

class TimeslotCalendarWidget extends StatefulWidget {
  const TimeslotCalendarWidget({
    Key? key,
    this.newGarageRef,
  }) : super(key: key);

  final DocumentReference? newGarageRef;

  @override
  _TimeslotCalendarWidgetState createState() => _TimeslotCalendarWidgetState();
}

class _TimeslotCalendarWidgetState extends State<TimeslotCalendarWidget> {
  late TimeslotCalendarModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimeslotCalendarModel());

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
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 30.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(45.0, 0.0, 0.0, 0.0),
          child: Text(
            FFLocalizations.of(context).getText(
              'sgfpkc7z' /* Crea un Garage */,
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'fgpazrv5' /* Seleziona il periodo di validi... */,
                ),
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Urbanist',
                      color: FlutterFlowTheme.of(context).gray600,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
              child: FlutterFlowCalendar(
                color: FlutterFlowTheme.of(context).primary,
                weekFormat: false,
                weekStartsMonday: true,
                onChange: (DateTimeRange? newSelectedDate) {
                  setState(() => _model.calendarSelectedDay1 = newSelectedDate);
                },
                titleStyle: TextStyle(),
                dayOfWeekStyle: TextStyle(),
                dateStyle: TextStyle(),
                selectedDateStyle: TextStyle(),
                inactiveDateStyle: TextStyle(),
                locale: FFLocalizations.of(context).languageCode,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
              child: FlutterFlowCalendar(
                color: FlutterFlowTheme.of(context).primary,
                weekFormat: false,
                weekStartsMonday: true,
                onChange: (DateTimeRange? newSelectedDate) {
                  setState(() => _model.calendarSelectedDay2 = newSelectedDate);
                },
                titleStyle: TextStyle(),
                dayOfWeekStyle: TextStyle(),
                dateStyle: TextStyle(),
                selectedDateStyle: TextStyle(),
                inactiveDateStyle: TextStyle(),
                locale: FFLocalizations.of(context).languageCode,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-0.15, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(90.0, 0.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'fpyrvtp6' /* Data d'inizio */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Urbanist',
                                    fontSize: 18.0,
                                  ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'kf2xmaak' /* - */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Urbanist',
                              fontSize: 18.0,
                            ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'ua3q8gos' /* Data di fine */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Urbanist',
                                    fontSize: 18.0,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  valueOrDefault<String>(
                    dateTimeFormat(
                      'MMMMEEEEd',
                      _model.calendarSelectedDay1?.start,
                      locale: FFLocalizations.of(context).languageCode,
                    ),
                    'Date',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Urbanist',
                        fontSize: 20.0,
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      's537pauw' /* - */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Urbanist',
                          fontSize: 18.0,
                        ),
                  ),
                ),
                Text(
                  dateTimeFormat(
                    'MMMMEEEEd',
                    _model.calendarSelectedDay2!.start,
                    locale: FFLocalizations.of(context).languageCode,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Urbanist',
                        fontSize: 20.0,
                      ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(35.0, 0.0, 24.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '57039w04' /* La tua disponibiilità è modifi... */,
                        ),
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Urbanist',
                              color: FlutterFlowTheme.of(context).gray600,
                              fontSize: 14.0,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(120.0, 0.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        _model.isDateOk = await actions.isDateOk(
                          _model.calendarSelectedDay1!.start,
                          _model.calendarSelectedDay2!.start,
                        );
                        if (_model.isDateOk!) {
                          final garagesUpdateData = createGaragesRecordData(
                            startDateValidity:
                                _model.calendarSelectedDay1?.start,
                            endDateValidity: _model.calendarSelectedDay2?.start,
                          );
                          await widget.newGarageRef!.update(garagesUpdateData);

                          context.goNamed(
                            'Create_Garage_3',
                            queryParameters: {
                              'newGarageRef': serializeParam(
                                widget.newGarageRef,
                                ParamType.DocumentReference,
                              ),
                            }.withoutNulls,
                          );
                        } else {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Errore '),
                                content: Text(
                                    'Date scelte non valide, prova a ricontrollare le date'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                        }

                        setState(() {});
                      },
                      text: FFLocalizations.of(context).getText(
                        'igha3iim' /* Conferma */,
                      ),
                      options: FFButtonOptions(
                        width: 130.0,
                        height: 30.0,
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
