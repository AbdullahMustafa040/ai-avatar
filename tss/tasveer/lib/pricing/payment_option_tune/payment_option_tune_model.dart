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

class PaymentOptionTuneModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - generatePaymobBearerToken] action in Row widget.
  String? token;
  // Stores action output result for [Backend Call - API (Paymob)] action in Row widget.
  ApiCallResponse? apiResultyw64;
  // Stores action output result for [Custom Action - generatePaymobBearerToken] action in Row widget.
  String? jazzcashToken;
  // Stores action output result for [Backend Call - API (Paymob)] action in Row widget.
  ApiCallResponse? jaazcashPaymobResponse;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
