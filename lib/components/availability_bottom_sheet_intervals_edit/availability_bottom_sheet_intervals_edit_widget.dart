import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'availability_bottom_sheet_intervals_edit_model.dart';
export 'availability_bottom_sheet_intervals_edit_model.dart';

class AvailabilityBottomSheetIntervalsEditWidget extends StatefulWidget {
  const AvailabilityBottomSheetIntervalsEditWidget({
    Key? key,
    String? day,
    this.newGarageRef,
  })  : this.day = day ?? 'idk',
        super(key: key);

  final String day;
  final DocumentReference? newGarageRef;

  @override
  _AvailabilityBottomSheetIntervalsEditWidgetState createState() =>
      _AvailabilityBottomSheetIntervalsEditWidgetState();
}

class _AvailabilityBottomSheetIntervalsEditWidgetState
    extends State<AvailabilityBottomSheetIntervalsEditWidget> {
  late AvailabilityBottomSheetIntervalsEditModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => AvailabilityBottomSheetIntervalsEditModel());
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
                  'f6tdlrqn' /* Seleziona l'orario di disponib... */,
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
                      'pnbek13x' /* Orario inizio */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                  FlutterFlowDropDown<String>(
                    controller: _model.dropDownStartHoursValueController ??=
                        FormFieldController<String>(null),
                    options: [
                      FFLocalizations.of(context).getText(
                        'byih226c' /* 09 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'sbsy7o19' /* 10 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'c3o9d2z0' /* 11 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'gz865g22' /* 12 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'z4h1n6k9' /* 13 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'nayei21p' /* 14 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'p0bc7ujh' /* 15 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'lmg01fho' /* 16 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'uqorl5vz' /* 17 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'cghkmhhb' /* 18 */,
                      ),
                      FFLocalizations.of(context).getText(
                        't86jr65a' /* 19 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '6vz75axt' /* 20 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'zjfwjgxm' /* 21 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'x314ooh2' /* 22 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '0udnsg7k' /* 23 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'c68ojfqw' /* 00 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '7b9y8i5c' /* 01 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'fm2y8zjn' /* 02 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'a3t1dc61' /* 03 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'g8z8jzd2' /* 04 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'me6v2n6r' /* 05 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '079we4xq' /* 06 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'zsi4hx1l' /* 07 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '0bldtznf' /* 08 */,
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
                      'pwz4k96g' /* Hours */,
                    ),
                    searchHintText: FFLocalizations.of(context).getText(
                      '00ufaw8r' /* Search for an item... */,
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
                        'kcyzjnwb' /* 00 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '5fxw8o49' /* 15 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'os7dz59j' /* 30 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'ls7kaif5' /* 45 */,
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
                      'zdo0y14y' /* Minutes */,
                    ),
                    searchHintText: FFLocalizations.of(context).getText(
                      'wenjys2v' /* Search for an item... */,
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
                      'n1u9fia7' /* Orario fine */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                  FlutterFlowDropDown<String>(
                    controller: _model.dropDownEndHoursValueController ??=
                        FormFieldController<String>(null),
                    options: [
                      FFLocalizations.of(context).getText(
                        '3sntaeeo' /* 09 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'a8yvszw6' /* 10 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '8isvlzku' /* 11 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'xkvrbfu1' /* 12 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'pj27d74x' /* 13 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '85iqsqip' /* 14 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '9yazogcl' /* 15 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '0m6jd7lm' /* 16 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'hfizchij' /* 17 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'd5lbogbb' /* 18 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'jqi0ijn2' /* 19 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '5rnl98xw' /* 20 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'kcvz2dwr' /* 21 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'hweea7lg' /* 22 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'umm0ti3h' /* 23 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'sd772s7q' /* 00 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'fxy29vxt' /* 01 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'l2l14zjd' /* 02 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'a4xzwpui' /* 03 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'y91mk122' /* 04 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '782g5ted' /* 05 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'kmqiz7iz' /* 06 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'yzwvvedh' /* 07 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '4sd8fe7p' /* 08 */,
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
                      'd9pfk0kk' /* Hours */,
                    ),
                    searchHintText: FFLocalizations.of(context).getText(
                      'c1a6xezt' /* Search for an item... */,
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
                        'tf0ixpgp' /* 00 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'gjuuyfzt' /* 15 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '9n8ugv6t' /* 30 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '0m7gpqgj' /* 45 */,
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
                      '7qlgmv31' /* Minutes */,
                    ),
                    searchHintText: FFLocalizations.of(context).getText(
                      'ldnnswcg' /* Search for an item... */,
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
                          await widget.newGarageRef!.update(garagesUpdateData4);
                        } else {
                          if (widget.day == 'friday') {
                            final garagesUpdateData5 = createGaragesRecordData(
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

                  setState(() {});
                },
                text: FFLocalizations.of(context).getText(
                  '31g0kbqh' /* OK */,
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
