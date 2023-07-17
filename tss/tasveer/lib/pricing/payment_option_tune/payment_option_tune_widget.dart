import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loader/loader_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'payment_option_tune_model.dart';
export 'payment_option_tune_model.dart';

class PaymentOptionTuneWidget extends StatefulWidget {
  const PaymentOptionTuneWidget({
    Key? key,
    this.order,
  }) : super(key: key);

  final DocumentReference? order;

  @override
  _PaymentOptionTuneWidgetState createState() =>
      _PaymentOptionTuneWidgetState();
}

class _PaymentOptionTuneWidgetState extends State<PaymentOptionTuneWidget> {
  late PaymentOptionTuneModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentOptionTuneModel());
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

    return StreamBuilder<OrderRecord>(
      stream: OrderRecord.getDocument(widget.order!),
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
        final paymentOptionTuneOrderRecord = snapshot.data!;
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
                'Payment Methods',
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
              child: StreamBuilder<ProfileRecord>(
                stream: ProfileRecord.getDocument(FFAppState().profiledpc!),
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
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 24.0, 16.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'How would you like to pay?',
                                    style:
                                        FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.08,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF212121),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            isDismissible: false,
                                            enableDrag: false,
                                            context: context,
                                            builder: (bottomSheetContext) {
                                              return GestureDetector(
                                                onTap: () => FocusScope.of(
                                                        context)
                                                    .requestFocus(_unfocusNode),
                                                child: Padding(
                                                  padding: MediaQuery.of(
                                                          bottomSheetContext)
                                                      .viewInsets,
                                                  child: Container(
                                                    height: double.infinity,
                                                    child: LoaderWidget(),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));

                                          _model.token = await actions
                                              .generatePaymobBearerToken();
                                          _model.apiResultyw64 =
                                              await PaymobCall.call(
                                            authToken: _model.token,
                                            amount: paymentOptionTuneOrderRecord
                                                    .discountedPrice! *
                                                100,
                                            orderId: widget.order?.id,
                                            profileId:
                                                FFAppState().profiledpc?.id,
                                            firstName:
                                                columnProfileRecord.displayName,
                                            lastName:
                                                columnProfileRecord.displayName,
                                            phone: currentPhoneNumber,
                                            email: currentUserEmail,
                                            type: 'CARD',
                                            transactionType:
                                                paymentOptionTuneOrderRecord
                                                    .type,
                                            noOfAvatar: columnProfileRecord
                                                    .noOfAvatar! +
                                                paymentOptionTuneOrderRecord
                                                    .noOfAvatar!,
                                          );
                                          Navigator.pop(context);
                                          if ((_model
                                                  .apiResultyw64?.succeeded ??
                                              true)) {
                                            context.pushNamed(
                                              'paymentTune',
                                              queryParams: {
                                                'url': serializeParam(
                                                  getJsonField(
                                                    (_model.apiResultyw64
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.url''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  (_model.apiResultyw64
                                                          ?.bodyText ??
                                                      ''),
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                          }

                                          setState(() {});
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 0.0, 0.0),
                                              child: Image.asset(
                                                'assets/images/card.png',
                                                width: 32.0,
                                                height: 32.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Debit/Credit Card',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Nunito',
                                                          color: Colors.white,
                                                          fontSize: 14.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.08,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF212121),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            isDismissible: false,
                                            enableDrag: false,
                                            context: context,
                                            builder: (bottomSheetContext) {
                                              return GestureDetector(
                                                onTap: () => FocusScope.of(
                                                        context)
                                                    .requestFocus(_unfocusNode),
                                                child: Padding(
                                                  padding: MediaQuery.of(
                                                          bottomSheetContext)
                                                      .viewInsets,
                                                  child: Container(
                                                    height: double.infinity,
                                                    child: LoaderWidget(),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));

                                          _model.jazzcashToken = await actions
                                              .generatePaymobBearerToken();
                                          _model.jaazcashPaymobResponse =
                                              await PaymobCall.call(
                                            authToken: _model.jazzcashToken,
                                            amount: paymentOptionTuneOrderRecord
                                                    .discountedPrice! *
                                                100,
                                            orderId: widget.order?.id,
                                            profileId:
                                                FFAppState().profiledpc?.id,
                                            firstName:
                                                columnProfileRecord.displayName,
                                            lastName:
                                                columnProfileRecord.displayName,
                                            phone: currentPhoneNumber,
                                            email: currentUserEmail,
                                            type: 'JAZZ_CASH',
                                            transactionType:
                                                paymentOptionTuneOrderRecord
                                                    .type,
                                            noOfAvatar: columnProfileRecord
                                                    .noOfAvatar! +
                                                paymentOptionTuneOrderRecord
                                                    .noOfAvatar!,
                                          );
                                          Navigator.pop(context);
                                          if ((_model.jaazcashPaymobResponse
                                                  ?.succeeded ??
                                              true)) {
                                            context.pushNamed(
                                              'paymentTune',
                                              queryParams: {
                                                'url': serializeParam(
                                                  getJsonField(
                                                    (_model.jaazcashPaymobResponse
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.url''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  (_model.jaazcashPaymobResponse
                                                          ?.bodyText ??
                                                      ''),
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                          }

                                          setState(() {});
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 0.0, 0.0),
                                              child: Image.asset(
                                                'assets/images/download_1.png',
                                                width: 32.0,
                                                height: 32.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Jazz cash',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Nunito',
                                                          color: Colors.white,
                                                          fontSize: 14.0,
                                                        ),
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
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
