// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ncdcare/Api/healthCard/healthcard.dart';
import 'package:ncdcare/Color/ThemeData.dart';
import 'package:ncdcare/Views/Main/Component/main_app_bar.dart';
import 'package:ncdcare/Views/Main/Component/main_dialog.dart';
import 'package:ncdcare/Views/Main/DataClass/cardclass.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HealthCardPage extends StatefulWidget {
  const HealthCardPage({super.key});

  @override
  State<HealthCardPage> createState() => _HealthCardPageState();
}

class _HealthCardPageState extends State<HealthCardPage> {
  Future<List<CardDataHealthClass>> getHealthCardData() async {
    var HealthCardList = await HealthCard().getAllergy();
    return HealthCardList.map(
        (e) => CardDataHealthClass(e['al_name'], e['al_symptom'])).toList();
  }

  Future<List<CardDataHealthClass>> getAdiseaseData() async {
    var HealthCardList = await HealthCard().getAdisease();
    return HealthCardList.map(
        (e) => CardDataHealthClass(e['adis_name'], e['adis_detail'])).toList();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: MainAppBar()
            .mainAppBar(context: context, title: const Text("บัตรสุขภาพ")),
        body: Container(
          width: width,
          height: height,
          //color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Container(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("รายการแพ้ยา",
                          style: TextStyle(
                              fontSize: 20,
                              color: mainColor,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Container(
                        width: width,
                        height: height * 0.2,
                        child: Material(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: mainColor, width: 3)),
                          child: FutureBuilder<List<CardDataHealthClass>>(
                              future: getHealthCardData(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      return ListRowData(snapshot.data![index],
                                          index + 1, width);
                                    },
                                  );
                                } else {
                                  return const CircularProgressIndicator();
                                }
                              }),
                        ),
                      ),
                      const SizedBox(height: 15),
                      GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => ShowDialogFormData(
                                TitleName: "ชื่อยา",
                                SubName: "อาการแพ้ยา",
                                IconText: "เพิ่มแพ้ยา",
                                Callback:
                                    (String TitleText, String SubText) async {
                                  int allergeyId = await HealthCard()
                                      .addAllergy(
                                          al_name: TitleText,
                                          al_symptom: SubText);
                                  if (allergeyId == 0) {
                                    showDialog(
                                        context: context,
                                        builder: (context) => MainAlertDialog(
                                            title:
                                                "เกิดข้อผิดพลาด เพิ่มแพ้ยาไม่สำเร็จ",
                                            onCilck: () {
                                              Navigator.of(context).pop();
                                              setState(() {});
                                            },
                                            setIcon: Icons.cancel));
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) => MainAlertDialog(
                                            title: "เพิ่มแพ้ยาสำเร็จ",
                                            onCilck: () {
                                              Navigator.of(context).pop();
                                              Navigator.of(context).pop();
                                              setState(() {});
                                            }));
                                  }
                                },
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.file_open, color: mainColor),
                              Text("เพิ่มยา",
                                  style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold)),
                            ],
                          )),
                    ],
                  )),
              const SizedBox(height: 20),
              Container(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("รายการโรคประจำตัว",
                          style: TextStyle(
                              fontSize: 20,
                              color: mainColor,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Container(
                        width: width,
                        height: height * 0.2,
                        child: Material(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: mainColor, width: 3)),
                          child: FutureBuilder<List<CardDataHealthClass>>(
                              future: getAdiseaseData(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      return ListRowData(snapshot.data![index],
                                          index + 1, width);
                                    },
                                  );
                                } else {
                                  return const CircularProgressIndicator();
                                }
                              }),
                        ),
                      ),
                      const SizedBox(height: 15),
                      GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => ShowDialogFormData(
                                TitleName: "ชื่อโรค",
                                SubName: "อื่นๆ",
                                IconText: "เพิ่มโรคประจำตัว",
                                Callback:
                                    (String TitleText, String SubText) async {
                                  int allergeyId = await HealthCard()
                                      .addAdisease(
                                          adis_name: TitleText,
                                          adis_detail: SubText);
                                  if (allergeyId == 0) {
                                    showDialog(
                                        context: context,
                                        builder: (context) => MainAlertDialog(
                                            title:
                                                "เกิดข้อผิดพลาด เพิ่มโรคประจำตัวไม่สำเร็จ",
                                            onCilck: () {
                                              Navigator.of(context).pop();
                                              setState(() {});
                                            },
                                            setIcon: Icons.cancel));
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) => MainAlertDialog(
                                            title: "เพิ่มโรคประจำตัวสำเร็จ",
                                            onCilck: () {
                                              Navigator.of(context).pop();
                                              Navigator.of(context).pop();
                                              setState(() {});
                                            }));
                                  }
                                },
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.file_open, color: mainColor),
                              Text("เพิ่มโรคประจำตัว",
                                  style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold)),
                            ],
                          )),
                    ],
                  )),
            ],
          ),
        ));
  }

  Widget ListRowData(CardDataHealthClass Datas, int index, double width) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              width: width * 0.1,
              child: Text(
                (index).toString(),
                style: TextStyle(color: mainColor, fontWeight: FontWeight.bold),
              )),
          Container(
              width: width * 0.32,
              child: Text(
                Datas.alName,
                style: TextStyle(color: mainColor),
              )),
          Container(
              width: width * 0.32,
              child: Text(
                Datas.alSymptom,
                style: const TextStyle(color: Colors.red),
              )),
        ],
      ),
    );
  }
}

class ShowDialogFormData extends StatelessWidget {
  final String TitleName;
  final String SubName;
  final String IconText;
  final Function(String, String) Callback;

  ShowDialogFormData(
      {super.key,
      required this.TitleName,
      required this.SubName,
      required this.IconText,
      required this.Callback});

  TextEditingController NameTitle = TextEditingController();
  TextEditingController Detail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
            child: TextField(
              controller: NameTitle,
              decoration: InputDecoration(
                icon: Text(TitleName,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                fillColor: const Color.fromARGB(255, 236, 236, 236),
                filled: true,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(18.0)),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18.0)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
            child: Text(SubName,
                style: const TextStyle(
                    color: Colors.red, fontWeight: FontWeight.bold)),
          ),
          TextField(
            maxLines: 3,
            controller: Detail,
            decoration: const InputDecoration(
              fillColor: Color.fromARGB(255, 236, 236, 236),
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(18.0)),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(18.0)),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: GestureDetector(
              onTap: () {
                Callback(NameTitle.text, Detail.text);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check_circle_outline, color: mainColor),
                  Text(IconText, style: TextStyle(color: mainColor)),
                ],
              )),
        )
      ],
    );
  }
}
