import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reservation4_copy_model.dart';
export 'reservation4_copy_model.dart';

class Reservation4CopyWidget extends StatefulWidget {
  const Reservation4CopyWidget({
    Key? key,
    this.reservationref,
    required this.documentGarage,
  }) : super(key: key);

  final DocumentReference? reservationref;
  final GaragesRecord? documentGarage;

  @override
  _Reservation4CopyWidgetState createState() => _Reservation4CopyWidgetState();
}

class _Reservation4CopyWidgetState extends State<Reservation4CopyWidget> {
  late Reservation4CopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Reservation4CopyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
              context.safePop();
            },
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(-0.15, -0.1),
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(-0.7, -0.9),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'bvnvse95' /* Immagine posto auto */,
                    ),
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, -0.7),
                  child: Image.network(
                    widget.documentGarage!.photos.first,
                    width: 300.0,
                    height: 300.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.6, 0.1),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'mr3kpj18' /* Come accedere al posto auto */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.45),
                  child: Image.network(
                    'https://picsum.photos/seed/303/600',
                    width: 150.0,
                    height: 150.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.8),
                  child: FFButtonWidget(
                    onPressed: () async {
                      final reservationUpdateData = createReservationRecordData(
                        totalPrice: 10.0,
                      );
                      await widget.reservationref!
                          .update(reservationUpdateData);

                      context.pushNamed(
                        'reservation_5',
                        queryParameters: {
                          'reservationref': serializeParam(
                            widget.reservationref,
                            ParamType.DocumentReference,
                          ),
                        }.withoutNulls,
                      );
                    },
                    text: FFLocalizations.of(context).getText(
                      'cur276f1' /* Procedi con il pagamento */,
                    ),
                    options: FFButtonOptions(
                      width: 260.0,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
