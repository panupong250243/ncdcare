import 'package:flutter/material.dart';
import 'package:ncdcare/Api/Disease/disease_symbol.dart';
import 'package:ncdcare/Color/ThemeData.dart';
import 'package:ncdcare/Views/Main/Component/main_dialog.dart';
import 'package:ncdcare/Views/Main/Component/warning_alert_dialog.dart';
import 'package:ncdcare/Views/Main/DataClass/symbolclass.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'main_app_bar.dart';
import 'show_selected_symptoms_page.dart';

class AnalyzeSymptomsPage extends StatefulWidget {
  const AnalyzeSymptomsPage({super.key});

  @override
  State<AnalyzeSymptomsPage> createState() => _AnalyzeSymptomsPageState();
}

class _AnalyzeSymptomsPageState extends State<AnalyzeSymptomsPage> {
  Future<List<BodyPartInfo>> getBodyPart() async {
    var bodyPartList = await DiseaseSymbol().getAllBodyPart();
    return bodyPartList
        .map((e) => BodyPartInfo(
            int.parse(e['bodypart_id']),
            e['bodypart_name'],
            IconData(int.parse(e['bodypart_icon_id']),
                fontFamily: e['bodypart_icon_fontFamily'])))
        .toList();
  }

  int currBodyPartId = 0;
  BodyPartInfo currBodyPartInfo = BodyPartInfo(
      0, "อาการทั้งหมด", const IconData(0xe0f7, fontFamily: 'MaterialIcons'));
  List<SymbolInfo> selectedSymbolInfo = [];

  Future<List<SymbolInfo>> getSymbol(
      {required int currBodyPartId, required String search}) async {
    var symbolList = await DiseaseSymbol().getSymbolByBodyPart(
        bodyPartId: currBodyPartId.toString(), search: search);
    return symbolList
        .map((e) => SymbolInfo(
            int.parse(e['symbol_id']),
            e['symbol_name'],
            e['symbol_dec'],
            int.parse(e['bodypart_id']),
            false,
            int.parse(e['disease_symbol_id'])))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        show();
      },
    );
  }

  TextEditingController symbolSearch = TextEditingController();
  void show() {
    showDialog(
      context: context,
      builder: (context) {
        return const WarningAlertDialogMess();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: MainAppBar().mainAppBar(
          context: context, title: const Text("วิเคราะร์อาการของคุณ")),
      body: SizedBox(
          height: height,
          width: width,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 10),
                child: Text("ค้นหาอาการ",
                    style: TextStyle(
                        fontSize: 16,
                        color: mainColor,
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                child: Material(
                  borderRadius: BorderRadius.circular(18),
                  elevation: 8,
                  child: TextField(
                    controller: symbolSearch,
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18.0)),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'ค้นหาอาการ',
                      hintStyle: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                //height: height * 0.18,
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Material(
                  borderRadius: BorderRadius.circular(18),
                  elevation: 8,
                  child: Container(
                    height: 98,
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: FutureBuilder<List<BodyPartInfo>>(
                        future: getBodyPart(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.length + 1,
                              itemBuilder: (context, index) {
                                if (index == 0) {
                                  return menuBodyItem(
                                      bodyPart: BodyPartInfo(
                                          0,
                                          "อาการทั้งหมด",
                                          const IconData(0xe0f7,
                                              fontFamily: 'MaterialIcons')),
                                      index: index);
                                } else {
                                  return menuBodyItem(
                                      bodyPart: snapshot.data![index - 1],
                                      index: index);
                                }
                              },
                            );
                          } else {
                            return const CircularProgressIndicator();
                          }
                        }),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                child: Text(currBodyPartInfo.bodyPartName,
                    style: TextStyle(
                        fontSize: 16,
                        color: mainColor,
                        fontWeight: FontWeight.bold)),
              ),
              FutureBuilder<List<SymbolInfo>>(
                future: getSymbol(
                    currBodyPartId: currBodyPartId, search: symbolSearch.text),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      height: 300,
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        elevation: 9,
                        borderRadius: BorderRadius.circular(8),
                        child: ListView.separated(
                          // shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return symbolPart(
                                symbolInfo: snapshot.data![index]);
                          },
                          separatorBuilder: (context, index) {
                            return const Divider(
                              thickness: 2,
                            );
                          },
                        ),
                      ),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
              nextButton(),
            ],
          )),
    );
  }

  Widget menuBodyItem({required BodyPartInfo bodyPart, required int index}) {
    return GestureDetector(
      onTap: () {
        currBodyPartId = bodyPart.bodyPartId;
        currBodyPartInfo = bodyPart;
        setState(() {});
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
        child: Column(
          children: [
            Material(
              borderRadius: BorderRadius.circular(5),
              elevation: 8,
              color: index == currBodyPartId ? mainColor : Colors.white,
              child: SizedBox(
                  height: 40,
                  width: 40,
                  child: Icon(
                    bodyPart.bodyIcon,
                    size: 25,
                    color: index == currBodyPartId ? Colors.white : mainColor,
                  )),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: 50,
              child: Text(
                bodyPart.bodyPartName,
                softWrap: true,
                style: TextStyle(
                    fontSize: 10,
                    color: mainColor,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget symbolPart({required SymbolInfo symbolInfo}) {
    return ListTile(
      onTap: () {
        if (selectedSymbolInfo
            .map((e) => e.symbolId)
            .toList()
            .contains(symbolInfo.symbolId)) {
          selectedSymbolInfo.removeWhere(
              (element) => element.symbolId == symbolInfo.symbolId);
        } else {
          selectedSymbolInfo.add(symbolInfo);
        }
        setState(() {});
      },
      shape: RoundedRectangleBorder(
        //<-- SEE HERE
        side: const BorderSide(width: 2, color: Colors.transparent),
        borderRadius: BorderRadius.circular(8),
      ),
      tileColor: selectedSymbolInfo
              .map((e) => e.symbolId)
              .toList()
              .contains(symbolInfo.symbolId)
          ? mainColor
          : Colors.white,
      title: Text(
        symbolInfo.symbolName,
        style: TextStyle(
          color: selectedSymbolInfo
                  .map((e) => e.symbolId)
                  .toList()
                  .contains(symbolInfo.symbolId)
              ? Colors.white
              : mainColor,
        ),
      ),
      trailing: selectedSymbolInfo
              .map((e) => e.symbolId)
              .toList()
              .contains(symbolInfo.symbolId)
          ? const Icon(
              Icons.check_circle_outline_outlined,
              color: Colors.white,
            )
          : Icon(Icons.add_circle_outline_outlined, color: mainColor),
    );
  }

  Widget nextButton() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Material(
        elevation: 9,
        color: mainColor,
        borderRadius: BorderRadius.circular(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Material(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey,
                  elevation: 9,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      selectedSymbolInfo.length.toString(),
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  "อาการ",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            TextButton(
                onPressed: () {
                  if (selectedSymbolInfo.isNotEmpty) {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: ShowSelectedSymptoms(
                        symbolList: selectedSymbolInfo,
                      ),
                      withNavBar: true, // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => MainAlertDialog(
                          title: "กรุณาเลือกอาการอย่างน้อย 1 อาการ",
                          onCilck: () {
                            Navigator.pop(context);
                          },
                          setIcon: Icons.cancel,
                          iconColor: Colors.red),
                    );
                  }
                },
                child: const Text(
                  "ต่อไป  >",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
