// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ncdcare/Api/Disease/disease.dart';
import 'package:ncdcare/Api/Question/question.dart';
import 'package:ncdcare/Color/ThemeData.dart';
import 'package:ncdcare/Views/Main/Component/main_app_bar.dart';
import 'package:ncdcare/Views/Main/Component/main_dialog.dart';
import 'package:ncdcare/Views/Main/Component/warning_alert_dialog.dart';
import 'package:ncdcare/Views/Main/DataClass/disease.dart';
import 'package:ncdcare/Views/Main/DataClass/questionclass.dart';
import 'package:ncdcare/Views/Main/main_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../DataClass/symbolclass.dart';

class AssessmentFormPage extends StatefulWidget {
  final List<SymbolInfo> symbolList;
  const AssessmentFormPage({super.key, required this.symbolList});

  @override
  State<AssessmentFormPage> createState() => _AssessmentFormPageState();
}

class _AssessmentFormPageState extends State<AssessmentFormPage> {
  Future<List<QuestionClass>> getQuestion() async {
    var questionList = await Question().getQuestion(
        symbolIdList:
            widget.symbolList.map((e) => e.diseaseId.toString()).toList(),
        most: widget.symbolList
            .where((element) => element.isMost)
            .first
            .symbolId
            .toString());
    return questionList
        .map((e) => QuestionClass(
            int.parse(e['question_id']),
            e['question_title'],
            int.parse(e['disease_symbol_id']),
            int.parse(e['symbol_id'])))
        .toList();
  }

  Future<List<AnswerClass>> getAnswer({required String questionId}) async {
    var answerList = await Question().getAnswer(questionId: questionId);
    return answerList
        .map((e) => AnswerClass(int.parse(e['answer_id']), e['answer_title'],
            int.parse(e['answer_score']), int.parse(e['question_id'])))
        .toList();
  }

  Future<SymbolGetFunction> getAddFunction() async {
    var function = await Disease().getDiseaseFunction(
        diseaseId:
            widget.symbolList.map((e) => e.diseaseId.toString()).toList());
    return SymbolGetFunction(
      int.parse(function['BMI']) >= 1 ? true : false,
      int.parse(function['Age']) >= 1 ? true : false,
      int.parse(function['FootImage']) >= 1 ? true : false,
    );
  }

  Future<List<String>> getAddFootImageId() async {
    var diseaseId = await Disease().getAddFootImageId(
        diseaseId:
            widget.symbolList.map((e) => e.diseaseId.toString()).toList());
    return diseaseId.map((e) => e['disease_symbol_id'].toString()).toList();
  }

  Future<PageView> questionPageViewBuilder() async {
    List<QuestionClass> questionList = await getQuestion();
    List<int> diseaseId = widget.symbolList.map((e) => e.diseaseId).toList();
    List<Widget> widgetList =
        questionList.map((e) => questionBuilder(question: e)).toList();
    SymbolGetFunction neededFunction = await getAddFunction();
    if (neededFunction.isBMI) {
      widgetList.add(getBMIPage());
    }
    if (neededFunction.isAge) {
      widgetList.add(getAgePage());
    }
    if (neededFunction.isFootImage) {
      widgetList.add(getFootImage());
    }
    pageNumber = widgetList.length;
    return PageView(
      controller: page,
      physics: const NeverScrollableScrollPhysics(),
      children: widgetList,
    );
  }

  PageController page = PageController();
  int pageNumber = 5;
  List<ResultClass> resultList = [];
  TextEditingController userWeight = TextEditingController();
  TextEditingController userHeight = TextEditingController();
  TextEditingController userAge = TextEditingController();
  File? footImage;

