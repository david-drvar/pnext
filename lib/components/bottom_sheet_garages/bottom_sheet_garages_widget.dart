import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bottom_sheet_garages_model.dart';
export 'bottom_sheet_garages_model.dart';

class BottomSheetGaragesWidget extends StatefulWidget {
  const BottomSheetGaragesWidget({
    Key? key,
    this.garage,
  }) : super(key: key);

  final GaragesRecord? garage;

  @override
  _BottomSheetGaragesWidgetState createState() =>
      _BottomSheetGaragesWidgetState();
}

class _BottomSheetGaragesWidgetState extends State<BottomSheetGaragesWidget> {
  late BottomSheetGaragesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomSheetGaragesModel());
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
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 36.0),
      child: Container(
        width: double.infinity,
        height: 200.0,
        constraints: BoxConstraints(
          maxHeight: 200.0,
        ),
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
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                height: 16.0,
                thickness: 3.0,
                indent: 120.0,
                endIndent: 120.0,
                color: Color(0xFFD7DADD),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(140.0, 30.0, 0.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.garage!.city,
                    'Garage City',
                  ),
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(125.0, 40.0, 0.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.garage!.address,
                    'Garage Address',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
