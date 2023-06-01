import 'package:flutter/material.dart';

import 'package:ncdcare/Color/ThemeData.dart';
import 'package:ncdcare/Views/Main/DataClass/cardclass.dart';
import 'package:url_launcher/url_launcher.dart';

class CardTile extends StatefulWidget {
  final CardDataClass data;

  const CardTile({super.key, required this.data});

  @override
  State<CardTile> createState() => _CardTileState();
}

class _CardTileState extends State<CardTile> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: GestureDetector(
        onTap: () async {
          if (widget.data.isHaveUri) {
            if (!await launchUrl(Uri.parse(widget.data.sourceUrl))) {
              throw Exception('Could not launch ${widget.data.sourceUrl}');
            }
          }
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Material(
              elevation: 10,
              child: SizedBox(
                width: width * 0.3,
                child: Image.network(widget.data.image),
              ),
            ),
            Material(
              elevation: 10,
              color: Colors.grey[400],
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20)),
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 20, 0, 20),
                width: width * 0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.data.sourceName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: mainColor,
                          fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.data.sourceSubName,
                      style: TextStyle(color: mainColor, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
