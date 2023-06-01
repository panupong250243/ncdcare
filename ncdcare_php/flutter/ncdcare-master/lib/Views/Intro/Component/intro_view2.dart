import 'package:flutter/material.dart';
import 'package:introduction_slider/introduction_slider.dart';

IntroductionSliderItem IntroView2(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return IntroductionSliderItem(
      logo: SizedBox(
          height: height * 0.4, child: Image.asset("assets/Intro2.png")),
      title: SizedBox(
        height: height * 0.25,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Text(
              "หมดปัญหากังวลใจกับอาการ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
            Text(
              "วิเคราะห์และขอคำปรึกษาเกี่ยวกับอาการของคุณ ",
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
      subtitle: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Image.asset("assets/blackname.png")),
      backgroundImageDecoration: const BackgroundImageDecoration(
          image: AssetImage("assets/Back2.png"), fit: BoxFit.fill));
}
