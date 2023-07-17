import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/firebase_auth/auth_util.dart';

List<String> newCustomFunction(List<String> aList) {
  return aList.toSet().toList();
}

int newCustomFunction2(int noOfImages) {
//  return noOfImages * 150;
  int x = noOfImages;
  int fine_tuned_steps = 0;

  if (x >= 15 && x <= 20) {
    fine_tuned_steps = 150 * x;
  } else if (x > 20) {
    fine_tuned_steps = 3000;
  }
  return fine_tuned_steps;
}

int disountedPriceCAl(
  int var1,
  int var2,
) {
  return (var1 - (var1 * (var2 / 100))).floor();
}

int discount(
  int totalAmount,
  int percentage,
) {
  return (totalAmount * (percentage / 100)).floor();
}

String formatPhone(String phone) {
  phone = phone.replaceFirst('0', '+92', 0);
  return phone;
}
