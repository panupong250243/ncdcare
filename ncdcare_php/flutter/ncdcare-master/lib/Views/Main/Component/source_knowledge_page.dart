import 'package:flutter/material.dart';
import 'package:ncdcare/Api/Source/source.dart';
import 'package:ncdcare/Api/ipcon.dart';
import 'package:ncdcare/Views/Main/Component/card_tile.dart';
import 'package:ncdcare/Views/Main/Component/main_app_bar.dart';
import 'package:ncdcare/Views/Main/DataClass/cardclass.dart';

class SourceKnowledgePage extends StatefulWidget {
  const SourceKnowledgePage({super.key});

  @override
  State<SourceKnowledgePage> createState() => _SourceKnowledgePageState();
}

class _SourceKnowledgePageState extends State<SourceKnowledgePage> {
  Future<List<CardDataClass>> getSource() async {
    var sourceList = await Source().getSource();
    return sourceList
        .map((e) => CardDataClass(
            e['sourcek_name'],
            "$ipcon/../upload/${e['sourcek_image']}",
            e['sourcek_url'],
            "",
            true))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: MainAppBar()
          .mainAppBar(context: context, title: Text("แหล่งความรู้")),
      body: Container(
        height: height,
        width: width,
        child: FutureBuilder<List<CardDataClass>>(
            future: getSource(),
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
