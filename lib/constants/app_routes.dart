import 'package:flutter/cupertino.dart';
import 'package:sportify/views/auth/forgot_password/forgot_password.dart';
import 'package:sportify/views/auth/register_screen/set_profile.dart';
import 'package:sportify/views/auth/register_screen/stage/preferences/preferences.dart';
import 'package:sportify/views/navbar/navbar.dart';
import 'package:sportify/views/screens/buddies/buddies.dart';
import 'package:sportify/views/screens/discover/discover.dart';
import 'package:sportify/views/screens/profile/edit_profile/edit_profile.dart';
import 'package:sportify/views/screens/settings/settings.dart';

import '../views/auth/forgot_password/change_pasword/changepassword.dart';
import '../views/auth/forgot_password/otp/forgot_otp.dart';
import '../views/auth/login_screen/login.dart';
import '../views/auth/register_screen/register.dart';
import '../views/auth/register_screen/stage/signup_otp.dart';
import '../views/screens/profile/profile.dart';

class AppRoutes {
  // AUTH routes
  static const login = '/login';
  static const userInterest = '/userInterest';
  static const signupOtpscreen = '/signupOtpscreen';
  static const signupscreen = '/signupscreen';
  static const changePassword = '/changePassword';
  static const resetOTP = '/resetOTP';
  static const forgotPassword = '/forgotPassword';

  //user routes
  static const profile = '/profile';
   static const editProfile = '/editProfile';
  static const settinga = '/setings';
  static const navbar = '/navbar';
  static const buddies = '/buddies';
  static const discover = '/discover';
  static const setUser = '/setUser';

  static Map<String, WidgetBuilder> routes() {
    return <String, WidgetBuilder>{
      AppRoutes.resetOTP: ((context) => ResetOTPScreen()),
        AppRoutes.setUser: ((context) => UserSetupScreen()),
      AppRoutes.changePassword: ((context) => ChangePassword()),
      AppRoutes.signupOtpscreen: ((context) => SignupOTPScreen()),
      AppRoutes.userInterest: ((context) => CreatePreferenceScreen()),
      AppRoutes.signupscreen: (context) => SignUp(),
      AppRoutes.forgotPassword: (context) => PasswordResetScreen(),
      AppRoutes.login: ((context) => LoginScreen()),

      AppRoutes.profile: ((context) => Profile()),
       AppRoutes.editProfile: ((context) => EditProfile()),
      AppRoutes.settinga: ((context) =>Settings()),
      AppRoutes.discover: ((context) => Discover()),
      AppRoutes.buddies: ((context) => Buddies()),
      AppRoutes.navbar: ((context) => NavBar()),
    };
  }
}
