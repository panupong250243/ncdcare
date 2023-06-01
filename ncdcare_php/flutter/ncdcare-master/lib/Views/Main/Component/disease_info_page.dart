import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ncdcare/Api/Disease/disease.dart';
import 'package:ncdcare/Api/ipcon.dart';
import 'package:ncdcare/Views/Main/Component/card_item_builder.dart';
import 'package:ncdcare/Views/Main/Component/main_app_bar.dart';
import 'package:ncdcare/Views/Main/DataClass/cardclass.dart';
import 'package:ncdcare/Views/Main/main_contect_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class DiseaseInfoPage extends StatefulWidget {
  const DiseaseInfoPage({super.key});

  @override
  State<DiseaseInfoPage> createState() => _DiseaseInfoPageState();
}

class _DiseaseInfoPageState extends State<DiseaseInfoPage> {
  Future<List<CardClass>> getDiseaseInfo() async {
    var adviceList = await Disease().getDiseaseInfo();
    return adviceList
        .map((e) => CardClass(
            e['dis_name'],
            NetworkImage("$ipcon/../upload/${e['dis_image']}"),
            e['dis_detail']))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: MainAppBar().mainAppBar(
          context: context, title: const Text("ข้อมูลโรค"), isBack: false),
      body: FutureBuilder<List<CardClass>>(
        future: getDiseaseInfo(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return CardItemBuilder(
                      width: width, card: snapshot.data![index]);
                },
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
