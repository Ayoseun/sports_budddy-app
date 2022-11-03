import 'package:flutter/material.dart';


import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_fonts.dart';
import '../../../../../constants/app_routes.dart';

class LoginNavigation extends StatelessWidget {
  const LoginNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed(AppRoutes.login),
              child: Text(
                'Login,',
                style: AppFonts.body1.copyWith(fontWeight: FontWeight.w600,color: Colors.black),
              ),
            ),
            Text(
              ' If your already have an account',
              style: AppFonts.body1,
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Signing up, confirms that you’ve read and agreed to ',
              style: AppFonts.body1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sportify’s ',
                  style: AppFonts.body1,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Terms of Use ',
                    style: AppFonts.body3.copyWith(
                        decoration: TextDecoration.underline,
                        color: Pallete.kPrimaryColor),
                  ),
                ),
                Text(
                  'and ',
                  style: AppFonts.body3,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Privacy and  Policy ',
                    style: AppFonts.body3.copyWith(
                        decoration: TextDecoration.underline,
                        color: Pallete.kPrimaryColor),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'Statement.',
                style: AppFonts.body1
              ),
            ),
          ],
        ),
      ],
    );
  }
}
