import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarting/pages/smarting_main.dart';
import 'package:smarting/provider/page_notifier.dart';

class SettingInfo extends Page {
  static final String pageName = 'SettingInfo';

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SettingInfoController(),
      ),
    );
  }

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this, builder: (context) => SettingInfoController());
  }
}

class SettingInfoController extends StatefulWidget {
  @override
  _SettingInfoState createState() => _SettingInfoState();
}

class _SettingInfoState extends State<SettingInfoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.orangeAccent,
            title: Text(
              'アプリ設定',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            actions: [
          IconButton(
            icon: Icon(Icons.keyboard_return, size: 30),
            onPressed: () => Provider.of<PageNotifier>(context, listen: false)
                .goToOtherPage(SmartingMain.pageName),
          ),
        ]));
  }
}
