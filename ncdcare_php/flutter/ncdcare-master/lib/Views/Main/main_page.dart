import 'package:flutter/cupertino.dart';
import 'package:ncdcare/Color/ThemeData.dart';
import 'package:ncdcare/Views/Main/Component/advice_page.dart';
import 'package:ncdcare/Views/Main/Component/disease_info_page.dart';
import 'package:ncdcare/Views/Main/Component/edit_profile.dart';
import 'package:ncdcare/Views/Main/Component/history_page.dart';
import 'package:ncdcare/Views/Main/Component/home_page.dart';
import 'package:ncdcare/Views/Main/Component/profile_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  int initialIndex = 2;
  MainPage({
    super.key,
    required this.initialIndex,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 2);

  List<Widget> _buildScreens() {
    return [
      const AdvicePage(), //AdvicePage(),
      const DiseaseInfoPage(),
      const HomePage(),
      const HistoryPage(),
      const profilePage()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.book_outlined),
        title: ("คำแนะนำ"),
        activeColorPrimary: Colors.teal,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.medical_information),
        title: ("ข้อมูลโรค"),
        activeColorPrimary: Colors.teal,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.add_home, color: Colors.white),
        title: ("หน้าแรก"),
        activeColorPrimary: mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.receipt_rounded),
        title: ("ประวัติ"),
        activeColorPrimary: Colors.teal,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person_2),
        title: ("ข้อมูลส่วนตัว"),
        activeColorPrimary: Colors.teal,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: widget.initialIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style15, // Choose the nav bar style with this property.
    );
    ;
  }
}
