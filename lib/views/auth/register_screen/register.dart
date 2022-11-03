import 'package:flutter/material.dart';
import 'package:sportify/views/auth/register_screen/stage/widget/login_navigation.dart';

import '../../../components/buttons.dart';
import '../../../components/input.dart';
import '../../../constants/app_fonts.dart';
import '../../../constants/app_images.dart';
import '../../../constants/app_routes.dart';
import '../../../utils/register_utils.dart';
import '../../../utils/validator.dart';
import '../login_screen/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool obsecure = true;
  String confirmPassword = '';
  final _registerFormKey = GlobalKey<FormState>();
  bool value = false;
  bool passwordVisible = false;
  final Map<String, dynamic> _registerData = {'email': '','phone': '', 'password': ''};
 
  @override
  Widget build(BuildContext context) {
    final _getSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
               
                SizedBox(height: _getSize.height * 0.05),
                Center(
                  child: Column(
                    children: [
                      Text('Start your sports journey!', style: AppFonts.heading2),
                        SizedBox(height: 4),
                      Text('All your sports activity in just few clicks',
                          style: AppFonts.body1),
                    ],
                  ),
                ),
                SizedBox(height: _getSize.height * 0.13),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Form(
                    key: _registerFormKey,
                    child: Column(
                      children: [
                        CustomInput2(
                          label: 'Email',
                          hint: 'Enter email address',
                          onSaved: (value) {
                            _registerData['email'] = value;
                          },
                          validator: Validators.emailValidator,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomInput2(
                          type: 'number',
                          label: 'Phone',
                          hint: 'Enter phone number',
                          onSaved: (value) {
                            _registerData['phone'] = value;
                          },
                         
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomInput2(
                          validator: Validators.passwordValidator,
                          obsecure: !passwordVisible,
                          suffixIcon: IconButton(
                              onPressed: () {
                                //call set state so that the UI is rebuilt on click
                                setState(() {
                                  //loop through either state when clicked
                                  passwordVisible = !passwordVisible;
                                });
                              },
                              icon: Icon(
                                // if password visibilty is default false set icon to visible icon or else set to hide icon
                                passwordVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off,
                                color: Color.fromARGB(255, 0, 0, 0), size: 18,
                              )),
                          label: 'Password',
                          hint: 'Enter your password',
                          onChanged: (String? value) {
                            confirmPassword = value!;
                          },
                          onSaved: (value) {
                            _registerData['password'] = value;
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomInput2(
                          obsecure: !passwordVisible,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Confirm password cannot be empty';
                            }
                            if (value != confirmPassword) {
                              return 'Password does not match';
                            }
                            return null;
                          },
                          label: 'Confirm Password',
                          hint: 'Confirm your password',
                          onSaved: (value) {
                            //_registerData['password'] = value;
                          },
                        ),
                        SizedBox(height: _getSize.height * 0.15),
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //custom inputfield
                    Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: ButtonWithFuction(
                            text: 'Register',
                            onPressed: () {
                             
                              //We call register-util here and pass formkey and injected data 
                              RegisterUtil.register(
                                  _registerFormKey, context, _registerData);
                             })),
                    const SizedBox(height: 24),
                  ],
                ),
                SizedBox(height: _getSize.height * 0.015),
                //custom policy and terms and condition widget
                LoginNavigation()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
