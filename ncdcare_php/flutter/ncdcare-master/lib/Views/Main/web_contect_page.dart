import 'package:flutter/material.dart';
import 'package:ncdcare/Api/Cache/data.dart';
import 'package:ncdcare/Api/ipcon.dart';
import 'package:ncdcare/Views/Main/Component/main_app_bar.dart';
import 'package:ncdcare/Views/Main/DataClass/cardclass.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebContectPage extends StatefulWidget {
  final CardClass card;
  const WebContectPage({super.key, required this.card});

  @override
  State<WebContectPage> createState() => _WebContectPageState();
}

class _WebContectPageState extends State<WebContectPage> {
  var controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    );

  @override
  void initState() {
    controller.loadHtmlString(
        "<style> iframe {height: 100%;  width: 100%;} </style> <div height='300' width='300'>${widget.card.contentdetail}</div>");
    super.initState();
  }

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
                SizedBox(
                  height: 150,
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(20),
                    child: WebViewWidget(
                      controller: controller,
                    ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
