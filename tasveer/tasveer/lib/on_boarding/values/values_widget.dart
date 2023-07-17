import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'values_model.dart';
export 'values_model.dart';

class ValuesWidget extends StatefulWidget {
  const ValuesWidget({Key? key}) : super(key: key);

  @override
  _ValuesWidgetState createState() => _ValuesWidgetState();
}

class _ValuesWidgetState extends State<ValuesWidget> {
  late ValuesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ValuesModel());
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
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.75,
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Image.asset(
                              'assets/images/Banner_(1).png',
                              width: double.infinity,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.99, 0.75),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  32.0, 0.0, 0.0, 0.0),
                              child: GradientText(
                                'Magic Avatars',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Colors.white,
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                colors: [
                                  FlutterFlowTheme.of(context).primary,
                                  Colors.white
                                ],
                                gradientDirection: GradientDirection.ltr,
                                gradientType: GradientType.linear,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.9),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  32.0, 8.0, 32.0, 0.0),
                              child: Text(
                                'Create realistic and personalized local avatars using our powerful AI technology ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(100.0, 16.0, 100.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed('GettingStarted');
                    },
                    text: 'Get Started',
                    icon: Icon(
                      FFIcons.kvector,
                      size: 15.0,
                    ),
                    options: FFButtonOptions(
                      width: 218.0,
                      height: 56.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Rubik',
                                color: Color(0xFF121212),
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(60.0),
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
