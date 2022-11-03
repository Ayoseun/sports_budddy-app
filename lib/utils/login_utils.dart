import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_routes.dart';
import '../providers/auth_provider.dart';
import 'app_utils.dart';
import 'db.dart';

class LoginUtil {
  static Future<String> login(GlobalKey<FormState> formkey,
      BuildContext context, Map<String, dynamic> loginData) async {
    // print(loginData);
    //var token2 = await showToken();
    //var id2 = await showId();

    var result;
    print(loginData);
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      await saveEmail(loginData['email']);
      AppUtils.showLoader(context);
      Provider.of<AuthProvider>(context, listen: false)
          .login(
        loginData['email'],
        loginData['password'],
      )
          .then((value) async {
        Navigator.of(context).pop();
        print(value);
        if (value['status'] == 200) {
          //save user id
          await saveId(value['data']['_id']);

          //save user email
          await saveEmail(value['data']['email']);
          await savePhone(value['data']['phone']);
          await saveName(value['data']['name']);
          await saveSurname(value['data']['surname']);
          await saveUsername(value['data']['username']);

          Navigator.of(context).pushReplacementNamed(AppRoutes.navbar);

          IsFirstTime().once(2);
        }

        if (value['error'] == 'User not found') {
          AppUtils.showAlertDialog(
              context,
              'Oops, We can\'t find this account!',
              value['error'],
              'Sign Up',
              'Check again',
              () => Navigator.of(context).pushNamed(AppRoutes.signupscreen));
        }

        if (value['error'] == 'Password is invalid') {
          AppUtils.showAlertDialog(
              context,
              'Oops, We really can\'t say, but this password is wrong',
              value['error'],
              'Sign Up',
              'Check again',
              () => Navigator.of(context).pushNamed(AppRoutes.signupscreen));
        }
      });
    }

    return result;
  }
}
