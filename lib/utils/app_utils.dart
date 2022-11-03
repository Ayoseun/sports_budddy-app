import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';
import '../shared/loader.dart';







class AppUtils {

  //   static void showIDLoader(context) {
  //   showDialog(
  //     context: context,
  //     builder: (ctx) => IDPopup(),
  //   );
  // }
  static dynamic ErrorDialog(
    BuildContext context,
    String titleText,
    String contentText,
    String cancelText,
  ) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(
        cancelText,
        style: AppFonts.dialogColoredText
            .copyWith(color: Pallete.kBlack, fontSize: 12),
      ),
      onPressed: () => Navigator.of(context).pop(),
    );

    // title
    Widget title = Center(
      child: Text(
        titleText,
        style:AppFonts.dialogColoredText.copyWith(
          fontWeight: FontWeight.w600,
color: Pallete.kPrimaryColor,
          fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );

    // content
    Widget content = Text(
      contentText,
      style: AppFonts.body1.copyWith(fontSize: 13),
      textAlign: TextAlign.center,
    );

    // set up the AlertDialog
    dynamic alert = Platform.isIOS
        ? CupertinoAlertDialog(
            title: title,
            content: content,
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  cancelButton,
                ],
              )
            ],
          )
        : AlertDialog(
            title: title,
            content: content,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(14),
              ),
            ),
            backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  cancelButton,
                ],
              )
            ],
          );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static dynamic showAlertDialog(
    BuildContext context,
    String titleText,
    String contentText,
    String confirmText,
    String cancelText,
    Function() confirmFunction,
  ) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(
        cancelText,
        style: AppFonts.dialogColoredText
            .copyWith(color: Pallete.kText, fontSize: 12),
      ),
      onPressed: () => Navigator.of(context).pop(),
    );

    Widget confirmButton = TextButton(
      child: Text(
        confirmText,
        style: AppFonts.dialogColoredText.copyWith(
            fontWeight: FontWeight.w600, color: Pallete.kPrimaryColor),
      ),
      onPressed: confirmFunction,
    );

    // title
    Widget title = Center(
      child: Text(
        titleText,
        style: AppFonts.dialogColoredText.copyWith(
          fontWeight: FontWeight.w600,
color: Pallete.kPrimaryColor,
          fontSize: 16,
        ),
        textAlign: TextAlign.center,
      ),
    );

    // content
    Widget content = Text(
      contentText,
      style: AppFonts.body1.copyWith(fontSize: 13),
      textAlign: TextAlign.center,
    );

    // set up the AlertDialog
    dynamic alert = Platform.isIOS
        ? CupertinoAlertDialog(
            title: title,
            content: content,
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  cancelButton,
                  confirmButton,
                ],
              )
            ],
          )
        : AlertDialog(
            title: title,
            content: content,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(14),
              ),
            ),
            backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  cancelButton,
                  confirmButton,
                ],
              )
            ],
          );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }





  static dynamic showWarningDialog(
    BuildContext context,
    Widget icon,
    String contentText,
    String confirmText,
    String cancelText,
    Function() confirmFunction,
  ) {
    // set up the buttons
    Widget cancelButton = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 16),
      child: OutlinedButton(
          child: Text(
            'Close',
            style: AppFonts.body1.copyWith(color: Colors.white,fontSize: 14),
          ),
          style: OutlinedButton.styleFrom(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            padding: EdgeInsets.symmetric(vertical: 16),
            primary: Colors.white,
            backgroundColor: Pallete.kPrimaryColor,
           
            textStyle: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          onPressed:()=> Navigator.of(context).pop()
    ));

    Widget confirmButton =
      GestureDetector(
        onTap: confirmFunction,
        child: Text(
          confirmText,
          style: AppFonts.body1.copyWith(
        ),
      
      
    ));

    // title
   

    // content
    Widget content = Text(
      contentText,
      style: AppFonts.body1.copyWith(fontSize: 12,color: Colors.black),
      textAlign: TextAlign.center,

    );

    // set up the AlertDialog
    dynamic alert = Platform.isIOS
        ? CupertinoAlertDialog(
            
           // content: content,
            actions: [
              Column(
            
                children: [
                  SizedBox(height: 8,),
                  icon, SizedBox(height: 24,),
                  content,
                  SizedBox(height: 24,),
                  cancelButton,
                  SizedBox(height: 8,),
                  confirmButton,
                  SizedBox(height: 16,),
                ],
              )
            ],
          )
        : AlertDialog(
           
            //content: content,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(14),
              ),
            ),
            backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
            actions: [
              Column(
            
                children: [
                  SizedBox(height: 8,),
                  icon, SizedBox(height: 24,),
                  content,
                  SizedBox(height: 24,),
                  cancelButton,
                  SizedBox(height: 8,),
                  confirmButton,
                  SizedBox(height: 16,),
                ],
              )
            ],
          );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }











  static dynamic showSingleDialog(
    BuildContext context,
    Widget icon,
    String contentText,
    String confirmText,
    String cancelText,
    Function() confirmFunction,
  ) {
    // set up the buttons
    Widget cancelButton = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 16),
      child: OutlinedButton(
          child: Text(
            'Loading....',
            style: AppFonts.body1.copyWith(color: Colors.white,fontSize: 14),
          ),
          style: OutlinedButton.styleFrom(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            padding: EdgeInsets.symmetric(vertical: 16),
            primary: Colors.white,
            backgroundColor: Pallete.kPrimaryColor,
           
            textStyle: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          onPressed:()=> Navigator.of(context).pop()
    ));

    Widget confirmButton =
      GestureDetector(
        onTap: confirmFunction,
        child: Text(
          confirmText,
          style: AppFonts.body1.copyWith(
        ),
      
      
    ));

    // title
   

    // content
    Widget content = Text(
      contentText,
      style: AppFonts.body1.copyWith(fontSize: 12,color: Colors.black),
      textAlign: TextAlign.center,

    );

    // set up the AlertDialog
    dynamic alert = Platform.isIOS
        ? CupertinoAlertDialog(
            
           // content: content,
            actions: [
              Column(
            
                children: [
                  SizedBox(height: 8,),
                  icon, SizedBox(height: 24,),
                  content,
                  SizedBox(height: 24,),
                  cancelButton,
                  SizedBox(height: 8,),
                  confirmButton,
                  SizedBox(height: 16,),
                ],
              )
            ],
          )
        : AlertDialog(
           
            //content: content,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(14),
              ),
            ),
            backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
            actions: [
              Column(
            
                children: [
                  SizedBox(height: 8,),
                  icon, SizedBox(height: 24,),
                  content,
                  SizedBox(height: 24,),
                  cancelButton,
                  SizedBox(height: 8,),
                  confirmButton,
                  SizedBox(height: 16,),
                ],
              )
            ],
          );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

 

  static bool checkValidEmail(value) {
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return true;
    } else {
      return false;
    }
  }

  static void showLoader(context) {
    showDialog(
      context: context,
      builder: (ctx) => const Loader(),
    );
  }
   
  static void showSnackBarMessage(String message, BuildContext context) {
    final snackBar = SnackBar(
      elevation: 2,
      content: Text(message,
          style: const TextStyle(
              fontFamily: "AccordAlternate", color: Colors.white),
          textAlign: TextAlign.center),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.black54,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}
