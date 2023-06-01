import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ncdcare/Api/Cache/data.dart';
import 'package:ncdcare/Api/Content/contect.dart';
import 'package:ncdcare/Api/ipcon.dart';
import 'package:ncdcare/Color/ThemeData.dart';
import 'package:ncdcare/Views/Main/Component/about_page.dart';
import 'package:ncdcare/Views/Main/Component/all_contect_page.dart';
import 'package:ncdcare/Views/Main/Component/analyze_symptoms_page.dart';
import 'package:ncdcare/Views/Main/Component/assess_risk_of_disease.dart';
import 'package:ncdcare/Views/Main/Component/emergencycall.dart';
import 'package:ncdcare/Views/Main/Component/health_card.dart';
import 'package:ncdcare/Views/Main/Component/knowledge_treasury.dart';
import 'package:ncdcare/Views/Main/Component/main_app_bar.dart';
import 'package:ncdcare/Views/Main/Component/source_knowledge_page.dart';
import 'package:ncdcare/Views/Main/DataClass/cardclass.dart';
import 'package:ncdcare/Views/Main/calculate_bmi.dart';
import 'package:ncdcare/Views/Main/main_contect_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../Api/UserProfile/user_profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<CardClass>> getRecomContect() async {
    var contectList = await Contect().recomContect();
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
          context: context,
          title: Column(
            children: const [
              Text("NCDs CARE"),
              Text(
                "HEALTH SERVICE",
                style: TextStyle(fontSize: 11),
              )
            ],
          ),
          isBack: false),
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 140,
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      // height: 150,
                      width: width * 0.9,
                      padding: const EdgeInsets.all(15),
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        elevation: 5,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FutureBuilder<Map<String, dynamic>>(
                              future: Profile().getUserProfile(
                                  userId: cacheUserId.toString()),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: 30,
                                        backgroundImage: snapshot
                                                    .data!['user_image'] ==
                                                null
                                            ? const AssetImage(
                                                    "assets/profile.png")
                                                as ImageProvider
                                            : NetworkImage(
                                                "$ipcon/../upload/${snapshot.data!['user_image']}"),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "สวัสดี !",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: mainColor,
                                                fontSize: 18),
                                          ),
                                          Text(
                                            snapshot.data!['user_fullname'] !=
                                                        "" &&
                                                    snapshot.data![
                                                            'user_fullname'] !=
                                                        null
                                                ? "คุณ ${snapshot.data!['user_fullname'].toString().split(' ')[0]}"
                                                : "คุณ ${snapshot.data!['user_name']}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          )
                                        ],
                                      ),
                                    ],
                                  );
                                } else {
                                  return CircularProgressIndicator();
                                }
                              }),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              children: [
                menuItem(
                    target: const AllContectPage(),
                    text: "บทความ",
                    icon: Icons.newspaper,
                    NavBar: true),
                menuItem(
                    target: const SourceKnowledgePage(),
                    text: "แหล่งความรู้",
                    icon: CupertinoIcons.globe,
                    NavBar: true),
                menuItem(
                    target: const KnowledgeTreasuryPage(),
                    text: "คลังความรู้",
                    icon: CupertinoIcons.play_rectangle_fill,
                    NavBar: true),
                menuItem(
                    target: const EmergencyCallPage(),
                    text: "ฉุกเฉิน",
                    icon: Icons.emergency,
                    NavBar: true),
                menuItem(
                  target: const CalculateBMI(),
                  text: "คำนวณBMI",
                  icon: Icons.calculate,
                ),
                menuItem(
                  target: const AboutPage(),
                  text: "เกี่ยวกับ",
                  icon: Icons.person_2,
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const AnalyzeSymptomsPage(),
                        withNavBar: false, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                    child: Container(
                      height: 100,
                      alignment: Alignment.center,
                      width: width * 0.9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                              image: AssetImage("assets/Main1.png"),
                              fit: BoxFit.cover)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "วิเคราะห์โรคเบื้องต้น",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: mainColor),
                          ),
                          Text(
                            "ตรวจด้วยระบบ AI",
                            style: TextStyle(color: mainColor),
                          ),
                          Text(
                            "เริ่มเลย",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: mainColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: const AssessRiskOfDisease(),
                            withNavBar:
                                false, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },
                        child: Container(
                          height: 100,
                          alignment: Alignment.center,
                          width: width * 0.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: const DecorationImage(
                                  image: AssetImage("assets/Main2.png"),
                                  fit: BoxFit.cover)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "ประเมินความเสี่ยง \n พฦติกรรม",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: mainColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "เริ่มเลย",
                                style: TextStyle(
                                    color: mainColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          PersistentNavBarNavigator.pushNewScreen(context,
                              screen: HealthCardPage(),
                              withNavBar: true,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino);
                        },
                        child: Container(
                          height: 100,
                          alignment: Alignment.center,
                          width: width * 0.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: const DecorationImage(
                                  image: AssetImage("assets/Main3.png"),
                                  fit: BoxFit.cover)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height: 70,
                                  child: Image.asset(
                                    "assets/card.png",
                                    fit: BoxFit.cover,
                                  )),
                              Text(
                                "บัตรสุขภาพ",
                                style: TextStyle(
                                    color: mainColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("บทความแนะนำ"),
                  TextButton(
                    onPressed: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const AllContectPage(),
                        withNavBar: true, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                    child: const Text(
                      "ดูเพิ่มเตืม >",
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 120,
              width: width,
              child: FutureBuilder<List<CardClass>>(
                  future: getRecomContect(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length + 1,
                        itemBuilder: (context, index) {
                          return index + 1 <= snapshot.data!.length
                              ? cardItemBuilder(width,
                                  card: snapshot.data![index])
                              : Container(
                                  height: 100,
                                  width: width * 0.3,
                                  alignment: Alignment.center,
                                  child: TextButton(
                                    onPressed: () {
                                      PersistentNavBarNavigator.pushNewScreen(
                                        context,
                                        screen: const AllContectPage(),
                                        withNavBar:
                                            true, // OPTIONAL VALUE. True by default.
                                        pageTransitionAnimation:
                                            PageTransitionAnimation.cupertino,
                                      );
                                    },
                                    child: const Text(
                                      "ดูเพิ่มเตืม >",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                );
                        },
                        scrollDirection: Axis.horizontal,
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  Widget cardItemBuilder(double width, {required CardClass card}) {
    return GestureDetector(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: MainContectPage(card: card),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: Container(
        margin: EdgeInsets.all(5),
        height: 100,
        width: width * 0.5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(image: card.backimage, fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
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
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget menuItem(
      {required Widget target,
      required String text,
      required IconData icon,
      bool NavBar = false}) {
    return GestureDetector(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: target,
          withNavBar: NavBar, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: Column(
        children: [
          Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 10,
            child: SizedBox(
                height: 50,
                width: 50,
                child: Icon(
                  icon,
                  size: 35,
                  color: mainColor,
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(text),
        ],
      ),
    );
  }
}
