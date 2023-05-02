import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/reservation_3_map/reservation3_map_widget.dart';
import '/pages/reservation_4/reservation4_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reservation3_choose_garage_model.dart';
export 'reservation3_choose_garage_model.dart';

class Reservation3ChooseGarageWidget extends StatefulWidget {
  const Reservation3ChooseGarageWidget({
    Key? key,
    this.reservationref,
    required this.reservationdoc,
  }) : super(key: key);

  final DocumentReference? reservationref;
  final ReservationRecord? reservationdoc;

  @override
  _Reservation3ChooseGarageWidgetState createState() =>
      _Reservation3ChooseGarageWidgetState();
}

class _Reservation3ChooseGarageWidgetState
    extends State<Reservation3ChooseGarageWidget> {
  late Reservation3ChooseGarageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Reservation3ChooseGarageModel());
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
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.04, -0.95),
                  child: Text(
                    'Scegli garage ',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.05, 0.85),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Reservation4Widget(
                            reservationref: widget.reservationref,
                            documentGarage: null!,
                          ),
                        ),
                      );
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
                  alignment: AlignmentDirectional(-0.01, -0.84),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Reservation3MapWidget(),
                        ),
                      );
                    },
                    text: 'Cerca sulla mappa',
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
                  alignment: AlignmentDirectional(0.0, -0.66),
                  child: Text(
                    'OPPURE',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.89, -0.58),
                  child: Text(
                    'Inserisci l\'indirizzo di tuo interesse',
                    style: FlutterFlowTheme.of(context).labelMedium,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.82, -0.49),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                    child: Text(
                      'Città',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.82, -0.49),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
                    child: Text(
                      'Quartiere',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.82, -0.49),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 160.0, 0.0, 0.0),
                    child: Text(
                      'Via/Piazza',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.82, -0.49),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 220.0, 0.0, 0.0),
                    child: Text(
                      'Civico',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.82, -0.49),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 280.0, 0.0, 0.0),
                    child: Text(
                      'Paese',
                      style: FlutterFlowTheme.of(context).bodyMedium,
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
