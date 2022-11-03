import 'dart:convert';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sportify/components/buttons.dart';
import 'package:sportify/utils/db.dart';
import '../../../components/input.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';
import '../../../constants/app_routes.dart';
import '../../../utils/login_utils.dart';
import '../../../utils/validator.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool value = false;
  bool passwordVisible = false;

  dispose() {
    super.dispose();
  }

  //this is the login form key used to validate user input
  final _loginFormKey = GlobalKey<FormState>();
  bool obsecure = true;

  //map object to inject user credentials
  final Map<String, dynamic> _loginData = {
    'email': '',
    'password': '',
  };
  Widget build(BuildContext context) {
    //size varaible used to get screen size
    final size = MediaQuery.of(context).size;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent, // transparent status bar
              systemNavigationBarColor: Colors.black, // navigation bar color
              statusBarIconBrightness:
                  Brightness.dark, // status bar icons' color
              systemNavigationBarIconBrightness:
                  Brightness.dark, //navigation bar icons' color
            ),
            child: Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    height: size.height,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome\nback!'.toUpperCase(),
                                  style: AppFonts.heading2
                                      .copyWith(color: Pallete.kBlack),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Home of sports',
                                  style: AppFonts.body1,
                                ),
                              ]),
                          Column(
                            children: [
                              Form(
                                key: _loginFormKey,
                                child: Column(
                                  children: [
                                    CustomInput2(
                                      label: 'Email',
                                      hint:
                                          'Enter email address / phone number',
                                      onSaved: (value) {
                                        _loginData['email'] = value;
                                      },
                                      validator: Validators.emailValidator,
                                    ),
                                    const SizedBox(height: 16),
                                    CustomInput2(
                                      validator: Validators.passwordValidator,
                                      obsecure: !passwordVisible,
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            //call set state so that the UI is rebuilt on click
                                            setState(() {
                                              //loop through either state when clicked
                                              passwordVisible =
                                                  !passwordVisible;
                                            });
                                          },
                                          icon: Icon(
                                            // if password visibilty is default false set icon to visible icon or else set to hide icon
                                            passwordVisible
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off,
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            size: 18,
                                          )),
                                      label: 'Password',
                                      hint: 'Enter password',
                                      onSaved: (value) {
                                        _loginData['password'] = value;
                                      },
                                    ),
                                    SizedBox(height: 16),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(AppRoutes.forgotPassword);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text('Forgot Password?',
                                        textAlign: TextAlign.start,
                                        softWrap: true,
                                        maxLines: 1,
                                        style: AppFonts.body1),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //Custom login button
                              ButtonWithFuction(
                                  text: 'Login',
                                  onPressed: () {
                                   
                                   // Parse loginform key for validation
                                   // parse loginData map
                                    LoginUtil.login(
                                        _loginFormKey, context, _loginData);
                                  }),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Already have an account?',
                                    style: AppFonts.body1,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      //navigates to register screen
                                      Navigator.of(context)
                                          .pushNamed(AppRoutes.signupscreen);
                                    },
                                    child: Text('Signup.',
                                        style: AppFonts.heading1.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300)),
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
            )));
  }
}
