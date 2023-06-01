import 'package:flutter/material.dart';
import 'package:ncdcare/Color/ThemeData.dart';

class RawTest1 extends StatefulWidget {
  const RawTest1({super.key});

  @override
  State<RawTest1> createState() => _RawTest1State();
}

class _RawTest1State extends State<RawTest1> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: OverflowBox(
        maxHeight: double.infinity,
        maxWidth: double.infinity,
        child: Column(children: [
          Container(
            height: height * 0.6,
            color: secordColor,
            child: Column(children: [
              Container(
                height: height * 0.6,
                child: Image.asset(
                  "assets/Intro1.png",
                  fit: BoxFit.fitHeight,
                ),
              )
            ]),
          ),
          RotationTransition(
            turns: AlwaysStoppedAnimation(20 / 360),
            child: Container(
              decoration: BoxDecoration(
                  color: mainColor, borderRadius: BorderRadius.circular(70)),
              height: height * 0.7,
              width: height * 0.7,
            ),
          )
        ]),
      ),
    );
  }
}
