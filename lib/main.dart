import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sportify/constants/app_routes.dart';
import 'package:sportify/views/auth/login_screen/login.dart';
import 'package:sportify/views/auth/register_screen/set_profile.dart';
import 'package:sportify/views/navbar/navbar.dart';

import 'constants/provider.dart';
import 'utils/db.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
      statusBarIconBrightness: Brightness.dark // dark text for status bar
      ));
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Future<int> alreadyAUser = IsFirstTime().getOnce();
    return MultiProvider(
      providers: AppProviders.providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: AppRoutes.routes(),
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: FutureBuilder(
          builder: (ctx, snapshot) {
            // Checking if future is resolved or not
            if (snapshot.connectionState == ConnectionState.done) {
              // check if snapshot has data and then convert data to int
              if (snapshot.hasData) {
                final data = snapshot.data as int;

                switch (data) {
                  case 0:
                    return LoginScreen();
                  case 1:
                    UserSetupScreen();
                    break;
                  case 2:
                    return NavBar();
                }
                // if we got our data
              }
            }
            // Displaying empty to indicate waiting state
            return Container(
              color: Colors.white,
            );
          },
          future: alreadyAUser,
        ),
      ),
    );
  }
}
