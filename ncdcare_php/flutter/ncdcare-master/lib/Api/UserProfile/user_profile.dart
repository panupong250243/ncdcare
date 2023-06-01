import 'dart:convert';
import 'dart:io';

import 'package:ncdcare/Api/ipcon.dart';
import 'package:http/http.dart' as http;
import 'package:ncdcare/Views/Main/Component/suggestion_page.dart';

class Profile {
  Future<Map<String, dynamic>> getUserProfile(
      {String? userId = "", String? username = ""}) async {
    var uri = "$ipcon/user/getProfile.php";
    var request = await http
        .post(Uri.parse(uri), body: {"user_id": userId, "username": username});
    if (request.statusCode == 200) {
      return json.decode(request.body);
    } else {
      return {};
    }
  }

  Future<int> editProfile(
      {required String userId,
      required String userFullname,
      required String userGender,
      required String userEmail,
      required String userTel}) async {
    var uri = "$ipcon/user/editProfile.php";
    var request = await http.post(Uri.parse(uri), body: {
      "user_id": userId,
      "user_fullname": userFullname,
      "user_gender": userGender,
      "user_email": userEmail,
      "user_tel": userTel
    });
    if (request.statusCode == 200) {
      return int.parse(json.decode(request.body));
    } else {
      return 0;
    }
  }

  Future<int> editProfileImage(
      {required String userId, required File image}) async {
    var uri = "$ipcon/user/editProfileImage.php";
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    var img = await http.MultipartFile.fromPath('img', image.path);
    request.files.add(img);
    request.fields['user_id'] = userId;
    var response = await request.send();
    if (response.statusCode == 200) {
      int userId = 0;
      await response.stream.transform(utf8.decoder).listen((value) {
        userId = int.parse(json.decode(value));
      }).asFuture();
      return userId;
    } else {
      return 0;
    }
  }

  Future<int> suggestion(
      {required String sugDetail,
      required String sugRating,
      required String userId}) async {
    var uri = "$ipcon/user/suggestion.php";
    var request = await http.post(Uri.parse(uri), body: {
      "sug_rate": sugRating,
      "sug_detail": sugDetail,
      "user_id": userId,
    });
    if (request.statusCode == 200) {
      var sugId = json.decode(request.body);
      return sugId;
    } else {
      return 0;
    }
  }
}
