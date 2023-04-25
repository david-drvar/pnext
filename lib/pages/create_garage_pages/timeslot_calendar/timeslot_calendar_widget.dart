import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/cancel_trip_h_o_s_t/cancel_trip_h_o_s_t_widget.dart';
import '/components/general_information_sheet/general_information_sheet_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/owners_garages/owners_garages_widget.dart';
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
            Navigator.pop(context);
          },
        ),
        actions: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.more_vert_outlined,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 30.0,
            ),
            onPressed: () async {
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                barrierColor: Color(0xB314181B),
                context: context,
                builder: (bottomSheetContext) {
                  return Padding(
                    padding: MediaQuery.of(bottomSheetContext).viewInsets,
                    child: Container(
                      height: 430.0,
                      child: CancelTripHOSTWidget(),
                    ),
                  );
                },
              ).then((value) => setState(() {}));
            },
          ),
        ],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'Seleziona il periodo di validità della disponibilità del tuo parcheggio',
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Lexend Deca',
                          color: FlutterFlowTheme.of(context).gray600,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(60.0, 70.0, 60.0, 0.0),
                  child: FlutterFlowCalendar(
                    color: FlutterFlowTheme.of(context).primary,
                    weekFormat: false,
                    weekStartsMonday: false,
                    onChange: (DateTimeRange? newSelectedDate) {
                      setState(
                          () => _model.calendarSelectedDay = newSelectedDate);
                    },
                    titleStyle: TextStyle(),
                    dayOfWeekStyle: TextStyle(),
                    dateStyle: TextStyle(),
                    selectedDateStyle: TextStyle(),
                    inactiveDateStyle: TextStyle(),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(90.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Start Date',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Urbanist',
                                    fontSize: 18.0,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          '-',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Urbanist',
                                    fontSize: 18.0,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'End Date',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Urbanist',
                                    fontSize: 18.0,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(36.0, 0.0, 0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          dateTimeFormat(
                              'MMMMEEEEd', _model.calendarSelectedDay?.start),
                          'Date',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Urbanist',
                              fontSize: 20.0,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: Text(
                        '-',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Urbanist',
                              fontSize: 18.0,
                            ),
                      ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        dateTimeFormat(
                            'MMMMEEEEd', _model.calendarSelectedDay?.end),
                        'Date',
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              35.0, 0.0, 24.0, 0.0),
                          child: Text(
                            'La tua disponibiilità è modificabile in qualiasi altro momento dal menù principale',
                            style: FlutterFlowTheme.of(context).bodySmall,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            120.0, 10.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            final garagesUpdateData = createGaragesRecordData(
                              startDateValidity:
                                  _model.calendarSelectedDay?.start,
                              endDateValidity: _model.calendarSelectedDay?.end,
                            );
                            await widget.newGarageRef!
                                .update(garagesUpdateData);
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (bottomSheetContext) {
                                return Padding(
                                  padding: MediaQuery.of(bottomSheetContext)
                                      .viewInsets,
                                  child: GeneralInformationSheetWidget(
                                    message: 'Success!',
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));

                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OwnersGaragesWidget(),
                              ),
                            );
                          },
                          text: 'Conferma',
                          options: FFButtonOptions(
                            width: 130.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
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
        ],
      ),
    );
  }
}
