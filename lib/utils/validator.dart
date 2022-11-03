import 'package:email_validator/email_validator.dart';

class Validators {
  static RegExp numReg = RegExp(r".*[0-9].*");
  static RegExp letterReg = RegExp(r".*[A-Z].*");
  static RegExp specialReg = RegExp(r".*[@#\$&].*");


static String? passwordValidator(value){

bool passValid = RegExp("^(?=.{8,32}\$)(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$%^&*(),.?:{}|<>]).*").hasMatch(value);
 
if (value.isEmpty ){
   return 'Password cannot be empty';
}


if(!passValid) 
 {
 return 'Password must contain atleast\n1 capital letter(A-Z)\n1 small letter(a-z)\n1 numbers(0-9)\na special characters (_#\$...)';
 }
 if (value.length < 8){
   return 'Password must be 8 characters long';
}
}




  static String? emailValidator(value) {
    if (value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return 'Invalid Email';
    }
    return null;
  }
  static String? nameValidator(value) {
    if (value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }
static String? surnameValidator(value) {
    if (value.isEmpty) {
      return 'Please enter your surname';
    }
    return null;
  }
  bool emailCheck(value) {
    bool isValid = true;

//declare a test case boolean, set it to false
    isValid = EmailValidator.validate(value);
    String correct = "";
    if (isValid) {
      return true;
    }
    return false;
  }
}
