import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'model_bundles_model.dart';
export 'model_bundles_model.dart';

class ModelBundlesWidget extends StatefulWidget {
  const ModelBundlesWidget({Key? key}) : super(key: key);

  @override
  _ModelBundlesWidgetState createState() => _ModelBundlesWidgetState();
}

class _ModelBundlesWidgetState extends State<ModelBundlesWidget> {
  late ModelBundlesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModelBundlesModel());
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
            buttonSize: 30.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 15.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Membership Bundles',
            style: GoogleFonts.getFont(
              'Rubik',
              color: Colors.white,
              fontSize: 16.0,
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
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 0.0, 0.0),
                child: Text(
                  'Become a member 🎁',
                  style: GoogleFonts.getFont(
                    'Outfit',
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                child: Text(
                  'We have made creating amazing AI avatars as affordable as possible. Please choose one of the plans below.',
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Nunito',
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                ),
              ),
              Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                    ),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 12.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 32.0, 16.0, 16.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          _model.choos = 0;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: _model.choos == 0
                                              ? _model.selectedcard
                                              : _model.unSelectedCard,
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 28.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Starter plan',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Rubik',
                                                          color: _model.choos ==
                                                                  0
                                                              ? _model
                                                                  .selectedHeading
                                                              : _model
                                                                  .unSelectedHeading,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    10.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Rs. 1200  ',
                                                          style: GoogleFonts
                                                              .getFont(
                                                            'Rubik',
                                                            color: _model
                                                                        .choos ==
                                                                    0
                                                                ? _model
                                                                    .selectedHeading
                                                                : _model
                                                                    .unSelectedHeading,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 8.0,
                                                                0.0, 24.0),
                                                    child: Text(
                                                      '1 human model, 5 Avatars and 20 images',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Nunito',
                                                        color: _model.choos == 0
                                                            ? _model
                                                                .selectedSubHeading
                                                            : _model
                                                                .unselectedSubHeading,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12.0,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 16.0, 16.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          _model.choos = 1;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: _model.choos == 1
                                              ? _model.selectedcard
                                              : _model.unSelectedCard,
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 28.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: Text(
                                                        'Fan club',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Rubik',
                                                          color: _model.choos ==
                                                                  1
                                                              ? _model
                                                                  .selectedHeading
                                                              : _model
                                                                  .unSelectedHeading,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16.0,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Save Rs.400',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Rubik',
                                                                  color: _model
                                                                              .choos ==
                                                                          1
                                                                      ? _model
                                                                          .selectedDiscount
                                                                      : _model
                                                                          .unSelectedDiscount,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Rs. 2000 ',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Rubik',
                                                                  color: _model
                                                                              .choos ==
                                                                          1
                                                                      ? _model
                                                                          .selectedHeading
                                                                      : _model
                                                                          .unSelectedHeading,
                                                                ),
                                                      ),
                                                    ),
                                                    Text(
                                                      'Rs. 2400',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily: 'Rubik',
                                                            color: Color(
                                                                0xFFD80000),
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 9.0,
                                                                0.0, 24.0),
                                                    child: Text(
                                                      '1 human model, 10 Avatars and 40 images',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Nunito',
                                                        color: _model.choos == 1
                                                            ? _model
                                                                .selectedSubHeading
                                                            : _model
                                                                .unselectedSubHeading,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12.0,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 16.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          _model.choos = 2;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: _model.choos == 2
                                              ? _model.selectedcard
                                              : _model.unSelectedCard,
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 28.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: Text(
                                                        'Loyalty club',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Rubik',
                                                          color: _model.choos ==
                                                                  2
                                                              ? _model
                                                                  .selectedHeading
                                                              : _model
                                                                  .unSelectedHeading,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16.0,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Save Rs.1000',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Rubik',
                                                                  color: _model
                                                                              .choos ==
                                                                          2
                                                                      ? _model
                                                                          .selectedDiscount
                                                                      : _model
                                                                          .unSelectedDiscount,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Rs. 3000 ',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Rubik',
                                                                  color: _model
                                                                              .choos ==
                                                                          2
                                                                      ? _model
                                                                          .selectedHeading
                                                                      : _model
                                                                          .unSelectedHeading,
                                                                ),
                                                      ),
                                                    ),
                                                    Text(
                                                      'Rs. 4000',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily: 'Rubik',
                                                            color: Color(
                                                                0xFFD80000),
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 9.0,
                                                                0.0, 24.0),
                                                    child: Text(
                                                      '1 human model, 20 Avatars and 80 images',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Nunito',
                                                        color: _model.choos == 2
                                                            ? _model
                                                                .selectedSubHeading
                                                            : _model
                                                                .unselectedSubHeading,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12.0,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 63.0, 16.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  final orderCreateData = createOrderRecordData(
                                    type: 'profile',
                                    noOfAvatar: () {
                                      if (_model.choos == 0) {
                                        return 5;
                                      } else if (_model.choos == 1) {
                                        return 10;
                                      } else if (_model.choos == 2) {
                                        return 20;
                                      } else {
                                        return 0;
                                      }
                                    }(),
                                    price: () {
                                      if (_model.choos == 0) {
                                        return 1200;
                                      } else if (_model.choos == 1) {
                                        return 2000;
                                      } else if (_model.choos == 2) {
                                        return 3000;
                                      } else {
                                        return 0;
                                      }
                                    }(),
                                    status: 'In Progress',
                                  );
                                  var orderRecordReference =
                                      OrderRecord.createDoc(
                                          FFAppState().profiledpc!);
                                  await orderRecordReference
                                      .set(orderCreateData);
                                  _model.ord = OrderRecord.getDocumentFromData(
                                      orderCreateData, orderRecordReference);

                                  context.pushNamed(
                                    'paymentOptionTune',
                                    queryParams: {
                                      'order': serializeParam(
                                        _model.ord!.reference,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                  );

                                  setState(() {});
                                },
                                text: 'Purchase',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 48.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: GoogleFonts.getFont(
                                    'Rubik',
                                    color: Color(0xFF121212),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0,
                                  ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
