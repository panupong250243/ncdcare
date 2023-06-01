import 'package:flutter/material.dart';
import 'package:ncdcare/Api/UserProfile/user_login.dart';
import 'package:ncdcare/Color/ThemeData.dart';
import 'package:ncdcare/Views/Login/Component/failed_register_dialog.dart';
import 'package:ncdcare/Views/Login/Component/privacy_policy.dart';
import 'package:ncdcare/Views/Login/Component/register_alert_dialog.dart';
import 'package:ncdcare/Views/Login/login_page.dart';
import 'package:ncdcare/Views/Main/main_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController tel = TextEditingController();

  Future<void> _showRegisterSucceedDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return const RegisterAlertDialog();
      },
    );
  }

  Future<void> _showRegisterFailedDialog(String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return FailedRegisterDialog(
          message: message,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitWidth, image: AssetImage("assets/Back4.png"))),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: width,
                child: IconButton(icon: Icon(Icons.arrow_back_ios_new),onPressed: () {
                  Navigator.of(context).pop();
                },)),
              Container(
                  width: width * 0.35,
                  height: height * 0.18,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/icon.png")))),
              Text(
                "สมัครสมาชิก",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: mainColor),
              ),
              const SizedBox(height: 40),
              Material(
                elevation: 9,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: width * 0.8,
                  // height: height * 0.6,
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 0.0),
                        child: Container(
                          child: Column(
                            children: [
                              TextField(
                                controller: username,
                                decoration: const InputDecoration(
                                  prefixIcon:
                                      Icon(Icons.person, color: Colors.grey),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18.0)),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18.0)),
                                  ),
                                  fillColor: Color.fromARGB(255, 216, 216, 216),
                                  filled: true,
                                  hintText: 'ชื่อผู้ใช้งาน',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              TextField(
                                controller: fullname,
                                decoration: const InputDecoration(
                                  prefixIcon:
                                      Icon(Icons.person, color: Colors.grey),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18.0)),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18.0)),
                                  ),
                                  fillColor: Color.fromARGB(255, 216, 216, 216),
                                  filled: true,
                                  hintText: 'ชื่อ-นามสกุล',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              TextField(
                                controller: email,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.mail_outline,
                                      color: Colors.grey),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18.0)),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18.0)),
                                  ),
                                  fillColor: Color.fromARGB(255, 216, 216, 216),
                                  filled: true,
                                  hintText: 'อี-เมล',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              TextField(
                                controller: tel,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.phone_android,
                                      color: Colors.grey),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18.0)),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18.0)),
                                  ),
                                  fillColor: Color.fromARGB(255, 216, 216, 216),
                                  filled: true,
                                  hintText: 'เบอร์โทรศัพท์',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              TextField(
                                controller: password,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.key_rounded,
                                      color: Colors.grey),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18.0)),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18.0)),
                                  ),
                                  fillColor: Color.fromARGB(255, 216, 216, 216),
                                  filled: true,
                                  hintText: 'รหัสผ่าน',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              TextField(
                                controller: confirmpassword,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.key_rounded,
                                      color: Colors.grey),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18.0)),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18.0)),
                                  ),
                                  fillColor: Color.fromARGB(255, 216, 216, 216),
                                  filled: true,
                                  hintText: 'ยืนยันรหัสผ่าน',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        // width: width * 0.25,
                        height: height * 0.05,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: mainColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14))),
                            onPressed: () async {
                              if (password.text == confirmpassword.text) {
                                int userId = await Login().register(
                                    username: username.text,
                                    password: password.text,
                                    email: email.text,
                                    fullname: fullname.text,
                                    tel: tel.text);
                                if (userId != 0) {
                                  _showRegisterSucceedDialog();
                                } else {
                                  _showRegisterFailedDialog(
                                      "เกิดข้อผิดพลาดระหว่างดำเนินการ");
                                }
                              } else {
                                _showRegisterFailedDialog("รหัสผ่านไม่ตรงกัน");
                              }
                            },
                            child: const Text("สมัครสมาชิก",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("มีบัญชีผู้ใช้แล้ว",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: mainColor,
                                  fontWeight: FontWeight.bold)),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return const LoginPage();
                                  },
                                ));
                              },
                              child: const Text("เข้าสู่ระบบ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold))),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                          "เมื่อคลิกปุ่มด้านบนและสร้างบัญชี แสดงว่าคุณได้อ่านและยอมรับ",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold)),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return PrivacyPolicy();
                              },
                            ));
                          },
                          child: const Text(
                              "นโยบายความเป็นส่วนตัวและเงื่อนไขการให้บริการ",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline))),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
