import 'package:flutter/material.dart';
import 'package:ncdcare/Color/ThemeData.dart';
import 'package:ncdcare/Views/Main/Component/assessment_form_page.dart';
import 'package:ncdcare/Views/Main/Component/main_app_bar.dart';
import 'package:ncdcare/Views/Main/Component/main_dialog.dart';
import 'package:ncdcare/Views/Main/DataClass/symbolclass.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class ShowSelectedSymptoms extends StatefulWidget {
  final List<SymbolInfo> symbolList;
  const ShowSelectedSymptoms({super.key, required this.symbolList});

  @override
  State<ShowSelectedSymptoms> createState() => _ShowSelectedSymptomsState();
}

class _ShowSelectedSymptomsState extends State<ShowSelectedSymptoms> {
  List<SymbolInfo> _symbolList = [];

  @override
  void initState() {
    _symbolList = widget.symbolList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: MainAppBar().mainAppBar(
          context: context, title: const Text("วิเคราะร์อาการของคุณ")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.fromLTRB(20, 25, 0, 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "กรุณาเลือกอาการ",
                      style: TextStyle(
                          fontSize: 24,
                          color: mainColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "ที่คุณกังวลมากที่สุด",
                      style: TextStyle(
                          fontSize: 24,
                          color: mainColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "มา 1 อาการ",
                      style: TextStyle(
                          fontSize: 24,
                          color: mainColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "ไม่ต้องห่วง! เราจะนำทุกอาการที่คุณเลือกมาวิเคราะห์",
                      style: TextStyle(
                          color: mainColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
            SizedBox(
              //height: height * 0.5,
              width: width,
              child: ListView.builder(
                itemCount: _symbolList.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    //highlightColor: Colors.red,
                    splashColor: Colors.blueAccent,
                    onTap: () {
                      setState(() {
                        _symbolList
                            .forEach((element) => element.isMost = false);
                        _symbolList[index].isMost = true;
                      });
                    },
                    child: RadioItem(_symbolList[index]),
                  );
                },
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: width * 0.3,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: mainColor),
            onPressed: () {
              if (_symbolList.where((element) => element.isMost).isNotEmpty) {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: AssessmentFormPage(
                    symbolList: _symbolList,
                  ),
                  withNavBar: true, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              } else {
                showDialog(
                  context: context,
                  builder: (context) => MainAlertDialog(
                      title: "กรุณาเลือกอาการที่คุณกังวลมากที่สุด",
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
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            )),
      ),
    );
  }
}

class RadioItem extends StatelessWidget {
  final SymbolInfo _item;
  RadioItem(this._item);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
            width: width * 0.9,
            child: ListTile(
              title: Text(_item.symbolName,
                  style: TextStyle(
                    color: _item.isMost ? Colors.white : mainColor,
                    fontWeight: FontWeight.bold,
                    //fontSize: 18.0
                  )),
              trailing: Icon(Icons.check_circle_outline,
                  color: _item.isMost ? Colors.white : Colors.transparent),
            ),
            decoration: BoxDecoration(
              color: _item.isMost ? mainColor : Colors.transparent,
              border: Border.all(
                  width: 1.0, color: _item.isMost ? mainColor : Colors.grey),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
          ),
          // Container(
          //   margin: EdgeInsets.only(left: 10.0),
          //   child: Text(_item.buttonText),
          // )
        ],
      ),
    );
  }
}
