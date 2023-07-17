import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'uploading_images_model.dart';
export 'uploading_images_model.dart';

class UploadingImagesWidget extends StatefulWidget {
  const UploadingImagesWidget({
    Key? key,
    this.images,
  }) : super(key: key);

  final List<String>? images;

  @override
  _UploadingImagesWidgetState createState() => _UploadingImagesWidgetState();
}

class _UploadingImagesWidgetState extends State<UploadingImagesWidget> {
  late UploadingImagesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UploadingImagesModel());
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
            'Uploading Images',
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 0.0),
                child: Text(
                  'Note: The quality of your avatars depend on the images your upload. Images should be clear, non-blurry, and captured from a variety of angles.',
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Nunito',
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 300.0,
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final uploadedImaged = widget.images?.toList() ?? [];
                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 1.0,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount: uploadedImaged.length,
                            itemBuilder: (context, uploadedImagedIndex) {
                              final uploadedImagedItem =
                                  uploadedImaged[uploadedImagedIndex];
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 11.0, 0.0),
                                    child: Container(
                                      width: 74.0,
                                      height: 74.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: CachedNetworkImage(
                                          imageUrl: uploadedImagedItem,
                                          width: 74.0,
                                          height: 74.0,
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
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: Text(
                    'Upload all 15 images before moving to the next step.',
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Nunito',
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 120.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (widget.images!.length < 15) {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Need Atleast 15 images'),
                              content: Text('Need Atleast 15 images'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );

                        context.pushNamed('UploadImageGuidelines');
                      } else {
                        context.pushNamed(
                          'CreateUserProfile',
                          queryParams: {
                            'uploadedimages': serializeParam(
                              widget.images,
                              ParamType.String,
                              true,
                            ),
                          }.withoutNulls,
                        );
                      }
                    },
                    text: 'Continue',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 48.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Rubik',
                                color: FlutterFlowTheme.of(context).tertiary,
                              ),
                      elevation: 2.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
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
