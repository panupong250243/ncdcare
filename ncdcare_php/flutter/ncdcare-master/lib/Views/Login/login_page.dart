import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ncdcare/Api/UserProfile/user_login.dart';
import 'package:ncdcare/Color/ThemeData.dart';
import 'package:ncdcare/Views/Login/Component/failed_login_dialog.dart';
import 'package:ncdcare/Views/Login/Component/login_alert_dialog.dart';
import 'package:ncdcare/Views/Login/forget_password_page.dart';
import 'package:ncdcare/Views/Login/register_page.dart';
import 'package:ncdcare/Views/Login/search_username_page.dart';
import 'package:ncdcare/Views/Main/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isHidePassword = true;

  Future<void> _showLoginSucceedDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return LoginAlertDialog();
      },
    );
  }

  Future<void> _showLoginFailedDialog(String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return FailedLoginDialog(
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainColor,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitWidth, image: AssetImage("assets/Back2.png"))),
          child: Column(
            children: [
              Container(
                  width: width * 0.35,
                  height: height * 0.25,
                  decoration: const BoxDecoration(
                      image:
                          DecorationImage(image: AssetImage("assets/icon.png")))),
              const Text(
                "เข้าสู่ระบบ",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 35),
              Material(
                elevation: 9,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: width * 0.8,
                  // height: height * 0.6,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 5.0),
                        child: Container(
                          child: Column(
                            children: [
                              TextField(
                                controller: username,
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
                                  hintText: 'ชื่อผู้ใช้งาน',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 25),
                              TextField(
                                controller: password,
                                obscureText: isHidePassword,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.key_rounded,
                                      color: Colors.grey),
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.visibility),
                                    onPressed: () {
                                      isHidePassword = !isHidePassword;
                                      setState(() {});
                                    },
                                  ),
                                  suffixIconColor: Colors.black,
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18.0)),
                                  ),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18.0)),
                                  ),
                                  fillColor:
                                      const Color.fromARGB(255, 216, 216, 216),
                                  filled: true,
                                  hintText: 'รหัสผ่าน',
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 20),
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return const SearchUserNamepage();
                                },
                              ));
                            },
                            child: const Text("ลืมรหัสผ่าน ?",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold))),
                      ),
                      Container(
                        // width: width * 0.25,
                        height: height * 0.05,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: mainColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14))),
                            onPressed: () async {
                              int userId = await Login().login(
                                  username: username.text,
                                  password: password.text);
                              if (userId != 0) {
                                _showLoginSucceedDialog();
                              } else {
                                _showLoginFailedDialog(
                                    "ชื่อผู้ใช้ หรือ รหัสผ่าน ไม่ถูกต้อง");
                              }
                            },
                            child: const Text("เข้าสู่ระบบ",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("ไม่มีบัญชีผู้ใช้?",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: mainColor,
                                  fontWeight: FontWeight.bold)),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return const RegisterPage();
                                  },
                                ));
                              },
                              child: const Text("สมัครสมาชิก",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold))),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
