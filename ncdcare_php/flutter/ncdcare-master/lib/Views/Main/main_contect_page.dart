import 'package:flutter/material.dart';
import 'package:ncdcare/Views/Main/Component/main_app_bar.dart';
import 'package:ncdcare/Views/Main/DataClass/cardclass.dart';

class MainContectPage extends StatefulWidget {
  final CardClass card;
  const MainContectPage({super.key, required this.card});

  @override
  State<MainContectPage> createState() => _MainContectPageState();
}

class _MainContectPageState extends State<MainContectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar()
          .mainAppBar(context: context, title: Text(widget.card.cardtitle)),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(image: widget.card.backimage),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.card.cardtitle,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(widget.card.contentdetail),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
