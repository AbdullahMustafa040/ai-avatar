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

class ModelBundlesModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  BundleRecord? slectedTile;

  Color? selectedcard = const Color(0xFFFFD800);

  Color? unSelectedCard = const Color(0xFF212121);

  Color? unSelectedHeading = Colors.white;

  Color? selectedHeading = const Color(0xFF121212);

  int? choos = 0;

  Color? selectedSubHeading = const Color(0xFF212121);

  Color? unselectedSubHeading = const Color(0xFFB3B3B3);

  Color? unSelectedDiscount = const Color(0xFFFFD800);

  Color? selectedDiscount = const Color(0xFFFDF2B4);

  Color? selectedDiscountedAmount = const Color(0xFFD80000);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  OrderRecord? ord;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
