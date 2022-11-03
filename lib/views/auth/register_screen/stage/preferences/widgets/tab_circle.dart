import 'package:flutter/material.dart';

class TabCircle extends StatelessWidget {
  const TabCircle({
    Key? key,
    required this.borderColor,
  }) : super(key: key);

  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 4,
          color: borderColor,
        ),
      ),
    );
  }
}
