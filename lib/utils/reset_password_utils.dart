import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../constants/app_routes.dart';
import '../providers/auth_provider.dart';
import '../shared/success.dart';
import 'app_utils.dart';
import 'db.dart';

class ResetPasswordUtil {
  static Future<String> resetPassword(GlobalKey<FormState> formkey,
      BuildContext context, Map<String, dynamic> resetData) async {
    // print(loginData);
    //var token2 = await showToken();
    //var id2 = await showId();

    var result;

    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      print(resetData['password']);
      AppUtils.showLoader(context);
      Provider.of<AuthProvider>(context, listen: false)
          .resetPassword(
        resetData['password'],
      )
          .then((value) async {
        Navigator.of(context).pop();
        print(value);
        if (value['status'] == 302) {
          AppUtils.showWarningDialog(
              context,
              Icon(Icons.error_rounded),
              'Ooops, seems this email is not registered!',
              'Register ',
              'Check',
              () => Navigator.of(context).pushNamed(AppRoutes.signupscreen));
        }

        if (value['status'] ==200) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => Success(
                      head: 'Success',
                      body: 'Password changed successfully',
                      buttonText: 'Login',
                      onPressed: AppRoutes.login)));
        }
      });
    }

    return result;
  }
}
