import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_routes.dart';
import '../providers/auth_provider.dart';
import 'app_utils.dart';
import 'db.dart';

class RegisterOTPUtil {
  static Future<String> register(
      BuildContext context, String registerOTPData) async {
    // print(loginData);
    //var token2 = await showToken();
    //var id2 = await showId();
    AppUtils.showLoader(context);
    var result;

    print(registerOTPData);
    Provider.of<AuthProvider>(context, listen: false)
        .registerOTP(registerOTPData)
        .then((value) async {
      Navigator.of(context).pop();
      print(value);
      if (value['status'] == 200) {
            IsFirstTime().once(1);              
        Navigator.of(context).pushNamed(AppRoutes.setUser);
      }
      if (value['status'] == 302) {
        //TO DO

        AppUtils.ErrorDialog(
          context,
          value['error'],
          'You have entered the wrong OTP.',
          'Close',
        );
      }
    });

    return result;
  }
}
