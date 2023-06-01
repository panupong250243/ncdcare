import 'package:flutter/material.dart';
import 'package:ncdcare/Api/Content/contect.dart';
import 'package:ncdcare/Api/ipcon.dart';
import 'package:ncdcare/Color/ThemeData.dart';
import 'package:ncdcare/Views/Main/Component/card_item_builder.dart';

import 'package:ncdcare/Views/Main/Component/main_app_bar.dart';
import 'package:ncdcare/Views/Main/DataClass/cardclass.dart';
import 'package:ncdcare/Views/Main/main_contect_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class AllContectPage extends StatefulWidget {
  const AllContectPage({super.key});

  @override
  State<AllContectPage> createState() => _AllContectPageState();
}

class _AllContectPageState extends State<AllContectPage> {
  Future<List<CardClass>> getAllContect() async {
    var contectList = await Contect().allContect();
    return contectList
        .map((e) => CardClass(
            e['content_name'],
            NetworkImage("$ipcon/../upload/${e['content_image']}"),
            e['content_detail']))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: MainAppBar().mainAppBar(
          context: context, title: const Text("บทความ"), isBack: true),
      body: FutureBuilder<List<CardClass>>(
        future: getAllContect(),
        builder: (context, snapshot) {
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
