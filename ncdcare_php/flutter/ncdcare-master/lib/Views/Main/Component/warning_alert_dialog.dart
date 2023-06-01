import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ncdcare/Color/ThemeData.dart';

class WarningAlertDialogMess extends StatefulWidget {
  const WarningAlertDialogMess({super.key});

  @override
  State<WarningAlertDialogMess> createState() => _WarningAlertDialogMessState();
}

class _WarningAlertDialogMessState extends State<WarningAlertDialogMess> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: mainColor),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Container(
                width: double.infinity,
                child: const Text(
                  "ต่อไป",
                  textAlign: TextAlign.center,
                )))
      ],
      title: const Text(
        "คำเตือน",
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "กรณีการเจ็บป่วยในสตรีมีครรภ์ และเด็ก จะมีอาการที่ซับซ้อนกว่าปกติ โปรดปรึกษาแพทย์ผู้เชี่ยวชาญ หากมีอาการที่กังวล",
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "การบริการของเราไม่ใช่คำวินิจฉัยของแพทย์แต่เป็นเพียงการให้ข้อมูลเบื้องต้นเท่านั้น",
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            color: Colors.grey[200],
            child: const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "หากมีข้อสงสัย ควรปรึกษา \n แพทย์ผู้เชี่ยวชาญเพิ่มเติมนะครับ",
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              height: 150, child: Image.asset("assets/warning_image.png")),
        ],
      ),
    );
  }
}
