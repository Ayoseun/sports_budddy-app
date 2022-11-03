import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_routes.dart';
import '../providers/auth_provider.dart';
import 'app_utils.dart';
import 'db.dart';

class ResendOTPUtil {
  static Future<String> resend(BuildContext context) async {
    // print(loginData);
    //var token2 = await showToken();
    //var id2 = await showId();
    AppUtils.showLoader(context);
    var result;

    var email = await showEmail();

    Provider.of<AuthProvider>(context, listen: false)
        .forgotPassword(email)
        .then((value) async {
      Navigator.of(context).pop();
      print(value);
      if (value['message'] == 'success') {
        AppUtils.ErrorDialog(
            context, 'OTP sent', 'OTP sent successfully', 'close');
      }
      if (value['message'] == 'User does not exist') {
        //TO DO

        AppUtils.ErrorDialog(
          context,
          value['message'],
          'This email is not registered.',
          'Close',
        );
      }
    });

    return result;
  }
}
