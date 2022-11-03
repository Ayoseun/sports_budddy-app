import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import '../constants/resources.dart';
import '../utils/db.dart';

class AuthAPI {
//create a static promise method that ties quesry to api
  static Future registerOTP(otp) async {
    //attach base to quesry
    var registerurl = baseUrl + "/verify_user";
    var id = await showId();
    print(id);
    final encoding = Encoding.getByName('utf-8');
    Map<String, dynamic> body = {
      'id': id,
      'otp': otp,
    };
    String jsonBody = json.encode(body);
    final headers = {'Content-Type': 'application/json'};
    //return parsed api
    return await http.post(
      Uri.parse(registerurl),
      headers: headers,
      encoding: encoding,
      body: jsonBody,
    );
  }

  //create a static promise method that ties quesry to api
  static Future forgot(email) async {
    //attach base to quesry

    var registerurl = baseUrl + "/forgot_password";
    final encoding = Encoding.getByName('utf-8');
    Map<String, dynamic> body = {"email": email};
    String jsonBody = json.encode(body);
    final headers = {'Content-Type': 'application/json'};
    //return parsed api

    print(jsonBody);
    return await http.patch(
      Uri.parse(registerurl),
      headers: headers,
      body: jsonBody,
    );
  }

  //create a static promise method that ties quesry to api
  static Future reset(password) async {
    //attach base to quesry
    var email = await showEmail();
    var registerurl = baseUrl + "/reset_password";
    final encoding = Encoding.getByName('utf-8');
    Map<String, dynamic> body = {
      "password": password,
      "email": email,
      "password_confirm": password
    };
    String jsonBody = json.encode(body);
    final headers = {'Content-Type': 'application/json'};
    //return parsed api
    return await http.post(
      Uri.parse(registerurl),
      headers: headers,
      body: jsonBody,
    );
  }

//create a static promise method that ties quesry to api
  static Future login(email, password) async {
    //attach base to quesry
    var registerurl = baseUrl + "/login";
    final encoding = Encoding.getByName('utf-8');
    Map<String, dynamic> body = {
      'email': email,
      'password': password,
    };
    String jsonBody = json.encode(body);
    final headers = {'Content-Type': 'application/json'};
    //return parsed api
    return await http.post(
      Uri.parse(registerurl),
      headers: headers,
      encoding: encoding,
      body: jsonBody,
    );
  }

  //create a static promise method that ties quesry to api
  static Future signup(email, phone, password) async {
    //attach base to quesry

    var registerurl = baseUrl + "/register";
    final encoding = Encoding.getByName('utf-8');
    Map<String, dynamic> body = {
      'email': email,
      'password': password,
      "phone": phone
    };
    String jsonBody = json.encode(body);
    final headers = {'Content-Type': 'application/json'};
    //return parsed api
    return await http.post(
      Uri.parse(registerurl),
      headers: headers,
      encoding: encoding,
      body: jsonBody,
    );
  }

  //create a static promise method that ties quesry to api
  static Future update(name, surname, username) async {
    //attach base to quesry
    var id =await showId();
     var email =await showEmail();
    var registerurl = baseUrl + "/update_user";
    final encoding = Encoding.getByName('utf-8');
    Map<String, dynamic> body = {
  "id":id,
  "email":email,
  "username":username,
     
      "surname":surname,
      "name": name
    };
    String jsonBody = json.encode(body);
    final headers = {'Content-Type': 'application/json'};
    //return parsed api
    return await http.patch(
      Uri.parse(registerurl),
      headers: headers,
      encoding: encoding,
      body: jsonBody,
    );
  }
}
