import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'availability_bottom_sheet_model.dart';
export 'availability_bottom_sheet_model.dart';

class AvailabilityBottomSheetWidget extends StatefulWidget {
  const AvailabilityBottomSheetWidget({
    Key? key,
    String? day,
    this.newGarageRef,
  })  : this.day = day ?? 'idk',
        super(key: key);

  final String day;
  final DocumentReference? newGarageRef;

  @override
  _AvailabilityBottomSheetWidgetState createState() =>
      _AvailabilityBottomSheetWidgetState();
}

class _AvailabilityBottomSheetWidgetState
    extends State<AvailabilityBottomSheetWidget> {
  late AvailabilityBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AvailabilityBottomSheetModel());
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
                  'iugcupk5' /* Seleziona l'orario di disponib... */,
                ),
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Lexend Deca',
                      color: FlutterFlowTheme.of(context).gray600,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 0.0, 10.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await DatePicker.showTimePicker(
                        context,
                        showTitleActions: true,
                        onConfirm: (date) {
                          setState(() {
                            _model.datePicked1 = date;
                          });
                        },
                        currentTime: getCurrentTimestamp,
                        locale: LocaleType.values.firstWhere(
                          (l) =>
                              l.name ==
                              FFLocalizations.of(context).languageCode,
                          orElse: () => LocaleType.en,
                        ),
                      );
                    },
                    text: FFLocalizations.of(context).getText(
                      'xl8u1zg0' /* Fascia Oraria */,
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
                      elevation: 2.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(80.0, 0.0, 0.0, 0.0),
                  child: Text(
                    valueOrDefault<String>(
                      dateTimeFormat(
                        'Hm',
                        _model.datePicked1,
                        locale: FFLocalizations.of(context).languageCode,
                      ),
                      'Time',
                    ),
                    style: FlutterFlowTheme.of(context).bodySmall,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 0.0, 10.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await DatePicker.showTimePicker(
                        context,
                        showTitleActions: true,
                        onConfirm: (date) {
                          setState(() {
                            _model.datePicked2 = date;
                          });
                        },
                        currentTime: getCurrentTimestamp,
                        locale: LocaleType.values.firstWhere(
                          (l) =>
                              l.name ==
                              FFLocalizations.of(context).languageCode,
                          orElse: () => LocaleType.en,
                        ),
                      );
                    },
                    text: FFLocalizations.of(context).getText(
                      '5blhqpx9' /* Fascia Oraria */,
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
                                color: FlutterFlowTheme.of(context).cultured,
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(80.0, 0.0, 0.0, 0.0),
                  child: Text(
                    valueOrDefault<String>(
                      dateTimeFormat(
                        'Hm',
                        _model.datePicked2,
                        locale: FFLocalizations.of(context).languageCode,
                      ),
                      'Time',
                    ),
                    style: FlutterFlowTheme.of(context).bodySmall,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  if (widget.day == 'monday') {
                    final garagesUpdateData1 = createGaragesRecordData(
                      mondayStart: _model.datePicked1,
                      mondayEnd: _model.datePicked2,
                    );
                    await widget.newGarageRef!.update(garagesUpdateData1);
                  } else {
                    if (widget.day == 'tuesday') {
                      final garagesUpdateData2 = createGaragesRecordData(
                        tuesdayStart: _model.datePicked1,
                        tuesdayEnd: _model.datePicked2,
                      );
                      await widget.newGarageRef!.update(garagesUpdateData2);
                    } else {
                      if (widget.day == 'wednesday') {
                        final garagesUpdateData3 = createGaragesRecordData(
                          wednesdayStart: _model.datePicked1,
                          wednesdayEnd: _model.datePicked2,
                        );
                        await widget.newGarageRef!.update(garagesUpdateData3);
                      } else {
                        if (widget.day == 'thursday') {
                          final garagesUpdateData4 = createGaragesRecordData(
                            thursdayStart: _model.datePicked1,
                            thursdayEnd: _model.datePicked2,
                          );
                          await widget.newGarageRef!.update(garagesUpdateData4);
                        } else {
                          if (widget.day == 'friday') {
                            final garagesUpdateData5 = createGaragesRecordData(
                              fridayStart: _model.datePicked1,
                              fridayEnd: _model.datePicked2,
                            );
                            await widget.newGarageRef!
                                .update(garagesUpdateData5);
                          } else {
                            if (widget.day == 'saturday') {
                              final garagesUpdateData6 =
                                  createGaragesRecordData(
                                saturdayStart: _model.datePicked1,
                                saturdayEnd: _model.datePicked2,
                              );
                              await widget.newGarageRef!
                                  .update(garagesUpdateData6);
                            } else {
                              if (widget.day == 'sunday') {
                                final garagesUpdateData7 =
                                    createGaragesRecordData(
                                  sundayStart: _model.datePicked1,
                                  sundayEnd: _model.datePicked2,
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
                },
                text: FFLocalizations.of(context).getText(
                  'j860in6z' /* OK */,
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
