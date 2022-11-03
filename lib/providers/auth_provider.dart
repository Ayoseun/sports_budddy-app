import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../constants/resources.dart';
import '../network_manager/api.dart';


class AuthProvider extends ChangeNotifier {


//Login auth provider
  Future<Map<String, dynamic>> login(email, password) async {
    dynamic data;
    notifyListeners();

    try {
      var response = await AuthAPI.login(email, password);
      var responseData = json.decode(response.body);
    
      if (responseData != null) {
        notifyListeners();
       
        data = responseData;
      }
    } catch (e) {
      notifyListeners();
      data = {'error': e};
    }
    return data;
  }

//Forgot password auth provider
  Future<Map<String, dynamic>> forgotPassword(email) async {
    dynamic data;
    notifyListeners();

    try {
      var response = await AuthAPI.forgot(email);
      var responseData = json.decode(response.body);
      print(responseData);
      if (responseData != null) {
        notifyListeners();

        data = responseData;
      }
    } catch (e) {
      notifyListeners();
      data = {'error': e};
    }
    return data;
  }
  //Reset password auth provider
  Future<Map<String, dynamic>> resetPassword(password) async {
    dynamic data;
    notifyListeners();

    try {
      var response = await AuthAPI.reset(password);
      var responseData = json.decode(response.body);
      print(responseData);
      if (responseData != null) {
        notifyListeners();

        data = responseData;
      }
    } catch (e) {
      notifyListeners();
      data = {'error': e};
    }
    return data;
  }





  //Update auth provider
      Future<Map<String, dynamic>> update(name,surname,username) async {
    dynamic data;
    notifyListeners();

    try {
      var response = await AuthAPI.update(name,surname,username);
      var responseData = json.decode(response.body);
      print(responseData);
      if (responseData != null) {
        notifyListeners();
        
        data = responseData;
      }
    } catch (e) {
      notifyListeners();
      data = {'error': e};
    }
    return data;
  }





//Register OTP auth provider
  Future<Map<String, dynamic>> registerOTP(token) async {
    dynamic data;

    notifyListeners();

    try {
      var response = await AuthAPI.registerOTP(token);
      var responseData = json.decode(response.body);
      if (responseData != null) {
        notifyListeners();

        data = responseData;
      }
    } catch (e) {
      notifyListeners();
      data = {'error': e};
    }
    return data;
  }
//Register auth provider
  Future<Map<String, dynamic>> register(email,phone, password) async {
    //top level declaration of data variable
    dynamic data;
    notifyListeners();

    try {
      //Recieve response from the signup API
      var response = await AuthAPI.signup(email,phone, password);
      //decode response body and pass it to responseData variable
      var responseData = json.decode(response.body);
      //check if respnse is not empty then call listener to pass the object response to data
      if (responseData != null) {
        notifyListeners();

        data = responseData;
      } else {
        data = responseData;
      }
    } catch (e) {
      //incase of error in server response throw to data 
      notifyListeners();
      data = {'error': e};
    }
    return data;
  }
}
