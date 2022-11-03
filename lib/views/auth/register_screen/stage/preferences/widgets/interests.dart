import 'package:flutter/material.dart';
import 'package:sportify/views/auth/register_screen/stage/preferences/widgets/personalise_tab.dart';

import '../../../../../../utils/app_utils.dart';


class Interests extends StatefulWidget {
  const Interests({
    Key? key,
  }) : super(key: key);

  @override
  State<Interests> createState() => _InterestsState();
}

class _InterestsState extends State<Interests> {
  List<String> pickedInterests = [];
  List<String> interests = <String>[
    'Football',
    'Basketball',
    'Volleyball',
    'Hockey',
    'PingPong',
    'Table tennis',
    'Running',
    'Rugby',
    'Cricket',
    'Golf'
  ];

  void pickInterest(String? interest) {
    setState(() {
      if (!pickedInterests.contains(interest)) {
        pickedInterests.add(interest!);
      } else {
        AppUtils.showSnackBarMessage('$interest already picked!', context);
      }
    });
  }

  void removeInterest(String? interest) {
    setState(() {
      pickedInterests.remove(interest);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PersonaliseTab(
      title: 'interests',
      items: interests,
      pickedItems: pickedInterests,
      removeSelectedItem: removeInterest,
      addItem: pickInterest,
    );
  }
}
