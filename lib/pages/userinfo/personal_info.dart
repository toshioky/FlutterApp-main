import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarting/pages/smarting_main.dart';
import 'package:smarting/provider/page_notifier.dart';

class PersonalInfo extends Page {
  static final String pageName = 'PersonalInfo';

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PersonalInfoController(),
      ),
    );
  }

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this, builder: (context) => PersonalInfoController());
  }
}

class PersonalInfoController extends StatefulWidget {
  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.orangeAccent,
          title: Text(
            '個人情報',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
            actions: [
              IconButton(
                icon: Icon(Icons.keyboard_return, size: 30),
                onPressed: () =>
                    Provider.of<PageNotifier>(context, listen: false)
                        .goToOtherPage(SmartingMain.pageName),
              ),
            ]
    ));
  }
}
