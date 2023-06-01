import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:ncdcare/Api/Cache/data.dart';
import 'package:ncdcare/Api/ipcon.dart';
import 'package:ncdcare/Views/Main/DataClass/questionclass.dart';

class Disease {
  Future<List> getDiseaseInfo() async {
    var uri = "$ipcon/disease/getDiseaseInfo.php";
    var request = await http.post(Uri.parse(uri), body: {});
    if (request.statusCode == 200) {
      return json.decode(request.body);
    } else {
      return [];
    }
  }

  Future getDiseaseFunction({required List<String> diseaseId}) async {
    var uri = "$ipcon/disease/getDiseaseFunction.php";
    var request = await http
        .post(Uri.parse(uri), body: {"diseaseId": diseaseId.join(",")});
    if (request.statusCode == 200) {
      return json.decode(request.body);
    } else {
      return [];
    }
  }

  Future<List> getAddFootImageId({required List<String> diseaseId}) async {
    var uri = "$ipcon/disease/getAddFootImageId.php";
    var request = await http
        .post(Uri.parse(uri), body: {"diseaseId": diseaseId.join(",")});
    if (request.statusCode == 200) {
      return json.decode(request.body);
    } else {
      return [];
    }
  }

  Future<int> saveResult({required ResultSaver data, int? imageResult}) async {
    var uri = "$ipcon/disease/saveResult.php";
    var request = await http.post(Uri.parse(uri), body: {
      "age": data.age != null ? data.age.toString() : "0",
      "height": data.appearance.height != null
          ? data.appearance.height.toString()
          : "0",
      "weight": data.appearance.weight != null
          ? data.appearance.weight.toString()
          : "0",
      "symptomList": data.symptomList.map((e) => e.symbolId).toList().join(","),
      "diseaseId": data.result.map((e) => e.diseaseId).toList().join(","),
      "score": data.result.map((e) => e.score).toList().join(","),
      "userId": cacheUserId.toString(),
      "imageResult": imageResult != null ? imageResult.toString() : "0"
    });
    if (request.statusCode == 200) {
      return int.parse(json.decode(request.body));
    } else {
      return 0;
    }
  }

  Future<int> runTestFootImage(
      {required File image, required String diseaseId}) async {
    var uri = "$ipcon/disease/runTestFootImage.php";
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    var img = await http.MultipartFile.fromPath('img', image.path);
    request.files.add(img);
    request.fields['user_id'] = cacheUserId.toString();
    request.fields['disease_id'] = diseaseId;
    var response = await request.send();
    if (response.statusCode == 200) {
      int id = 0;
      await response.stream.transform(utf8.decoder).listen((value) {
        id = int.parse(json.decode(value));
      }).asFuture();
      return id;
    } else {
      return 0;
    }
  }

  Future<List> getResultHistory() async {
    var uri = "$ipcon/disease/getResultHistory.php";
    var request = await http
        .post(Uri.parse(uri), body: {"userId": cacheUserId.toString()});
    if (request.statusCode == 200) {
      return json.decode(request.body);
    } else {
      return [];
    }
  }

  Future<List> getSymbolList({required List<String> symbolId}) async {
    var uri = "$ipcon/disease/getSymbolList.php";
    var request =
        await http.post(Uri.parse(uri), body: {"symbolId": symbolId.join(",")});
    print("test : " + request.body);
    if (request.statusCode == 200) {
      return json.decode(request.body);
    } else {
      return [];
    }
  }

  Future<List> getResultHistoryDetail({required String resultId}) async {
    var uri = "$ipcon/disease/getResultHistoryDetail.php";
    var request = await http.post(Uri.parse(uri), body: {"resultId": resultId});
    if (request.statusCode == 200) {
      return json.decode(request.body);
    } else {
      return [];
    }
  }
}
