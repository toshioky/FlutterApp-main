import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarting/pages/userinfo/logout_view.dart';
import 'package:smarting/pages/userinfo/personal_info.dart';
import 'package:smarting/pages/userinfo/setting_info.dart';
import 'package:smarting/provider/page_notifier.dart';

class SmartingSideDrawer extends StatefulWidget {
  @override
  _SmartingSideDrawerState createState() => _SmartingSideDrawerState();
}

class _SmartingSideDrawerState extends State<SmartingSideDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 45),
              color: Colors.orange.shade200,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/smt_logo2.png'),
                            fit: BoxFit.fill,
                            colorFilter: ColorFilter.mode(Colors.orange.shade200, BlendMode.dstATop)
                        )
                    ),
                  ),
                  Text(
                    'スマートアイエンジー株式会社',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black38,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 20),
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
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white
                    ),
                  ),
                  Text(
                    'Flutter開発部 メンバー',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white
                    ),
                  ),
                  Text(
                    '丸井 丸丸',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                '個人情報'
              ),
              onTap: (){
                Provider.of<PageNotifier>(context, listen: false).goToOtherPage(PersonalInfo.pageName);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                '設定'
              ),
              onTap: (){
                Provider.of<PageNotifier>(context, listen: false).goToOtherPage(SettingInfo.pageName);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                'ログアウト'
              ),
              onTap: (){
                Provider.of<PageNotifier>(context, listen: false).goToOtherPage(LogoutView.pageName);
              },
            )
          ],
        ),
    );
  }
}