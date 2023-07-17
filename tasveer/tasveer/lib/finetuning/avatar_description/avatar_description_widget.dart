import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'avatar_description_model.dart';
export 'avatar_description_model.dart';

class AvatarDescriptionWidget extends StatefulWidget {
  const AvatarDescriptionWidget({
    Key? key,
    this.promptDoc,
  }) : super(key: key);

  final PromptRecord? promptDoc;

  @override
  _AvatarDescriptionWidgetState createState() =>
      _AvatarDescriptionWidgetState();
}

class _AvatarDescriptionWidgetState extends State<AvatarDescriptionWidget> {
  late AvatarDescriptionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AvatarDescriptionModel());
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
        appBar: AppBar(
          backgroundColor: Color(0xFF121212),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Avatar Details',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Rubik',
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          child: StreamBuilder<PromptRecord>(
            stream: PromptRecord.getDocument(FFAppState().promptdoc!),
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
              final columnPromptRecord = snapshot.data!;
              return Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 1.0,
                          height: 250.0,
                          decoration: BoxDecoration(
                            color: Colors.black,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                widget.promptDoc!.avatarPosterPhoto!,
                                width: 360.0,
                                height: 250.0,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 0.0, 0.0),
                    child: Text(
                      widget.promptDoc!.avatarName!,
                      style: FlutterFlowTheme.of(context).headlineSmall,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                    child: Text(
                      widget.promptDoc!.paragraph!,
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                  if (FFAppState().profiledpc != null)
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          StreamBuilder<ProfileRecord>(
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                );
                              }
                              final columnProfileRecord = snapshot.data!;
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  StreamBuilder<List<AvatarsRecord>>(
                                    stream: queryAvatarsRecord(
                                      parent: FFAppState().profiledpc,
                                      singleRecord: true,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                          ),
                                        );
                                      }
                                      List<AvatarsRecord>
                                          columnAvatarsRecordList =
                                          snapshot.data!;
                                      // Return an empty Container when the item does not exist.
                                      if (snapshot.data!.isEmpty) {
                                        return Container();
                                      }
                                      final columnAvatarsRecord =
                                          columnAvatarsRecordList.isNotEmpty
                                              ? columnAvatarsRecordList.first
                                              : null;
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (columnProfileRecord
                                                  .profileCompleted ??
                                              true)
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 75.0, 16.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    setState(() {
                                                      FFAppState().promptdoc =
                                                          widget.promptDoc!
                                                              .reference;
                                                    });
                                                    if (columnProfileRecord
                                                        .profileCompleted!) {
                                                      if (columnPromptRecord
                                                              .gender ==
                                                          columnProfileRecord
                                                              .gender) {
                                                        if (columnProfileRecord
                                                                .noOfAvatar! >
                                                            0) {
                                                          _model.promptCreateResult =
                                                              await CreaatePromptCall
                                                                  .call(
                                                            tuneId:
                                                                columnAvatarsRecord!
                                                                    .tuneId
                                                                    ?.toString(),
                                                            text: columnPromptRecord
                                                                .positivePrompt,
                                                            faceCorrect:
                                                                columnPromptRecord
                                                                    .faceCorrection,
                                                            controlNetImageUrl:
                                                                columnPromptRecord
                                                                    .controlnetInputImage,
                                                            negativePrompt:
                                                                columnPromptRecord
                                                                    .negativePrompt,
                                                            controlnetHint:
                                                                columnPromptRecord
                                                                    .controlnetHint,
                                                            seed:
                                                                columnPromptRecord
                                                                    .seed
                                                                    ?.toDouble(),
                                                            cfgScale:
                                                                columnPromptRecord
                                                                    .cfg,
                                                            steps:
                                                                columnPromptRecord
                                                                    .steps,
                                                          );

                                                          final imageGenerationCreateData =
                                                              createImageGenerationRecordData(
                                                            createdAt:
                                                                getCurrentTimestamp,
                                                            modifiedAt:
                                                                getCurrentTimestamp,
                                                            status:
                                                                'In Progress',
                                                            promptId:
                                                                FFAppState()
                                                                    .promptdoc,
                                                            tuneId:
                                                                getJsonField(
                                                              (_model.promptCreateResult
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.tune_id''',
                                                            ),
                                                            astriaPromptId:
                                                                getJsonField(
                                                              (_model.promptCreateResult
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.id''',
                                                            ),
                                                          );
                                                          await ImageGenerationRecord
                                                                  .createDoc(
                                                                      FFAppState()
                                                                          .profiledpc!)
                                                              .set(
                                                                  imageGenerationCreateData);

                                                          final profileUpdateData =
                                                              createProfileRecordData(
                                                            noOfAvatar:
                                                                columnProfileRecord
                                                                        .noOfAvatar! -
                                                                    1,
                                                          );
                                                          await FFAppState()
                                                              .profiledpc!
                                                              .update(
                                                                  profileUpdateData);

                                                          context.pushNamed(
                                                              'MyAvatars');
                                                        } else {
                                                          context.pushNamed(
                                                              'AvatarBundle');
                                                        }
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Gender'),
                                                              content: Text(
                                                                  'Choose an avatar of the same gender'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      }
                                                    } else {
                                                      context.pushNamed(
                                                          'ModelBundles');
                                                    }

                                                    setState(() {});
                                                  },
                                                  text: 'Create Avatar 🎭',
                                                  options: FFButtonOptions(
                                                    width: double.infinity,
                                                    height: 48.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    textStyle:
                                                        GoogleFonts.getFont(
                                                      'Rubik',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16.0,
                                                    ),
                                                    elevation: 2.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  if (FFAppState().profiledpc == null)
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 75.0, 16.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      setState(() {
                                        FFAppState().promptdoc =
                                            widget.promptDoc!.reference;
                                      });

                                      context
                                          .pushNamed('UploadImageGuidelines');
                                    },
                                    text: 'Create Avatar 🎭',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 48.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: GoogleFonts.getFont(
                                        'Rubik',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.0,
                                      ),
                                      elevation: 2.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  if (FFAppState().profiledpc != null)
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: StreamBuilder<ProfileRecord>(
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
                          final columnProfileRecord = snapshot.data!;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (columnProfileRecord.profileCompleted ==
                                      false)
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 75.0, 16.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            setState(() {
                                              FFAppState().promptdoc =
                                                  widget.promptDoc!.reference;
                                            });

                                            context.pushNamed('ModelBundles');
                                          },
                                          text: 'Create Avatar 🎭',
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 48.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle: GoogleFonts.getFont(
                                              'Rubik',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.0,
                                            ),
                                            elevation: 2.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          );
                        },
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
