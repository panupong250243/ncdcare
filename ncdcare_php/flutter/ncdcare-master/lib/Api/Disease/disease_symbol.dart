import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ncdcare/Api/ipcon.dart';

class DiseaseSymbol {
  Future<List> getAllBodyPart() async {
    var uri = "$ipcon/disease/getAllBodyPart.php";
    var request = await http.post(Uri.parse(uri), body: {});
    if (request.statusCode == 200) {
      return json.decode(request.body);
    } else {
      return [];
    }
  }

  Future<List> getSymbolByBodyPart(
      {required String bodyPartId, required String search}) async {
    var uri = "$ipcon/disease/getSymbolByBodyPart.php";
    var request = await http.post(Uri.parse(uri),
        body: {"bodyPartId": bodyPartId, "search": search});
    if (request.statusCode == 200) {
      return json.decode(request.body);
    } else {
      return [];
    }
  }
}
