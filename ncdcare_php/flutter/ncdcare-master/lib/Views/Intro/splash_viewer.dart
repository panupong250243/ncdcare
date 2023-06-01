import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:ncdcare/Views/Intro/intro_viewer.dart';

class SplashViewer extends StatefulWidget {
  const SplashViewer({super.key});

  @override
  State<SplashViewer> createState() => _SplashViewerState();
}

class _SplashViewerState extends State<SplashViewer> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return EasySplashScreen(
      logo: Image.asset("assets/MainIcon.png"),
      logoWidth: width * 0.5,
      durationInSeconds: 5,
      navigator: const IntroViewer(),
      loaderColor: Colors.transparent,
    );
  }
}
