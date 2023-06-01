import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ncdcare/Api/Advice/advice.dart';
import 'package:ncdcare/Api/emergency/emergency.dart';
import 'package:ncdcare/Api/ipcon.dart';
import 'package:ncdcare/Color/ThemeData.dart';
import 'package:ncdcare/Views/Main/Component/main_app_bar.dart';
import 'package:ncdcare/Views/Main/DataClass/cardclass.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class EmergencyCallPage extends StatefulWidget {
  const EmergencyCallPage({super.key});

  @override
  State<EmergencyCallPage> createState() => _EmergencyCallPageState();
}

class _EmergencyCallPageState extends State<EmergencyCallPage> {
  Future<List<CardClass>> getUserAdvice() async {
    var adviceList = await Advice().getAdvice();
    return adviceList
        .map((e) => CardClass(
            e['adv_name'],
            NetworkImage("$ipcon/../upload/${e['adv_image']}"),
            e['adv_detail']))
        .toList();
  }

  Future<List<CardNumberClass>> getEmergencyNumber() async {
    var EmergencyList = await EmergencyNumber().getEmergency();
    return EmergencyList.map((e) => CardNumberClass(e['em_name'], e['em_tel']))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: MainAppBar().mainAppBar(
            context: context, title: const Text("ฉุกเฉิน"), isBack: true),
        body: Container(
            padding: EdgeInsets.all(25.0),
            child: Material(
              elevation: 9,
              borderRadius: BorderRadius.circular(12),
              child: FutureBuilder<List<CardNumberClass>>(
                  future: getEmergencyNumber(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.separated(
                        separatorBuilder: (context, index) {
                          //<-- SEE HERE
                          return Divider(
                            thickness: 2,
                          );
                        },
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) => ListTile(
                          title: Text(snapshot.data![index].cardtitle,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          subtitle: Text(snapshot.data![index].phonenumber),
                          trailing: Icon(CupertinoIcons.phone_fill_arrow_right),
                          iconColor: Colors.green,
                          onTap: () {
                            _onAlertButtonsPressed(
                                context,
                                snapshot.data![index].cardtitle,
                                snapshot.data![index].phonenumber);
                          },
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
            )));
  }

  _onAlertButtonsPressed(context, String Emername, String EmerTel) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              icon: Icon(
                Icons.warning,
                size: 80,
                color: Color.fromARGB(255, 252, 206, 3),
              ),
              title: Text(
                'คุณแน่ใจที่จะโทรเบอร์นี้ใช่หรือไม่ !',
                style: TextStyle(
                    color: mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              actionsAlignment: MainAxisAlignment.center,
              actions: <Widget>[
                Container(
                  width: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14))),
                    child: const Text(
                      'ตกลง',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      print(EmerTel);
                      _callNumber(EmerTel);
                    },
                  ),
                ),
                Container(
                  width: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14))),
                    child: const Text(
                      'ยกเลิก',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ));
  }

  _callNumber(String phoneNumber) async {
    String number = phoneNumber;
    await FlutterPhoneDirectCaller.callNumber(number);
  }
}
