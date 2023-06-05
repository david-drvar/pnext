import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'all_chats_page_tabbar_model.dart';
export 'all_chats_page_tabbar_model.dart';

class AllChatsPageTabbarWidget extends StatefulWidget {
  const AllChatsPageTabbarWidget({Key? key}) : super(key: key);

  @override
  _AllChatsPageTabbarWidgetState createState() =>
      _AllChatsPageTabbarWidgetState();
}

class _AllChatsPageTabbarWidgetState extends State<AllChatsPageTabbarWidget> {
  late AllChatsPageTabbarModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllChatsPageTabbarModel());

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          FFLocalizations.of(context).getText(
            '39k37dc8' /* Tutte le Chats */,
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Urbanist',
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4.0,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: DefaultTabController(
                length: 2,
                initialIndex: 0,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment(0.0, 0),
                      child: TabBar(
                        labelColor: FlutterFlowTheme.of(context).primaryText,
                        unselectedLabelColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        labelStyle: FlutterFlowTheme.of(context).titleMedium,
                        indicatorColor: FlutterFlowTheme.of(context).primary,
                        tabs: [
                          Tab(
                            text: FFLocalizations.of(context).getText(
                              '33r9r9p5' /* Come noleggiatore */,
                            ),
                          ),
                          Tab(
                            text: FFLocalizations.of(context).getText(
                              '6psl93mg' /* Come proprietario */,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 2.0, 0.0, 0.0),
                            child: StreamBuilder<List<ChatsRecord>>(
                              stream: queryChatsRecord(
                                queryBuilder: (chatsRecord) =>
                                    chatsRecord.where('user_b',
                                        isEqualTo: currentUserReference),
                              ),
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
                                List<ChatsRecord> listViewChatsRecordList =
                                    snapshot.data!;
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewChatsRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewChatsRecord =
                                        listViewChatsRecordList[listViewIndex];
                                    return StreamBuilder<FFChatInfo>(
                                      stream: FFChatManager.instance
                                          .getChatInfo(
                                              chatRecord: listViewChatsRecord),
                                      builder: (context, snapshot) {
                                        final chatInfo = snapshot.data ??
                                            FFChatInfo(listViewChatsRecord);
                                        return FFChatPreview(
                                          onTap: () => context.pushNamed(
                                            'ChatPage',
                                            queryParameters: {
                                              'chatUser': serializeParam(
                                                chatInfo.otherUsers.length == 1
                                                    ? chatInfo
                                                        .otherUsersList.first
                                                    : null,
                                                ParamType.Document,
                                              ),
                                              'chatRef': serializeParam(
                                                chatInfo.chatRecord.reference,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'chatUser':
                                                  chatInfo.otherUsers.length ==
                                                          1
                                                      ? chatInfo
                                                          .otherUsersList.first
                                                      : null,
                                            },
                                          ),
                                          lastChatText:
                                              chatInfo.chatPreviewMessage(),
                                          lastChatTime: listViewChatsRecord
                                              .lastMessageTime,
                                          seen: listViewChatsRecord
                                              .lastMessageSeenBy!
                                              .contains(currentUserReference),
                                          title: chatInfo.chatPreviewTitle(),
                                          userProfilePic:
                                              chatInfo.chatPreviewPic(),
                                          color: Color(0xFFEEF0F5),
                                          unreadColor: Colors.blue,
                                          titleTextStyle: GoogleFonts.getFont(
                                            'DM Sans',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.0,
                                          ),
                                          dateTextStyle: GoogleFonts.getFont(
                                            'DM Sans',
                                            color: Color(0x73000000),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14.0,
                                          ),
                                          previewTextStyle: GoogleFonts.getFont(
                                            'DM Sans',
                                            color: Color(0x73000000),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14.0,
                                          ),
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  3.0, 3.0, 3.0, 3.0),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 2.0, 0.0, 0.0),
                            child: StreamBuilder<List<ChatsRecord>>(
                              stream: queryChatsRecord(
                                queryBuilder: (chatsRecord) =>
                                    chatsRecord.where('user_a',
                                        isEqualTo: currentUserReference),
                              ),
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
                                List<ChatsRecord> listViewChatsRecordList =
                                    snapshot.data!;
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewChatsRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewChatsRecord =
                                        listViewChatsRecordList[listViewIndex];
                                    return StreamBuilder<FFChatInfo>(
                                      stream: FFChatManager.instance
                                          .getChatInfo(
                                              chatRecord: listViewChatsRecord),
                                      builder: (context, snapshot) {
                                        final chatInfo = snapshot.data ??
                                            FFChatInfo(listViewChatsRecord);
                                        return FFChatPreview(
                                          onTap: () => context.pushNamed(
                                            'ChatPage',
                                            queryParameters: {
                                              'chatUser': serializeParam(
                                                chatInfo.otherUsers.length == 1
                                                    ? chatInfo
                                                        .otherUsersList.first
                                                    : null,
                                                ParamType.Document,
                                              ),
                                              'chatRef': serializeParam(
                                                chatInfo.chatRecord.reference,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'chatUser':
                                                  chatInfo.otherUsers.length ==
                                                          1
                                                      ? chatInfo
                                                          .otherUsersList.first
                                                      : null,
                                            },
                                          ),
                                          lastChatText:
                                              chatInfo.chatPreviewMessage(),
                                          lastChatTime: listViewChatsRecord
                                              .lastMessageTime,
                                          seen: listViewChatsRecord
                                              .lastMessageSeenBy!
                                              .contains(currentUserReference),
                                          title: chatInfo.chatPreviewTitle(),
                                          userProfilePic:
                                              chatInfo.chatPreviewPic(),
                                          color: Color(0xFFEEF0F5),
                                          unreadColor: Colors.blue,
                                          titleTextStyle: GoogleFonts.getFont(
                                            'DM Sans',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.0,
                                          ),
                                          dateTextStyle: GoogleFonts.getFont(
                                            'DM Sans',
                                            color: Color(0x73000000),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14.0,
                                          ),
                                          previewTextStyle: GoogleFonts.getFont(
                                            'DM Sans',
                                            color: Color(0x73000000),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14.0,
                                          ),
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  3.0, 3.0, 3.0, 3.0),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
