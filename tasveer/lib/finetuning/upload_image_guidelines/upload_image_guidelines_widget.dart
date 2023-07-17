import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'upload_image_guidelines_model.dart';
export 'upload_image_guidelines_model.dart';

class UploadImageGuidelinesWidget extends StatefulWidget {
  const UploadImageGuidelinesWidget({Key? key}) : super(key: key);

  @override
  _UploadImageGuidelinesWidgetState createState() =>
      _UploadImageGuidelinesWidgetState();
}

class _UploadImageGuidelinesWidgetState
    extends State<UploadImageGuidelinesWidget> {
  late UploadImageGuidelinesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UploadImageGuidelinesModel());
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
            'Image Guidelines',
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 0.0, 0.0),
                  child: Text(
                    'Upload your images ',
                    style: GoogleFonts.getFont(
                      'Outfit',
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 8.0, 0.0),
                  child: Text(
                    'Upload 15 of your solo pictures below. We have listed sample images along with their guidelines. Tap on each image to view further instructions.\n\nClear and high quality images with different backgrounds, angles, pose, and clothing outfits result in high quality avatars. ',
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Nunito',
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 0.0, 8.0),
                  child: Text(
                    'Portrait (5-6)',
                    style: GoogleFonts.getFont(
                      'Outfit',
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                  child: StreamBuilder<List<GuidelinesRecord>>(
                    stream: queryGuidelinesRecord(
                      queryBuilder: (guidelinesRecord) => guidelinesRecord
                          .where('category', isEqualTo: 'Face angles'),
                    ),
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
                      List<GuidelinesRecord> rowGuidelinesRecordList =
                          snapshot.data!;
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                              rowGuidelinesRecordList.length, (rowIndex) {
                            final rowGuidelinesRecord =
                                rowGuidelinesRecordList[rowIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 8.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF121212),
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'Instructions',
                                      queryParams: {
                                        'guideDoc': serializeParam(
                                          rowGuidelinesRecord,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'guideDoc': rowGuidelinesRecord,
                                      },
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: CachedNetworkImage(
                                      imageUrl: rowGuidelinesRecord.image!,
                                      width: 64.0,
                                      height: 64.0,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 0.0, 8.0),
                  child: Text(
                    'Looking at the camera (4-5)',
                    style: GoogleFonts.getFont(
                      'Outfit',
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                  child: StreamBuilder<List<GuidelinesRecord>>(
                    stream: queryGuidelinesRecord(
                      queryBuilder: (guidelinesRecord) => guidelinesRecord
                          .where('category', isEqualTo: 'Smiling'),
                    ),
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
                      List<GuidelinesRecord> rowGuidelinesRecordList =
                          snapshot.data!;
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(
                              rowGuidelinesRecordList.length, (rowIndex) {
                            final rowGuidelinesRecord =
                                rowGuidelinesRecordList[rowIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 8.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF121212),
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'Instructions',
                                      queryParams: {
                                        'guideDoc': serializeParam(
                                          rowGuidelinesRecord,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'guideDoc': rowGuidelinesRecord,
                                      },
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: CachedNetworkImage(
                                      imageUrl: rowGuidelinesRecord.image!,
                                      width: 64.0,
                                      height: 64.0,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 0.0, 8.0),
                  child: Text(
                    'Side pose (5)',
                    style: GoogleFonts.getFont(
                      'Outfit',
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                  child: StreamBuilder<List<GuidelinesRecord>>(
                    stream: queryGuidelinesRecord(
                      queryBuilder: (guidelinesRecord) => guidelinesRecord
                          .where('category', isEqualTo: 'Above waist high'),
                    ),
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
                      List<GuidelinesRecord> rowGuidelinesRecordList =
                          snapshot.data!;
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                              rowGuidelinesRecordList.length, (rowIndex) {
                            final rowGuidelinesRecord =
                                rowGuidelinesRecordList[rowIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 8.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF121212),
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'Instructions',
                                      queryParams: {
                                        'guideDoc': serializeParam(
                                          rowGuidelinesRecord,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'guideDoc': rowGuidelinesRecord,
                                      },
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: CachedNetworkImage(
                                      imageUrl: rowGuidelinesRecord.image!,
                                      width: 64.0,
                                      height: 64.0,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      );
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 64.0, 16.0, 75.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        final selectedMedia = await selectMedia(
                          imageQuality: 100,
                          mediaSource: MediaSource.photoGallery,
                          multiImage: true,
                        );
                        if (selectedMedia != null &&
                            selectedMedia.every((m) =>
                                validateFileFormat(m.storagePath, context))) {
                          setState(() => _model.isDataUploading = true);
                          var selectedUploadedFiles = <FFUploadedFile>[];
                          var downloadUrls = <String>[];
                          try {
                            selectedUploadedFiles = selectedMedia
                                .map((m) => FFUploadedFile(
                                      name: m.storagePath.split('/').last,
                                      bytes: m.bytes,
                                      height: m.dimensions?.height,
                                      width: m.dimensions?.width,
                                      blurHash: m.blurHash,
                                    ))
                                .toList();

                            downloadUrls = (await Future.wait(
                              selectedMedia.map(
                                (m) async =>
                                    await uploadData(m.storagePath, m.bytes),
                              ),
                            ))
                                .where((u) => u != null)
                                .map((u) => u!)
                                .toList();
                          } finally {
                            _model.isDataUploading = false;
                          }
                          if (selectedUploadedFiles.length ==
                                  selectedMedia.length &&
                              downloadUrls.length == selectedMedia.length) {
                            setState(() {
                              _model.uploadedLocalFiles = selectedUploadedFiles;
                              _model.uploadedFileUrls = downloadUrls;
                            });
                          } else {
                            setState(() {});
                            return;
                          }
                        }

                        context.pushNamed(
                          'UploadingImages',
                          queryParams: {
                            'images': serializeParam(
                              _model.uploadedFileUrls,
                              ParamType.String,
                              true,
                            ),
                          }.withoutNulls,
                        );
                      },
                      text: 'Upload from gallery',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 48.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: GoogleFonts.getFont(
                          'Rubik',
                          color: Colors.black,
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
          ),
        ),
      ),
    );
  }
}
