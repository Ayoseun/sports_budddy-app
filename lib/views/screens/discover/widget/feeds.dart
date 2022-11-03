import 'package:flutter/material.dart';
import 'package:sportify/constants/app_colors.dart';

import '../../../../constants/app_fonts.dart';

class Feeds extends StatefulWidget {
  const Feeds({
    Key? key,
  }) : super(key: key);

  @override
  State<Feeds> createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  String? dropdownValue;
  List<String> interests = <String>[
    'Football',
    'Basketball',
    'Volleyball',
    'Hockey',
    'PingPong',
    'Table tennis',
   
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.13,
              child: GridView.builder(
                  padding: EdgeInsets.only(
                    top: size.height * 0.02,
                  ),
                  physics: const BouncingScrollPhysics(),
                  itemCount: interests.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 4 / 1.2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                   // final String pref = widget.pickedItems[index];
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color:index==0? Pallete.kPrimaryColor:Pallete.whiteColor,
                        border: Border.all(color:index==0? Color.fromARGB(0, 15, 38, 76):Color(0x2C0F264C)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.20,
                            child: Text(
                              interests[index],
                              style: AppFonts.hintStyle.copyWith(
                                fontSize: 12,
                                color:index==0? Colors.white:Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
