import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'garage_details_for_reservation_model.dart';
export 'garage_details_for_reservation_model.dart';

class GarageDetailsForReservationWidget extends StatefulWidget {
  const GarageDetailsForReservationWidget({
    Key? key,
    this.garageRef,
    this.reservationRef,
  }) : super(key: key);

  final DocumentReference? garageRef;
  final DocumentReference? reservationRef;

  @override
  _GarageDetailsForReservationWidgetState createState() =>
      _GarageDetailsForReservationWidgetState();
}

class _GarageDetailsForReservationWidgetState
    extends State<GarageDetailsForReservationWidget>
    with TickerProviderStateMixin {
  late GarageDetailsForReservationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 60.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 60.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 60.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 80.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 90.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 100.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GarageDetailsForReservationModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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

    return StreamBuilder<GaragesRecord>(
      stream: GaragesRecord.getDocument(widget.garageRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
        final garageDetailsForReservationGaragesRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          resizeToAvoidBottomInset: false,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 44.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 5.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pop();
                                    },
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: Color(0x3A000000),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30.0,
                                        buttonSize: 46.0,
                                        icon: Icon(
                                          Icons.arrow_back_rounded,
                                          color: Colors.white,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          context.safePop();
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height: 320.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFDBE2E7),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                child:
                                                    FlutterFlowExpandedImageView(
                                                  image: CachedNetworkImage(
                                                    imageUrl:
                                                        garageDetailsForReservationGaragesRecord
                                                            .photos.first,
                                                    fit: BoxFit.contain,
                                                  ),
                                                  allowRotation: false,
                                                  tag:
                                                      garageDetailsForReservationGaragesRecord
                                                          .photos.first,
                                                  useHeroAnimation: true,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Hero(
                                            tag:
                                                garageDetailsForReservationGaragesRecord
                                                    .photos.first,
                                            transitionOnUserGestures: true,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    garageDetailsForReservationGaragesRecord
                                                        .photos.first,
                                                width: double.infinity,
                                                height: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 16.0, 16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                if (garageDetailsForReservationGaragesRecord
                                                        .userRef ==
                                                    currentUserReference)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(100.0,
                                                                0.0, 0.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        context.pushNamed(
                                                          'edit_garage',
                                                          queryParameters: {
                                                            'garageRef':
                                                                serializeParam(
                                                              widget.garageRef,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'dyuh1elk' /* Modifica */,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: 60.0,
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Urbanist',
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                                if (garageDetailsForReservationGaragesRecord
                                                        .userRef ==
                                                    currentUserReference)
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      final garagesUpdateData =
                                                          createGaragesRecordData(
                                                        isActive: false,
                                                      );
                                                      await widget.garageRef!
                                                          .update(
                                                              garagesUpdateData);
                                                      context.safePop();
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'flbw0vl4' /* Elimina */,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: 60.0,
                                                      height: 40.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .redApple,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Urbanist',
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 12.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: AutoSizeText(
                                garageDetailsForReservationGaragesRecord
                                    .address,
                                style:
                                    FlutterFlowTheme.of(context).displaySmall,
                              ).animateOnPageLoad(
                                  animationsMap['textOnPageLoadAnimation1']!),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 4.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                garageDetailsForReservationGaragesRecord.city,
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF8B97A2),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ).animateOnPageLoad(
                                  animationsMap['textOnPageLoadAnimation2']!),
                            ),
                            Expanded(
                              child: Text(
                                garageDetailsForReservationGaragesRecord.zip,
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF8B97A2),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ).animateOnPageLoad(
                                  animationsMap['textOnPageLoadAnimation3']!),
                            ),
                            Expanded(
                              child: Text(
                                garageDetailsForReservationGaragesRecord
                                    .country,
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF8B97A2),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ).animateOnPageLoad(
                                  animationsMap['textOnPageLoadAnimation4']!),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 12.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'up1q2qaw' /* Descrizione */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ).animateOnPageLoad(
                            animationsMap['rowOnPageLoadAnimation1']!),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 4.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 24.0),
                                child: Text(
                                  garageDetailsForReservationGaragesRecord
                                      .description,
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF8B97A2),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ).animateOnPageLoad(
                                    animationsMap['textOnPageLoadAnimation5']!),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'bnmbekio' /* Adatto per */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ).animateOnPageLoad(
                            animationsMap['rowOnPageLoadAnimation2']!),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 10.0,
                                borderWidth: 1.0,
                                buttonSize: 60.0,
                                fillColor: FlutterFlowTheme.of(context).primary,
                                disabledColor:
                                    FlutterFlowTheme.of(context).grayIcon,
                                icon: FaIcon(
                                  FontAwesomeIcons.truck,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                                onPressed:
                                    garageDetailsForReservationGaragesRecord
                                                .dimensions !=
                                            'truck'
                                        ? null
                                        : () {
                                            print('IconButton pressed ...');
                                          },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 10.0,
                                borderWidth: 1.0,
                                buttonSize: 60.0,
                                fillColor: FlutterFlowTheme.of(context).primary,
                                disabledColor:
                                    FlutterFlowTheme.of(context).grayIcon,
                                icon: FaIcon(
                                  FontAwesomeIcons.carSide,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                                onPressed:
                                    garageDetailsForReservationGaragesRecord
                                                .dimensions !=
                                            'car'
                                        ? null
                                        : () {
                                            print('IconButton pressed ...');
                                          },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 10.0,
                                borderWidth: 1.0,
                                buttonSize: 60.0,
                                fillColor: FlutterFlowTheme.of(context).primary,
                                disabledColor:
                                    FlutterFlowTheme.of(context).grayIcon,
                                icon: Icon(
                                  Icons.pedal_bike_sharp,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                                onPressed:
                                    garageDetailsForReservationGaragesRecord
                                                .dimensions !=
                                            'bike'
                                        ? null
                                        : () {
                                            print('IconButton pressed ...');
                                          },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 10.0,
                                borderWidth: 1.0,
                                buttonSize: 60.0,
                                fillColor: FlutterFlowTheme.of(context).primary,
                                disabledColor:
                                    FlutterFlowTheme.of(context).grayIcon,
                                icon: FaIcon(
                                  FontAwesomeIcons.caravan,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                                onPressed:
                                    garageDetailsForReservationGaragesRecord
                                                .dimensions !=
                                            'caravan'
                                        ? null
                                        : () {
                                            print('IconButton pressed ...');
                                          },
                              ),
                            ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 10.0,
                              borderWidth: 1.0,
                              buttonSize: 60.0,
                              fillColor: FlutterFlowTheme.of(context).primary,
                              disabledColor:
                                  FlutterFlowTheme.of(context).grayIcon,
                              icon: FaIcon(
                                FontAwesomeIcons.truckMoving,
                                color: Colors.white,
                                size: 30.0,
                              ),
                              onPressed:
                                  garageDetailsForReservationGaragesRecord
                                              .dimensions !=
                                          'big_truck'
                                      ? null
                                      : () {
                                          print('IconButton pressed ...');
                                        },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Container(
                          width: 350.0,
                          height: 250.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(5.0),
                            shape: BoxShape.rectangle,
                          ),
                          child: Builder(builder: (context) {
                            final _googleMapMarker =
                                garageDetailsForReservationGaragesRecord;
                            return FlutterFlowGoogleMap(
                              controller: _model.googleMapsController,
                              onCameraIdle: (latLng) =>
                                  _model.googleMapsCenter = latLng,
                              initialLocation: _model.googleMapsCenter ??=
                                  garageDetailsForReservationGaragesRecord
                                      .location!,
                              markers: [
                                FlutterFlowMarker(
                                  _googleMapMarker.reference.path,
                                  _googleMapMarker.location!,
                                ),
                              ],
                              markerColor: GoogleMarkerColor.red,
                              mapType: MapType.normal,
                              style: GoogleMapStyle.standard,
                              initialZoom: 14.0,
                              allowInteraction: true,
                              allowZoom: true,
                              showZoomControls: true,
                              showLocation: true,
                              showCompass: false,
                              showMapToolbar: true,
                              showTraffic: false,
                              centerMapOnMarkerTap: true,
                            );
                          }),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'gugjd4oe' /* Garage availabilities */,
                              ),
                              style: FlutterFlowTheme.of(context).titleLarge,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'a3s82wks' /* Monday */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Urbanist',
                                    color: FlutterFlowTheme.of(context).dark600,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  dateTimeFormat(
                                    'Hm',
                                    garageDetailsForReservationGaragesRecord
                                        .mondayStart,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  'Not available',
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                            if (functions.isDateNull(
                                    garageDetailsForReservationGaragesRecord
                                        .mondayEnd) ==
                                false)
                              Text(
                                FFLocalizations.of(context).getText(
                                  '3m5zeuzv' /* - */,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            if (functions.isDateNull(
                                    garageDetailsForReservationGaragesRecord
                                        .mondayEnd) ==
                                false)
                              Text(
                                valueOrDefault<String>(
                                  dateTimeFormat(
                                    'Hm',
                                    garageDetailsForReservationGaragesRecord
                                        .mondayEnd,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  'ee',
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                '7s7fl7r1' /* Tuesday */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Urbanist',
                                    color: FlutterFlowTheme.of(context).dark600,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  dateTimeFormat(
                                    'Hm',
                                    garageDetailsForReservationGaragesRecord
                                        .tuesdayStart,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  'Not available',
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                            if (functions.isDateNull(
                                    garageDetailsForReservationGaragesRecord
                                        .tuesdayEnd) ==
                                false)
                              Text(
                                FFLocalizations.of(context).getText(
                                  'dxjdqjco' /* - */,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            if (functions.isDateNull(
                                    garageDetailsForReservationGaragesRecord
                                        .tuesdayEnd) ==
                                false)
                              Text(
                                valueOrDefault<String>(
                                  dateTimeFormat(
                                    'Hm',
                                    garageDetailsForReservationGaragesRecord
                                        .tuesdayEnd,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  'ee',
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'qqjtrevj' /* Wednesday */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Urbanist',
                                    color: FlutterFlowTheme.of(context).dark600,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  dateTimeFormat(
                                    'Hm',
                                    garageDetailsForReservationGaragesRecord
                                        .wednesdayStart,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  'Not available',
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                            if (functions.isDateNull(
                                    garageDetailsForReservationGaragesRecord
                                        .wednesdayEnd) ==
                                false)
                              Text(
                                FFLocalizations.of(context).getText(
                                  'cjfqs198' /* - */,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            if (functions.isDateNull(
                                    garageDetailsForReservationGaragesRecord
                                        .wednesdayEnd) ==
                                false)
                              Text(
                                dateTimeFormat(
                                  'Hm',
                                  garageDetailsForReservationGaragesRecord
                                      .wednesdayEnd!,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'ys36pm6v' /* Thursday */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Urbanist',
                                    color: FlutterFlowTheme.of(context).dark600,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  dateTimeFormat(
                                    'Hm',
                                    garageDetailsForReservationGaragesRecord
                                        .thursdayStart,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  'Not available',
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                            if (functions.isDateNull(
                                    garageDetailsForReservationGaragesRecord
                                        .thursdayEnd) ==
                                false)
                              Text(
                                FFLocalizations.of(context).getText(
                                  '0qjxnsqy' /* - */,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            if (functions.isDateNull(
                                    garageDetailsForReservationGaragesRecord
                                        .thursdayEnd) ==
                                false)
                              Text(
                                dateTimeFormat(
                                  'Hm',
                                  garageDetailsForReservationGaragesRecord
                                      .thursdayEnd!,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                's1xrrh1l' /* Friday */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Urbanist',
                                    color: FlutterFlowTheme.of(context).dark600,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  dateTimeFormat(
                                    'Hm',
                                    garageDetailsForReservationGaragesRecord
                                        .fridayStart,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  'Not available',
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                            if (functions.isDateNull(
                                    garageDetailsForReservationGaragesRecord
                                        .fridayEnd) ==
                                false)
                              Text(
                                FFLocalizations.of(context).getText(
                                  'lb1nyuh9' /* - */,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            if (functions.isDateNull(
                                    garageDetailsForReservationGaragesRecord
                                        .fridayEnd) ==
                                false)
                              Text(
                                dateTimeFormat(
                                  'Hm',
                                  garageDetailsForReservationGaragesRecord
                                      .fridayEnd!,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                '0uxoz8z6' /* Saturday */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Urbanist',
                                    color: FlutterFlowTheme.of(context).dark600,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  dateTimeFormat(
                                    'Hm',
                                    garageDetailsForReservationGaragesRecord
                                        .saturdayStart,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  'Not available',
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                            if (functions.isDateNull(
                                    garageDetailsForReservationGaragesRecord
                                        .saturdayEnd) ==
                                false)
                              Text(
                                FFLocalizations.of(context).getText(
                                  'wk27tsxa' /* - */,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            if (functions.isDateNull(
                                    garageDetailsForReservationGaragesRecord
                                        .saturdayEnd) ==
                                false)
                              Text(
                                dateTimeFormat(
                                  'Hm',
                                  garageDetailsForReservationGaragesRecord
                                      .saturdayEnd!,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'b5jh4kbr' /* Sunday */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Urbanist',
                                    color: FlutterFlowTheme.of(context).dark600,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  dateTimeFormat(
                                    'Hm',
                                    garageDetailsForReservationGaragesRecord
                                        .sundayStart,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  'Not available',
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                            if (functions.isDateNull(
                                    garageDetailsForReservationGaragesRecord
                                        .sundayEnd) ==
                                false)
                              Text(
                                FFLocalizations.of(context).getText(
                                  'm8zxa14l' /* - */,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            if (functions.isDateNull(
                                    garageDetailsForReservationGaragesRecord
                                        .sundayEnd) ==
                                false)
                              Text(
                                dateTimeFormat(
                                  'Hm',
                                  garageDetailsForReservationGaragesRecord
                                      .sundayEnd!,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 20.0, 0.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                '3s2uj8o9' /* Garage accessibility - */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Urbanist',
                                    color: FlutterFlowTheme.of(context).dark600,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            if (garageDetailsForReservationGaragesRecord
                                    .isKey ==
                                false)
                              Text(
                                FFLocalizations.of(context).getText(
                                  'rr3ujbnk' /*  always accessible */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Urbanist',
                                      color:
                                          FlutterFlowTheme.of(context).dark600,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            if (garageDetailsForReservationGaragesRecord
                                    .isKey ==
                                true)
                              Text(
                                FFLocalizations.of(context).getText(
                                  'fj9on2b0' /* requires key or remote control */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Urbanist',
                                      color:
                                          FlutterFlowTheme.of(context).dark600,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          height: 250.0,
                          decoration: BoxDecoration(),
                          child: Builder(
                            builder: (context) {
                              final photoListView =
                                  garageDetailsForReservationGaragesRecord
                                      .photos
                                      .toList();
                              return GridView.builder(
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 3.0,
                                  mainAxisSpacing: 3.0,
                                  childAspectRatio: 1.0,
                                ),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: photoListView.length,
                                itemBuilder: (context, photoListViewIndex) {
                                  final photoListViewItem =
                                      photoListView[photoListViewIndex];
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                child:
                                                    FlutterFlowExpandedImageView(
                                                  image: Image.network(
                                                    valueOrDefault<String>(
                                                      photoListViewItem,
                                                      'https://via.placeholder.com/600x400',
                                                    ),
                                                    fit: BoxFit.contain,
                                                  ),
                                                  allowRotation: false,
                                                  tag: valueOrDefault<String>(
                                                    photoListViewItem,
                                                    'https://via.placeholder.com/600x400' +
                                                        '$photoListViewIndex',
                                                  ),
                                                  useHeroAnimation: true,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Hero(
                                            tag: valueOrDefault<String>(
                                              photoListViewItem,
                                              'https://via.placeholder.com/600x400' +
                                                  '$photoListViewIndex',
                                            ),
                                            transitionOnUserGestures: true,
                                            child: Image.network(
                                              valueOrDefault<String>(
                                                photoListViewItem,
                                                'https://via.placeholder.com/600x400',
                                              ),
                                              width: 100.0,
                                              height: 100.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        height: 250.0,
                        decoration: BoxDecoration(),
                        child: Builder(
                          builder: (context) {
                            final videoListView =
                                garageDetailsForReservationGaragesRecord.videos
                                    .toList();
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              itemCount: videoListView.length,
                              itemBuilder: (context, videoListViewIndex) {
                                final videoListViewItem =
                                    videoListView[videoListViewIndex];
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FlutterFlowVideoPlayer(
                                      path: videoListViewItem,
                                      videoType: VideoType.network,
                                      autoPlay: false,
                                      looping: true,
                                      showControls: true,
                                      allowFullScreen: true,
                                      allowPlaybackSpeedMenu: false,
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryText,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4.0,
                      color: Color(0x55000000),
                      offset: Offset(0.0, 2.0),
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
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 40.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              StreamBuilder<ReservationRecord>(
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
                                  final textReservationRecord = snapshot.data!;
                                  return Text(
                                    (garageDetailsForReservationGaragesRecord
                                                .rate *
                                            textReservationRecord.totalTime)
                                        .toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Urbanist',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                  );
                                },
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'ck73nae5' /* € all'ora */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF8B97A2),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              '3rhe24y0' /* + tasse */,
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ],
                      ),
                      if (functions.isDocReferenceNull(widget.reservationRef) ==
                          false)
                        StreamBuilder<ReservationRecord>(
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
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              );
                            }
                            final buttonReservationRecord = snapshot.data!;
                            return FFButtonWidget(
                              onPressed: () async {
                                final reservationUpdateData =
                                    createReservationRecordData(
                                  garageOwner:
                                      garageDetailsForReservationGaragesRecord
                                          .userRef,
                                );
                                await widget.reservationRef!
                                    .update(reservationUpdateData);

                                context.pushNamed(
                                  'PagePayWith',
                                  queryParameters: {
                                    'reservationRef': serializeParam(
                                      widget.reservationRef,
                                      ParamType.DocumentReference,
                                    ),
                                    'garageRef': serializeParam(
                                      widget.garageRef,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                'thnj4338' /* Prenota ora */,
                              ),
                              options: FFButtonOptions(
                                width: 130.0,
                                height: 30.0,
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
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
