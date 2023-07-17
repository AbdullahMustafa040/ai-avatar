// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';

import 'package:crypto/crypto.dart';

Future<String> generatePaymobBearerToken() async {
  // Add your function code here!
  final now = DateTime.now();
  final dateStr =
      "${now.day.toString().padLeft(2, '0')}-${now.month.toString().padLeft(2, '0')}-${now.year.toString().padLeft(4, '0')}";
  final dateMultiplied =
      (int.parse(dateStr.replaceAll('-', '')) * 3).toString();
  final key = 'aipikchure'; // replace with your own secret key
  final hmac = Hmac(sha256, utf8.encode(key));
  final hash = hmac.convert(utf8.encode(dateMultiplied));
  final hashString = hash.toString();

  return hashString;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
