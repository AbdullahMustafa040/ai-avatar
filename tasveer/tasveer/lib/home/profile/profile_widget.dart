import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/profiles_component/profiles_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'profile_model.dart';
export 'profile_model.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late ProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((currentUserDocument?.profileId?.toList() ?? []).length == 0) {
        setState(() {
          FFAppState().deleteProfiledpc();
          FFAppState().profiledpc = null;
        });
      } else {
        if (FFAppState().profiledpc != null) {
          if ((currentUserDocument?.profileId?.toList() ?? [])
                  .contains(FFAppState().profiledpc) !=
              true) {
            setState(() {
              FFAppState().profiledpc =
                  (currentUserDocument?.profileId?.toList() ?? []).first;
            });
          }
        } else {
          setState(() {
            FFAppState().profiledpc =
                (currentUserDocument?.profileId?.toList() ?? []).first;
          });
        }
      }
    });
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
        backgroundColor: Colors.black,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            await launchURL('https://wa.me/923060678635');
          },
          backgroundColor: FlutterFlowTheme.of(context).tertiary,
          icon: FaIcon(
            FontAwesomeIcons.whatsapp,
            color: FlutterFlowTheme.of(context).success,
            size: 20.0,
          ),
          label: Text(
            'Help',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 10.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if ((currentUserDocument?.profileId?.toList() ?? []).length !=
                    0)
                  AuthUserStreamWidget(
                    builder: (context) => StreamBuilder<ProfileRecord>(
                      stream:
                          ProfileRecord.getDocument(FFAppState().profiledpc!),
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
                        final rowProfileRecord = snapshot.data!;
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  18.0, 0.0, 0.0, 0.0),
                              child: Container(
                                height: 64.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                ),
                                child: StreamBuilder<ProfileRecord>(
                                  stream: ProfileRecord.getDocument(
                                      FFAppState().profiledpc!),
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
                                    final rowProfileRecord = snapshot.data!;
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 40.0,
                                          height: 40.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/image_(3)_1.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 11.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              rowProfileRecord.noOfAvatar
                                                  ?.toString(),
                                              '0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito',
                                                  color: Colors.white,
                                                  fontSize: 12.0,
                                                ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (FFAppState().profiledpc !=
                                                null) {
                                              if (rowProfileRecord
                                                  .profileCompleted!) {
                                                context
                                                    .pushNamed('AvatarBundle');
                                              } else {
                                                context
                                                    .pushNamed('ModelBundles');
                                              }
                                            }
                                          },
                                          child: Icon(
                                            Icons.add_box,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 18.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Color(0x45FFFFFF),
                                      context: context,
                                      builder: (bottomSheetContext) {
                                        return GestureDetector(
                                          onTap: () => FocusScope.of(context)
                                              .requestFocus(_unfocusNode),
                                          child: Padding(
                                            padding: MediaQuery.of(
                                                    bottomSheetContext)
                                                .viewInsets,
                                            child: ProfilesComponentWidget(),
                                          ),
                                        );
                                      },
                                    ).then((value) => setState(() {}));
                                  },
                                  child: Container(
                                    width: 40.0,
                                    height: 40.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl: rowProfileRecord.photoUrl!,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                if ((currentUserDocument?.profileId?.toList() ?? []).length ==
                    0)
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 48.0),
                      child: AuthUserStreamWidget(
                        builder: (context) => Container(
                          width: 384.4,
                          height: 85.0,
                          decoration: BoxDecoration(
                            color: Colors.black,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 24.0, 0.0, 0.0),
                                child: Text(
                                  'Welcome to Avatize 👋',
                                  style: GoogleFonts.getFont(
                                    'Outfit',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 8.0, 0.0, 0.0),
                                child: Text(
                                  'Transform yourself into your favorite local Avatars.  ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Nunito',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                if (FFAppState().profiledpc != null)
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 24.0, 0.0, 16.0),
                              child: Text(
                                'My Avatars 🧙‍♂️',
                                style: FlutterFlowTheme.of(context).titleLarge,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: PagedListView<DocumentSnapshot<Object?>?,
                                  ImageGenerationRecord>(
                                pagingController: () {
                                  final Query<Object?> Function(Query<Object?>)
                                      queryBuilder = (imageGenerationRecord) =>
                                          imageGenerationRecord;
                                  if (_model.pagingController != null) {
                                    final query = queryBuilder(
                                        ImageGenerationRecord.collection());
                                    if (query != _model.pagingQuery) {
                                      // The query has changed
                                      _model.pagingQuery = query;
                                      _model.streamSubscriptions
                                          .forEach((s) => s?.cancel());
                                      _model.streamSubscriptions.clear();
                                      _model.pagingController!.refresh();
                                    }
                                    return _model.pagingController!;
                                  }

                                  _model.pagingController =
                                      PagingController(firstPageKey: null);
                                  _model.pagingQuery = queryBuilder(
                                      ImageGenerationRecord.collection());
                                  _model.pagingController!
                                      .addPageRequestListener((nextPageMarker) {
                                    queryImageGenerationRecordPage(
                                      parent: FFAppState().profiledpc,
                                      queryBuilder: (imageGenerationRecord) =>
                                          imageGenerationRecord,
                                      nextPageMarker: nextPageMarker,
                                      pageSize: 25,
                                      isStream: true,
                                    ).then((page) {
                                      _model.pagingController!.appendPage(
                                        page.data,
                                        page.nextPageMarker,
                                      );
                                      final streamSubscription =
                                          page.dataStream?.listen((data) {
                                        data.forEach((item) {
                                          final itemIndexes = _model
                                              .pagingController!.itemList!
                                              .asMap()
                                              .map((k, v) =>
                                                  MapEntry(v.reference.id, k));
                                          final index =
                                              itemIndexes[item.reference.id];
                                          final items = _model
                                              .pagingController!.itemList!;
                                          if (index != null) {
                                            items.replaceRange(
                                                index, index + 1, [item]);
                                            _model.pagingController!.itemList =
                                                {
                                              for (var item in items)
                                                item.reference: item
                                            }.values.toList();
                                          }
                                        });
                                        setState(() {});
                                      });
                                      _model.streamSubscriptions
                                          .add(streamSubscription);
                                    });
                                  });
                                  return _model.pagingController!;
                                }(),
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                reverse: false,
                                scrollDirection: Axis.vertical,
                                builderDelegate: PagedChildBuilderDelegate<
                                    ImageGenerationRecord>(
                                  // Customize what your widget looks like when it's loading the first page.
                                  firstPageProgressIndicatorBuilder: (_) =>
                                      Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                  ),

                                  itemBuilder: (context, _, listViewIndex) {
                                    final listViewImageGenerationRecord = _model
                                        .pagingController!
                                        .itemList![listViewIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 10.0),
                                      child: StreamBuilder<PromptRecord>(
                                        stream: PromptRecord.getDocument(
                                            listViewImageGenerationRecord
                                                .promptId!),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                              ),
                                            );
                                          }
                                          final containerPromptRecord =
                                              snapshot.data!;
                                          return Container(
                                            width: 328.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF212121),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (listViewImageGenerationRecord
                                                        .status ==
                                                    'Done') {
                                                  context.pushNamed(
                                                    'AvatarScreen',
                                                    queryParams: {
                                                      'imageGeneration':
                                                          serializeParam(
                                                        listViewImageGenerationRecord,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'imageGeneration':
                                                          listViewImageGenerationRecord,
                                                    },
                                                  );
                                                } else {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text('Status'),
                                                        content: Text(
                                                            'Avatar creation is in progress'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                }
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    child: Image.network(
                                                      containerPromptRecord
                                                          .mainImage!,
                                                      width: 100.0,
                                                      height: 100.0,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    17.0,
                                                                    0.0,
                                                                    8.0),
                                                        child: Text(
                                                          containerPromptRecord
                                                              .avatarName!,
                                                          style: GoogleFonts
                                                              .getFont(
                                                            'Outfit',
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 18.0,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          listViewImageGenerationRecord
                                                              .status!,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito',
                                                                fontSize: 12.0,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    8.0,
                                                                    0.0,
                                                                    8.0),
                                                        child: Text(
                                                          listViewImageGenerationRecord
                                                              .createdAt!
                                                              .toString(),
                                                          style: GoogleFonts
                                                              .getFont(
                                                            'Nunito',
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 10.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (FFAppState().profiledpc == null)
                  Container(
                    width: 358.0,
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Hey there! ',
                                    style: GoogleFonts.getFont(
                                      'Outfit',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Ready to create some kickass avatars?',
                                    style: GoogleFonts.getFont(
                                      'Outfit',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Image.asset(
                            'assets/images/vxc1wloqkruhz6vc5qrocu7e6bm6-removebg-preview_1.png',
                            width: 358.0,
                            height: 358.0,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
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
