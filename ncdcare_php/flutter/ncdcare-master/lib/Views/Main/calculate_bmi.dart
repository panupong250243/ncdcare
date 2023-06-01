import 'package:flutter/material.dart';
import 'package:ncdcare/Color/ThemeData.dart';
import 'package:ncdcare/Views/Main/Component/profile_icon.dart';
import 'package:ncdcare/Views/Main/calculate_bmi_result.dart';

class CalculateBMI extends StatefulWidget {
  const CalculateBMI({super.key});

  @override
  State<CalculateBMI> createState() => _CalculateBMIState();
}

class _CalculateBMIState extends State<CalculateBMI> {
  TextEditingController userWeight = TextEditingController();
  TextEditingController userHeight = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text("คำนวน BMI"),
        centerTitle: true,
        actions: profileIcon(),
      ),
      body: Container(
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
                    child: const Text("น้ำหนักและส่วนสูง",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                    decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(10))),
                Divider(
                  color: mainColor,
                  thickness: 2,
                ),
                InputTextField(
                    width: MediaQuery.of(context).size.width * 0.8,
                    title: "น้ำหนัก",
                    hintText: "กรอกน้ำหนักของคุณ",
                    imageicon: Image.asset("assets/Weight.png"),
                    controller: userWeight),
                SizedBox(
                  height: 10,
                ),
                InputTextField(
                    width: MediaQuery.of(context).size.width * 0.8,
                    title: "ส่วนสูง",
                    hintText: "กรอกส่วนสูงของคุณ",
                    imageicon: Image.asset("assets/Height.png"),
                    controller: userHeight),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return CalculateBMIResult(
                              userWeight:
                                  double.tryParse(userWeight.text) == null
                                      ? 0
                                      : double.parse(userWeight.text),
                              userrHeight:
                                  double.tryParse(userHeight.text) == null
                                      ? 0
                                      : double.parse(userHeight.text) / 100);
                        },
                      ));
                    },
                    child: Text("ต่อไป"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget InputTextField(
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
                  fillColor: Color.fromARGB(255, 224, 224, 224),
                  hintText: hintText,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            )),
      ],
    );
  }
}
