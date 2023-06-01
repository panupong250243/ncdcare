import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ncdcare/Api/ipcon.dart';

class EmergencyNumber {
  Future<List> getEmergency() async {
    var uri = "$ipcon/emergency/getEmergency.php";
    var request = await http.post(Uri.parse(uri), body: {});
    if (request.statusCode == 200) {
      return json.decode(request.body);
    } else {
      return [];
    }
  }
}
