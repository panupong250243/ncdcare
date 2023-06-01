import 'package:flutter/material.dart';
import 'package:ncdcare/Api/Contactus/contactus.dart';
import 'package:ncdcare/Api/Source/source.dart';
import 'package:ncdcare/Api/ipcon.dart';
import 'package:ncdcare/Views/Main/Component/card_tile.dart';
import 'package:ncdcare/Views/Main/Component/main_app_bar.dart';
import 'package:ncdcare/Views/Main/DataClass/cardclass.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  Future<List<CardDataClass>> getAbout() async {
    var contactList = await Contactus().getContactus();
    return contactList
        .map((e) => CardDataClass(
            e['contact_name'],
            "$ipcon/../upload/${e['contact_image']}",
            e['contact_url'],
            "",
            e['contact_url'] == "" ? false : true))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:
          MainAppBar().mainAppBar(context: context, title: Text("เกียวกับ")),
      body: Container(
        height: height,
        width: width,
        child: FutureBuilder<List<CardDataClass>>(
            future: getAbout(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return CardTile(
                        data: snapshot.data![index],
                      );
                    },
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
