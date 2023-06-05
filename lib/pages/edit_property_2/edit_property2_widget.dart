import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/amenitity_indicator/amenitity_indicator_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_property2_model.dart';
export 'edit_property2_model.dart';

class EditProperty2Widget extends StatefulWidget {
  const EditProperty2Widget({
    Key? key,
    this.propertyRef,
    this.propertyAmenities,
  }) : super(key: key);

  final PropertiesRecord? propertyRef;
  final AmenititiesRecord? propertyAmenities;

  @override
  _EditProperty2WidgetState createState() => _EditProperty2WidgetState();
}

class _EditProperty2WidgetState extends State<EditProperty2Widget> {
  late EditProperty2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProperty2Model());

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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          buttonSize: 46.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 24.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'uav5dqtv' /* Edit Property */,
          ),
          style: FlutterFlowTheme.of(context).headlineSmall,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
          child: StreamBuilder<AmenititiesRecord>(
            stream: AmenititiesRecord.getDocument(
                widget.propertyAmenities!.reference),
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
              final columnAmenititiesRecord = snapshot.data!;
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'yij2ykk0' /* CHOOSE YOUR AMENITIES */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Urbanist',
                                          color: FlutterFlowTheme.of(context)
                                              .gray600,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.amenitityIndicatorModel1,
                                    updateCallback: () => setState(() {}),
                                    child: AmenitityIndicatorWidget(
                                      icon: Icon(
                                        Icons.pool_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .gray600,
                                      ),
                                      background:
                                          FlutterFlowTheme.of(context).tertiary,
                                      borderColor: Color(0xFFE1EDF9),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SwitchListTile.adaptive(
                                    value: _model.amenityPoolValue1 ??=
                                        widget.propertyAmenities!.pool,
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.amenityPoolValue1 = newValue!);
                                    },
                                    title: Text(
                                      FFLocalizations.of(context).getText(
                                        'umuwfyai' /* Pool */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    activeTrackColor: Color(0xFF392BBA),
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16.0, 8.0, 0.0, 8.0),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.amenitityIndicatorModel2,
                                    updateCallback: () => setState(() {}),
                                    child: AmenitityIndicatorWidget(
                                      icon: Icon(
                                        Icons.ev_station_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .gray600,
                                      ),
                                      background:
                                          FlutterFlowTheme.of(context).tertiary,
                                      borderColor: Color(0xFFE1EDF9),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SwitchListTile.adaptive(
                                    value: _model.amenityEVChargingValue ??=
                                        widget.propertyAmenities!.evCharger,
                                    onChanged: (newValue) async {
                                      setState(() => _model
                                          .amenityEVChargingValue = newValue!);
                                    },
                                    title: Text(
                                      FFLocalizations.of(context).getText(
                                        'vgwgq692' /* EV Car Charging */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    activeTrackColor: Color(0xFF392BBA),
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16.0, 8.0, 0.0, 8.0),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.amenitityIndicatorModel3,
                                    updateCallback: () => setState(() {}),
                                    child: AmenitityIndicatorWidget(
                                      icon: Icon(
                                        Icons.power_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .gray600,
                                      ),
                                      background:
                                          FlutterFlowTheme.of(context).tertiary,
                                      borderColor: Color(0xFFE1EDF9),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SwitchListTile.adaptive(
                                    value: _model.amenityExtraOutletsValue ??=
                                        widget.propertyAmenities!.extraOutlets,
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.amenityExtraOutletsValue =
                                              newValue!);
                                    },
                                    title: Text(
                                      FFLocalizations.of(context).getText(
                                        '8pr5b3jc' /* Extra Outlets */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    activeTrackColor: Color(0xFF392BBA),
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16.0, 8.0, 0.0, 8.0),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.amenitityIndicatorModel4,
                                    updateCallback: () => setState(() {}),
                                    child: AmenitityIndicatorWidget(
                                      icon: Icon(
                                        Icons.ac_unit_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .gray600,
                                      ),
                                      background:
                                          FlutterFlowTheme.of(context).tertiary,
                                      borderColor: Color(0xFFE1EDF9),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SwitchListTile.adaptive(
                                    value: _model.amenityACValue ??=
                                        widget.propertyAmenities!.ac,
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.amenityACValue = newValue!);
                                    },
                                    title: Text(
                                      FFLocalizations.of(context).getText(
                                        'h00peps2' /* Air Conditioning (AC) */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    activeTrackColor: Color(0xFF392BBA),
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16.0, 8.0, 0.0, 8.0),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.amenitityIndicatorModel5,
                                    updateCallback: () => setState(() {}),
                                    child: AmenitityIndicatorWidget(
                                      icon: Icon(
                                        Icons.wb_sunny_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .gray600,
                                      ),
                                      background:
                                          FlutterFlowTheme.of(context).tertiary,
                                      borderColor: Color(0xFFE1EDF9),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SwitchListTile.adaptive(
                                    value: _model.amenityHeatingValue ??=
                                        widget.propertyAmenities!.heater,
                                    onChanged: (newValue) async {
                                      setState(() => _model
                                          .amenityHeatingValue = newValue!);
                                    },
                                    title: Text(
                                      FFLocalizations.of(context).getText(
                                        'z8wi5kdu' /* Heating */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    activeTrackColor: Color(0xFF392BBA),
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16.0, 8.0, 0.0, 8.0),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.amenitityIndicatorModel6,
                                    updateCallback: () => setState(() {}),
                                    child: AmenitityIndicatorWidget(
                                      icon: Icon(
                                        Icons.local_laundry_service_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .gray600,
                                      ),
                                      background:
                                          FlutterFlowTheme.of(context).tertiary,
                                      borderColor: Color(0xFFE1EDF9),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SwitchListTile.adaptive(
                                    value: _model.amenityWasherValue ??=
                                        widget.propertyAmenities!.washer,
                                    onChanged: (newValue) async {
                                      setState(() => _model.amenityWasherValue =
                                          newValue!);
                                    },
                                    title: Text(
                                      FFLocalizations.of(context).getText(
                                        'mmateffh' /* Washer */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    activeTrackColor: Color(0xFF392BBA),
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16.0, 8.0, 0.0, 8.0),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.amenitityIndicatorModel7,
                                    updateCallback: () => setState(() {}),
                                    child: AmenitityIndicatorWidget(
                                      icon: Icon(
                                        Icons.local_laundry_service_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .gray600,
                                      ),
                                      background:
                                          FlutterFlowTheme.of(context).tertiary,
                                      borderColor: Color(0xFFE1EDF9),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SwitchListTile.adaptive(
                                    value: _model.amenityDryerValue ??=
                                        widget.propertyAmenities!.dryer,
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.amenityDryerValue = newValue!);
                                    },
                                    title: Text(
                                      FFLocalizations.of(context).getText(
                                        'g9iu68da' /* Dryer */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    activeTrackColor: Color(0xFF392BBA),
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16.0, 8.0, 0.0, 8.0),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.amenitityIndicatorModel8,
                                    updateCallback: () => setState(() {}),
                                    child: AmenitityIndicatorWidget(
                                      icon: Icon(
                                        Icons.pets_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .gray600,
                                      ),
                                      background:
                                          FlutterFlowTheme.of(context).tertiary,
                                      borderColor: Color(0xFFE1EDF9),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SwitchListTile.adaptive(
                                    value: _model.amenityPetsValue ??=
                                        widget.propertyAmenities!.dogFriendly,
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.amenityPetsValue = newValue!);
                                    },
                                    title: Text(
                                      FFLocalizations.of(context).getText(
                                        '7xqvgg9p' /* Pet Friendly */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    activeTrackColor: Color(0xFF392BBA),
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16.0, 8.0, 0.0, 8.0),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.amenitityIndicatorModel9,
                                    updateCallback: () => setState(() {}),
                                    child: AmenitityIndicatorWidget(
                                      icon: Icon(
                                        Icons.fitness_center_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .gray600,
                                      ),
                                      background:
                                          FlutterFlowTheme.of(context).tertiary,
                                      borderColor: Color(0xFFE1EDF9),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SwitchListTile.adaptive(
                                    value: _model.amenityWorkoutValue ??=
                                        widget.propertyAmenities!.workout,
                                    onChanged: (newValue) async {
                                      setState(() => _model
                                          .amenityWorkoutValue = newValue!);
                                    },
                                    title: Text(
                                      FFLocalizations.of(context).getText(
                                        'yg1hjz08' /* Workout Facility */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    activeTrackColor: Color(0xFF392BBA),
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16.0, 8.0, 0.0, 8.0),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.amenitityIndicatorModel10,
                                    updateCallback: () => setState(() {}),
                                    child: AmenitityIndicatorWidget(
                                      icon: Icon(
                                        Icons.theater_comedy,
                                        color: FlutterFlowTheme.of(context)
                                            .gray600,
                                      ),
                                      background:
                                          FlutterFlowTheme.of(context).tertiary,
                                      borderColor: Color(0xFFE1EDF9),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SwitchListTile.adaptive(
                                    value: _model.amenityPoolValue2 ??=
                                        widget.propertyAmenities!.hip,
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.amenityPoolValue2 = newValue!);
                                    },
                                    title: Text(
                                      FFLocalizations.of(context).getText(
                                        'a7tiwfkq' /* Hip */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    activeTrackColor: Color(0xFF392BBA),
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16.0, 8.0, 0.0, 8.0),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.amenitityIndicatorModel11,
                                      updateCallback: () => setState(() {}),
                                      child: AmenitityIndicatorWidget(
                                        icon: Icon(
                                          Icons.nightlife,
                                          color: FlutterFlowTheme.of(context)
                                              .gray600,
                                        ),
                                        background: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        borderColor: Color(0xFFE1EDF9),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SwitchListTile.adaptive(
                                      value: _model.amenityPoolValue3 ??=
                                          widget.propertyAmenities!.nightLife,
                                      onChanged: (newValue) async {
                                        setState(() => _model
                                            .amenityPoolValue3 = newValue!);
                                      },
                                      title: Text(
                                        FFLocalizations.of(context).getText(
                                          'ggrj35a0' /* Night Life */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium,
                                      ),
                                      tileColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      activeTrackColor: Color(0xFF392BBA),
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              16.0, 8.0, 0.0, 8.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'ruozwg6t' /* STEP */,
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                '1l3vskyr' /* 2/3 */,
                              ),
                              style:
                                  FlutterFlowTheme.of(context).headlineMedium,
                            ),
                          ],
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            final amenititiesUpdateData =
                                createAmenititiesRecordData(
                              ac: _model.amenityACValue,
                              heater: _model.amenityHeatingValue,
                              pool: _model.amenityPoolValue1,
                              dogFriendly: _model.amenityPetsValue,
                              washer: _model.amenityWasherValue,
                              dryer: _model.amenityDryerValue,
                              workout: _model.amenityWorkoutValue,
                              hip: _model.amenityPoolValue2,
                              nightLife: _model.amenityPoolValue3,
                              extraOutlets: _model.amenityExtraOutletsValue,
                              evCharger: _model.amenityEVChargingValue,
                            );
                            await widget.propertyAmenities!.reference
                                .update(amenititiesUpdateData);

                            context.pushNamed(
                              'editProperty_3',
                              queryParameters: {
                                'propertyRef': serializeParam(
                                  widget.propertyRef,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'propertyRef': widget.propertyRef,
                              },
                            );
                          },
                          text: FFLocalizations.of(context).getText(
                            '50p2w27c' /* NEXT */,
                          ),
                          options: FFButtonOptions(
                            width: 120.0,
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
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
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
