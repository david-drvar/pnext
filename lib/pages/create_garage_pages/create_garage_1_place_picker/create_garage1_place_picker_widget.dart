import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import '/pages/create_garage_pages/create_garage_2_foto_video/create_garage2_foto_video_widget.dart';
import 'dart:io';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_garage1_place_picker_model.dart';
export 'create_garage1_place_picker_model.dart';

class CreateGarage1PlacePickerWidget extends StatefulWidget {
  const CreateGarage1PlacePickerWidget({Key? key}) : super(key: key);

  @override
  _CreateGarage1PlacePickerWidgetState createState() =>
      _CreateGarage1PlacePickerWidgetState();
}

class _CreateGarage1PlacePickerWidgetState
    extends State<CreateGarage1PlacePickerWidget> {
  late CreateGarage1PlacePickerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateGarage1PlacePickerModel());
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
          FFLocalizations.of(context).getText(
            '4dzu8c5k' /* Crea un Garage */,
          ),
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '29jzb9d0' /* Registra con GPS dove si trova... */,
                  ),
                  textAlign: TextAlign.justify,
                  style: FlutterFlowTheme.of(context).bodySmall,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlutterFlowPlacePicker(
                      iOSGoogleMapsApiKey:
                          'AIzaSyCvGV_md_PqFWmLb_YDcPANgFDg0cMz9K8',
                      androidGoogleMapsApiKey:
                          'AIzaSyA3rS8AyljUkQWTJXmHyzgNNRCe0nxurdM',
                      webGoogleMapsApiKey:
                          'AIzaSyDOHGJtnAZgTaDqE_0E5wY11bNDTGhi08o',
                      onSelect: (place) async {
                        setState(() => _model.placePickerValue = place);
                      },
                      defaultText: FFLocalizations.of(context).getText(
                        'gdvm5m69' /* Seleziona Location */,
                      ),
                      icon: Icon(
                        Icons.place,
                        color: Colors.white,
                        size: 16.0,
                      ),
                      buttonOptions: FFButtonOptions(
                        width: 200.0,
                        height: 40.0,
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
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        _model.placePickerValue.address,
                        'Chosen address',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        _model.placePickerValue.city,
                        'Chosen city',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        _model.placePickerValue.zipCode,
                        'Chosen ZIP code',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        _model.placePickerValue.country,
                        'Chosen Country',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ],
                ),
              ),
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
                          FFLocalizations.of(context).getText(
                            '7gqqeapa' /* Seleziona la taglia del veicol... */,
                          ),
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          if ((functions.isTextNull(_model.vehicleType) ==
                                  false) &&
                              (functions.isTextNull(
                                      _model.placePickerValue.address) ==
                                  false)) {
                            final garagesCreateData = createGaragesRecordData(
                              userRef: currentUserReference,
                              city: _model.placePickerValue.city,
                              address: _model.placePickerValue.address,
                              zip: _model.placePickerValue.zipCode,
                              dimensions: _model.vehicleType,
                              location: _model.placePickerValue.latLng,
                              country: _model.placePickerValue.country,
                              isActive: true,
                              isCreationFinished: false,
                            );
                            var garagesRecordReference =
                                GaragesRecord.collection.doc();
                            await garagesRecordReference.set(garagesCreateData);
                            _model.newGarage =
                                GaragesRecord.getDocumentFromData(
                                    garagesCreateData, garagesRecordReference);
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CreateGarage2FotoVideoWidget(
                                  newGarageRef: _model.newGarage!.reference,
                                ),
                              ),
                            );
                          }

                          setState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          'z0v276a6' /* AVANTI */,
                        ),
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
