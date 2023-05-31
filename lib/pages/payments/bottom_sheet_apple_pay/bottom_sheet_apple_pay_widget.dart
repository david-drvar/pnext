import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/payments/payment_confirmed/payment_confirmed_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bottom_sheet_apple_pay_model.dart';
export 'bottom_sheet_apple_pay_model.dart';

class BottomSheetApplePayWidget extends StatefulWidget {
  const BottomSheetApplePayWidget({
    Key? key,
    required this.reservationRef,
    required this.garageRef,
  }) : super(key: key);

  final DocumentReference? reservationRef;
  final DocumentReference? garageRef;

  @override
  _BottomSheetApplePayWidgetState createState() =>
      _BottomSheetApplePayWidgetState();
}

class _BottomSheetApplePayWidgetState extends State<BottomSheetApplePayWidget> {
  late BottomSheetApplePayModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomSheetApplePayModel());
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
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: Container(
        width: double.infinity,
        height: 350.0,
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
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 0.0),
                    child: Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/iphone-iOS.jpg',
                          width: 300.0,
                          height: 200.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '94a0ms9u' /* Pay */,
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'PT Sans',
                                fontSize: 28.0,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(180.0, 5.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'ivt4f82x' /* Cancel */,
                        ),
                        textAlign: TextAlign.end,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Urbanist',
                              color: Color(0xFF1F7FD6),
                              fontSize: 24.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).dark600,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'kln5nl2t' /* CARD */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'wuu0l0wn' /* 0000  0000  0000  0000 */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Urbanist',
                              color: FlutterFlowTheme.of(context).dark600,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(80.0, 0.0, 0.0, 0.0),
                      child: Icon(
                        Icons.chevron_right_rounded,
                        color: Color(0xFF1F7FD6),
                        size: 24.0,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1.0,
                indent: 10.0,
                color: FlutterFlowTheme.of(context).grayIcon,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(80.0, 0.0, 0.0, 0.0),
                    child: Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-0.43, -0.89),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'jcyb5c5w' /* SUBTOTAL */,
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.86, -0.38),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'z1yfq3g4' /* TAX */,
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.67, 0.37),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'hf7tezsj' /* TOTAL  */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Urbanist',
                                    color: FlutterFlowTheme.of(context).dark600,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 1.0,
                indent: 10.0,
                color: FlutterFlowTheme.of(context).grayIcon,
              ),
              FFButtonWidget(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentConfirmedWidget(
                        garageRef: widget.garageRef!,
                        reservationRef: widget.reservationRef!,
                      ),
                    ),
                  );
                },
                text: FFLocalizations.of(context).getText(
                  'r2euv0ug' /* Pay */,
                ),
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).dark600,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'PT Sans',
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                  elevation: 3.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
