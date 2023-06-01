import 'package:flutter/material.dart';
import 'package:ncdcare/Api/UserProfile/user_login.dart';
import 'package:ncdcare/Color/ThemeData.dart';
import 'package:ncdcare/Views/Login/forget_password_page.dart';
import 'package:ncdcare/Views/Login/otp_page.dart';
import 'package:ncdcare/Views/Main/Component/main_dialog.dart';

class SearchUserNamepage extends StatefulWidget {
  const SearchUserNamepage({super.key});

  @override
  State<SearchUserNamepage> createState() => _SearchUserNamepageState();
}

class _SearchUserNamepageState extends State<SearchUserNamepage> {
  TextEditingController username = TextEditingController();
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
          "ลืมรหัสผ่าน",
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
                  "ชื่อผู้ใช้งาน",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Material(
                  color: Colors.transparent,
                  elevation: 8,
                  child: TextField(
                    controller: username,
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
                      hintText: 'ชื่อผู้ใช้งานหรืออีเมล',
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
                        int userId = await Login()
                            .forgetPassword(username: username.text);
                        if (userId != 0) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return OtpPage(
                                userId: userId,
                              );
                            },
                          ));
                        } else {
                          _showFailedDialog("ไม่ชื่อผู้ใช้หรืออีเมล์ดังกล่าว");
                        }
                      },
                      child: const Text("ค้นหา",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                )
              ],
            ),
          ),
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) => ListTile(
            title: const Text("ปุณณวิชญ์ ตันกุระ",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            shape: const Border.symmetric(horizontal: BorderSide(width: 0.5)),
            onTap: () {},
          ),
          itemCount: 2,
        ))
      ]),
    );
  }
}
