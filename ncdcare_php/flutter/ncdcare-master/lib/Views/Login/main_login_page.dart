import 'package:flutter/material.dart';
import 'package:ncdcare/Color/ThemeData.dart';
import 'package:ncdcare/Views/Login/login_page.dart';
import 'package:ncdcare/Views/Login/register_page.dart';

class MainLoginPage extends StatefulWidget {
  const MainLoginPage({super.key});

  @override
  State<MainLoginPage> createState() => _MainLoginPageState();
}

class _MainLoginPageState extends State<MainLoginPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitWidth, image: AssetImage("assets/Back3.png"))),
        child: Column(
          children: [
            Container(
                alignment: Alignment.center,
                height: height * 0.5,
                width: width * 0.8,
                child: Image.asset("assets/Login.png")),
            Container(
              padding: const EdgeInsets.only(left: 30),
              height: height * 0.4,
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "NCDs CARE",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "HEALTH SERVICE",
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text("ครบ จบ ในแอพเดียว\nแชทกับหมอ ปรึกษาหมอและผู้เชี่ยวชาญ ",
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
            Container(
              height: height * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14))),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return const RegisterPage();
                          },
                        ));
                      },
                      child: Text(
                        "สมัครสมาชิก",
                        style: TextStyle(
                            color: mainColor, fontWeight: FontWeight.bold),
                      )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 33, 112, 77),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14))),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return const LoginPage();
                          },
                        ));
                      },
                      child: const Text("เข้าสู่ระบบ",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
