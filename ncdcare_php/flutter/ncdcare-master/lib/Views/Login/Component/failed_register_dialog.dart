import 'package:flutter/material.dart';
import 'package:ncdcare/Color/ThemeData.dart';
import 'package:ncdcare/Views/Main/main_page.dart';

class FailedRegisterDialog extends StatefulWidget {
  final String message;
  const FailedRegisterDialog({super.key, required this.message});

  @override
  State<FailedRegisterDialog> createState() => _FailedRegisterDialogState();
}

class _FailedRegisterDialogState extends State<FailedRegisterDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Icon(
        Icons.cancel,
        size: 100,
        color: mainColor,
      ),
      title: Text(
        'สมัครสมาชิกล้มเหลว !',
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
