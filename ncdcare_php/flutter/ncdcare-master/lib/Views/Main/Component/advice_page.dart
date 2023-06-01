import 'package:flutter/material.dart';
import 'package:ncdcare/Api/Advice/advice.dart';
import 'package:ncdcare/Api/Content/contect.dart';
import 'package:ncdcare/Api/ipcon.dart';
import 'package:ncdcare/Views/Main/Component/card_item_builder.dart';
import 'package:ncdcare/Views/Main/Component/main_app_bar.dart';
import 'package:ncdcare/Views/Main/DataClass/cardclass.dart';
import 'package:ncdcare/Views/Main/main_contect_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class AdvicePage extends StatefulWidget {
  const AdvicePage({super.key});

  @override
  State<AdvicePage> createState() => _AdvicePageState();
}

class _AdvicePageState extends State<AdvicePage> {
  Future<List<CardClass>> getUserAdvice() async {
    var adviceList = await Advice().getAdvice();
    return adviceList
        .map((e) => CardClass(
            e['adv_name'],
            NetworkImage("$ipcon/../upload/${e['adv_image']}"),
            e['adv_detail']))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: MainAppBar().mainAppBar(
          context: context, title: const Text("คำแนะนำ"), isBack: false),
      body: FutureBuilder<List<CardClass>>(
        future: getUserAdvice(),
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
