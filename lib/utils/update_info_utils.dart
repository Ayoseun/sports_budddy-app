import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../constants/app_routes.dart';
import '../providers/auth_provider.dart';
import 'app_utils.dart';
import 'db.dart';

class UpdateUtil {
  static Future<String> update(GlobalKey<FormState> formkey,
      BuildContext context, Map<String, dynamic> updateData) async {
    // print(loginData);
    //var token2 = await showToken();
    //var id2 = await showId();

    var result;

    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      await saveUsername(updateData['username']);
      await saveName(updateData['name']);
      await saveSurname(updateData['surname']);
      AppUtils.showLoader(context);
      Provider.of<AuthProvider>(context, listen: false)
          .update(
       updateData['name'],
       updateData['surname'],
       updateData['phone'],
       
      )
          .then((value) async {
        Navigator.of(context).pop();
        print(value);
        if (value['status'] == 302) {
            AppUtils.ErrorDialog(
          context,
          value['message'],
          'You have entered the wrong OTP.',
          'Close',
        );
        }
        if (value['status'] == 200) {
         

          AppUtils.showSingleDialog(
              context,
              Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
              'Almost done here',
              '.',
              '',
              () => Navigator.of(context).pushNamed(AppRoutes.login));

          Future.delayed(Duration(milliseconds: 1000), () {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(AppRoutes.login);
          });
        }
      });
    }

    return result;
  }
}
