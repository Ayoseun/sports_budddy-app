import 'package:flutter/material.dart';
import 'package:sportify/utils/update_info_utils.dart';

import '../../../components/buttons.dart';
import '../../../components/input.dart';
import '../../../constants/app_fonts.dart';
import '../../../constants/app_routes.dart';
import '../../../utils/app_utils.dart';
import '../../../utils/forgot_password_utils.dart';

class UserSetupScreen extends StatefulWidget {
  const UserSetupScreen({Key? key}) : super(key: key);

  @override
  _UserSetupScreenState createState() => _UserSetupScreenState();
}

class _UserSetupScreenState extends State<UserSetupScreen> {
  bool enabled = false;

  final Map<String, dynamic> _userData = {
    'name': '',
    'surname': '',
    'username': '',
  };
  final _userformKey = GlobalKey<FormState>();
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
              key: _userformKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  Text(
                    'Let’s create get your new \naccount all setup',
                    style: AppFonts.coloredHeading,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    'Just a few clicks and we are on the goallll.',
                    style: AppFonts.body1,
                  ),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  CustomInput(
                      hint: 'Enter your name',
                      onSaved: (value) {},
                      onChanged: (value) {
                        setState(() {
                          if (enabled) {
                            _userData['name'] = value;
                          }
                        });
                      }),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  CustomInput(
                      hint: 'Enter your surname',
                      onSaved: (value) {},
                      onChanged: (value) {
                        setState(() {
                          //check that the user email is valid email format
                          enabled = AppUtils.checkValidEmail(value);
                          if (enabled) {
                            _userData['surname'] = value;
                          }
                        });
                      }),
                  // const PrivacyInfo(),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  CustomInput(
                      hint: 'Enter your username',
                      onSaved: (value) {
                        _userData['username'] = value;
                      },
                      onChanged: (value) {}), SizedBox(
                    height: size.height * 0.16,
                  ),
                  ButtonWithFuction(
                      text: 'Okay...',
                      onPressed: () {
                        UpdateUtil.update(_userformKey, context, _userData);
                      }),

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
