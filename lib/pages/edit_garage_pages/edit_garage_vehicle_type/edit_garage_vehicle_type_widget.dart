import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_garage_vehicle_type_model.dart';
export 'edit_garage_vehicle_type_model.dart';

class EditGarageVehicleTypeWidget extends StatefulWidget {
  const EditGarageVehicleTypeWidget({
    Key? key,
    this.garage,
  }) : super(key: key);

  final GaragesRecord? garage;

  @override
  _EditGarageVehicleTypeWidgetState createState() =>
      _EditGarageVehicleTypeWidgetState();
}

class _EditGarageVehicleTypeWidgetState
    extends State<EditGarageVehicleTypeWidget> {
  late EditGarageVehicleTypeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditGarageVehicleTypeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.anyButtonSelected = true;
        _model.vehicleType = widget.garage!.dimensions;
      });
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30.0,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Edit Garage',
          style: FlutterFlowTheme.of(context).headlineMedium,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        width: 330.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Text(
                          'Select the maximum size of vehicle that your parking space can accommodate',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 10.0,
                        borderWidth: 1.0,
                        buttonSize: 60.0,
                        fillColor: FlutterFlowTheme.of(context).primary,
                        disabledColor: FlutterFlowTheme.of(context).grayIcon,
                        icon: FaIcon(
                          FontAwesomeIcons.truck,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        onPressed: _model.anyButtonSelected &&
                                (_model.vehicleType == 'truck')
                            ? null
                            : () async {
                                setState(() {
                                  _model.vehicleType = 'truck';
                                  _model.anyButtonSelected = true;
                                });
                              },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 10.0,
                        borderWidth: 1.0,
                        buttonSize: 60.0,
                        fillColor: FlutterFlowTheme.of(context).primary,
                        disabledColor: FlutterFlowTheme.of(context).grayIcon,
                        icon: FaIcon(
                          FontAwesomeIcons.carSide,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        onPressed: _model.anyButtonSelected &&
                                (_model.vehicleType == 'car')
                            ? null
                            : () async {
                                setState(() {
                                  _model.vehicleType = 'car';
                                  _model.anyButtonSelected = true;
                                });
                              },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 10.0,
                        borderWidth: 1.0,
                        buttonSize: 60.0,
                        fillColor: FlutterFlowTheme.of(context).primary,
                        disabledColor: FlutterFlowTheme.of(context).grayIcon,
                        icon: Icon(
                          Icons.pedal_bike_sharp,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        onPressed: _model.anyButtonSelected &&
                                (_model.vehicleType == 'bike')
                            ? null
                            : () async {
                                setState(() {
                                  _model.vehicleType = 'bike';
                                  _model.anyButtonSelected = true;
                                });
                              },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 10.0,
                        borderWidth: 1.0,
                        buttonSize: 60.0,
                        fillColor: FlutterFlowTheme.of(context).primary,
                        disabledColor: FlutterFlowTheme.of(context).grayIcon,
                        icon: FaIcon(
                          FontAwesomeIcons.caravan,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        onPressed: _model.anyButtonSelected &&
                                (_model.vehicleType == 'caravan')
                            ? null
                            : () async {
                                setState(() {
                                  _model.vehicleType = 'caravan';
                                  _model.anyButtonSelected = true;
                                });
                              },
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 10.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      fillColor: FlutterFlowTheme.of(context).primary,
                      disabledColor: FlutterFlowTheme.of(context).grayIcon,
                      icon: FaIcon(
                        FontAwesomeIcons.truckMoving,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onPressed: _model.anyButtonSelected &&
                              (_model.vehicleType == 'big_truck')
                          ? null
                          : () async {
                              setState(() {
                                _model.vehicleType = 'big_truck';
                                _model.anyButtonSelected = true;
                              });
                            },
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          final garagesUpdateData = createGaragesRecordData(
                            dimensions: _model.vehicleType,
                          );
                          await widget.garage!.reference
                              .update(garagesUpdateData);
                          Navigator.pop(context);
                        },
                        text: 'UPDATE',
                        options: FFButtonOptions(
                          width: 120.0,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
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
                          borderRadius: BorderRadius.circular(60.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
