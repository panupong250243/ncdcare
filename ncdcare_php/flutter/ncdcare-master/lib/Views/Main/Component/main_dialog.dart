import 'package:flutter/material.dart';
import 'package:ncdcare/Color/ThemeData.dart';
import 'package:ncdcare/Views/Main/main_page.dart';

class MainAlertDialog extends StatefulWidget {
  final String title;
  final Function() onCilck;
  final IconData setIcon;
  final Color iconColor;
  const MainAlertDialog(
      {super.key,
      required this.title,
      required this.onCilck,
      this.setIcon = Icons.check_circle,
      this.iconColor = const Color.fromARGB(255, 3, 87, 47)});

  @override
  State<MainAlertDialog> createState() => _MainAlertDialogState();
}

class _MainAlertDialogState extends State<MainAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Icon(
        widget.setIcon,
        size: 100,
        color: widget.iconColor,
      ),
      title: Text(
        widget.title,
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
              widget.onCilck();
            },
          ),
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
    );
  }
}
