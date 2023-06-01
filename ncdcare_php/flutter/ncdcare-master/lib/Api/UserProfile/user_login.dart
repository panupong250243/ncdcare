import 'dart:convert';
import 'package:ncdcare/Api/Cache/data.dart';
import 'package:ncdcare/Api/ipcon.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login {
  Future<int> login(
      {required String username, required String password}) async {
    var uri = "$ipcon/user/login.php";
    var request = await http.post(Uri.parse(uri),
        body: {"username": username, "password": password});
    if (request.statusCode == 200) {
      var userId = int.parse(json.decode(request.body));
      if (userId != 0) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setInt("userId", userId);
        cacheUserId = userId;
      }
      return userId;
    } else {
      return 0;
    }
  }

  Future<int> register(
      {required String username,
      required String password,
      String? fullname,
      String? email,
      String? tel}) async {
    var uri = "$ipcon/user/register.php";
    var request = await http.post(Uri.parse(uri), body: {
      "username": username,
      "password": password,
      "fullname": fullname,
      "email": email,
      "tel": tel,
    });
    if (request.statusCode == 200) {
      var userId = json.decode(request.body);
      if (userId != 0) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setInt("userId", userId);
        cacheUserId = userId;
      }
      return userId;
    } else {
      return 0;
    }
  }

  Future<int> forgetPassword({required String username}) async {
    var uri = "$ipcon/user/forgetPassword.php?username=${username}";
    var request = await http.get(Uri.parse(uri));
    if (request.statusCode == 200) {
      return int.parse(json.decode(request.body));
    } else {
      return 0;
    }
  }

  Future<int> checkOTP({required String userId, required String otp}) async {
    var uri = "$ipcon/user/checkOTP.php";
    var request = await http.post(Uri.parse(uri), body: {
      "userId": userId,
      "otp": otp,
    });
    if (request.statusCode == 200) {
      return int.parse(json.decode(request.body));
    } else {
      return 0;
    }
  }

  Future<void> logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }

  Future<int> resetPassword(
      {required String userId, required String newPassword}) async {
    var uri = "$ipcon/user/resetPassword.php";
    var request = await http.post(Uri.parse(uri),
        body: {"user_id": userId, "newpassword": newPassword});
    if (request.statusCode == 200) {
      int userId = int.parse(json.decode(request.body));
      return userId;
    } else {
      return 0;
    }
  }

  Future<int> chagnePassword(
      {required String userId,
      required String oldPassword,
      required String newPassword}) async {
    var uri = "$ipcon/user/chagnePassword.php";
    var request = await http.post(Uri.parse(uri), body: {
      "user_id": userId,
      "user_password": oldPassword,
      "newpassword": newPassword
    });
    if (request.statusCode == 200) {
      int userId = int.parse(json.decode(request.body));
      return userId;
    } else {
      return 0;
    }
  }
}
