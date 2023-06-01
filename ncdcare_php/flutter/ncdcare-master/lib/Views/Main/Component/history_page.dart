import 'package:flutter/material.dart';
import 'package:ncdcare/Api/Disease/disease.dart';
import 'package:ncdcare/Views/Main/Component/history_page_detail.dart';
import 'package:ncdcare/Views/Main/Component/main_app_bar.dart';
import 'package:ncdcare/Views/Main/DataClass/disease.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  // List<AnalyzeResult> data = [
  //   AnalyzeResult(
  //       [
  //         DiseaseSymptom("เจ็บ", "หัว"),
  //         DiseaseSymptom("มีเลือด", "หัว"),
  //         DiseaseSymptom("ล้าน", "หัว"),
  //         DiseaseSymptom("มีแผล", "แขน"),
  //         DiseaseSymptom("ชา", "แขน")
  //       ],
  //       WeightHeight(171, 85),
  //       23,
  //       [SymptomDetail("แขนอ่อนล้า", "มีอาการแขนอ่อนล้ามากกว่า 7 วัน")],
  //       [
  //         AnalyzeResultChance("โรคเบาหวาน", 90),
  //         AnalyzeResultChance("โรคความดันโลหิตสูง", 12),
  //         AnalyzeResultChance("โรคอ้วนลงพุง", 6),
  //       ]),
  //   AnalyzeResult(
  //       [
  //         DiseaseSymptom("เจ็บ", "หัว"),
  //         DiseaseSymptom("มีเลือด", "หัว"),
  //         DiseaseSymptom("ล้าน", "หัว"),
  //         DiseaseSymptom("มีแผล", "แขน"),
  //         DiseaseSymptom("ชา", "แขน")
  //       ],
  //       WeightHeight(171, 85),
  //       23,
  //       [SymptomDetail("แขนอ่อนล้า", "มีอาการแขนอ่อนล้ามากกว่า 7 วัน")],
  //       [
  //         AnalyzeResultChance("โรคเบาหวาน", 90),
  //         AnalyzeResultChance("โรคความดันโลหิตสูง", 12),
  //         AnalyzeResultChance("โรคอ้วนลงพุง", 6),
  //       ]),
  //   AnalyzeResult(
  //       [
  //         DiseaseSymptom("เจ็บ", "หัว"),
  //         DiseaseSymptom("มีเลือด", "หัว"),
  //         DiseaseSymptom("ล้าน", "หัว"),
  //         DiseaseSymptom("มีแผล", "แขน"),
  //         DiseaseSymptom("ชา", "แขน")
  //       ],
  //       WeightHeight(171, 85),
  //       23,
  //       [SymptomDetail("แขนอ่อนล้า", "มีอาการแขนอ่อนล้ามากกว่า 7 วัน")],
  //       [
  //         AnalyzeResultChance("โรคเบาหวาน", 90),
  //         AnalyzeResultChance("โรคความดันโลหิตสูง", 12),
  //         AnalyzeResultChance("โรคอ้วนลงพุง", 6),
  //       ]),
  // ];

  Future<List<HistoryResult>> getHistory() async {
    var request = await Disease().getResultHistory();
    List<HistoryResult> data = [];
    for (int i = 0; i < request.length; i++) {
      String symbol = request[i]['result_symbol'];
      if (request[i]['result_image_id'] != null &&
          request[i]['result_image_id'] != "0") {
        data.add(HistoryResult(
            int.parse(request[i]['result_id']),
            symbol.split(",").map((e) => int.parse(e)).toList(),
            WeightHeight(double.tryParse(request[i]['result_height']),
                double.tryParse(request[i]['result_weight'])),
            int.tryParse(request[i]['result_age']),
            FootImage(
                int.parse(request[i]['result_image_id']),
                request[i]['result_image_name'],
                int.parse(request[i]['result_image_status']),
                int.parse(request[i]['result_image_result']),
                int.parse(request[i]['disease_symbol_id']))));
      } else {
        data.add(HistoryResult(
            int.parse(request[i]['result_id']),
            symbol.split(",").map((e) => int.parse(e)).toList(),
            WeightHeight(double.tryParse(request[i]['result_height']),
                double.tryParse(request[i]['result_weight'])),
            int.tryParse(request[i]['result_age']),
            null));
      }
    }
    return data;
  }

  Widget isImageRunning({FootImage? imageData}) {
    if (imageData != null) {
      return imageData.status == 0 ? Text("กำลังประมวลผล") : Container();
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar().mainAppBar(
          context: context,
          title: const Text("ประวัติการวิเคราะห์"),
          isBack: false),
      body: Container(
        padding: EdgeInsets.all(10),
        child: FutureBuilder<List<HistoryResult>>(
          future: getHistory(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(20),
                      // shape: Border.all(color: Colors.grey),
                      child: ListTile(
                        onTap: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: HistoryPageDetail(
                              data: snapshot.data![index],
                            ),
                            withNavBar:
                                true, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },
                        title: Text("ครั้งที่ ${index + 1}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            isImageRunning(
                                imageData: snapshot.data![index].image),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                      ),
                    ),
                  );
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
}
