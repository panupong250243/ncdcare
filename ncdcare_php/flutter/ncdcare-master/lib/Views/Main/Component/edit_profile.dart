import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ncdcare/Api/Cache/data.dart';
import 'package:ncdcare/Api/UserProfile/user_profile.dart';
import 'package:ncdcare/Api/ipcon.dart';
import 'package:ncdcare/Color/ThemeData.dart';
import 'package:ncdcare/Views/Main/Component/main_app_bar.dart';
import 'package:ncdcare/Views/Main/Component/main_dialog.dart';
import 'package:ncdcare/Views/Main/Component/profile_icon.dart';
import 'package:ncdcare/Views/Main/Component/profile_page.dart';
import 'package:ncdcare/Views/Main/DataClass/genderclass.dart';
import 'package:ncdcare/Views/Main/main_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class EditProfilePage extends StatefulWidget {
  String? img = "";
  String? ufullname = "";
  String? ugender = "0";
  // final String ubirth;
  String? utel = "";
  String? uemail = "";
  EditProfilePage(
      {super.key,
      required this.ufullname,
      required this.ugender,
      required this.img,
      // required this.ubirth,
      required this.utel,
      required this.uemail});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController ufirstname = TextEditingController();
  TextEditingController ulastname = TextEditingController();
  int ugender = 0;
  TextEditingController ubirth = TextEditingController();
  TextEditingController utel = TextEditingController();
  TextEditingController uemail = TextEditingController();
  List<genderclass> gender = [
    // genderclass("ไม่ระบุ", 0),
    genderclass("ชาย", 0),
    genderclass("หญิง", 1),
    // genderclass("อื่นๆ", 3),
  ];

  File? imgadd;

  Future<void> imagepickeradd() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imgadd = File(image.path);
      });
    }
  }

  @override
  void initState() {
    ufirstname = TextEditingController(text: widget.ufullname?.split(" ")[0]);
    if (widget.ufullname?.split(" ").length == 2) {
      ulastname = TextEditingController(text: widget.ufullname?.split(" ")[1]);
    }
    if (widget.ugender == null) {
      ugender = 0;
    } else {
      ugender = int.parse(widget.ugender!);
    }
    // ubirth = TextEditingController(text: widget.ubirth);
    utel = TextEditingController(text: widget.utel);
    uemail = TextEditingController(text: widget.uemail);
    super.initState();
  }

  void showSavedDialog() {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return MainAlertDialog(
          title: 'บันทึกข้อมูลสำเร็จ !',
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

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: MainAppBar().mainAppBar(
          context: context,
          title: const Text(
            "โปรไฟล์ของฉัน",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )),
      body: Container(
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      imagepickeradd();
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 45,
                      backgroundImage: imgadd != null
                          ? FileImage(File(imgadd!.path))
                          : widget.img == null
                              ? const AssetImage("assets/profile.png")
                                  as ImageProvider
                              : NetworkImage("$ipcon/../upload/${widget.img}"),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text("ชื่อ",
                      style: TextStyle(
                          fontSize: 14,
                          color: mainColor,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(18),
                    elevation: 8,
                    child: TextField(
                      controller: ufirstname,
                      decoration: const InputDecoration(
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
                        hintText: 'ชื่อ',
                        hintStyle: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text("นามสกุล",
                      style: TextStyle(
                          fontSize: 14,
                          color: mainColor,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(18),
                    elevation: 8,
                    child: TextField(
                      controller: ulastname,
                      decoration: const InputDecoration(
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
                        hintText: 'นามสกุล',
                        hintStyle: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text("เพศ",
                      style: TextStyle(
                          fontSize: 14,
                          color: mainColor,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  width: width,
                  padding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(18),
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<int>(
                          isExpanded: true,
                          underline: Container(),
                          value: ugender,
                          items: gender
                              .map((e) => DropdownMenuItem(
                                    value: e.genderType,
                                    child: Text(e.genderName),
                                  ))
                              .toList(),
                          onChanged: (v) {
                            ugender = v!;
                            setState(() {});
                          }),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 20.0),
                //   child: Text("วันเกิด",
                //       style: TextStyle(
                //           fontSize: 14,
                //           color: mainColor,
                //           fontWeight: FontWeight.bold)),
                // ),
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                //   child: Material(
                //     borderRadius: BorderRadius.circular(18),
                //     elevation: 8,
                //     child: TextField(
                //       controller: ubirth,
                //       decoration: InputDecoration(
                //         fillColor: Colors.white,
                //         filled: true,
                //         focusedBorder: OutlineInputBorder(
                //           borderSide: BorderSide.none,
                //           borderRadius: BorderRadius.all(Radius.circular(18.0)),
                //         ),
                //         border: OutlineInputBorder(
                //           borderRadius: BorderRadius.all(Radius.circular(18.0)),
                //           borderSide: BorderSide.none,
                //         ),
                //         hintText: 'วันเกิด',
                //         hintStyle: TextStyle(
                //           fontSize: 12,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text("หมายเลขเบอร์โทรศัพท์",
                      style: TextStyle(
                          fontSize: 14,
                          color: mainColor,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(18),
                    elevation: 8,
                    child: TextField(
                      controller: utel,
                      decoration: const InputDecoration(
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
                        hintText: 'หมายเลขเบอร์โทรศัพท์',
                        hintStyle: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text("อีเมล",
                      style: TextStyle(
                          fontSize: 14,
                          color: mainColor,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(18),
                    elevation: 8,
                    child: TextField(
                      controller: uemail,
                      decoration: const InputDecoration(
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
                        hintText: 'อีเมล',
                        hintStyle: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: width * 0.85,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: mainColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18))),
                        onPressed: () async {
                          int userId = await Profile().editProfile(
                              userId: cacheUserId.toString(),
                              userFullname:
                                  "${ufirstname.text} ${ulastname.text}",
                              userGender: ugender.toString(),
                              userEmail: uemail.text,
                              userTel: utel.text);

                          if (userId != 0) {
                            if (imgadd != null) {
                              int userIdImg = await Profile().editProfileImage(
                                  userId: userId.toString(),
                                  image: File(imgadd!.path));
                            }

                            showSavedDialog();
                          }
                        },
                        child: const Text("บันทึก",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold))),
                  ),
                ),
                const SizedBox(height: 35)
              ],
            ),
          )),
    );
  }
}
