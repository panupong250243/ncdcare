import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ncdcare/Api/UserProfile/user_login.dart';
import 'package:ncdcare/Color/ThemeData.dart';
import 'package:ncdcare/Views/Main/Component/main_app_bar.dart';
import 'package:ncdcare/Views/Main/Component/main_dialog.dart';
import 'package:ncdcare/Views/Main/main_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class ChangePassword extends StatefulWidget {
  final int userId;
  ChangePassword({super.key, required this.userId});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController uPassword = TextEditingController();
  TextEditingController uNewPassword = TextEditingController();
  void showSavedDialog() {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return MainAlertDialog(
          title: 'เปลี่ยนรหัสผ่านสำเร็จ !',
          onCilck: () {
            PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: MainPage(
                initialIndex: 4,
              ),
              withNavBar: true, // OPTIONAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          },
        );
      },
    );
  }

  Widget passwordFieldBuilder({
    required TextEditingController controller,
    required String title,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(title,
              style: TextStyle(
                  fontSize: 14, color: mainColor, fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
          child: Material(
            borderRadius: BorderRadius.circular(18),
            elevation: 8,
            child: TextField(
              controller: controller,
              obscureText: true,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(18.0)),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18.0)),
                  borderSide: BorderSide.none,
                ),
                hintText: title,
                hintStyle: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar()
          .mainAppBar(context: context, title: Text("เปลี่ยนรหัสผ่าน")),
      body: ListView(
        shrinkWrap: true,
        children: [
          passwordFieldBuilder(
              controller: uPassword, title: "รหัสผ่านปัจจุบัน"),
          passwordFieldBuilder(controller: uNewPassword, title: "รหัสผ่านใหม่"),
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
            child: ElevatedButton(
              onPressed: () async {
                int userId = await Login().chagnePassword(
                    userId: widget.userId.toString(),
                    oldPassword: uPassword.text,
                    newPassword: uNewPassword.text);
                if (userId == 0) {
                } else if (userId == -1) {
                } else {
                  showSavedDialog();
                }
              },
              child: Text("ยืนยัน"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: mainColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14))),
            ),
          )
        ],
      ),
    );
  }
}
