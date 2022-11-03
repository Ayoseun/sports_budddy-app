import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sportify/constants/app_colors.dart';
import '../../../../../constants/app_fonts.dart';
import 'widgets/interests.dart';
import 'widgets/tab_circle.dart';
import 'widgets/tab_divider.dart';


class CreatePreferenceScreen extends StatefulWidget {
  const CreatePreferenceScreen({Key? key}) : super(key: key);

  @override
  _CreatePreferenceScreenState createState() => _CreatePreferenceScreenState();
}

class _CreatePreferenceScreenState extends State<CreatePreferenceScreen>
    with SingleTickerProviderStateMixin {
      //initialize controller
  late TabController _tabController;
  //set item count number to begin from 0
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 1);

    //set tabcontroller listener to current index
    _tabController.addListener(() {
      setState(() {
        _currentIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final preferences = PreferenceList.prefs;
    // final preferences = PreferenceList.prefs;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.06,
                ),
                Text(
                  'Let’s personalize your \nSportify profile',
                  style: AppFonts.coloredHeading,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(
                  'This is the begining of your Sportify experience.',
                  style: AppFonts.body1,
                ),
                SizedBox(
                  height: size.height * 0.06,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.18),
                  child: Row(
                    children: [
                      const TabDivider(),
                      TabCircle(
                          borderColor: _currentIndex == 0
                              ? Pallete.kPrimaryColor
                              : const Color(0xFFBBC3C9)),
                      const TabDivider(),
                     
                    ],
                  ),
                ),
                DefaultTabController(
                  initialIndex: 0,
                  length: 1,
                  // animationDuration: const Duration(seconds: 1),
                  child: Container(
                    height: size.height * 0.8,
                    width: size.width,
                    alignment: Alignment.center,
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      appBar: AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        toolbarHeight: 0,
                        automaticallyImplyLeading: false,
                        bottom: TabBar(
                          padding: EdgeInsets.zero,
                          controller: _tabController,
                          indicatorColor: Colors.white,
                          labelColor: Pallete.kPrimaryColor,
                          unselectedLabelColor: const Color(0xFFBBC3C9),
                          // isScrollable: true,
                          tabs: <Widget>[
                            Tab(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  'Interests',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                      body: TabBarView(
                        controller: _tabController,
                        children: const <Widget>[
                          Interests(),
                          
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
