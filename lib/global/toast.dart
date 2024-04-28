import 'package:explorexpert/features/user_auth/presentation/widgets/essentials.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({required String message}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: EXColors.primaryDark,
      textColor: Colors.white,
      fontSize: 16.0);
}
