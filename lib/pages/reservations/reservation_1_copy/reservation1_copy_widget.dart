import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/reservations/reservation_2/reservation2_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reservation1_copy_model.dart';
export 'reservation1_copy_model.dart';

class Reservation1CopyWidget extends StatefulWidget {
  const Reservation1CopyWidget({
    Key? key,
    this.datestart,
    this.timePickedOk,
  }) : super(key: key);

  final DateTime? datestart;
  final bool? timePickedOk;

  @override
  _Reservation1CopyWidgetState createState() => _Reservation1CopyWidgetState();
}

class _Reservation1CopyWidgetState extends State<Reservation1CopyWidget> {
  late Reservation1CopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Reservation1CopyModel());
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
              Navigator.pop(context);
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
                    'Indica quando hai bisogno del parcheggio',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.07, -0.77),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await DatePicker.showDatePicker(
                        context,
                        showTitleActions: true,
                        onConfirm: (date) {
                          setState(() {
                            _model.datePicked = date;
                          });
                        },
                        currentTime: getCurrentTimestamp,
                        minTime: getCurrentTimestamp,
                      );
                    },
                    text: 'Data ',
                    options: FFButtonOptions(
                      width: 120.0,
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
                  alignment: AlignmentDirectional(0.0, 0.85),
                  child: FFButtonWidget(
                    onPressed: () async {
                      _model.startR = await actions.hoursAndMinutesToDateAction(
                        _model.dropDownOre1Value!,
                        _model.dropDownMin1Value!,
                      );
                      _model.endR = await actions.hoursAndMinutesToDateAction(
                        _model.dropDownOre2Value!,
                        _model.dropDownMin2Value!,
                      );
                      _model.reservationTimeCheck =
                          await actions.reservationTimeOk(
                        context,
                        _model.dropDownOre1Value!,
                        _model.dropDownMin1Value!,
                        _model.dropDownOre2Value!,
                        _model.dropDownMin2Value!,
                      );
                      _model.totalTime = await actions.parkingTimeCalculation(
                        context,
                        _model.dropDownOre1Value!,
                        _model.dropDownOre2Value!,
                        _model.dropDownMin1Value!,
                        _model.dropDownMin2Value!,
                      );
                      if (_model.reservationTimeCheck!) {
                        final reservationCreateData =
                            createReservationRecordData(
                          dateStart: _model.startR,
                          dateEnd: _model.endR,
                          user: currentUserReference,
                          dateReservation: _model.datePicked,
                          totalTime: _model.totalTime,
                        );
                        var reservationRecordReference =
                            ReservationRecord.collection.doc();
                        await reservationRecordReference
                            .set(reservationCreateData);
                        _model.reservationDoc =
                            ReservationRecord.getDocumentFromData(
                                reservationCreateData,
                                reservationRecordReference);
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Reservation2Widget(
                              reservationref: _model.reservationDoc!.reference,
                            ),
                          ),
                        );
                      } else {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Reservation problem'),
                              content: Text(
                                  'Intervallo temporale scelto non valido'),
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
                  alignment: AlignmentDirectional(0.1, -0.5),
                  child: FlutterFlowDropDown<String>(
                    controller: _model.dropDownOre1ValueController ??=
                        FormFieldController<String>(null),
                    options: [
                      '00',
                      '01',
                      '02',
                      '03',
                      '04',
                      '05',
                      '06',
                      '07',
                      '08',
                      '09',
                      '10',
                      '11',
                      '12',
                      '13',
                      '14',
                      '15',
                      '16',
                      '17',
                      '18',
                      '19',
                      '20',
                      '21',
                      '22',
                      '23'
                    ],
                    onChanged: (val) =>
                        setState(() => _model.dropDownOre1Value = val),
                    width: 84.0,
                    height: 50.0,
                    searchHintTextStyle:
                        FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                    textStyle: FlutterFlowTheme.of(context).bodyMedium,
                    hintText: 'hour',
                    searchHintText: 'Search for an item...',
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: Colors.transparent,
                    borderWidth: 0.0,
                    borderRadius: 0.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                    hidesUnderline: true,
                    isSearchable: false,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.65, -0.5),
                  child: FlutterFlowDropDown<String>(
                    controller: _model.dropDownMin1ValueController ??=
                        FormFieldController<String>(null),
                    options: ['00', '15', '30', '45'],
                    onChanged: (val) =>
                        setState(() => _model.dropDownMin1Value = val),
                    width: 84.0,
                    height: 50.0,
                    searchHintTextStyle:
                        FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Urbanist',
                          fontSize: 14.0,
                        ),
                    hintText: 'min',
                    searchHintText: 'Search for an item...',
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: Colors.transparent,
                    borderWidth: 0.0,
                    borderRadius: 0.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                    hidesUnderline: true,
                    isSearchable: false,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.55, -0.3),
                  child: Text(
                    'Seleziona orario \nfine sosta',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.55, -0.5),
                  child: Text(
                    'Seleziona orario \ninizio sosta',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.1, -0.3),
                  child: FlutterFlowDropDown<String>(
                    controller: _model.dropDownOre2ValueController ??=
                        FormFieldController<String>(null),
                    options: [
                      '00',
                      '01',
                      '02',
                      '03',
                      '04',
                      '05',
                      '06',
                      '07',
                      '08',
                      '09',
                      '10',
                      '11',
                      '12',
                      '13',
                      '14',
                      '15',
                      '16',
                      '17',
                      '18',
                      '19',
                      '20',
                      '21',
                      '22',
                      '23'
                    ],
                    onChanged: (val) =>
                        setState(() => _model.dropDownOre2Value = val),
                    width: 84.0,
                    height: 50.0,
                    searchHintTextStyle:
                        FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                    textStyle: FlutterFlowTheme.of(context).bodyMedium,
                    hintText: 'hour',
                    searchHintText: 'Search for an item...',
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: Colors.transparent,
                    borderWidth: 0.0,
                    borderRadius: 0.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                    hidesUnderline: true,
                    isSearchable: false,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.65, -0.3),
                  child: FlutterFlowDropDown<String>(
                    controller: _model.dropDownMin2ValueController ??=
                        FormFieldController<String>(null),
                    options: ['00', '15', '30', '45'],
                    onChanged: (val) =>
                        setState(() => _model.dropDownMin2Value = val),
                    width: 84.0,
                    height: 50.0,
                    searchHintTextStyle:
                        FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Urbanist',
                          fontSize: 14.0,
                        ),
                    hintText: 'min',
                    searchHintText: 'Search for an item...',
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: Colors.transparent,
                    borderWidth: 0.0,
                    borderRadius: 0.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                    hidesUnderline: true,
                    isSearchable: false,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.06, -0.63),
                  child: Text(
                    valueOrDefault<String>(
                      _model.datePicked?.toString(),
                      'data scelta',
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
