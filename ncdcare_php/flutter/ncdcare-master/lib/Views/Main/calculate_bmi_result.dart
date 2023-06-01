import 'package:flutter/material.dart';
import 'package:ncdcare/Views/Main/Component/home_page.dart';
import 'package:ncdcare/Views/Main/Component/profile_icon.dart';
import 'package:ncdcare/Views/Main/main_page.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../Color/ThemeData.dart';

class CalculateBMIResult extends StatefulWidget {
  final double userWeight;
  final double userrHeight;
  const CalculateBMIResult(
      {super.key, required this.userWeight, required this.userrHeight});

  @override
  State<CalculateBMIResult> createState() => _CalculateBMIResultState();
}

class _CalculateBMIResultState extends State<CalculateBMIResult> {
  double BMIResult = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  double calculateBMI() {
    double heightSquare = widget.userrHeight * widget.userrHeight;
    double result = widget.userWeight / heightSquare;
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text("คำนวน BMI"),
        centerTitle: true,
        actions: profileIcon(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: SfRadialGauge(
                    enableLoadingAnimation: true,
                    axes: <RadialAxis>[
                      RadialAxis(
                        minimum: 0,
                        maximum: 100,
                        ranges: <GaugeRange>[
                          GaugeRange(
                            startValue: 0,
                            endValue: 20,
                            color: Colors.yellow,
                            startWidth: 50,
                            endWidth: 50,
                          ),
                          GaugeRange(
                            startValue: 20,
                            endValue: 80,
                            color: Colors.green,
                            startWidth: 50,
                            endWidth: 50,
                          ),
                          GaugeRange(
                            startValue: 80,
                            endValue: 100,
                            color: Colors.red,
                            startWidth: 50,
                            endWidth: 50,
                          )
                        ],
                        pointers: <GaugePointer>[
                          NeedlePointer(
                            value: calculateBMI(),
                            needleStartWidth: 5,
                            needleEndWidth: 1,
                            needleLength: 1,
                          )
                        ],
                        endAngle: 0,
                        startAngle: 180,
                        showFirstLabel: false,
                        showLabels: false,
                        showAxisLine: false,
                        showLastLabel: false,
                      ),
                    ])),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "BMI ของคุณมีค่าเท่ากับ",
                style: TextStyle(color: mainColor, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            Container(
                padding: const EdgeInsets.all(8),
                height: 100,
                width: double.infinity,
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 10,
                  child: Wrap(
                    alignment: WrapAlignment.spaceAround,
                    runAlignment: WrapAlignment.center,
                    children: [
                      Text(
                        calculateBMI().toStringAsFixed(2),
                        style: TextStyle(
                            color: mainColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      resultText(calculateBMI())
                    ],
                  ),
                )),
            SizedBox(
              height: 40,
            ),
            Container(
              child: Material(
                  elevation: 9,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset('assets/BMI.png'),
                  )),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                    builder: (context) {
                      return MainPage(
                        initialIndex: 2,
                      );
                    },
                  ), (route) => false);
                },
                style: ElevatedButton.styleFrom(backgroundColor: mainColor),
                child: Wrap(
                  children: [Icon(Icons.check_rounded), Text("  เสร็จสิ้น")],
                )),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: Wrap(
                  children: [
                    Icon(Icons.refresh, color: mainColor),
                    Text(
                      "  เริ่มทำใหม่",
                      style: TextStyle(color: mainColor),
                    )
                  ],
                )),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget resultText(double result) {
    if (result <= 18.5) {
      return Text(
        "ระดับน้ำหนักน้อย",
        style: TextStyle(
            color: Colors.yellow[200],
            fontWeight: FontWeight.bold,
            fontSize: 25),
      );
    } else if (result <= 22.9) {
      return const Text(
        "ระดับปกติ",
        style: TextStyle(
            color: Colors.green, fontWeight: FontWeight.bold, fontSize: 25),
      );
    } else if (result <= 24.9) {
      return Text(
        "ระดับท้วม",
        style: TextStyle(
            color: Colors.orange[200],
            fontWeight: FontWeight.bold,
            fontSize: 25),
      );
    } else if (result <= 29.9) {
      return const Text(
        "ระดับอ้วน",
        style: TextStyle(
            color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 25),
      );
    } else {
      return const Text(
        "ระดับอ้วนมาก",
        style: TextStyle(
            color: Colors.red, fontWeight: FontWeight.bold, fontSize: 25),
      );
    }
  }
}
