import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../constants/app_routes.dart';
import '../providers/auth_provider.dart';
import 'app_utils.dart';
import 'db.dart';

class RegisterUtil {
  static Future<String> register(GlobalKey<FormState> formkey,
      BuildContext context, Map<String, dynamic> registerData) async {
    // print(loginData);
    //var token2 = await showToken();
    //var id2 = await showId();

    var result;

    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      await saveEmail(registerData['email']);
      AppUtils.showLoader(context);
      Provider.of<AuthProvider>(context, listen: false)
          .register(
        registerData['email'],
        registerData['phone'],
        registerData['password'],
      )
          .then((value) async {
        Navigator.of(context).pop();
        print(value);
        if (value['status']== 302) {
          AppUtils.showWarningDialog(
              context,
              Icon(Icons.error_rounded),
              'Ooops, seems this email is already taken!',
              'Login instead',
              'Check',
              () => Navigator.of(context).pushNamed(AppRoutes.login));
        }
      
        if (value['status'] == 200) {
          await saveId(value['data']['_id']);

          AppUtils.showSingleDialog(
              context,
              Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
              'Registration successful',
              '.',
              'Try again',
              () => Navigator.of(context).pushNamed(AppRoutes.signupscreen));

          Future.delayed(Duration(milliseconds: 1000), () {
             IsFirstTime().once(1);
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(AppRoutes.signupOtpscreen);
          });
        }
      });
    }

    return result;
  }
}
