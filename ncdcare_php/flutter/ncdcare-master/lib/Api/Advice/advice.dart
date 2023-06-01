import 'dart:convert';

import 'package:ncdcare/Api/Cache/data.dart';
import 'package:ncdcare/Api/ipcon.dart';
import 'package:http/http.dart' as http;

class Advice {
  Future<List> getAdvice() async {
    var uri = "$ipcon/advice/getAdvice.php";
    var request = await http.post(Uri.parse(uri), body: {});
    if (request.statusCode == 200) {
      return json.decode(request.body);
    } else {
      return [];
    }
  }
}
