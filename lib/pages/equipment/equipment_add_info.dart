import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smarting/pages/camera.dart';
import 'package:smarting/pages/smarting_main.dart';
import 'package:smarting/provider/page_notifier.dart';

class EquipmentAddInfo extends Page {
  static final String pageName = 'EquipmentAddInfo';

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: EquipmentAddInfoController(),
      ),
    );
  }

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this, builder: (context) => EquipmentAddInfoController());
  }
}

class EquipmentAddInfoController extends StatefulWidget {
  @override
  _EquipmentAddInfoState createState() => _EquipmentAddInfoState();
}

class _EquipmentAddInfoState extends State<EquipmentAddInfoController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.orangeAccent,
            title: Text(
              '備品追加',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.keyboard_return, size: 30),
                onPressed: () =>
                    Provider.of<PageNotifier>(context, listen: false)
                        .goToOtherPage(SmartingMain.pageName),
              ),
            ]),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 45,
                margin: EdgeInsets.fromLTRB(20, 30, 20, 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'カテゴリー',
                    //errorText: 'Error message',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                height: 45,
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: '備品名',
                    //errorText: 'Error message',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              InkWell(
                child: Container(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.photo_camera_outlined,
                      size: 100,
                    ),
                  ),
                  //child: Center(child: Image.asset(pic!),),
                  height: 220,
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                ),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CameraApp())),
              ),
              Container(
                height: 45,
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.remove_circle)),
                    Flexible(
                        child: TextFormField(
                      textAlign: TextAlign.center,
                      inputFormatters: <TextInputFormatter>[
                        // ignore: deprecated_member_use
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      keyboardType: TextInputType.number,
                      initialValue: '0',
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: '個数',
                        //errorText: 'Error message',
                        border: OutlineInputBorder(),
                        counterText: '',
                      ),
                    )),
                    IconButton(onPressed: () {}, icon: Icon(Icons.add_circle))
                  ],
                ),
                width: 220,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.top,
                  maxLines: 2,
                  //initialValue: biko,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: '備考',
                    //errorText: 'Error message',
                    border: OutlineInputBorder(),
                    counterText: '',
                  ),
                  maxLength: 135,
                ),
              ),
              Container(
                height: 55,
                margin: EdgeInsets.fromLTRB(35.0, 15.0, 35.0, 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: CupertinoButton(
                        child: Text('初期化',
                            style: TextStyle(
                                letterSpacing: 8.0,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold)),
                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        color: Colors.orangeAccent.shade100,
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: CupertinoButton(
                        child: Text('登録',
                            style: TextStyle(
                                letterSpacing: 8.0,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold)),
                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        color: Colors.orange,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
