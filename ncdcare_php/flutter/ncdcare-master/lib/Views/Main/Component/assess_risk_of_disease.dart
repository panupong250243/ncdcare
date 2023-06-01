import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ncdcare/Api/Cache/data.dart';
import 'package:ncdcare/Api/ipcon.dart';
import 'package:ncdcare/Views/Main/Component/main_app_bar.dart';
import 'package:ncdcare/Views/Main/Component/warning_alert_dialog.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AssessRiskOfDisease extends StatefulWidget {
  const AssessRiskOfDisease({super.key});

  @override
  State<AssessRiskOfDisease> createState() => _AssessRiskOfDiseaseState();
}

class _AssessRiskOfDiseaseState extends State<AssessRiskOfDisease> {
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
    )
    ..loadRequest(
        Uri.parse('$ipcon/disease/loadingFromApp.php?user_id=$cacheUserId'));
  // ..loadRequest(Uri.parse(
  //     '$ipcon/disease/assessRiskOfDisease.php?userId=$cacheUserId'));

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        show();
      },
    );
  }

  void show() {
    showDialog(
      context: context,
      builder: (context) {
        return const WarningAlertDialogMess();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar()
          .mainAppBar(context: context, title: Text("ประเมินความเสี่ยงโรค")),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
