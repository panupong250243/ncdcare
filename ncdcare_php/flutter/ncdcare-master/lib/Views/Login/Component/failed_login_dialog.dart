import 'package:flutter/material.dart';
import 'package:ncdcare/Color/ThemeData.dart';
import 'package:ncdcare/Views/Main/main_page.dart';

class FailedLoginDialog extends StatefulWidget {
  final String message;
  const FailedLoginDialog({super.key, required this.message});

  @override
  State<FailedLoginDialog> createState() => _FailedLoginDialogState();
}

class _FailedLoginDialogState extends State<FailedLoginDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Icon(
        Icons.cancel,
        size: 100,
        color: mainColor,
      ),
      title: Text(
        'เข้าสู่ระบบล้มเหลว !',
        style: TextStyle(
            color: mainColor, fontWeight: FontWeight.bold, fontSize: 30),
      ),
      content: Text(widget.message),
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
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
    );
  }
}
