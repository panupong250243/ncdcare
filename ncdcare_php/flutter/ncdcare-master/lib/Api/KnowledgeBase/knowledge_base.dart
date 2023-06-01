import 'dart:convert';

import 'package:ncdcare/Api/ipcon.dart';
import 'package:http/http.dart' as http;

class KnowledgeBase {
  Future<List> getKnowledgeBase() async {
    var uri = "$ipcon/knowledgebase/getKnowledgeBase.php";
    var request = await http.post(Uri.parse(uri), body: {});
    if (request.statusCode == 200) {
      return json.decode(request.body);
    } else {
      return [];
    }
  }
}
