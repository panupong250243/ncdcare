import 'package:flutter/material.dart';
import 'package:ncdcare/Api/UserProfile/user_login.dart';
import 'package:ncdcare/Color/ThemeData.dart';
import 'package:ncdcare/Views/Login/login_page.dart';
import 'package:ncdcare/Views/Main/Component/main_dialog.dart';
import 'package:ncdcare/Views/Main/Component/profile_icon.dart';

class ForgetPasswordPage extends StatefulWidget {
  final int userId;
  const ForgetPasswordPage({super.key, required this.userId});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  TextEditingController newPassword = TextEditingController();
  TextEditingController newComPassword = TextEditingController();

  Future<void> _showSucceedDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return MainAlertDialog(
          title: 'การรีเซ็ตรหัสผ่านสำเร็จ',
          onCilck: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
                (route) => false);
          },
        );
      },
    );
  }

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
          "เปลี่ยนรหัสผ่าน",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(35.0, 25.0, 35.0, 15.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "รหัสผ่านใหม่",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Material(
                  color: Colors.transparent,
                  elevation: 8,
                  child: TextField(
                    controller: newPassword,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18.0)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 160, 160, 160)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18.0)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 160, 160, 160)),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'รหัสผ่านใหม่',
                      hintStyle: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "ยืนยันรหัสผ่านใหม่",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Material(
                  color: Colors.transparent,
                  elevation: 8,
                  child: TextField(
                    controller: newComPassword,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18.0)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 160, 160, 160)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18.0)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 160, 160, 160)),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'ยืนยันรหัสผ่านใหม่',
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
                        print(widget.userId.toString());
                        print(newPassword.text);
                        if (newPassword.text == newComPassword.text) {
                          int userdataId = await Login().resetPassword(
                              userId: widget.userId.toString(),
                              newPassword: newPassword.text);
                          if (userdataId != 0) {
                            _showSucceedDialog();
                          } else {
                            _showFailedDialog("เกิดข้อผิดพลาด");
                          }
                        } else {
                          _showFailedDialog("รหัสผ่านไม่ตรงกัน");
                        }
                      },
                      child: const Text("ยืนยัน",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
