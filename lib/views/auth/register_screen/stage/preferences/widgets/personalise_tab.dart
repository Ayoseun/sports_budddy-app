import 'package:flutter/material.dart';

import '../../../../../../components/buttons.dart';
import '../../../../../../constants/app_fonts.dart';
import '../../../../../../constants/app_routes.dart';

class PersonaliseTab extends StatefulWidget {
  const PersonaliseTab({
    Key? key,
    required this.items,
    required this.pickedItems,
    required this.removeSelectedItem,
    required this.addItem,
    required this.title,
  }) : super(key: key);

  final List<String> pickedItems;
  final List<String> items;
  final Function(String?)? removeSelectedItem;
  final Function(String?)? addItem;
  final String title;

  @override
  State<PersonaliseTab> createState() => _PersonaliseTabState();
}

class _PersonaliseTabState extends State<PersonaliseTab> {
  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.03),
      child: Column(
        children: [
          Text(
            'Please set up your ${widget.title} in a few simple steps',
            style: AppFonts.body1
                .copyWith(fontWeight: FontWeight.w600, fontSize: 13),
          ),
          SizedBox(
            height:
                size.height * ((widget.pickedItems.length / 3).ceil() * 0.065),
            child: GridView.builder(
                padding: EdgeInsets.only(
                  top: size.height * 0.02,
                ),
                physics: const BouncingScrollPhysics(),
                itemCount: widget.pickedItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 4 / 1.2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final String pref = widget.pickedItems[index];
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFF0F264C)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.20,
                          child: Text(
                            pref,
                            style: AppFonts.hintStyle.copyWith(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        InkWell(
                          onTap: () => widget.removeSelectedItem!(pref),
                          child: const Icon(
                            Icons.clear_outlined,
                            size: 13,
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
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: const Color.fromRGBO(0, 66, 105, 0.28),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                hint: Text('Find more ${widget.title}',
                    style: AppFonts.hintStyle),
                value: dropdownValue,
                icon: const Icon(Icons.keyboard_arrow_down_outlined),
                elevation: 16,
                isExpanded: true,
                autofocus: true,
                style: AppFonts.body1,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                    widget.addItem!(newValue);
                  });
                },
                items:
                    widget.items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),

          SizedBox(
            height: size.height * 0.08,
          ),
          //custom buttom to get user input data
          CustomButton(
            text: 'Next',
            onpressed: () {
              //navigate user to homescreen
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(AppRoutes.navbar, (route) => false);
            },
          ),
          SizedBox(
            height: size.height * 0.04,
          ),

          // this is for the user to skip
           //navigate user to homescreen
          GestureDetector(
            onTap: () => Navigator.of(context)
                .pushNamedAndRemoveUntil(AppRoutes.navbar, (route) => false),
            child: Text('Skip, continue later',
                style: AppFonts.body1.copyWith(fontSize: 16)),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
        ],
      ),
    );
  }
}
