import 'package:flutter/material.dart';
import 'package:ncdcare/Views/Main/DataClass/cardclass.dart';
import 'package:ncdcare/Views/Main/main_contect_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class CardItemBuilder extends StatefulWidget {
  final double width;
  final CardClass card;
  const CardItemBuilder({super.key, required this.width, required this.card});

  @override
  State<CardItemBuilder> createState() => _CardItemBuilderState();
}

class _CardItemBuilderState extends State<CardItemBuilder> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: MainContectPage(card: widget.card),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Container(
          height: 150,
          width: widget.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: widget.card.backimage, fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Text(
                      widget.card.cardtitle,
                      style: TextStyle(
                        // color: mainColor,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 2
                          ..color = Colors.black,
                      ),
                    ),
                    Text(
                      widget.card.cardtitle,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
