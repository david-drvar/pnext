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
                'Seleziona l\'orario di disponibilità del tuo posto auto per il giorno della settimana scelto ',
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
                    'Orario inzio',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                  FlutterFlowDropDown<String>(
                    controller: _model.dropDownStartHoursValueController ??=
                        FormFieldController<String>(null),
                    options: [
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
                      '23',
                      '00',
                      '01',
                      '02',
                      '03',
                      '04',
                      '05',
                      '06',
                      '07',
                      '08'
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
                    hintText: 'Hours',
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
                  FlutterFlowDropDown<String>(
                    controller: _model.dropDownStartMinutesValueController ??=
                        FormFieldController<String>(null),
                    options: ['00', '15', '30', '45'],
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
                    hintText: 'Minutes',
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
                    'Orario fine',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                  FlutterFlowDropDown<String>(
                    controller: _model.dropDownEndHoursValueController ??=
                        FormFieldController<String>(null),
                    options: [
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
                      '23',
                      '00',
                      '01',
                      '02',
                      '03',
                      '04',
                      '05',
                      '06',
                      '07',
                      '08'
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
                    hintText: 'Hours',
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
                  FlutterFlowDropDown<String>(
                    controller: _model.dropDownEndMinutesValueController ??=
                        FormFieldController<String>(null),
                    options: ['00', '15', '30', '45'],
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
                    hintText: 'Minutes',
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
                text: 'OK',
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
