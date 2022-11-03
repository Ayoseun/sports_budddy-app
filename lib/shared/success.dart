import 'package:flutter/material.dart';
import 'package:sportify/components/buttons.dart';
import '../constants/app_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/app_routes.dart';
import '../constants/app_colors.dart';
import '../constants/app_images.dart';

class Success extends StatelessWidget {
  String head = 'Success';
  String body =
      'Your sale offer has been successfully listed on the trafiat marketplace';

  String buttonText = 'back to dashboard';

  String onPressed;
  Success(
      {required this.head,
      required this.body,
      required this.buttonText,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Lottie.asset('assets/images/success.json'),
            Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                Text(head,
                    textAlign: TextAlign.start,
                    softWrap: true,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Pallete.kPrimaryColor,
                    )),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(body,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      maxLines: 2,
                      style: AppFonts.body1),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ButtonWithFuction(
                    text: buttonText.toUpperCase(),
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil(onPressed, (route) => false);
                    }))
          ],
        ),
      ),
    );
  }
}
