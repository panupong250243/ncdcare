import 'package:flutter/material.dart';
import 'package:ncdcare/Api/KnowledgeBase/knowledge_base.dart';
import 'package:ncdcare/Api/ipcon.dart';
import 'package:ncdcare/Views/Main/Component/main_app_bar.dart';
import 'package:ncdcare/Views/Main/web_contect_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../DataClass/cardclass.dart';

class KnowledgeTreasuryPage extends StatefulWidget {
  const KnowledgeTreasuryPage({super.key});

  @override
  State<KnowledgeTreasuryPage> createState() => _KnowledgeTreasuryPageState();
}

class _KnowledgeTreasuryPageState extends State<KnowledgeTreasuryPage> {
  Future<List<CardClass>> getKnowledgeBase() async {
    var knowledgeBaseList = await KnowledgeBase().getKnowledgeBase();
    return knowledgeBaseList
        .map((e) => CardClass(
              e['knowb_name'],
              NetworkImage("$ipcon/../upload/${e['knowb_image']}"),
              e['knowb_video'],
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: MainAppBar()
          .mainAppBar(context: context, title: const Text("คลังความรู้")),
      body: Container(
        padding: EdgeInsets.all(10),
        child: FutureBuilder<List<CardClass>>(
          future: getKnowledgeBase(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return cardItemBuilder(
                      card: snapshot.data![index], width: width);
                },
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Widget cardItemBuilder({required CardClass card, required double width}) {
    return GestureDetector(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: WebContectPage(card: card),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: Container(
        height: 150,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(image: card.backimage, fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Stack(
                    children: [
                      Text(
                        card.cardtitle,
                        style: TextStyle(
                          // color: mainColor,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 2
                            ..color = Colors.black,
                        ),
                      ),
                      Text(
                        card.cardtitle,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.play_circle)
                ],
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
