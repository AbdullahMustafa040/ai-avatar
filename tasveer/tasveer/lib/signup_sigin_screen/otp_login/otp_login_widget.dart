import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'otp_login_model.dart';
export 'otp_login_model.dart';

class OtpLoginWidget extends StatefulWidget {
  const OtpLoginWidget({
    Key? key,
    this.phoneNo,
  }) : super(key: key);

  final String? phoneNo;

  @override
  _OtpLoginWidgetState createState() => _OtpLoginWidgetState();
}

class _OtpLoginWidgetState extends State<OtpLoginWidget> {
  late OtpLoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OtpLoginModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onExecute.add(StopWatchExecute.start);
      setState(() {
        _model.otp = '1234';
      });
      setState(() {
        _model.error = false;
      });
    });

    _model.emailController ??=
        TextEditingController(text: '${widget.phoneNo}@aiAvatar.com');
    _model.passwordController ??= TextEditingController(text: widget.phoneNo);
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
            'Create your account',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Rubik',
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
                  'Enter your 4-digit OTP',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    child: Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 1.0,
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 20.0, 16.0, 0.0),
                                child: PinCodeTextField(
                                  autoDisposeControllers: false,
                                  appContext: context,
                                  length: 4,
                                  textStyle: GoogleFonts.getFont(
                                    'Rubik',
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  enableActiveFill: true,
                                  autoFocus: true,
                                  enablePinAutofill: true,
                                  errorTextSpace: 16.0,
                                  showCursor: true,
                                  cursorColor: Colors.white,
                                  obscureText: false,
                                  pinTheme: PinTheme(
                                    fieldHeight: 48.0,
                                    fieldWidth: 76.0,
                                    borderWidth: 1.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                    shape: PinCodeFieldShape.box,
                                    activeColor: Color(0xFF212121),
                                    inactiveColor: Color(0xFF212121),
                                    selectedColor: Color(0xFF212121),
                                    activeFillColor: Color(0xFF212121),
                                    inactiveFillColor: Color(0xFF212121),
                                    selectedFillColor: Color(0xFF212121),
                                  ),
                                  controller: _model.pinCodeController,
                                  onChanged: (_) {},
                                  onCompleted: (_) async {
                                    setState(() {});
                                  },
                                  autovalidateMode: AutovalidateMode.disabled,
                                  validator: _model.pinCodeControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            if (_model.error)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'OTP is incorrect. Please retry.',
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Nunito',
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                ),
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (_model.timerMilliseconds == 0)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 0.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.timerController.onExecute
                                                  .add(StopWatchExecute.reset);

                                              _model.timerController.onExecute
                                                  .add(StopWatchExecute.start);
                                              _model.otp = '1234';
                                            },
                                            child: Text(
                                              'Resend OTP',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Nunito',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 14.0,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      if (_model.timerMilliseconds != 0)
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Time remaining:',
                                                style: GoogleFonts.getFont(
                                                  'Nunito',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(2.0, 2.0, 0.0, 0.0),
                                              child: FlutterFlowTimer(
                                                initialTime:
                                                    _model.timerMilliseconds,
                                                getDisplayTime: (value) =>
                                                    StopWatchTimer
                                                        .getDisplayTime(
                                                  value,
                                                  hours: false,
                                                  minute: false,
                                                  milliSecond: false,
                                                ),
                                                timer: _model.timerController,
                                                updateStateInterval: Duration(
                                                    milliseconds: 1000),
                                                onChanged: (value, displayTime,
                                                    shouldUpdate) {
                                                  _model.timerMilliseconds =
                                                      value;
                                                  _model.timerValue =
                                                      displayTime;
                                                  if (shouldUpdate)
                                                    setState(() {});
                                                },
                                                onEnded: () async {
                                                  setState(() {});
                                                },
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Nunito',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(2.0, 2.0, 0.0, 0.0),
                                              child: Text(
                                                'sec',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                          fontSize: 14.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (_model.otp ==
                                      _model.pinCodeController!.text) {
                                    GoRouter.of(context).prepareAuthEvent();

                                    final user =
                                        await authManager.signInWithEmail(
                                      context,
                                      _model.emailController.text,
                                      _model.passwordController.text,
                                    );
                                    if (user == null) {
                                      return;
                                    }

                                    if (valueOrDefault<bool>(
                                            currentUserDocument?.termsAgreement,
                                            false) ==
                                        true) {
                                      context.pushNamedAuth('home', mounted);
                                    } else {
                                      context.pushNamedAuth(
                                          'TermsandConditions', mounted);
                                    }
                                  } else {
                                    setState(() {
                                      _model.error = true;
                                    });
                                  }
                                },
                                text: 'Next',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 48.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFFFFD800),
                                  textStyle: GoogleFonts.getFont(
                                    'Rubik',
                                    color: Color(0xFF121212),
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
                            if (false)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: TextFormField(
                                  controller: _model.emailController,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: '[Some hint text...]',
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodySmall,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito',
                                        color: Colors.white,
                                      ),
                                  validator: _model.emailControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            if (false)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: TextFormField(
                                  controller: _model.passwordController,
                                  autofocus: true,
                                  obscureText: !_model.passwordVisibility,
                                  decoration: InputDecoration(
                                    hintText: '[Some hint text...]',
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodySmall,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    suffixIcon: InkWell(
                                      onTap: () => setState(
                                        () => _model.passwordVisibility =
                                            !_model.passwordVisibility,
                                      ),
                                      focusNode: FocusNode(skipTraversal: true),
                                      child: Icon(
                                        _model.passwordVisibility
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: Color(0xFF757575),
                                        size: 22.0,
                                      ),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito',
                                        color: Colors.white,
                                      ),
                                  validator: _model.passwordControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                          ],
                        ),
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
