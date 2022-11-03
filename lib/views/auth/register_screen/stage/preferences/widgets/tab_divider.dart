import 'package:flutter/material.dart';

class TabDivider extends StatelessWidget {
  const TabDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      width: size.width * 0.2,
      child: const Divider(
        thickness: 1,
        color: Color(0xFFBBC3C9),
      ),
    );
  }
}
