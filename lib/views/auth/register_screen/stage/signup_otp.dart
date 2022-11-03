import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../components/buttons.dart';
import '../../../../components/input.dart';
import '../../../../components/pinboxes.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_routes.dart';
import '../../../../utils/db.dart';
import '../../../../utils/register_otp_utils .dart';
import '../../../../utils/resend_otp_utils .dart';


class SignupOTPScreen extends StatefulWidget {
  SignupOTPScreen({Key? key}) : super(key: key);

  @override
  State<SignupOTPScreen> createState() => _SignupOTPScreenState();
}

class _SignupOTPScreenState extends State<SignupOTPScreen> {
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  bool hasError = false;
  String currentText = "";

  String otp = 'tolu*****yeru@gmail.com';

  final controller = TextEditingController();

  final focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            BackButtonWithHeader(text: 'OTP Verification'),
                            SizedBox(
                              height: 16,
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                  'Enter the otp sent to your email address to validate your email address and continue.',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Pallete.kLightText,
                                  )),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(height: _size.height * 0.03),
                        //custom pinboxes for OTP
                        PinBoxes(controller: controller, focusNode: focusNode),
                        SizedBox(height: _size.height * 0.15),
                        //this is a static text
                        Column(
                          children: [
                            //Proceed button
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: OutlinedButton(
                                  child: Text('Proceed'.toUpperCase()),
                                  style: OutlinedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(vertical: 16),
                                    side: const BorderSide(
                                        color: Pallete.kPrimaryColor, width: 1),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    primary: Pallete.whiteColor,
                                    backgroundColor: Pallete.kPrimaryColor,
                                    textStyle: const TextStyle(
                                        color: Pallete.kPrimaryColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                   
                                    RegisterOTPUtil.register(
                                        context, controller.text);
                                  }),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            const Text('Did not get an OTP?',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Pallete.kText,
                                  fontSize: 16,
                                )), //sizebox for margin between widget

                            //resend button wrapped in a container to manage it's width
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: OutlinedButton(
                                  child: Text('Resend'.toUpperCase()),
                                  style: OutlinedButton.styleFrom(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    primary: Pallete.kPrimaryColor,
                                    backgroundColor: Colors.transparent,
                                    textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                   //IsFirstTime().once(0);
                                    ResendOTPUtil.resend(context);
                                  }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
