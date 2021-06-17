import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarting/provider/page_notifier.dart';

class LogoutView extends Page {
  static final String pageName = 'LogoutView';

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LogoutViewController(),
      ),
    );
  }

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this, builder: (context) => LogoutViewController());
  }
}

class LogoutViewController extends StatefulWidget {
  @override
  _LogoutViewState createState() => _LogoutViewState();
}

class _LogoutViewState extends State<LogoutViewController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: Container(
            child: Center(
              child: Container(
                height: 425,
                color: Colors.orange.shade200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/smt_logo2.png'),
                            fit: BoxFit.fill,
                          )),
                    ),
                    Text(
                      'スマートアイエンジー株式会社',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black38,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/unknwon.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Text(
                      '○○○○○○＠smarting.jp',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    Text(
                      'Flutter開発部 メンバー',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    Text(
                      '丸井 丸丸',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    SizedBox(height: 15),
                    Container(
                        height: 55,
                        width: 380,
                        color: Colors.black26,
                        child: Text('丸井 丸丸' + '様' + '\n正常にログアウトされました。',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black38,
                                fontWeight: FontWeight.bold))),
                    SizedBox(height: 25),
                    Container(
                        height: 40,
                        width: 300,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          child: Text(
                            'ログイン画面へ',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black38,
                                fontWeight: FontWeight.bold),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          color: Colors.orangeAccent,
                          onPressed: () {
                            Provider.of<PageNotifier>(context, listen: false)
                                .goToMain();
                          },
                        )),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
