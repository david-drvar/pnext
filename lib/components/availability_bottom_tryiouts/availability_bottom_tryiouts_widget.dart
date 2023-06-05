import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'availability_bottom_tryiouts_model.dart';
export 'availability_bottom_tryiouts_model.dart';

class AvailabilityBottomTryioutsWidget extends StatefulWidget {
  const AvailabilityBottomTryioutsWidget({Key? key}) : super(key: key);

  @override
  _AvailabilityBottomTryioutsWidgetState createState() =>
      _AvailabilityBottomTryioutsWidgetState();
}

class _AvailabilityBottomTryioutsWidgetState
    extends State<AvailabilityBottomTryioutsWidget> {
  late AvailabilityBottomTryioutsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AvailabilityBottomTryioutsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 400.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(0.0, -3.0),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: FlutterFlowDropDown<String>(
        controller: _model.dropDownValueController ??=
            FormFieldController<String>(
          _model.dropDownValue ??= FFLocalizations.of(context).getText(
            'z4wpkfdf' /* Credit card */,
          ),
        ),
        options: [
          FFLocalizations.of(context).getText(
            '8osbwkxn' /* Credit card */,
          ),
          FFLocalizations.of(context).getText(
            '5w2ri3zo' /* Debit card */,
          ),
          FFLocalizations.of(context).getText(
            'yovxrsuo' /* PayPal */,
          )
        ],
        onChanged: (val) => setState(() => _model.dropDownValue = val),
        width: 180.0,
        height: 50.0,
        searchHintTextStyle: FlutterFlowTheme.of(context).bodyLarge.override(
              fontFamily: 'Poppins',
              color: FlutterFlowTheme.of(context).secondaryText,
            ),
        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.normal,
            ),
        hintText: FFLocalizations.of(context).getText(
          'dqkj2puj' /* Please selectaa... */,
        ),
        searchHintText: FFLocalizations.of(context).getText(
          '7usthmtg' /* Search for an item... */,
        ),
        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
        elevation: 2.0,
        borderColor: Colors.transparent,
        borderWidth: 0.0,
        borderRadius: 0.0,
        margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
        hidesUnderline: true,
        isSearchable: false,
      ),
    );
  }
}
