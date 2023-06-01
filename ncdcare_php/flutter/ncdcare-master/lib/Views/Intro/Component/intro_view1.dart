import 'package:flutter/material.dart';
import 'package:introduction_slider/introduction_slider.dart';

IntroductionSliderItem IntroView1(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return IntroductionSliderItem(
      logo: SizedBox(
          height: height * 0.4, child: Image.asset("assets/Intro1.png")),
      title: SizedBox(
        height: height * 0.25,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Text(
              "วิเคราะห์โรคด้วยตัวเอง\nได้ทุกที่ ทุกเวลา",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Text(
              "สามารถวิเคราะห์โรคเบื้องต้นได้ ",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
      subtitle: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Image.asset("assets/whitename.png")),
      backgroundImageDecoration: const BackgroundImageDecoration(
          image: AssetImage("assets/Back1.png"), fit: BoxFit.fill));
}
