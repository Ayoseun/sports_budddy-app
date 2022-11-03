import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sportify/constants/app_colors.dart';
import 'package:sportify/constants/app_fonts.dart';
import 'package:sportify/constants/app_routes.dart';
import 'package:sportify/utils/app_utils.dart';
import 'package:sportify/utils/db.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // transparent status bar
        statusBarIconBrightness: Brightness.dark // dark text for status bar
        ));
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'Settings',
                style: AppFonts.heading1,
              ),
              SizedBox(
                height: size.height * 0.2,
              ),
              Row_item(
                  itemName: 'Change Password',
                  icon: Icon(
                    Icons.key,
                  ),
                  onpressed: AppRoutes.forgotPassword),
              SizedBox(
                height: size.height * 0.05,
              ),
              Row_item(
                  itemName: 'Update User info',
                  icon: Icon(
                    Icons.key,
                  ),
                  onpressed: AppRoutes.editProfile),
              SizedBox(
                height: size.height * 0.05,
              ),
              Row_item(
                  itemName: 'Privacy',
                  icon: Icon(
                    Icons.key,
                  ),
                  onpressed: AppRoutes.profile),
              SizedBox(
                height: size.height * 0.05,
              ),
              Row_item(
                  itemName: 'Groups',
                  icon: Icon(
                    Icons.key,
                  ),
                  onpressed: AppRoutes.profile),
              SizedBox(
                height: size.height * 0.2,
              ),
              GestureDetector(
                onTap: () {
                  AppUtils.showAlertDialog(context, 'Are you sure?',
                      'You are about to logout', 'Log out', 'cancel', () {
                    delete_Shared_Preferences();
                    Navigator.pushNamedAndRemoveUntil(
                        context, AppRoutes.login, (route) => false);
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'My Account',
                      style: AppFonts.body1,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text('Log Out',
                        style: AppFonts.errorStyle.copyWith(
                            fontSize: 24, color: Pallete.kSecondaryColor)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Row_item extends StatelessWidget {
  const Row_item({
    Key? key,
    required this.icon,
    required this.itemName,
    required this.onpressed,
  }) : super(key: key);
  final Widget icon;
  final String itemName;
  final String onpressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(onpressed);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  //color: Pallete.kPrimaryColor .withOpacity(0.08),
                  color: Color.fromARGB(104, 213, 213, 213),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Padding(padding: const EdgeInsets.all(8.0), child: icon),
              ),
              SizedBox(
                width: 8,
              ),
              Text(itemName),
            ],
          ),
          Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}
