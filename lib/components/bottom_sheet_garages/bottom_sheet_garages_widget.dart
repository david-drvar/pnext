import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/reservations/garage_details_for_reservation/garage_details_for_reservation_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bottom_sheet_garages_model.dart';
export 'bottom_sheet_garages_model.dart';

class BottomSheetGaragesWidget extends StatefulWidget {
  const BottomSheetGaragesWidget({
    Key? key,
    this.garage,
    required this.reservationRef,
  }) : super(key: key);

  final GaragesRecord? garage;
  final DocumentReference? reservationRef;

  @override
  _BottomSheetGaragesWidgetState createState() =>
      _BottomSheetGaragesWidgetState();
}

class _BottomSheetGaragesWidgetState extends State<BottomSheetGaragesWidget> {
  late BottomSheetGaragesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomSheetGaragesModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 36.0),
      child: StreamBuilder<UsersRecord>(
        stream: UsersRecord.getDocument(widget.garage!.userRef!),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  color: FlutterFlowTheme.of(context).primary,
                ),
              ),
            );
          }
          final containerUsersRecord = snapshot.data!;
          return Container(
            width: double.infinity,
            height: 200.0,
            constraints: BoxConstraints(
              maxHeight: 200.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).tertiary,
              boxShadow: [
                BoxShadow(
                  blurRadius: 7.0,
                  color: Color(0x4D000000),
                  offset: Offset(0.0, 3.0),
                )
              ],
              borderRadius: BorderRadius.circular(16.0),
              shape: BoxShape.rectangle,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(
                      height: 16.0,
                      thickness: 3.0,
                      indent: 120.0,
                      endIndent: 120.0,
                      color: Color(0xFFD7DADD),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Host info',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(40.0),
                            child: Image.network(
                              valueOrDefault<String>(
                                containerUsersRecord.photoUrl,
                                'https://via.placeholder.com/600x400?text=Host+picture',
                              ),
                              width: 80.0,
                              height: 80.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  containerUsersRecord.name,
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 16.0,
                                      ),
                                ),
                              ),
                              Text(
                                widget.garage!.city,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Urbanist',
                                      fontSize: 12.0,
                                    ),
                              ),
                              Text(
                                widget.garage!.address,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Urbanist',
                                      fontSize: 12.0,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                widget.garage!.rate.toString(),
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 16.0,
                                    ),
                              ),
                              Text(
                                '+taxes/fees',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    50.0, 0.0, 0.0, 0.0),
                                child: StreamBuilder<ReservationRecord>(
                                  stream: ReservationRecord.getDocument(
                                      widget.reservationRef!),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      );
                                    }
                                    final buttonReservationRecord =
                                        snapshot.data!;
                                    return FFButtonWidget(
                                      onPressed: () async {
                                        _model.totalPrice =
                                            await actions.totalPriceCalculation(
                                          widget.garage!.rate,
                                          buttonReservationRecord.totalTime,
                                        );

                                        final reservationUpdateData =
                                            createReservationRecordData(
                                          garageReference:
                                              widget.garage!.reference,
                                          totalPrice: widget.garage!.rate *
                                              buttonReservationRecord.totalTime,
                                        );
                                        await widget.reservationRef!
                                            .update(reservationUpdateData);
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                GarageDetailsForReservationWidget(
                                              garageRef:
                                                  widget.garage!.reference,
                                              reservationRef:
                                                  widget.reservationRef,
                                            ),
                                          ),
                                        );

                                        setState(() {});
                                      },
                                      text: 'See Garage',
                                      options: FFButtonOptions(
                                        width: 130.0,
                                        height: 30.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Urbanist',
                                              color: Colors.white,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'per hour',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
