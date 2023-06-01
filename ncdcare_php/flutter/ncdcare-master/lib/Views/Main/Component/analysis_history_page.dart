import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ncdcare/Views/Main/Component/main_app_bar.dart';

class AnalysisHistoryPage extends StatefulWidget {
  const AnalysisHistoryPage({super.key});

  @override
  State<AnalysisHistoryPage> createState() => _AnalysisHistoryPageState();
}

class _AnalysisHistoryPageState extends State<AnalysisHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar()
          .mainAppBar(context: context, title: const Text("ประวัติการวิเคราะห์")),
      body: Container(),
    );
  }
}
