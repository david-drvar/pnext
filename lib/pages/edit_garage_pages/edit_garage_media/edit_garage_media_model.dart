import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/upload_garage_photo/upload_garage_photo_widget.dart';
import '/components/upload_garage_video/upload_garage_video_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditGarageMediaModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<String> photoList = [];
  void addToPhotoList(String item) => photoList.add(item);
  void removeFromPhotoList(String item) => photoList.remove(item);
  void removeAtIndexFromPhotoList(int index) => photoList.removeAt(index);

  List<String> videoList = [];
  void addToVideoList(String item) => videoList.add(item);
  void removeFromVideoList(String item) => videoList.remove(item);
  void removeAtIndexFromVideoList(int index) => videoList.removeAt(index);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Bottom Sheet - uploadGaragePhoto] action in Button widget.
  String? bottomSheetOutput;
  // Stores action output result for [Bottom Sheet - uploadGarageVideo] action in Button widget.
  String? videoBottomSheetOutput;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
