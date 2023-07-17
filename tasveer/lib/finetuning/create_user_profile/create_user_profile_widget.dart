import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_user_profile_model.dart';
export 'create_user_profile_model.dart';

class CreateUserProfileWidget extends StatefulWidget {
  const CreateUserProfileWidget({
    Key? key,
    this.uploadedimages,
  }) : super(key: key);

  final List<String>? uploadedimages;

  @override
  _CreateUserProfileWidgetState createState() =>
      _CreateUserProfileWidgetState();
}

class _CreateUserProfileWidgetState extends State<CreateUserProfileWidget> {
  late CreateUserProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateUserProfileModel());

    _model.textController ??= TextEditingController();
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
            'Create User Profile',
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
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                    child: Container(
                      width: 80.0,
                      height: 80.0,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        widget.uploadedimages!.first,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              14.0, 32.0, 0.0, 0.0),
                          child: Text(
                            'Set a name',
                            style: GoogleFonts.getFont(
                              'Outfit',
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 8.0, 16.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller: _model.textController,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText:
                                      'Set an identifier name for this user',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito',
                                      color: Colors.white,
                                      fontSize: 14.0,
                                    ),
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              14.0, 24.0, 14.0, 0.0),
                          child: Text(
                            'Choose your gender',
                            style: GoogleFonts.getFont(
                              'Outfit',
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: FlutterFlowChoiceChips(
                              options: [
                                ChipData('👨 Male'),
                                ChipData('👩 Female')
                              ],
                              onChanged: (val) => setState(
                                  () => _model.choiceChipsValue = val?.first),
                              selectedChipStyle: ChipStyle(
                                backgroundColor: Color(0xFFC47918),
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito',
                                      color: Colors.white,
                                    ),
                                iconColor: Colors.white,
                                iconSize: 18.0,
                                elevation: 4.0,
                              ),
                              unselectedChipStyle: ChipStyle(
                                backgroundColor: Color(0xFF212121),
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Nunito',
                                      color: Color(0xFFE3E7ED),
                                    ),
                                iconColor: Color(0xFF212121),
                                iconSize: 18.0,
                                elevation: 4.0,
                              ),
                              chipSpacing: 60.0,
                              multiselect: false,
                              initialized: _model.choiceChipsValue != null,
                              alignment: WrapAlignment.start,
                              controller: _model.choiceChipsValueController ??=
                                  FormFieldController<List<String>>(
                                ['👨 Male'],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 75.0, 16.0, 16.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (_model.choiceChipsValue != null &&
                                    _model.choiceChipsValue != '') {
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    return;
                                  }

                                  final profileCreateData = {
                                    ...createProfileRecordData(
                                      userId: currentUserReference,
                                      displayName: _model.textController.text,
                                      photoUrl: widget.uploadedimages?.first,
                                      createdTime: getCurrentTimestamp,
                                      gender:
                                          _model.choiceChipsValue == '👨 Male'
                                              ? 'male'
                                              : 'female',
                                      done: false,
                                      profileCompleted: false,
                                    ),
                                    'img_urls': widget.uploadedimages,
                                  };
                                  var profileRecordReference =
                                      ProfileRecord.collection.doc();
                                  await profileRecordReference
                                      .set(profileCreateData);
                                  _model.prof =
                                      ProfileRecord.getDocumentFromData(
                                          profileCreateData,
                                          profileRecordReference);

                                  final usersUpdateData = {
                                    'profile_id': FieldValue.arrayUnion(
                                        [_model.prof!.reference]),
                                  };
                                  await currentUserReference!
                                      .update(usersUpdateData);
                                  setState(() {
                                    FFAppState().profiledpc =
                                        _model.prof!.reference;
                                  });

                                  context.pushNamed('ModelBundles');
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('choose gender'),
                                        content: Text('choose gender'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }

                                setState(() {});
                              },
                              text: 'Create Profile',
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
                                  color: FlutterFlowTheme.of(context).tertiary,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
