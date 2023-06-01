import 'dart:convert';

import 'package:ncdcare/Api/ipcon.dart';
import 'package:http/http.dart' as http;

class Contactus {
  Future<List> getContactus() async {
    var uri = "$ipcon/contactus/getContactus.php";
    var request = await http.post(Uri.parse(uri), body: {});
    if (request.statusCode == 200) {
      return json.decode(request.body);
    } else {
      return [];
    }
  }
}
