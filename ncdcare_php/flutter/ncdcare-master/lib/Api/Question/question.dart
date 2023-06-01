import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ncdcare/Api/ipcon.dart';
import 'package:ncdcare/Views/Main/DataClass/disease.dart';

class Question {
  Future<List> getQuestion(
      {required List<String> symbolIdList, required String most}) async {
    var uri = "$ipcon/question/getQuestion.php";
    var request = await http.post(Uri.parse(uri),
        body: {"symbolIdList": symbolIdList.join(","), "most": most});
    if (request.statusCode == 200) {
      return json.decode(request.body);
    } else {
      return [];
    }
  }

  Future<List> getAnswer({required String questionId}) async {
    var uri = "$ipcon/question/getAnswerById.php";
    var request =
        await http.post(Uri.parse(uri), body: {"questionId": questionId});
    if (request.statusCode == 200) {
      return json.decode(request.body);
    } else {
      return [];
    }
  }

  Future<int> saveResult({required AnalyzeResult getResult}) async {
    var uri = "$ipcon/question/saveResult.php";
    var request = await http.post(Uri.parse(uri), body: {});
    if (request.statusCode == 200) {
      return int.parse(json.decode(request.body));
    } else {
      return 0;
    }
  }
}
