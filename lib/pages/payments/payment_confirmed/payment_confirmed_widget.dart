import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'payment_confirmed_model.dart';
export 'payment_confirmed_model.dart';

class PaymentConfirmedWidget extends StatefulWidget {
  const PaymentConfirmedWidget({
    Key? key,
    required this.garageRef,
    required this.reservationRef,
  }) : super(key: key);

  final DocumentReference? garageRef;
  final DocumentReference? reservationRef;

  @override
  _PaymentConfirmedWidgetState createState() => _PaymentConfirmedWidgetState();
}

class _PaymentConfirmedWidgetState extends State<PaymentConfirmedWidget> {
  late PaymentConfirmedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentConfirmedModel());

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

    return StreamBuilder<ReservationRecord>(
      stream: ReservationRecord.getDocument(widget.reservationRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  color: FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        final paymentConfirmedReservationRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          body: SafeArea(
            top: true,
            child: StreamBuilder<GaragesRecord>(
              stream: GaragesRecord.getDocument(widget.garageRef!),
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
                final columnGaragesRecord = snapshot.data!;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                      child: Container(
                        width: 140.0,
                        height: 140.0,
                        decoration: BoxDecoration(
                          color: Color(0x4C4B39EF),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color(0xFF4B39EF),
                            width: 2.0,
                          ),
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              30.0, 30.0, 30.0, 30.0),
                          child: Icon(
                            Icons.check_rounded,
                            color: Color(0xFF4B39EF),
                            size: 60.0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'wnp1ismi' /* Pagamento confermato! */,
                        ),
                        style:
                            FlutterFlowTheme.of(context).displaySmall.override(
                                  fontFamily: 'Outfit',
                                  color: Color(0xFF4B39EF),
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '6shxm9fl' /* Grazie per aver utilizzato PNe... */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Plus Jakarta Sans',
                              color: Color(0xFF57636C),
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 400.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          final chatsCreateData = {
                            ...createChatsRecordData(
                              userA:
                                  paymentConfirmedReservationRecord.garageOwner,
                              userB: currentUserReference,
                            ),
                            'users': functions.returnUsersListForChatCreation(
                                paymentConfirmedReservationRecord.garageOwner!,
                                currentUserReference!),
                          };
                          var chatsRecordReference =
                              ChatsRecord.collection.doc();
                          await chatsRecordReference.set(chatsCreateData);
                          _model.chat = ChatsRecord.getDocumentFromData(
                              chatsCreateData, chatsRecordReference);

                          final reservationUpdateData =
                              createReservationRecordData(
                            chatReference:
                                paymentConfirmedReservationRecord.chatReference,
                            isCreationFinished: true,
                          );
                          await widget.reservationRef!
                              .update(reservationUpdateData);

                          context.pushNamed(
                            'reservation_4',
                            queryParameters: {
                              'reservationref': serializeParam(
                                widget.reservationRef,
                                ParamType.DocumentReference,
                              ),
                              'documentGarage': serializeParam(
                                columnGaragesRecord,
                                ParamType.Document,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'documentGarage': columnGaragesRecord,
                            },
                          );

                          setState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          'wyjdes3m' /* Avanti */,
                        ),
                        options: FFButtonOptions(
                          width: 230.0,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Plus Jakarta Sans',
                                color: FlutterFlowTheme.of(context).cultured,
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal,
                              ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
