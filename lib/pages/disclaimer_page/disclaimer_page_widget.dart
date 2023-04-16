import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/create_property_3_copy/create_property3_copy_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'disclaimer_page_model.dart';
export 'disclaimer_page_model.dart';

class DisclaimerPageWidget extends StatefulWidget {
  const DisclaimerPageWidget({
    Key? key,
    this.newGarageRef,
  }) : super(key: key);

  final DocumentReference? newGarageRef;

  @override
  _DisclaimerPageWidgetState createState() => _DisclaimerPageWidgetState();
}

class _DisclaimerPageWidgetState extends State<DisclaimerPageWidget> {
  late DisclaimerPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DisclaimerPageModel());
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
            color: Color(0xFF95A1AC),
            size: 24.0,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Align(
          alignment: AlignmentDirectional(-0.3, 0.0),
          child: Text(
            'Create Garage',
            style: FlutterFlowTheme.of(context).headlineSmall,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Align(
          alignment: AlignmentDirectional(0.0, -0.15),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, -0.8),
                child: Text(
                  'Disclaimer riguardo al fatto che bisogna avere una \ncasssetta per le chiavi in modo da renderle accessibili\nal clinte che accederà sbloccando il lucchetto con \npassword che dovrete successivamente caricare sul\nvostro profilo',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.55, -0.3),
                child: Text(
                  'Confermo di aver preso visione del disclaimer',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.75, -0.3),
                child: Theme(
                  data: ThemeData(
                    checkboxTheme: CheckboxThemeData(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                    ),
                    unselectedWidgetColor: FlutterFlowTheme.of(context).accent2,
                  ),
                  child: Checkbox(
                    value: _model.checkboxValue ??= false,
                    onChanged: (newValue) async {
                      setState(() => _model.checkboxValue = newValue!);
                    },
                    activeColor: FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (_model.checkboxValue!) {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateProperty3CopyWidget(),
                        ),
                      );
                    } else {
                      await Future.delayed(const Duration(milliseconds: 1000));
                    }
                  },
                  text: 'Confermo',
                  options: FFButtonOptions(
                    width: 130.0,
                    height: 40.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
    );
  }
}
