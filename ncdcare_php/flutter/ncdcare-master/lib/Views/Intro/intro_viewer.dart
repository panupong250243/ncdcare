import 'package:flutter/material.dart';
import 'package:introduction_slider/introduction_slider.dart';
import 'package:ncdcare/Views/Intro/Component/intro_view1.dart';
import 'package:ncdcare/Views/Login/main_login_page.dart';

import 'Component/intro_view2.dart';
import 'Component/intro_view3.dart';

class IntroViewer extends StatefulWidget {
  const IntroViewer({super.key});

  @override
  State<IntroViewer> createState() => _IntroViewerState();
}

class _IntroViewerState extends State<IntroViewer> {
  List<IntroductionSliderItem> pageLoader() {
    List<IntroductionSliderItem> pagelist = [];
    return [IntroView1(context), IntroView2(context), IntroView3(context)];
  }

  Widget introViewsLoader() {
    return IntroductionSlider(
      items: pageLoader(),
      done: const Done(
        child: Icon(
          Icons.check_circle,
          color: Colors.grey,
        ),
        home: MainLoginPage(),
      ),
      dotIndicator: const DotIndicator(selectedColor: Colors.grey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: introViewsLoader(),
      ),
    );
  }
}
