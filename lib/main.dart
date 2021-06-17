import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarting/pages/equipment/equipment_add_info.dart';
import 'package:smarting/pages/equipment/equipment_detail_info.dart';
import 'package:smarting/pages/userinfo/login_view.dart';
import 'package:smarting/pages/smarting_main.dart';
import 'package:smarting/pages/userinfo/logout_view.dart';
import 'package:smarting/pages/userinfo/personal_info.dart';
import 'package:smarting/pages/userinfo/setting_info.dart';
import 'package:smarting/provider/page_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SmartingApp());
}

class SmartingApp extends StatelessWidget {
  // ignore: non_constant_identifier_names
  static final String _GoLoginView = LoginView.pageName;

  // ignore: non_constant_identifier_names
  static final String _GoLogoutView = LogoutView.pageName;

  // ignore: non_constant_identifier_names
  static final String _GoPersonalInfo = PersonalInfo.pageName;

  // ignore: non_constant_identifier_names
  static final String _GoSettingInfo = SettingInfo.pageName;

  // ignore: non_constant_identifier_names
  static final String _GoSmartingMain = SmartingMain.pageName;

  // ignore: non_constant_identifier_names
  static final String _GoEquipmentDetailInfo = EquipmentDetailInfo.pageName;

  // ignore: non_constant_identifier_names
  static final String _GoEquipmentAddInfo = EquipmentAddInfo.pageName;


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => PageNotifier())],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Consumer<PageNotifier>(
              builder: (context, pageNotifier, child) {
                return Navigator(
                    // 画面遷移先
                    pages: [
                      MaterialPage(
                      // ① メイン画面遷移先
                          key: ValueKey(_GoLoginView),
                          child: LoginView()),
                      // ② 各画面遷移先
                      if (pageNotifier.currentPage == _GoSmartingMain)
                        SmartingMain(),
                      if (pageNotifier.currentPage == _GoEquipmentDetailInfo)
                        EquipmentDetailInfo(),
                      if (pageNotifier.currentPage == _GoEquipmentAddInfo)
                        EquipmentAddInfo(),
                      if (pageNotifier.currentPage == _GoLogoutView)
                        LogoutView(),
                      if (pageNotifier.currentPage == _GoPersonalInfo)
                        PersonalInfo(),
                      if (pageNotifier.currentPage == _GoSettingInfo)
                        SettingInfo(),
                    ],
                    // PopPage(バックページ)を防ぐ
                    onPopPage: (route, result) {
                      if (!route.didPop(result)) {
                        return false;
                      }
                      return true;
                    });
              },
            )));
  }
}
