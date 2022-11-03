import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../components/buttons.dart';
import '../../../../components/input.dart';
import '../../../../components/pinboxes.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_routes.dart';
import '../../../../utils/reset_otp_utils.dart';


class ResetOTPScreen extends StatefulWidget {
  ResetOTPScreen({Key? key}) : super(key: key);

  @override
  State<ResetOTPScreen> createState() => _ResetOTPScreenState();
}

class _ResetOTPScreenState extends State<ResetOTPScreen> {
  TextEditingController textEditingController = TextEditingController();


  bool hasError = false;
  String currentText = "";

 
//you set controller text here 
  final controller = TextEditingController();
//use this to get textcontroller focusnode
  final focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    //this will get the screen size
    final _size = MediaQuery.of(context).size;
    //willpopscope stops the user from going back
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
                            //custom back button with text
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
                        
                        SizedBox(height: _size.height * 0.03),
                        //OTP pin box widget
                        PinBoxes(controller: controller, focusNode: focusNode),

                        //set height allowances
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
                                     // Navigator.of(context).pushNamed(AppRoutes.changePassword);
                                    ResetOTPUtil.resetotp(
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
                                   // ResendOTPUtil.resend(context);
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
