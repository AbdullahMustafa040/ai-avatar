import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profiles_component_model.dart';
export 'profiles_component_model.dart';

class ProfilesComponentWidget extends StatefulWidget {
  const ProfilesComponentWidget({Key? key}) : super(key: key);

  @override
  _ProfilesComponentWidgetState createState() =>
      _ProfilesComponentWidgetState();
}

class _ProfilesComponentWidgetState extends State<ProfilesComponentWidget> {
  late ProfilesComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilesComponentModel());
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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 200.0,
            height: 56.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    'Choose a profile',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      'Outfit',
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: StreamBuilder<List<ProfileRecord>>(
              stream: queryProfileRecord(
                queryBuilder: (profileRecord) => profileRecord.where('user_id',
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
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  );
                }
                List<ProfileRecord> columnProfileRecordList = snapshot.data!;
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(columnProfileRecordList.length,
                        (columnIndex) {
                      final columnProfileRecord =
                          columnProfileRecordList[columnIndex];
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          setState(() {
                            FFAppState().profiledpc =
                                columnProfileRecord.reference;
                          });

                          context.pushNamed('home');
                        },
                        child: Material(
                          color: Colors.transparent,
                          elevation: 1.0,
                          child: Container(
                            height: 56.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              border: Border.all(
                                width: 0.5,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 8.0, 0.0),
                                          child: Container(
                                            width: 32.0,
                                            height: 32.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              columnProfileRecord.photoUrl!,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        columnProfileRecord.displayName!,
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.getFont(
                                          'Nunito',
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (columnProfileRecord.reference ==
                                    FFAppState().profiledpc)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 25.5, 0.0),
                                    child: Image.asset(
                                      'assets/images/Vector_(1).png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                              ],
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
          Material(
            color: Colors.transparent,
            elevation: 1.0,
            child: Container(
              width: double.infinity,
              height: 56.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                border: Border.all(
                  width: 0.5,
                ),
              ),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed('UploadImageGuidelines');
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'Create a new model ',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont(
                          'Nunito',
                          color: Color(0xFF212121),
                          fontWeight: FontWeight.w600,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 15.0,
                          borderWidth: 1.0,
                          buttonSize: 30.0,
                          fillColor: Color(0xFFFFD800),
                          icon: Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 15.0,
                          ),
                          onPressed: () async {
                            context.pushNamed('UploadImageGuidelines');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            elevation: 1.0,
            child: Container(
              width: double.infinity,
              height: 56.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                border: Border.all(
                  width: 0.5,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 18.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          GoRouter.of(context).prepareAuthEvent();
                          await authManager.signOut();
                          GoRouter.of(context).clearRedirectLocation();

                          context.goNamedAuth('Values', mounted);
                        },
                        child: Text(
                          'Log out',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.getFont(
                            'Nunito',
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            elevation: 1.0,
            child: Container(
              width: double.infinity,
              height: 56.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                border: Border.all(
                  width: 0.5,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 18.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('DeleteAccount');
                        },
                        child: Text(
                          'Delete account',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.getFont(
                            'Nunito',
                            color: Color(0xFFC70000),
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