  Future<void> footImagePicker(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      setState(() {
        footImage = File(image.path);
      });
    }
  }

  Future<void> runSaveResult({int? footImage}) async {
    var data = ResultSaver(
      widget.symbolList,
      AppearanceClass(
          double.tryParse(userHeight.text), double.tryParse(userWeight.text)),
      int.tryParse(userAge.text),
      resultList,
    );
    int request =
        await Disease().saveResult(data: data, imageResult: footImage);
    if (request > 0) {
      PersistentNavBarNavigator.pushNewScreen(
        context,
        screen: MainPage(initialIndex: 3),
        withNavBar: true, // OPTIONAL VALUE. True by default.
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
    } else {
      showDialog(
          context: context,
          builder: (context) => MainAlertDialog(
              title: "เกิดข้อผิดพลาด ในการบันทึกผลลัพธ์",
              onCilck: () {
                Navigator.of(context).pop();
                setState(() {});
              },
              setIcon: Icons.cancel));
    }
  }

  Future<void> runFootImage() async {
    List<String> diseaseId = await getAddFootImageId();
    int request = await Disease()
        .runTestFootImage(image: footImage!, diseaseId: diseaseId.join(","));
    if (request > 0) {
      runSaveResult(footImage: request);
    } else {
      showDialog(
          context: context,
          builder: (context) => MainAlertDialog(
              title: "เกิดข้อผิดพลาด ในการอัพโหลดภาพถ่าย",
              onCilck: () {
                Navigator.of(context).pop();
                setState(() {});
              },
              setIcon: Icons.cancel));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar().mainAppBar(
          context: context, title: const Text("วิเคราะห์อาการของคุณ")),
      body: Container(
        child: FutureBuilder<PageView>(
          future: questionPageViewBuilder(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return snapshot.data!;
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Widget questionBuilder({required QuestionClass question}) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width * 0.8,
        child: Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 5,
            child: Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      height: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(question.questionTitle,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                  FutureBuilder<List<AnswerClass>>(
                    future:
                        getAnswer(questionId: question.disease_id.toString()),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return answerBuilder(
                                question: question,
                                answer: snapshot.data![index]);
                          },
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  )
                ],
              ),
            )),
      ),
    );
  }

  Widget answerBuilder(
      {required QuestionClass question, required AnswerClass answer}) {
    return ElevatedButton(
        onPressed: () {
          List<int> resultMap = resultList.map((e) => e.diseaseId).toList();
          List<int> symbolMap =
              widget.symbolList.map((e) => e.symbolId).toList();
          if (resultMap.contains(question.disease_id)) {
            resultList[resultList.indexWhere(
                        (element) => element.diseaseId == question.disease_id)]
                    .score +=
                addScore(
                    symbolIdList: symbolMap,
                    question: question,
                    answer: answer);
          } else {
            resultList.add(ResultClass(
                question.disease_id,
                addScore(
                    symbolIdList: symbolMap,
                    question: question,
                    answer: answer)));
          }
          nextPage();
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            side: BorderSide(
              width: 2.0,
              color: mainColor,
            )),
        child: Text(
          answer.answer_title,
          style: TextStyle(color: mainColor),
        ));
  }

  int addScore(
      {required List<int> symbolIdList,
      required QuestionClass question,
      required AnswerClass answer}) {
    if (symbolIdList.contains(question.symbol_id)) {
      return answer.answer_score * 2;
    } else {
      return answer.answer_score;
    }
  }

  void nextPage() {
    if (page.page! < pageNumber - 1) {
      page.nextPage(
          duration: const Duration(seconds: 2), curve: Curves.easeOutQuart);
    } else {
      if (footImage != null) {
        runFootImage();
      } else {
        runSaveResult();
      }
    }
  }

  Widget getBMIPage() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 5,
        child: Container(
          padding: const EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text("น้ำหนักและส่วนสูง",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white))),
              Divider(
                color: mainColor,
                thickness: 2,
              ),
              inputTextField(
                  width: MediaQuery.of(context).size.width * 0.8,
                  title: "น้ำหนัก",
                  hintText: "กรอกน้ำหนักของคุณ",
                  imageicon: Image.asset("assets/Weight.png"),
                  controller: userWeight),
              const SizedBox(
                height: 10,
              ),
              inputTextField(
                  width: MediaQuery.of(context).size.width * 0.8,
                  title: "ส่วนสูง",
                  hintText: "กรอกส่วนสูงของคุณ",
                  imageicon: Image.asset("assets/Height.png"),
                  controller: userHeight),
              ElevatedButton(
                  onPressed: () {
                    if (userWeight.text.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) => MainAlertDialog(
                            title: "กรุณากรอกน้ำหนักของท่าน",
                            onCilck: () {
                              Navigator.pop(context);
                            },
                            setIcon: Icons.cancel,
                            iconColor: Colors.red),
                      );
                    } else if (userHeight.text.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) => MainAlertDialog(
                            title: "กรุณากรอกส่วนสูงของท่าน",
                            onCilck: () {
                              Navigator.pop(context);
                            },
                            setIcon: Icons.cancel,
                            iconColor: Colors.red),
                      );
                    } else {
                      nextPage();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      )),
                  child: const Text("ต่อไป"))
            ],
          ),
        ),
      ),
    );
  }

  Widget inputTextField(
      {required double width,
      required String title,
      required String hintText,
      required TextEditingController controller,
      required Widget imageicon}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
            width: width * 0.2,
            child: Column(
              children: [imageicon, Text(title)],
            )),
        SizedBox(
            width: width * 0.6,
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 224, 224, 224),
                  hintText: hintText,
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            )),
      ],
    );
  }

  Widget getAgePage() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 5,
        child: Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text("อายุ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white))),
              Divider(
                color: mainColor,
                thickness: 2,
              ),
              inputTextField(
                  width: MediaQuery.of(context).size.width * 0.8,
                  title: "อายุ",
                  hintText: "กรอกอายุของคุณ",
                  imageicon: Image.asset("assets/Weight.png"),
                  controller: userAge),
              ElevatedButton(
                  onPressed: () {
                    if (userAge.text.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) => MainAlertDialog(
                            title: "กรุณากรอกอายุของท่าน",
                            onCilck: () {
                              Navigator.pop(context);
                            },
                            setIcon: Icons.cancel,
                            iconColor: Colors.red),
                      );
                    } else {
                      nextPage();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      )),
                  child: const Text("ต่อไป"))
            ],
          ),
        ),
      ),
    );
  }

  Widget getFootImage() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 5,
        child: Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text("ถ่ายรูปลักษณะแผลที่หายช้า",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white))),
              Divider(
                color: mainColor,
                thickness: 2,
              ),
              Container(
                // height: 300,
                width: 300,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(border: Border.all()),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          "กรุณาเลือกวิธีการถ่ายรูปภาพ",
                          style: TextStyle(
                              color: mainColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        actionsAlignment: MainAxisAlignment.center,
                        actionsOverflowAlignment: OverflowBarAlignment.center,
                        actions: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: mainColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14))),
                              onPressed: () {
                                footImagePicker(ImageSource.camera);
                                Navigator.pop(context);
                              },
                              child: const Text("เปิดกล้องถ่ายรูป")),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: mainColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14))),
                              onPressed: () {
                                footImagePicker(ImageSource.gallery);
                                Navigator.pop(context);
                              },
                              child: const Text("เปิดแกลเลอรี่")),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14))),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("ยกเลิก")),
                        ],
                      ),
                    );
                    // footImagePicker();
                  },
                  child: footImage == null
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                height: 120,
                                child: Image.asset("assets/camera.png")),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "ถ่ายภาพ",
                              style: TextStyle(
                                  color: mainColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            )
                          ],
                        )
                      : Image.file(File(footImage!.path)),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (footImage == null) {
                      showDialog(
                        context: context,
                        builder: (context) => MainAlertDialog(
                            title: "กรุณาถ่ายรูปลักษณะแผลที่หายช้าของท่าน",
                            onCilck: () {
                              Navigator.pop(context);
                            },
                            setIcon: Icons.cancel,
                            iconColor: Colors.red),
                      );
                    } else {
                      nextPage();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      )),
                  child: const Text("ต่อไป"))
            ],
          ),
        ),
      ),
    );
  }
}
