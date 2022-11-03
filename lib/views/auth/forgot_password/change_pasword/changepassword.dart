// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import '../../../../components/buttons.dart';
import '../../../../components/input.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_images.dart';
import '../../../../constants/app_routes.dart';
import '../../../../constants/resources.dart';
import '../../../../shared/success.dart';
import '../../../../utils/reset_password_utils.dart';
import '../../../../utils/validator.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool obsecure = false;
  final _resetFormKey = GlobalKey<FormState>();
  final Map<String, dynamic> _resetData = {'password': ''};
  @override
  Widget build(BuildContext context) {
    final _getSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //custom header with text
            const BackButtonWithHeader(text: 'Change Password'),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Form(
                key: _resetFormKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 24,
                    ),

                    //custom input field
                    CustomInput(
                      obsecure: obsecure,
                      //text: 'Confirm Password',
                      hint: 'Confirm password',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            obsecure = !obsecure;
                          });
                        },
                        child: Image.asset(
                          obsecure ? AppImages.eyesOn : AppImages.eyesOff,
                          scale: 4,
                        ),
                      ),
                      onSaved: (value) {
                        _resetData['password'] = value;
                        //pass value to the email object
                      },
                      validator: Validators.passwordValidator,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomInput(
                      obsecure: obsecure,
                      label: 'Confirm New Password',
                      hint: 'Confirm New Password',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            obsecure = !obsecure;
                          });
                        },
                        child: Image.asset(
                          obsecure ? AppImages.eyesOn : AppImages.eyesOff,
                          scale: 4,
                        ),
                      ),
                      onSaved: (value) {
                        //pass value to the email object
                      },
                      validator: Validators.passwordValidator,
                    ),
                    SizedBox(
                      height: _getSize.height * 0.2,
                    ),
                    ElevatedButton(
                      child: const Text('Change'),
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.login);
                        // ResetPasswordUtil.resetPassword(
                        //     _resetFormKey, context, _resetData);
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 5,
                          shadowColor: Pallete.kPrimaryColor,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          minimumSize: const Size.fromHeight(50),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          primary: Pallete.kPrimaryColor,
                          onPrimary: Pallete.whiteColor,
                          textStyle: const TextStyle(
                            fontSize: 20,
                          ),
                          alignment: Alignment.center),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
