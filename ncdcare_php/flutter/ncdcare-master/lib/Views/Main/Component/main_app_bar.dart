import 'package:flutter/material.dart';
import 'package:ncdcare/Color/ThemeData.dart';
import 'package:ncdcare/Views/Main/Component/profile_icon.dart';

class MainAppBar {
  PreferredSizeWidget mainAppBar(
      {required BuildContext context,
      required Widget title,
      bool isBack = true}) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: isBack
          ? IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_ios_new))
          : Container(),
      backgroundColor: mainColor,
      centerTitle: true,
      title: title,
      actions: profileIcon(),
    );
  }
}
