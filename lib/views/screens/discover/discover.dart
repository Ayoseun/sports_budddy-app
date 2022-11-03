import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sportify/constants/app_fonts.dart';
import 'package:sportify/constants/app_images.dart';
import 'package:sportify/views/screens/discover/widget/feeds.dart';
import 'package:sportify/views/screens/discover/widget/list_content.dart';

import '../../../constants/app_colors.dart';
import '../../../utils/db.dart';

class Discover extends StatefulWidget {
  Discover({Key? key}) : super(key: key);

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {

    List<String> news = [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
     'assets/images/cover.jpg',
     'assets/images/image1.jpg',
    'assets/images/image1.jpg',
     'assets/images/image1.jpg',
  ];

      var name = '';
  var id = '';
  inituser() async {
    name = await showName();
    id = await showId();
    print(id);
    setState(() {
      name;
      id;
    });
  }
 @override
  void initState() {
    inituser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // transparent status bar
        statusBarIconBrightness: Brightness.dark // dark text for status bar
        ));
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Column(
          children: [

            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Hello',style: AppFonts.body1.copyWith(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500)),SizedBox(width: 8,),Text(name,style: AppFonts.heading1,),
              ],
            ),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Feed',
                  style: AppFonts.heading1.copyWith(color: Pallete.kBlack),
                ),
                Image.asset(
                  AppImages.search,
                  height: 20,
                  color: Pallete.kLightText,
                )
              ],
            ),
            SizedBox(height: size.height * 0.13, child: Feeds()),
            SizedBox(
              height: size.height * 0.6751,
              width: size.width,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int i) {
                    return ListViewContent(
                        image: news[i],
                        name: 'name',
                        sports: 'sports',
                        rating: 'rating');
                  }),
            ),
          ],
        ),
      ),
    ));
  }
}
