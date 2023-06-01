import 'package:flutter/material.dart';
import 'package:ncdcare/Api/UserProfile/user_login.dart';
import 'package:ncdcare/Color/ThemeData.dart';
import 'package:ncdcare/Views/Login/forget_password_page.dart';
import 'package:ncdcare/Views/Main/Component/main_dialog.dart';

class OtpPage extends StatefulWidget {
  final int userId;
  const OtpPage({super.key, required this.userId});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  TextEditingController otp = TextEditingController();

  Future<void> _showFailedDialog(String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return MainAlertDialog(
          title: message,
          onCilck: () {
            Navigator.pop(context);
          },
          setIcon: Icons.cancel,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: true,
        title: const Text(
          "ยืนยันรหัส OTP",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            const Text(
              "ใส่รหัส OTP ที่ท่านได้รับทางอีเมล์",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Material(
              color: Colors.transparent,
              elevation: 8,
              child: TextField(
                controller: otp,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18.0)),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 160, 160, 160)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18.0)),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 160, 160, 160)),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: '123456',
                  hintStyle: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: width,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18))),
                  onPressed: () async {
                    int userId = await Login().checkOTP(
                        userId: widget.userId.toString(), otp: otp.text);
                    if (userId != 0) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return ForgetPasswordPage(
                            userId: userId,
                          );
                        },
                      ));
                    } else {
                      _showFailedDialog("เกิดข้อผิดพลาด");
                    }
                  },
                  child: const Text("ส่ง",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold))),
            )
          ],
        ),
      ),
    );
  }
}
