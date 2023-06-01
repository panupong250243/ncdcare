import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ncdcare/Api/Cache/data.dart';
import 'package:ncdcare/Api/UserProfile/user_login.dart';
import 'package:ncdcare/Api/UserProfile/user_profile.dart';
import 'package:ncdcare/Api/ipcon.dart';
import 'package:ncdcare/Color/ThemeData.dart';
import 'package:ncdcare/Views/Login/login_page.dart';
import 'package:ncdcare/Views/Main/Component/change_password.dart';
import 'package:ncdcare/Views/Main/Component/edit_profile.dart';
import 'package:ncdcare/Views/Main/Component/main_dialog.dart';
import 'package:ncdcare/Views/Main/Component/privacy_policy_page.dart';
import 'package:ncdcare/Views/Main/Component/profile_icon.dart';
import 'package:ncdcare/Views/Main/Component/suggestion_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  Future<Map<String, dynamic>> getprofile() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var userId = preferences.getInt("userId");
    var userProfile = Profile().getUserProfile(userId: userId.toString());
    return userProfile;
  }

  Future<void> imagepickeradd() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      int result = await Profile().editProfileImage(
          userId: cacheUserId.toString(), image: File(image.path));
      if (result != 0) {
        setState(() {});
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("ข้อมูลส่วนตัว"),
        backgroundColor: mainColor,
        actions: profileIcon(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<Map<String, dynamic>>(
                future: getprofile(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 45,
                              backgroundImage: snapshot.data!['user_image'] ==
                                      null
                                  ? const AssetImage("assets/profile.png")
                                      as ImageProvider
                                  : NetworkImage(
                                      "$ipcon/../upload/${snapshot.data!['user_image']}"),
                            ),
                          ),
                          Text(
                            snapshot.data!['user_fullname'] == null ||
                                    snapshot.data!['user_fullname']
                                            .toString()
                                            .isEmpty ==
                                        ""
                                ? snapshot.data!['user_name']
                                : snapshot.data!['user_fullname'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return MainAlertDialog(
                                    title: "ออกจากระบบสำเร็จ !",
                                    onCilck: () {
                                      Login().logout();
                                      PersistentNavBarNavigator.pushNewScreen(
                                          context,
                                          screen: LoginPage(),
                                          withNavBar: false,
                                          pageTransitionAnimation:
                                              PageTransitionAnimation
                                                  .cupertino);
                                    },
                                    iconColor: Colors.red,
                                    setIcon: Icons.logout,
                                  );
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red[100]),
                            child: const Text(
                              "ออกจากระบบ",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              elevation: 10,
                              borderRadius: BorderRadius.circular(20),
                              child: Column(
                                children: [
                                  tileButton("โปรไฟล์ของฉัน",
                                      target: EditProfilePage(
                                        ufullname:
                                            snapshot.data!['user_fullname'],
                                        // ubirth: snapshot.data!['user_fullname'],
                                        uemail: snapshot.data!['user_email'],
                                        ugender: snapshot.data!['user_gender'],
                                        utel: snapshot.data!['user_tel'],
                                        img: snapshot.data!['user_image'],
                                      )),
                                  tileButton("เปลี่ยนรหัสผ่าน",
                                      target: ChangePassword(
                                        userId: cacheUserId,
                                      )),
                                  tileButton("ข้อเสนอแนะ",
                                      target: const SuggestionPage()),
                                  tileButton("นโยบายความเป็นส่วนตัว",
                                      target: const PrivacyPolicyPage()),
                                ],
                              ),
                            ),
                          ),
                        ]);
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
          ],
        ),
      ),
    );
  }

  Widget tileButton(String title, {Widget? target}) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: mainColor),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: mainColor),
      onTap: () {
        if (target != null) {
          PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: target,
            withNavBar: true, // OPTIONAL VALUE. True by default.
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        }
      },
    );
  }
}
