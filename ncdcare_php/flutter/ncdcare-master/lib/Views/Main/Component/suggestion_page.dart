import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ncdcare/Api/Cache/data.dart';
import 'package:ncdcare/Api/UserProfile/user_profile.dart';
import 'package:ncdcare/Color/ThemeData.dart';
import 'package:ncdcare/Views/Main/Component/main_app_bar.dart';
import 'package:ncdcare/Views/Main/Component/main_dialog.dart';

class SuggestionPage extends StatefulWidget {
  const SuggestionPage({super.key});

  @override
  State<SuggestionPage> createState() => _SuggestionPageState();
}

class _SuggestionPageState extends State<SuggestionPage> {
  TextEditingController sugDetail = TextEditingController();

  double sugRating = 0;

  Future<void> _showSuccedDialog(String msg) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return MainAlertDialog(onCilck: () { Navigator.of(context).pop(); }, title: msg,);
      },
    );
  }

  Future<void> _showFailedDialog(String msg) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return MainAlertDialog(onCilck: () { Navigator.of(context).pop(); }, title: msg, setIcon: Icons.cancel);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar()
          .mainAppBar(context: context, title: const Text("ข้อเสนอแนะ")),
      body: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(5, 20, 5, 5),
          margin: const EdgeInsets.all(10),
          child: Material(
            elevation: 20,
            borderRadius: BorderRadius.circular(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("ข้อเสนอแนะของคุณช่วยเราในการปรับปรุง"),
                RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    sugRating = rating;
                    print(rating);
                  },
                ),
                Text("Click the star give your rate"),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(5, 20, 5, 5),
          margin: const EdgeInsets.all(10),
          child: Material(
            elevation: 20,
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  controller: sugDetail,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)))),
            ),
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.fromLTRB(5, 20, 5, 5),
            margin: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () async {
                int sugId = await Profile().suggestion(
                  sugDetail: sugDetail.text,
                  sugRating: sugRating.toString(),
                  userId: cacheUserId.toString(),
                );
                if (sugId != 0) {
                  _showSuccedDialog("ขอบคุณสำหรับข้อเสนอแนะ !");
                }
              },
              child: Text("ส่งข้อเสนอแนะ"),
              style: ElevatedButton.styleFrom(
                backgroundColor: mainColor,
              ),
            )),
      ]),
    );
  }
}
