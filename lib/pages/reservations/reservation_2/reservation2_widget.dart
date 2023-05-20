import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/reservations/reservation_3_map/reservation3_map_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'reservation2_model.dart';
export 'reservation2_model.dart';

class Reservation2Widget extends StatefulWidget {
  const Reservation2Widget({
    Key? key,
    this.reservationref,
  }) : super(key: key);

  final DocumentReference? reservationref;

  @override
  _Reservation2WidgetState createState() => _Reservation2WidgetState();
}

class _Reservation2WidgetState extends State<Reservation2Widget> {
  late Reservation2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Reservation2Model());

    _model.textController1 ??= TextEditingController();
    _model.textController2 ??= TextEditingController();
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
            alignment: AlignmentDirectional(0.0, 0.05),
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, -0.9),
                  child: Text(
                    'Inserisci informazioni relative al tuo veicolo',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, -0.7),
                  child: Text(
                    'Seleziona grandezza veicolo',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.4, -0.55),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 10.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    fillColor: FlutterFlowTheme.of(context).primary,
                    icon: FaIcon(
                      FontAwesomeIcons.carSide,
                      color: FlutterFlowTheme.of(context).cultured,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      final reservationUpdateData = createReservationRecordData(
                        dimension: 'car',
                      );
                      await widget.reservationref!
                          .update(reservationUpdateData);
                      setState(() {
                        _model.textController2?.text = 'size: car';
                      });
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, -0.55),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 10.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    fillColor: FlutterFlowTheme.of(context).primary,
                    icon: Icon(
                      Icons.pedal_bike,
                      color: FlutterFlowTheme.of(context).cultured,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      final reservationUpdateData = createReservationRecordData(
                        dimension: 'bike',
                      );
                      await widget.reservationref!
                          .update(reservationUpdateData);
                      setState(() {
                        _model.textController2?.text = 'size: bike';
                      });
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.4, -0.55),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 10.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    fillColor: FlutterFlowTheme.of(context).primary,
                    icon: FaIcon(
                      FontAwesomeIcons.caravan,
                      color: FlutterFlowTheme.of(context).cultured,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      final reservationUpdateData = createReservationRecordData(
                        dimension: 'caravan',
                      );
                      await widget.reservationref!
                          .update(reservationUpdateData);
                      setState(() {
                        _model.textController2?.text = 'size: caravan';
                      });
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.8, -0.55),
                  child: FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).primary,
                    borderRadius: 10.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    fillColor: FlutterFlowTheme.of(context).primary,
                    icon: FaIcon(
                      FontAwesomeIcons.truck,
                      color: FlutterFlowTheme.of(context).lineGray,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      final reservationUpdateData = createReservationRecordData(
                        dimension: 'truck',
                      );
                      await widget.reservationref!
                          .update(reservationUpdateData);
                      setState(() {
                        _model.textController2?.text = 'size: truck';
                      });
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.8, -0.55),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 10.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    fillColor: FlutterFlowTheme.of(context).primary,
                    icon: FaIcon(
                      FontAwesomeIcons.truckMoving,
                      color: FlutterFlowTheme.of(context).cultured,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      final reservationUpdateData = createReservationRecordData(
                        dimension: 'big_truck',
                      );
                      await widget.reservationref!
                          .update(reservationUpdateData);
                      setState(() {
                        _model.textController2?.text = 'size: big truck';
                      });
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.83, -0.39),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'truck',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.37, -0.39),
                  child: Text(
                    'car',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.02, -0.39),
                  child: Text(
                    'bike',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.37, -0.4),
                  child: Text(
                    'caravan',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.78, -0.39),
                  child: Text(
                    'big truck',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.01),
                  child: Text(
                    'inserisci targa',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.17),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        100.0, 100.0, 100.0, 100.0),
                    child: TextFormField(
                      controller: _model.textController1,
                      autofocus: true,
                      textCapitalization: TextCapitalization.none,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'XX000XX',
                        hintStyle: FlutterFlowTheme.of(context)
                            .bodySmall
                            .override(
                              fontFamily: 'Urbanist',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Urbanist',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 17.0,
                            fontWeight: FontWeight.normal,
                          ),
                      textAlign: TextAlign.center,
                      validator:
                          _model.textController1Validator.asValidator(context),
                      inputFormatters: [_model.textFieldMask1],
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.04, 0.72),
                  child: FFButtonWidget(
                    onPressed: () async {
                      final reservationUpdateData = createReservationRecordData(
                        carCode: _model.textController1.text,
                      );
                      await widget.reservationref!
                          .update(reservationUpdateData);
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Reservation3MapWidget(
                            reservationref: widget.reservationref,
                          ),
                        ),
                      );
                    },
                    text: 'Cerca parcheggio',
                    options: FFButtonOptions(
                      width: 230.0,
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
                  alignment: AlignmentDirectional(0.0, -0.19),
                  child: TextFormField(
                    controller: _model.textController2,
                    autofocus: true,
                    readOnly: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'size',
                      hintStyle: FlutterFlowTheme.of(context).bodySmall,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    textAlign: TextAlign.center,
                    validator:
                        _model.textController2Validator.asValidator(context),
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
