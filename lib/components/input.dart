import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';
import 'package:flutter/gestures.dart';



class textspan extends StatelessWidget {
  /*
  variables to hold the strings*/
  final String text;
  final String text2;
  final String text3;
  //this calls the onpressed widget
  final Widget onPressed;
  //this is to set color
  final Color color;
  //here we pass the sttring to the constructor
  textspan(
    this.color,
    this.onPressed,
    this.text,
    this.text2,
    this.text3,
  );

  @override
  Widget build(BuildContext context) {
    //this class returns a Richtext widget
    return Padding(
      padding: const EdgeInsets.only(top: 2.0),
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: text,
              style: TextStyle(color: Pallete.kBlack),
            ),
            TextSpan(
                text: text2,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                    color: color),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => onPressed));
                  }),
            TextSpan(
                text: text3,
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    decoration: TextDecoration.none,
                    fontSize: 12,
                    color: Color(0xFF000066),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    onPressed;
                  }),
          ],
        ),
      ),
    );
    ;
  }
}


class CustomTextSpan extends StatelessWidget {
  /*
  variables to hold the strings*/
  final String text;
  final String text2;
  final String text3;
  //this calls the onpressed widget
  final Widget onPressed;
  //this is to set color
  final Color color;
  //here we pass the sttring to the constructor
  CustomTextSpan(
    this.color,
    this.onPressed,
    this.text,
    this.text2,
    this.text3,
  );

  @override
  Widget build(BuildContext context) {
    //this class returns a Richtext widget
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Flexible(
        child: RichText(
          softWrap: true,
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: text,
                style: TextStyle(color: Pallete.kBlack),
              ),
              TextSpan(
                  text: text2,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      decoration: TextDecoration.none,
                      fontSize: 12,
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  /* style: TextStyle(
                    fontSize: 12,
                  
                    overflow: TextOverflow.ellipsis,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                      color: color),*/
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => onPressed));
                    }),
              TextSpan(
                  text: text3,
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      overflow: TextOverflow.fade,
                      decoration: TextDecoration.none,
                      fontSize: 12,
                      color: Pallete.kText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      onPressed;
                    }),
            ],
          ),
        ),
      ),
    );
    ;
  }
}


class CustomInput2 extends StatelessWidget {
  final String? hint;
  final String? label;
  final String? error;
  final String? description;
  final String? type;
  final String? value;
  final Color? color;
  final Widget? suffixIcon;
  final bool? enabled;
  final bool? obsecure;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;

  const CustomInput2(
      {Key? key,
      this.hint,
      this.color,
      this.label,
      this.error,
      this.description,
      this.value,
      this.suffixIcon,
      this.enabled,
      this.obsecure = false,
      this.onSaved,
      this.onChanged,
      this.validator,
      this.type})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      //enabled: enabled,
      //autofocus: false,
      validator: validator,
      onChanged: onChanged,
     
      keyboardType: type == 'number'
          ? const TextInputType.numberWithOptions(signed: true, decimal: true)
          : TextInputType.emailAddress,
     // maxLength: type == 'number' ? 13 : 100,
      // controller: passwordController,
    //  textInputAction: TextInputAction.next,
      //obscure text will hide the text
      obscureText: obsecure!,
      //enableSuggestions: false,
//autocorrect: false,
      // controller: passwordController,
//autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Color.fromARGB(255, 87, 87, 87))),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color.fromARGB(255, 176, 176, 176))),
        labelText: label,
        suffixIcon: suffixIcon,
        //errorMaxLines: 1,
        errorText: error,
        errorStyle: AppFonts.hintStyle.copyWith(fontSize: 12,color: Color.fromARGB(255, 193, 7, 7)),
        hintText: hint,
        hintStyle: AppFonts.hintStyle.copyWith(fontSize: 12,color: Pallete.khint),
        labelStyle: AppFonts.hintStyle.copyWith(fontSize: 12,color: Color.fromARGB(255, 160, 160, 160)),

        //obscure text will hide the text
      ),
    );
  }
}

class CustomInput extends StatelessWidget {
  final String? hint;
  final String? label;
  final String? description;
  final String? type;
  final String? value;
  final Widget? suffixIcon;
  final bool? enabled;
  final bool? obsecure;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;

  const CustomInput(
      {Key? key,
      this.hint,
      this.label,
      this.description,
      this.value,
      this.suffixIcon,
      this.enabled,
      this.obsecure = false,
      required this.onSaved,
      this.onChanged,
      this.validator,
      this.type})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            style: AppFonts.labelStyle,
          ),
        SizedBox(
          height: 8,
        ),
        TextFormField(
          keyboardType: type == 'number'
              ? const TextInputType.numberWithOptions(
                  signed: true, decimal: true)
              : TextInputType.emailAddress,
          maxLength: type == 'number' ? 13 : 100,
          // inputFormatters: [
          //   // if (label == "Amount") ThousandsFormatter(),
          //   // if (type == 'number')
          //   //   FilteringTextInputFormatter.allow(RegExp('^[0-9,-]*\$')),
          // ],

          initialValue: value,
          enabled: enabled,
          obscureText: obsecure!,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            errorMaxLines: 1,
            hintText: hint,
            suffixIcon: suffixIcon,
            hintStyle: AppFonts.hintStyle.copyWith(color: Pallete.khint),
            // errorBorder: AppInput.errorBorder,
            errorStyle: AppFonts.errorStyle,
            counterText: '',
            // focusedErrorBorder: AppInput.focusedBorder,
            // focusedBorder: AppInput.focusedBorder,
            //border: AppInput.border,
          ),
          validator: validator,
          onSaved: onSaved,
          onChanged: onChanged,
        ),
        if (description != null)
          Text(
            description!,
            style: AppFonts.body3,
          ),
      ],
    );
  }
}

class ThousandsFormatter {}
