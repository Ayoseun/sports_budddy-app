import 'package:flutter/material.dart';

import '../../../components/buttons.dart';
import '../../../components/input.dart';
import '../../../constants/app_fonts.dart';
import '../../../constants/app_routes.dart';
import '../../../utils/app_utils.dart';
import '../../../utils/forgot_password_utils.dart';


class PasswordResetScreen extends StatefulWidget {
  const PasswordResetScreen({Key? key}) : super(key: key);

  @override
  _PasswordResetScreenState createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  bool enabled = false;

  final Map<String, dynamic> _resetPasswordData = {
    'email': '',
  };
 final _forgotPasswordKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: SingleChildScrollView(
            child: Form(
              key:_forgotPasswordKey ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  Text(
                    'Let’s create a new \npassword',
                    style: AppFonts.coloredHeading,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    'Please enter your registered email address to begin password reset process.',
                    style: AppFonts.body1,
                  ),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  CustomInput(
                      hint: 'Enter email address',
                      onSaved: (value) {},
                      onChanged: (value) {
                        setState(() {
                          //check that the user email is valid email format
                          enabled = AppUtils.checkValidEmail(value);
                          if (enabled) {
                            _resetPasswordData['email'] = value;
                          }
                        });
                      }),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  // const PrivacyInfo(),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  CustomButton(
                    text: 'Next',
                    enabled: enabled,
                    onpressed: enabled
                        ? () {
                         
                            ForgotUtil.forgot(
                                _forgotPasswordKey, context, _resetPasswordData);
                          }
                        : () {},
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  CustomButton(
                    text: 'Back',
                    enabled: false,
                    onpressed: () => Navigator.of(context).pop(),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
