import 'package:flutter/material.dart';
import 'package:ncdcare/Color/ThemeData.dart';
import 'package:ncdcare/Views/Main/main_page.dart';

class LoginAlertDialog extends StatefulWidget {
  const LoginAlertDialog({super.key});

  @override
  State<LoginAlertDialog> createState() => _LoginAlertDialogState();
}

class _LoginAlertDialogState extends State<LoginAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Icon(
        Icons.check_circle,
        size: 100,
        color: mainColor,
      ),
      title: Text(
        'เข้าสู่ระบบสำเร็จ !',
        style: TextStyle(
            color: mainColor, fontWeight: FontWeight.bold, fontSize: 30),
      ),
      actions: <Widget>[
        Container(
          width: 100,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: mainColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14))),
            child: const Text(
              'ตกลง',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return MainPage(
                    initialIndex: 2,
                  );
                },
              ));
            },
          ),
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
    );
  }
}
