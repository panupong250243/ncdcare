import 'package:flutter/material.dart';
import 'package:ncdcare/Api/Disease/disease.dart';
import 'package:ncdcare/Color/ThemeData.dart';
import 'package:ncdcare/Views/Main/Component/main_app_bar.dart';
import 'package:ncdcare/Views/Main/DataClass/disease.dart';
import 'package:ncdcare/Views/Main/main_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HistoryResultPage extends StatefulWidget {
  final HistoryResult data;
  const HistoryResultPage({super.key, required this.data});

  @override
  State<HistoryResultPage> createState() => _HistoryResultPageState();
}

class _HistoryResultPageState extends State<HistoryResultPage> {
  Future<List<HistoryResultDetail>> getResultHistoryDetail() async {
    var detailList = await Disease()
        .getResultHistoryDetail(resultId: widget.data.id.toString());
    return detailList
        .map((e) => HistoryResultDetail(
            int.parse(e['result_detail_id']),
            double.parse(e['result_detail_score']),
            double.parse(e['result_detail_max_score']),
            int.parse(e['disease_symbol_id']),
            e['disease_symbol_name']))
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
            child: Container(
          width: width,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "รายละเอียดการวิเคราะห์",
                style: TextStyle(
                    color: mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(30, 10, 0, 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "จากอาการของคุณ",
                        style: TextStyle(
                            color: mainColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(
                            "ด้วย AI ของ ",
                            style: TextStyle(
                                color: mainColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "NCDs CARE",
                            style: TextStyle(
                                color: Colors.green[400],
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text(
                        "เรียงลำดับโรคที่น่าจะเป็นดังต่อไปนี้",
                        style: TextStyle(
                            color: mainColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(),
                    ],
                  )),
              FutureBuilder<List<HistoryResultDetail>>(
                future: getResultHistoryDetail(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return resultBuilder(resultData: snapshot.data!);
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: mainColor),
                  onPressed: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: MainPage(initialIndex: 3),
                      withNavBar: false, // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.check),
                      Text("เสร็จสิ้น"),
                    ],
                  ))
            ],
          ),
        )),
      ),
    );
  }

  List<AnalyzeResultChance> mapHistoryResultDetailToAnalyzeResultChance(
      {required List<HistoryResultDetail> result}) {
    if (widget.data.image != null && widget.data.image!.status != 0) {
      // double max =
      //     result.map((e) => e.detailScore).toList().reduce((a, b) => a + b) +
      //         widget.data.image!.result;
      // double avg = max / result.length;
      return result
          .map((e) => AnalyzeResultChance(
              e.diseaseName,
              double.parse((((e.diseaseId == widget.data.image!.diseaseId
                          ? (e.detailScore + widget.data.image!.result) /
                              (e.detailMaxScore + 10)
                          : e.detailScore / e.detailMaxScore) *
                      100))
                  .toStringAsFixed(2))))
          .toList();
    } else {
      // double max =
      //     result.map((e) => e.detailScore).toList().reduce((a, b) => a + b);
      return result
          .map((e) => AnalyzeResultChance(
              e.diseaseName,
              double.parse(((e.detailScore / e.detailMaxScore) * 100)
                  .toStringAsFixed(2))))
          .toList();
    }
  }

  Widget resultBuilder({required List<HistoryResultDetail> resultData}) {
    List<AnalyzeResultChance> result =
        mapHistoryResultDetailToAnalyzeResultChance(result: resultData);
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: result.length,
        physics: const ScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Material(
              borderRadius: BorderRadius.circular(20),
              elevation: 10,
              child: ListTile(
                title: Text(result[index].diseaseName,
                    style: TextStyle(
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
                subtitle: result[index].diseaseChance >= 80
                    ? const Text(
                        "ควรพบแพทย์เพื่อทำการรักษาในทันที",
                        style: TextStyle(fontSize: 12, color: Colors.red),
                      )
                    : result[index].diseaseChance >= 10
                        ? const Text(
                            "ควรพบแพทย์เพื่อรับการตรวจเพิ่มเติม",
                            style: TextStyle(fontSize: 12, color: Colors.amber),
                          )
                        : const Text(
                            "ควรพบแพทย์เพื่อรับคำแนะนำเพิ่มเติม",
                            style: TextStyle(
                                fontSize: 12, color: Colors.lightBlue),
                          ),
                trailing: Text("${result[index].diseaseChance}%",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: result[index].diseaseChance >= 80
                            ? Colors.red
                            : result[index].diseaseChance >= 10
                                ? Colors.amber
                                : Colors.lightBlue)),
              ),
            ),
          );
        },
      ),
    );
  }
}
