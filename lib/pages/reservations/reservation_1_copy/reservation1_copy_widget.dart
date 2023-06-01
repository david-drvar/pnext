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
                    FFLocalizations.of(context).getText(
                      'qev9wse8' /* Indica quando hai bisogno del ... */,
                    ),
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
                        locale: LocaleType.values.firstWhere(
                          (l) =>
                              l.name ==
                              FFLocalizations.of(context).languageCode,
                          orElse: () => LocaleType.en,
                        ),
                      );
                    },
                    text: FFLocalizations.of(context).getText(
                      'y8oijhcv' /* Data  */,
                    ),
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
                        _model.datePicked!,
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
                          isCreationFinished: false,
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
                              title: Text('Errore prenotazione'),
                              content: Text(
                                  'Orari scelti non validi, prova a ricontrollare gli orari'),
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
                      '1e2c3g5l' /* Conferma */,
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
                  alignment: AlignmentDirectional(0.1, -0.5),
                  child: FlutterFlowDropDown<String>(
                    controller: _model.dropDownOre1ValueController ??=
                        FormFieldController<String>(null),
                    options: [
                      FFLocalizations.of(context).getText(
                        'tect6yof' /* 00 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'dods9zmq' /* 01 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'hkotrce7' /* 02 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '9d8o0hy9' /* 03 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '3ra09bmx' /* 04 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'oa89cbfy' /* 05 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'irbqoq35' /* 06 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '6jt7lkwn' /* 07 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'x4r3tcdg' /* 08 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'xkswuovf' /* 09 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'xfmek6oh' /* 10 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'nzutxlh8' /* 11 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'l93ps4xa' /* 12 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '0r72xf15' /* 13 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'tczyp18z' /* 14 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '0c6kct9n' /* 15 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'dyt09eu6' /* 16 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '3kkl25r1' /* 17 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '2rrlxlgx' /* 18 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'sscoswg9' /* 19 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'r70lacl9' /* 20 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'b4ac514r' /* 21 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '5c6gz1if' /* 22 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'hqalsm8x' /* 23 */,
                      )
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
                    hintText: FFLocalizations.of(context).getText(
                      '6ytr6fd3' /* hour */,
                    ),
                    searchHintText: FFLocalizations.of(context).getText(
                      'xhczyhri' /* Search for an item... */,
                    ),
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
                    options: [
                      FFLocalizations.of(context).getText(
                        'xf14ddln' /* 00 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'jkm54u49' /* 15 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'k7sgeg8l' /* 30 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '11db0rho' /* 45 */,
                      )
                    ],
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
                    hintText: FFLocalizations.of(context).getText(
                      'ytki0x5a' /* min */,
                    ),
                    searchHintText: FFLocalizations.of(context).getText(
                      '7t16ozlw' /* Search for an item... */,
                    ),
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
                    FFLocalizations.of(context).getText(
                      'x7spn7w0' /* Seleziona orario 
fine sosta */
                      ,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.55, -0.5),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'y19r66c8' /* Seleziona orario 
inizio sosta */
                      ,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.1, -0.3),
                  child: FlutterFlowDropDown<String>(
                    controller: _model.dropDownOre2ValueController ??=
                        FormFieldController<String>(null),
                    options: [
                      FFLocalizations.of(context).getText(
                        '1xyosewk' /* 00 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '22idsmsh' /* 01 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'xb32kxwx' /* 02 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'gbbfevdu' /* 03 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'a9jqzde2' /* 04 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '75jfhtva' /* 05 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '18ioae87' /* 06 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '5y3vcf6h' /* 07 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'ai2n6i51' /* 08 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'wlpgsv5w' /* 09 */,
                      ),
                      FFLocalizations.of(context).getText(
                        's6pdnsm8' /* 10 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '4ez0ylk2' /* 11 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '8aug2vhp' /* 12 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'dggm5xpw' /* 13 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '3yq1b6im' /* 14 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'e65bbjr2' /* 15 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'a1u70vr1' /* 16 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'zwbbw83f' /* 17 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '8p0qk2kd' /* 18 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '5ma0jjiu' /* 19 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'ffr8lnqr' /* 20 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'zhrk4hq1' /* 21 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'fbwhjh66' /* 22 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'rw9i5r90' /* 23 */,
                      )
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
                    hintText: FFLocalizations.of(context).getText(
                      'm64y46w7' /* hour */,
                    ),
                    searchHintText: FFLocalizations.of(context).getText(
                      '60tzl4xa' /* Search for an item... */,
                    ),
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
                    options: [
                      FFLocalizations.of(context).getText(
                        'pk58mw1s' /* 00 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'vq1sjk77' /* 15 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'c9t66g4x' /* 30 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'dvjgovs9' /* 45 */,
                      )
                    ],
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
                    hintText: FFLocalizations.of(context).getText(
                      'mqrzxr0a' /* min */,
                    ),
                    searchHintText: FFLocalizations.of(context).getText(
                      '3vrtnq00' /* Search for an item... */,
                    ),
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
                      dateTimeFormat(
                        'd/M/y',
                        _model.datePicked,
                        locale: FFLocalizations.of(context).languageCode,
                      ),
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
