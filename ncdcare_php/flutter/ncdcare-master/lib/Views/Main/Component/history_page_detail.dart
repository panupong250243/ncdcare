import 'package:flutter/material.dart';
import 'package:ncdcare/Api/Disease/disease.dart';
import 'package:ncdcare/Color/ThemeData.dart';
import 'package:ncdcare/Views/Main/Component/history_result_page.dart';
import 'package:ncdcare/Views/Main/Component/main_app_bar.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../DataClass/disease.dart';

class HistoryPageDetail extends StatefulWidget {
  final HistoryResult data;
  const HistoryPageDetail({super.key, required this.data});

  @override
  State<HistoryPageDetail> createState() => _HistoryPageDetailState();
}

class _HistoryPageDetailState extends State<HistoryPageDetail> {
  Future<List<DiseaseSymptom>> getDiseaseSymptomData() async {
    var symbolList = await Disease().getSymbolList(
        symbolId: widget.data.symptomList.map((e) => e.toString()).toList());
    print(symbolList);
    return symbolList
        .map((e) => DiseaseSymptom(
            e['symbol_id'], e['symbol_name'], e['bodypart_name']))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: MainAppBar().mainAppBar(
          context: context,
          title: const Text("ประวัติการวิเคราะห์"),
          isBack: true),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Text(
              "สรุปอาการ",
              style: TextStyle(
                  color: mainColor, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Material(
                elevation: 10,
                child: Container(
                  width: width,
                  padding: const EdgeInsets.fromLTRB(30, 10, 0, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FutureBuilder<List<DiseaseSymptom>>(
                        future: getDiseaseSymptomData(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            print(snapshot.error);
                          }
                          if (snapshot.hasData) {
                            return getDiseaseSymptom(
                              newData: snapshot.data!,
                            );
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      ),
                      getWeightHeight(),
                      getAge(),
                      // getDetail(),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: mainColor),
                          onPressed: () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: HistoryResultPage(
                                data: widget.data,
                              ),
                              withNavBar:
                                  true, // OPTIONAL VALUE. True by default.
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            );
                          },
                          child: Container(
                              alignment: Alignment.center,
                              width: width,
                              child: const Text("ผลวิเคราะห์"))),
                    ],
                  ),
                ))
          ],
        )),
      ),
    );
  }

  Widget getDiseaseSymptom({required List<DiseaseSymptom> newData}) {
    List<Widget> output = [];
    newData.sort((a, b) => a.symptomPart.compareTo(b.symptomPart));
    String lastPart = "";
    for (int i = 0; i < widget.data.symptomList.length; i++) {
      if (lastPart != newData[i].symptomPart) {
        output.add(Text(
          newData[i].symptomPart,
          style: TextStyle(color: mainColor),
        ));
        lastPart = newData[i].symptomPart;
      }
      output.add(Container(
        padding: const EdgeInsets.only(left: 30),
        child: Text(newData[i].symptomName, style: TextStyle(color: mainColor)),
      ));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: output,
    );
  }

  Widget getWeightHeight() {
    List<Widget> output = [];
    output.add(Text(
      "น้ำหนักและส่วนสูง",
      style: TextStyle(color: mainColor),
    ));
    output.add(Container(
      padding: const EdgeInsets.only(left: 30),
      child: Text(
          widget.data.appearance.Weight != null &&
                  widget.data.appearance.Weight != 0
              ? "${widget.data.appearance.Weight} kg"
              : "ไม่ระบุ",
          style: TextStyle(color: mainColor)),
    ));
    output.add(Container(
      padding: const EdgeInsets.only(left: 30),
      child: Text(
          widget.data.appearance.Height != null &&
                  widget.data.appearance.Height != 0
              ? "${widget.data.appearance.Height} cm"
              : "ไม่ระบุ",
          style: TextStyle(color: mainColor)),
    ));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: output,
    );
  }

  Widget getAge() {
    List<Widget> output = [];
    output.add(Text(
      "อายุ",
      style: TextStyle(color: mainColor),
    ));
    output.add(Container(
      padding: const EdgeInsets.only(left: 30),
      child: Text(
          widget.data.age != null && widget.data.age != 0
              ? "${widget.data.age} ปี"
              : "ไม่ระบุ",
          style: TextStyle(color: mainColor)),
    ));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: output,
    );
  }

  // Widget getDetail() {
  //   return Column(
  //     children: widget.data.detail
  //         .map((e) => Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   e.symptomTitle,
  //                   style: TextStyle(color: mainColor),
  //                 ),
  //                 Container(
  //                   padding: const EdgeInsets.only(left: 30),
  //                   child: Text(
  //                     e.symptomSubTitle,
  //                     style: TextStyle(color: mainColor),
  //                   ),
  //                 )
  //               ],
  //             ))
  //         .toList(),
  //   );
  // }
}
