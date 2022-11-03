import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../constants/app_routes.dart';
import '../providers/auth_provider.dart';
import 'app_utils.dart';
import 'db.dart';

class ForgotUtil {
  static Future<String> forgot(GlobalKey<FormState> formkey,
      BuildContext context, Map<String, dynamic> forgotData) async {
  

    var result;

    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      await saveEmail(forgotData['email']);
      AppUtils.showLoader(context);
      Provider.of<AuthProvider>(context, listen: false)
          .forgotPassword(
        forgotData['email'],
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

        if (value['status'] == 200) {
          await saveId(value['data']['_id']);
          Navigator.of(context).pushNamed(AppRoutes.resetOTP);
        }
      });
    }

    return result;
  }
}
