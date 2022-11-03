import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';





class CustomButton extends StatelessWidget {
  final String text;
  final Function() onpressed;
  final double? width;
  final double? height;
  final Color? color;
  final Color? textColor;
  final FontWeight? fontWeight;
  final Color? borderColor;
  final Widget? icon;
  final bool isOutline;
  final double? fontSize;
  final bool enabled;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onpressed,
    this.fontSize,
    this.width,
    this.height,
    this.isOutline = false,
    this.icon,
    this.color,
    this.textColor,
    this.fontWeight,
    this.borderColor = Pallete.kPrimaryColor,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: width ?? size.width * 0.9,
      child: MaterialButton(
        elevation: 0,
        height: height,
        minWidth: width,
        color: !enabled
            ? const Color.fromRGBO(0, 66, 105, 0.07)
            : isOutline
                ? Colors.white
                : color ?? Pallete.kPrimaryColor,
        splashColor: Colors.white10,
        shape: RoundedRectangleBorder(
            side: isOutline ? BorderSide(color: borderColor!) : BorderSide.none,
            borderRadius: BorderRadius.circular(8)),
        onPressed: onpressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null ? icon! : const SizedBox(),
            SizedBox(width: 10),
            Text(text,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: fontSize ?? 16,
                    fontWeight: fontWeight ?? FontWeight.normal,
                    color: !enabled
                        ? Colors.black
                        : isOutline
                            ? textColor
                            : Colors.white,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}



class BackButtonWithHeader extends StatelessWidget {
  final String text;

  const BackButtonWithHeader({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 0.5, color: Pallete.khint)),
            child: const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.arrow_back_ios,
                size: 18,
                color: Pallete.kText,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 32.0),
          child: Text(text,
              textAlign: TextAlign.center,
              style:
                  AppFonts.body1.copyWith(fontSize: 16, color: Pallete.kBlack)),
        ),
        Text('')
      ]),
    );
  }
}

class ButtonWithFuction extends StatelessWidget {
  const ButtonWithFuction({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  //this calls the onpressed widget
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: OutlinedButton(
            child: Text(
              text,
            ),
            style: OutlinedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(3))),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                primary: Colors.white,
                backgroundColor: Pallete.kPrimaryColor,
                shadowColor: Pallete.kLightText,
                elevation: 0,
                textStyle:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
            onPressed: onPressed));
  }
}
