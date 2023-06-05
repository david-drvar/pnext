import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'availability_bottom_sheet_intervals_model.dart';
export 'availability_bottom_sheet_intervals_model.dart';

class AvailabilityBottomSheetIntervalsWidget extends StatefulWidget {
  const AvailabilityBottomSheetIntervalsWidget({
    Key? key,
    String? day,
    this.newGarageRef,
  })  : this.day = day ?? 'idk',
        super(key: key);

  final String day;
  final DocumentReference? newGarageRef;

  @override
  _AvailabilityBottomSheetIntervalsWidgetState createState() =>
      _AvailabilityBottomSheetIntervalsWidgetState();
}

class _AvailabilityBottomSheetIntervalsWidgetState
    extends State<AvailabilityBottomSheetIntervalsWidget> {
  late AvailabilityBottomSheetIntervalsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => AvailabilityBottomSheetIntervalsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 400.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(0.0, -3.0),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 10.0, 24.0, 4.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'ntj4kl0o' /* Seleziona l'orario di disponib... */,
                ),
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Roboto',
                      color: FlutterFlowTheme.of(context).gray600,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      '83h89vye' /* Orario inzio */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                  FlutterFlowDropDown<String>(
                    controller: _model.dropDownStartHoursValueController ??=
                        FormFieldController<String>(null),
                    options: [
                      FFLocalizations.of(context).getText(
                        '7k3e0i7n' /* 09 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'co7zimqh' /* 10 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'ovywf9fd' /* 11 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '122ctlsh' /* 12 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '2135gw5b' /* 13 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'cdgwtmt4' /* 14 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'il9igods' /* 15 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'z3jy5f1l' /* 16 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '7vnf133v' /* 17 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'o93gnwnk' /* 18 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'up51o1du' /* 19 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '67ngmopf' /* 20 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'r3p0slfl' /* 21 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '6nvvslno' /* 22 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'u85z3ox6' /* 23 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'ankbhquh' /* 00 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'w2fx89wh' /* 01 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'xq5ie9ri' /* 02 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'jblhtb35' /* 03 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'omoo87a8' /* 04 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '8py2xb11' /* 05 */,
                      ),
                      FFLocalizations.of(context).getText(
                        's5xiqm8m' /* 06 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'fxmv8tpc' /* 07 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'ags1zzrp' /* 08 */,
                      )
                    ],
                    onChanged: (val) =>
                        setState(() => _model.dropDownStartHoursValue = val),
                    width: 100.0,
                    height: 50.0,
                    searchHintTextStyle:
                        FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                    textStyle: FlutterFlowTheme.of(context).bodyMedium,
                    hintText: FFLocalizations.of(context).getText(
                      'z43n4eby' /* Hours */,
                    ),
                    searchHintText: FFLocalizations.of(context).getText(
                      '0mnw9rvq' /* Search for an item... */,
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
                  FlutterFlowDropDown<String>(
                    controller: _model.dropDownStartMinutesValueController ??=
                        FormFieldController<String>(null),
                    options: [
                      FFLocalizations.of(context).getText(
                        '49kdbv7m' /* 00 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'gyibbp0n' /* 15 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'kfhcmqfg' /* 30 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '15550cma' /* 45 */,
                      )
                    ],
                    onChanged: (val) =>
                        setState(() => _model.dropDownStartMinutesValue = val),
                    width: 100.0,
                    height: 50.0,
                    searchHintTextStyle:
                        FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                    textStyle: FlutterFlowTheme.of(context).bodyMedium,
                    hintText: FFLocalizations.of(context).getText(
                      '568t8i4d' /* Minutes */,
                    ),
                    searchHintText: FFLocalizations.of(context).getText(
                      'd804j9iy' /* Search for an item... */,
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
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'pnj9fa18' /* Orario fine */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                  FlutterFlowDropDown<String>(
                    controller: _model.dropDownEndHoursValueController ??=
                        FormFieldController<String>(null),
                    options: [
                      FFLocalizations.of(context).getText(
                        'ytg5c7rc' /* 09 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '1liupofg' /* 10 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '0a26dnr4' /* 11 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'fot7zwme' /* 12 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'yf5p1qd0' /* 13 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'ciwdlgc5' /* 14 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '077hz8kx' /* 15 */,
                      ),
                      FFLocalizations.of(context).getText(
                        's1jzaop5' /* 16 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '3lypwcdf' /* 17 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '09oxl55y' /* 18 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '4364mhtz' /* 19 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '2e5hk8rg' /* 20 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'qp3czqrs' /* 21 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '9e4c8baf' /* 22 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '31oxl0e6' /* 23 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'p00gaeob' /* 00 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'cvw51krc' /* 01 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '3zz2cl1s' /* 02 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '2tn1xb3g' /* 03 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '5jaeo0um' /* 04 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'hsw23c8k' /* 05 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'zvlx04r9' /* 06 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'pipriy7a' /* 07 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '564ntfz6' /* 08 */,
                      )
                    ],
                    onChanged: (val) =>
                        setState(() => _model.dropDownEndHoursValue = val),
                    width: 100.0,
                    height: 50.0,
                    searchHintTextStyle:
                        FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                    textStyle: FlutterFlowTheme.of(context).bodyMedium,
                    hintText: FFLocalizations.of(context).getText(
                      'teug2wpl' /* Hours */,
                    ),
                    searchHintText: FFLocalizations.of(context).getText(
                      'k978jigv' /* Search for an item... */,
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
                  FlutterFlowDropDown<String>(
                    controller: _model.dropDownEndMinutesValueController ??=
                        FormFieldController<String>(null),
                    options: [
                      FFLocalizations.of(context).getText(
                        '6g6cjho9' /* 00 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '2021gbv0' /* 15 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'jca28u8m' /* 30 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'kynqqpxe' /* 45 */,
                      )
                    ],
                    onChanged: (val) =>
                        setState(() => _model.dropDownEndMinutesValue = val),
                    width: 100.0,
                    height: 50.0,
                    searchHintTextStyle:
                        FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                    textStyle: FlutterFlowTheme.of(context).bodyMedium,
                    hintText: FFLocalizations.of(context).getText(
                      'xlprr8nl' /* Minutes */,
                    ),
                    searchHintText: FFLocalizations.of(context).getText(
                      '2cqer774' /* Search for an item... */,
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
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  if (!functions.isTextNull(_model.dropDownStartHoursValue) &&
                      !functions.isTextNull(_model.dropDownStartMinutesValue) &&
                      !functions.isTextNull(_model.dropDownEndHoursValue) &&
                      !functions.isTextNull(_model.dropDownEndMinutesValue)) {
                    _model.startDateTime =
                        await actions.hoursAndMinutesToDateAction(
                      _model.dropDownStartHoursValue!,
                      _model.dropDownStartMinutesValue!,
                    );
                    _model.endDateTime =
                        await actions.hoursAndMinutesToDateAction(
                      _model.dropDownEndHoursValue!,
                      _model.dropDownEndMinutesValue!,
                    );
                    if (widget.day == 'monday') {
                      final garagesUpdateData1 = createGaragesRecordData(
                        mondayStart: _model.startDateTime,
                        mondayEnd: _model.endDateTime,
                      );
                      await widget.newGarageRef!.update(garagesUpdateData1);
                    } else {
                      if (widget.day == 'tuesday') {
                        final garagesUpdateData2 = createGaragesRecordData(
                          tuesdayStart: _model.startDateTime,
                          tuesdayEnd: _model.endDateTime,
                        );
                        await widget.newGarageRef!.update(garagesUpdateData2);
                      } else {
                        if (widget.day == 'wednesday') {
                          final garagesUpdateData3 = createGaragesRecordData(
                            wednesdayStart: _model.startDateTime,
                            wednesdayEnd: _model.endDateTime,
                          );
                          await widget.newGarageRef!.update(garagesUpdateData3);
                        } else {
                          if (widget.day == 'thursday') {
                            final garagesUpdateData4 = createGaragesRecordData(
                              thursdayStart: _model.startDateTime,
                              thursdayEnd: _model.endDateTime,
                            );
                            await widget.newGarageRef!
                                .update(garagesUpdateData4);
                          } else {
                            if (widget.day == 'friday') {
                              final garagesUpdateData5 =
                                  createGaragesRecordData(
                                fridayStart: _model.startDateTime,
                                fridayEnd: _model.endDateTime,
                              );
                              await widget.newGarageRef!
                                  .update(garagesUpdateData5);
                            } else {
                              if (widget.day == 'saturday') {
                                final garagesUpdateData6 =
                                    createGaragesRecordData(
                                  saturdayStart: _model.startDateTime,
                                  saturdayEnd: _model.endDateTime,
                                );
                                await widget.newGarageRef!
                                    .update(garagesUpdateData6);
                              } else {
                                if (widget.day == 'sunday') {
                                  final garagesUpdateData7 =
                                      createGaragesRecordData(
                                    sundayStart: _model.startDateTime,
                                    sundayEnd: _model.endDateTime,
                                  );
                                  await widget.newGarageRef!
                                      .update(garagesUpdateData7);
                                }
                              }
                            }
                          }
                        }
                      }
                    }

                    Navigator.pop(context);
                  }

                  setState(() {});
                },
                text: FFLocalizations.of(context).getText(
                  'z7otnv7d' /* OK */,
                ),
                options: FFButtonOptions(
                  width: 100.0,
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Lexend Deca',
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                  elevation: 2.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
