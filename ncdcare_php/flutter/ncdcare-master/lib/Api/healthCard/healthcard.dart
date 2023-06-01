import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ncdcare/Api/Cache/data.dart';
import 'package:ncdcare/Api/ipcon.dart';

class HealthCard {
  Future<List> getAllergy() async {
    var uri = "$ipcon/healthcard/getAllergy.php";
    var request = await http
        .post(Uri.parse(uri), body: {"user_id": cacheUserId.toString()});
    if (request.statusCode == 200) {
      return json.decode(request.body);
    } else {
      return [];
    }
  }

  Future<List> getAdisease() async {
    var uri = "$ipcon/healthcard/getAdisease.php";
    var request = await http
        .post(Uri.parse(uri), body: {"user_id": cacheUserId.toString()});
    if (request.statusCode == 200) {
      return json.decode(request.body);
    } else {
      return [];
    }
  }

  Future<int> addAllergy(
      {required String al_name, required String al_symptom}) async {
    var uri = "$ipcon/healthcard/insertAllergy.php";
    var request = await http.post(Uri.parse(uri), body: {
      "al_name": al_name.toString(),
      "al_symptom": al_symptom.toString(),
      "user_id": cacheUserId.toString(),
    });
    if (request.statusCode == 200) {
      var allergyId = json.decode(request.body);
      return allergyId;
    } else {
      return 0;
    }
  }

  Future<int> addAdisease(
      {required String adis_name, required String adis_detail}) async {
    var uri = "$ipcon/healthcard/insertAdisease.php";
    var request = await http.post(Uri.parse(uri), body: {
      "adis_name": adis_name.toString(),
      "adis_detail": adis_detail.toString(),
      "user_id": cacheUserId.toString(),
    });
    if (request.statusCode == 200) {
      var adiseaseId = json.decode(request.body);
      return adiseaseId;
    } else {
      return 0;
    }
  }
}
