import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loader/loader_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'payment_tune_model.dart';
export 'payment_tune_model.dart';

class PaymentTuneWidget extends StatefulWidget {
  const PaymentTuneWidget({
    Key? key,
    this.url,
  }) : super(key: key);

  final String? url;

  @override
  _PaymentTuneWidgetState createState() => _PaymentTuneWidgetState();
}

class _PaymentTuneWidgetState extends State<PaymentTuneWidget> {
  late PaymentTuneModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentTuneModel());
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

    return StreamBuilder<ProfileRecord>(
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
        final paymentTuneProfileRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.black,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          isDismissible: false,
                          enableDrag: false,
                          context: context,
                          builder: (bottomSheetContext) {
                            return GestureDetector(
                              onTap: () => FocusScope.of(context)
                                  .requestFocus(_unfocusNode),
                              child: Padding(
                                padding: MediaQuery.of(bottomSheetContext)
                                    .viewInsets,
                                child: Container(
                                  height: double.infinity,
                                  child: LoaderWidget(),
                                ),
                              ),
                            );
                          },
                        ).then((value) => setState(() {}));

                        await Future.delayed(
                            const Duration(milliseconds: 3000));
                        if (paymentTuneProfileRecord.profileCompleted!) {
                          _model.fineTune = await CreateAFineTuneCall.call(
                            title: paymentTuneProfileRecord.displayName,
                            name: paymentTuneProfileRecord.gender == 'male'
                                ? 'man'
                                : 'woman',
                            imageUrlsList:
                                paymentTuneProfileRecord.imgUrls!.toList(),
                            steps: functions.newCustomFunction2(
                                paymentTuneProfileRecord.imgUrls!
                                    .toList()
                                    .length),
                          );
                          if ((_model.fineTune?.succeeded ?? true)) {
                            final avatarsCreateData = {
                              ...createAvatarsRecordData(
                                name: getJsonField(
                                  (_model.fineTune?.jsonBody ?? ''),
                                  r'''$.name''',
                                ).toString(),
                                createdAt: getCurrentTimestamp,
                                modifiedAt: getCurrentTimestamp,
                                ckptUrl: getJsonField(
                                  (_model.fineTune?.jsonBody ?? ''),
                                  r'''$.ckpt_url''',
                                ).toString(),
                                token: getJsonField(
                                  (_model.fineTune?.jsonBody ?? ''),
                                  r'''$.token''',
                                ).toString(),
                                title: getJsonField(
                                  (_model.fineTune?.jsonBody ?? ''),
                                  r'''$.title''',
                                ).toString(),
                                tuneId: getJsonField(
                                  (_model.fineTune?.jsonBody ?? ''),
                                  r'''$.id''',
                                ),
                                status: 'In Progress',
                              ),
                              'upload_images': getJsonField(
                                (_model.fineTune?.jsonBody ?? ''),
                                r'''$.orig_images''',
                              ),
                            };
                            await AvatarsRecord.createDoc(
                                    paymentTuneProfileRecord.reference)
                                .set(avatarsCreateData);
                            Navigator.pop(context);

                            context.pushNamed('MyImage');
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text(
                                      (_model.fineTune?.statusCode ?? 200)
                                          .toString()),
                                  content:
                                      Text((_model.fineTune?.bodyText ?? '')),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok Tune Erroro'),
                                    ),
                                  ],
                                );
                              },
                            );
                            Navigator.pop(context);
                          }
                        } else {
                          Navigator.pop(context);
                          await Future.delayed(
                              const Duration(milliseconds: 1000));

                          context.pushNamed('Profile');
                        }

                        setState(() {});
                      },
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                      child: FlutterFlowWebView(
                        url: widget.url!,
                        bypass: true,
                        width: MediaQuery.of(context).size.width * 1.0,
                        height: MediaQuery.of(context).size.height * 0.8,
                        verticalScroll: false,
                        horizontalScroll: false,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
