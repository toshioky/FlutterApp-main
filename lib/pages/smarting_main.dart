import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarting/pages/business/business_add_info.dart';
import 'package:smarting/pages/business/business_listview.dart';
import 'package:smarting/pages/equipment/equipment_add_info.dart';
import 'package:smarting/pages/equipment/equipment_listview.dart';
import 'package:smarting/pages/smarting_side_drawer.dart';
import 'package:smarting/provider/page_notifier.dart';

class SmartingMain extends Page {
  static final String pageName = 'SmartingMain';

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BottomNavigationController(),
      ),
    );
  }

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this, builder: (context) => BottomNavigationController());
  }
}

class BottomNavigationController extends StatefulWidget {
  @override
  _BottomNavigationControllerState createState() =>
      _BottomNavigationControllerState();
}

class _BottomNavigationControllerState
    extends State<BottomNavigationController> {
  final pages = [EquipmentListview(), BusinessListview()];

  // タブバー
  final tabBarTitles = ['備品管理', '名刺管理'];

  int tabBarIndex = 0;
  String currentTitle = "";

  @override
  Widget build(BuildContext context) {
    currentTitle = tabBarTitles[tabBarIndex];
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.orangeAccent,
            title: Text(
              currentTitle,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.search_outlined, size: 30),
                //todo : 備品または名刺のリストを検索する機能の作成
                onPressed: () =>
                    Provider.of<PageNotifier>(context, listen: false)
                        .goToOtherPage(SmartingMain.pageName),
              ),
              IconButton(
                icon: Icon(Icons.filter_alt, size: 30),
                //todo : 備品または名刺のリストのフィルター機能の作成
                onPressed: () =>
                    Provider.of<PageNotifier>(context, listen: false)
                        .goToOtherPage(SmartingMain.pageName),
              ),
            ]),
        drawer: Drawer(child: SmartingSideDrawer()),
        body: pages[tabBarIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.assessment), label: tabBarTitles[0]),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box), label: tabBarTitles[1])
          ],
          currentIndex: tabBarIndex,
          fixedColor: Colors.orangeAccent,
          onTap: (value) {
            setState(() {
              this.tabBarIndex = value.toInt();
            });
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showAddPage(),
          child: new Icon(Icons.add),
          backgroundColor: Colors.orangeAccent,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  void showAddPage() {
    if (tabBarIndex == 0) {
      Provider.of<PageNotifier>(context, listen: false)
          .goToOtherPage(EquipmentAddInfo.pageName);
    } else if (tabBarIndex == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BusinessAddInfo()));
    }
  }
}
