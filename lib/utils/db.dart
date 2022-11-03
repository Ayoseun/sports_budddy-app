import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences s_prefs;

saveToken(token) async {
  s_prefs = await SharedPreferences.getInstance();
  s_prefs.setString("token", token);
}


saveEmail(email) async {
  s_prefs = await SharedPreferences.getInstance();
  s_prefs.setString("email", email);
}


saveName(name) async {
  s_prefs = await SharedPreferences.getInstance();
  s_prefs.setString("name", name);
}


saveSurname(surname) async {
  s_prefs = await SharedPreferences.getInstance();
  s_prefs.setString("surname", surname);
}


saveUsername(surname) async {
  s_prefs = await SharedPreferences.getInstance();
  s_prefs.setString("surname", surname);
}


savePhone(phone) async {
  s_prefs = await SharedPreferences.getInstance();
  s_prefs.setString("phone", phone);
}


saveId(id) async {
  s_prefs = await SharedPreferences.getInstance();
  s_prefs.setString("id", id);
}

showToken() async {
  s_prefs = await SharedPreferences.getInstance();

  String? temp = s_prefs.getString("token");

  return temp;
}


showUsername() async {
  s_prefs = await SharedPreferences.getInstance();

  String? temp = s_prefs.getString("token");

  return temp;
}

showEmail() async {
  s_prefs = await SharedPreferences.getInstance();

  String? temp = s_prefs.getString("email");

  return temp;
}


showName() async {
  s_prefs = await SharedPreferences.getInstance();

  String? temp = s_prefs.getString("name");

  return temp;
}


showSurname() async {
  s_prefs = await SharedPreferences.getInstance();

  String? temp = s_prefs.getString("surname");

  return temp;
}


showPhone() async {
  s_prefs = await SharedPreferences.getInstance();

  String? temp = s_prefs.getString("phone");

  return temp;
}

showId() async {
  s_prefs = await SharedPreferences.getInstance();

  String? temp = s_prefs.getString("id");

  return temp;
}

delete_Shared_Preferences() async {
  s_prefs = await SharedPreferences.getInstance();
  s_prefs.remove("email");
   s_prefs.remove("id");
    s_prefs.remove("token");
     s_prefs.remove("phone");
      s_prefs.remove("name");

  //temp = " ";
}

class Storage {
  static Future balance(String Save) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('balance', Save);
    // print('object');
  }

  static Future<dynamic> getAlreadyAUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? value = prefs.getBool('alreadyAUser');
    return value;
  }

  addIntToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('intValue', 123);
  }

  static Future oneTime<int>() async {
    var once = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('intValue', once);
    if (once == 0) {
      prefs.setInt('intValue', once);
    } else {
      return once;
    }
  }

  addDoubleToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('doubleValue', 115.0);
  }

  static Future<dynamic> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    dynamic tokenMap = token == null ? 'null' : jsonDecode(token) as dynamic;
    return tokenMap;
  }

  static Future<bool> setToken(dynamic token) async {
    var commit = false;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', jsonEncode(token));
    commit = true;
    return commit;
  }

  static void removeToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }

  addBoolToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('boolValue', true);
  }

  static getBalance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? stringValue = prefs.getString('balance');
    return stringValue!;
  }

  getBoolValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    bool? boolValue = prefs.getBool('boolValue');
    return boolValue;
  }

  getIntValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return int
    int? intValue = prefs.getInt('intValue');
    return intValue;
  }

  getDoubleValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return double
    double? doubleValue = prefs.getDouble('doubleValue');
    return doubleValue;
  }
}

class IsFirstTime {
  Future<int> getOnce() async {
    int? intValue;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String

    if (prefs.getInt("initScreen") == null) {
      intValue = 0;
    } else {
      intValue = prefs.getInt("initScreen");
    }

    return intValue!;
  }

  Future once(int num) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //initScreen
    await prefs.setInt("initScreen", num);

    int initScreen = (prefs.getInt("initScreen"))!;
    print('initScreen ${initScreen}');
    // return initScreen;
  }
}
