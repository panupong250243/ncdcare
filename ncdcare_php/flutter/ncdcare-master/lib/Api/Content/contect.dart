import 'dart:convert';

import 'package:ncdcare/Api/ipcon.dart';
import 'package:http/http.dart' as http;

class Contect {
  Future<List> recomContect() async {
    var uri = "$ipcon/contect/recom_contect.php";
    var request = await http.post(Uri.parse(uri), body: {});
    if (request.statusCode == 200) {
      return json.decode(request.body);
    } else {
      return [];
    }
  }

  Future<List> allContect() async {
    var uri = "$ipcon/contect/all_contect.php";
    var request = await http.post(Uri.parse(uri), body: {});
    if (request.statusCode == 200) {
      return json.decode(request.body);
    } else {
      return [];
    }
  }
}
