
import 'package:flutter/material.dart';


import '../../constants/app_colors.dart';
import '../../constants/app_images.dart';
import '../../constants/app_routes.dart';
import '../screens/buddies/buddies.dart';
import '../screens/discover/discover.dart';
import '../screens/profile/profile.dart';
import '../screens/settings/settings.dart';





class NavBar extends StatefulWidget {
  NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar>{
  //set current tab to starting index
  int currentTab = 0;

  //this is a list of all screents passed into a list that takes widget
  final List<Widget> screens = [
    Discover(),
    Profile(),
    Buddies(),
   Settings(),
   
  ];



//declaring pagestorage state
  final PageStorageBucket Bucket = PageStorageBucket();

  Widget currentScreen = Discover();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Pallete.kBackgroundColor,
        body:
            //this page storage bucket helps to store each page state in memory
            PageStorage(bucket: Bucket, child: currentScreen),


        //set bottomnavbar
        bottomNavigationBar: BottomAppBar(
            //asign shape to navabr
            color:Pallete.whiteColor,
            shape: CircularNotchedRectangle(),
            //set shape to 10px round
            notchMargin: 2,
            child: Container(
              height: 60,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = Discover();
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppImages.discover,
                            color: currentTab == 0
                                ? Color(0xC7171A1C)
                                : Color(0x333B4349),
                            width:17,
                            height: 17,
                          ),SizedBox(height: 4,),
                          Text('Discover',
                              style: TextStyle(
                                fontSize: 11,
                                color: currentTab == 0
                                    ? Color(0xC7171A1C)
                                : Color(0x333B4349),
                              )),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = Buddies();
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppImages.buddy,
                            color: currentTab == 1
                                ? Color(0xC7171A1C)
                                : Color(0x333B4349),
                            width: 20,
                            height: 20,
                          ),SizedBox(height: 4,),
                          Text('Buddies',
                              style: TextStyle(
                                fontSize: 11,
                                  color: currentTab == 1
                                      ? Color(0xC7171A1C)
                                : Color(0x333B4349),
                                 )),
                        ],
                      ),
                    ),
                    MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen = Profile();
                              currentTab = 5;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(AppImages.profile,
                               color: currentTab == 5
                                   ? Color(0xC7171A1C)
                                    : Color(0x333B4349),
                               height: 20,
                              ),
                            //  Icon(Icons.file_copy,
                               
                            //     color: currentTab == 5
                            //          ? Colors.white
                            //         : Color(0x7C171A1C),
                            //    size: 20,
                               
                             // )
                            SizedBox(height: 4,),
                              Text('Profile',
                                  style: TextStyle(
                                    fontSize: 11,
                                      color: currentTab == 5
                                           ? Color(0xC7171A1C)
                                    : Color(0x333B4349),)),
                            ],
                          ),
                        ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen = Settings();
                              currentTab = 2;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.settings_outlined, color: currentTab == 2
                                    ? Color(0xC7171A1C)
                                    : Color(0x333B4349),
                                size: 20,
                                ),
                               
                             SizedBox(height: 4,),
                              Text('Settings',
                                  style: TextStyle(
                                    fontSize: 11,
                                      color: currentTab == 2
                                            ? Color(0xC7171A1C)
                                    : Color(0x333B4349),)),
                            ],
                          ),
                        ),
                         ],
                    )
                  ]),
            )));
  }
}
