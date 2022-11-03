import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sportify/constants/app_fonts.dart';
import 'package:sportify/constants/app_images.dart';

import '../../../constants/app_colors.dart';
import '../../../utils/db.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

    var email = '';
  var id = '';
  inituser() async {
    email = await showEmail();
    id = await showId();
    print(id);
    setState(() {
      email;
      id;
    });
  }
  List<String> activities = <String>[
    'You liked',
    'You Commented',
    'You liked',
    'You Commented',
    'You liked',
    'You liked',
    'You liked',
    'You Commented',
    'You liked',
    'You liked',
    'You Commented',
  ];

  List<Map> interests = [
    {'id': 0, 'club': 'Football', 'actions': '5k likes'},
    {'id': 1, 'club': 'Rugby', 'actions': '50k comments'},
    {'id': 2, 'club': 'Basketball', 'actions': '3k folloeers'},
    {'id': 2, 'club': 'Basketball', 'actions': '3k folloeers'},
    {'id': 2, 'club': 'Basketball', 'actions': '3k folloeers'},
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // transparent status bar
        statusBarIconBrightness: Brightness.light // dark text for status bar
        ));
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 252, 252, 252),
        body: Column(children: [
          // SizedBox(height: 16,),
          // Text('Profile',style: AppFonts.heading1,),
          Container(
              height: size.height * 0.3,
              width: size.width,
              decoration: BoxDecoration(
                color: Pallete.whiteColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(100)),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/cover.jpg',
                    width: size.width,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        width: 150,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(53, 255, 255, 255),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ayo solomon',
                                  style: AppFonts.heading1.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '09078099974',
                                  style: AppFonts.body1
                                      .copyWith(color: Colors.white),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'Football fanatic',
                                  style: AppFonts.heading1.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Pallete.kPrimaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ClipOval(
                            child: Image.asset(
                              AppImages.person,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          SizedBox(
            height: 16,
          ),
          Text('Interest'),
          SizedBox(
            height: size.height * 0.1,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: interests.length,
                itemBuilder: ((context, i) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        //color: Pallete.kPrimaryColor .withOpacity(0.08),
                        color: Color(0xDCF1F1F1),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.sports),
                            Text(
                              interests[i]['actions'].toString(),
                              style: AppFonts.body1.copyWith(fontSize: 11),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              interests[i]['club'].toString(),
                              style: AppFonts.hintStyle.copyWith(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                })),
          ),

          SizedBox(
            height: 4,
          ),
          SizedBox(
            height: size.height * 0.47,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemCount: activities.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Pallete.whiteColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Manchester united vs sheffield',
                                  style: AppFonts.heading2.copyWith(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      activities[index],
                                      style: AppFonts.body1.copyWith(
                                          color: Colors.orangeAccent,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    activities[index] == 'You liked'
                                        ? Icon(
                                            Icons.favorite_rounded,
                                            color: Colors.redAccent,
                                            size: 12,
                                          )
                                        : Icon(
                                            Icons.chat_rounded,
                                            color: Colors.grey,
                                            size: 12,
                                          )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              width: size.width * 0.8,
                              child: Text(
                                'Lorem ipsum ther rerete uyuyuh uyiyi rwwe uyty rcerw roiouy trrdt qwerty iutre beans tresr stress trewsq point stew reverswx',
                                style: AppFonts.body1.copyWith(
                                  fontSize: 12,
                                  color: Pallete.kGravishColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                })),
          ),
        ]));
  }
}
