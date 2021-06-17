import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smarting/pages/camera.dart';

class BusinessAddInfo extends StatefulWidget {
  const BusinessAddInfo({Key? key}) : super(key: key);

  @override
  _BusinessAddInfoState createState() => _BusinessAddInfoState();
}

class _BusinessAddInfoState extends State<BusinessAddInfo> {
  String? businessCard;
  String? companyName = "入力してください。";
  String? name = "入力してください。";
  String? phone = "入力してください。";
  String? address = "入力してください。";
  String? station = "入力してください。";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_outlined),
        ),
        title: Text(
          '名刺追加',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Text(
                  '名刺の写真を撮ってください',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              Text(
                '名刺正面',
                textAlign: TextAlign.start,
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
                  height: 200,
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                ),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CameraApp())),
              ),
              Text(
                '名刺裏面',
                textAlign: TextAlign.start,
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
                  height: 200,
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                ),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CameraApp())),
              ),

              // Layout
              const Divider(
                height: 20,
                thickness: 2,
                indent: 10,
                endIndent: 10,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  '名刺の情報を入力してください',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              Text(
                "会社名　あなたの入力 : ${this.companyName}",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 1,
                minLines: 1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "会社名",
                  hintText: "会社名を入力してください！",
                ),

                // 変更を即時反映する。
                onChanged: (text) {
                  if (text.length > 0) {
                    // 入力値があるなら、それを反映する。
                    setState(() {
                      this.companyName = text;
                    });
                  } else {
                    setState(() {
                      this.companyName = "入力してください。";
                    });
                  }
                },
              ),
              Text(
                "お名前　あなたの入力 : ${this.name}",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 1,
                minLines: 1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "お名前",
                  hintText: "お名前を入力してください！",
                ),

                // 変更を即時反映する。
                onChanged: (text) {
                  if (text.length > 0) {
                    // 入力値があるなら、それを反映する。
                    setState(() {
                      this.name = text;
                    });
                  } else {
                    setState(() {
                      this.name = "入力してください。";
                    });
                  }
                },
              ),
              Text(
                "TEL/FAX　あなたの入力 : ${this.phone}",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 1,
                minLines: 1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "TEL/FAX",
                  hintText: "TEL/FAXを入力してください！",
                ),

                // 変更を即時反映する。
                onChanged: (text) {
                  if (text.length > 0) {
                    // 入力値があるなら、それを反映する。
                    setState(() {
                      this.phone = text;
                    });
                  } else {
                    setState(() {
                      this.phone = "入力してください。";
                    });
                  }
                },
              ),
              Text(
                "住所　あなたの入力 : ${this.address}",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 1,
                minLines: 1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "住所",
                  hintText: "住所を入力してください！",
                ),

                // 変更を即時反映する。
                onChanged: (text) {
                  if (text.length > 0) {
                    // 入力値があるなら、それを反映する。
                    setState(() {
                      this.address = text;
                    });
                  } else {
                    setState(() {
                      this.address = "入力してください。";
                    });
                  }
                },
              ),
              Text(
                "最寄駅　あなたの入力 : ${this.station}",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 1,
                minLines: 1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "最寄駅",
                  hintText: "駅名を入力してください！",
                ),

                // 変更を即時反映する。
                onChanged: (text) {
                  if (text.length > 0) {
                    // 入力値があるなら、それを反映する。
                    setState(() {
                      this.station = text;
                    });
                  } else {
                    setState(() {
                      this.station = "入力してください。";
                    });
                  }
                },
              ),
              Container(
                margin: EdgeInsets.all(1.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: CupertinoButton(
                        child: Text('初期化',
                            style: TextStyle(
                              letterSpacing: 8.0,
                              fontSize: 20.0,
                            )),
                        padding: EdgeInsets.fromLTRB(.0, 15.0, 0.0, 15.0),
                        color: Colors.orangeAccent.shade100,
                        onPressed: () {},
                      ),
                    ),
                    Expanded(
                      child: CupertinoButton(
                        child: Text('登録',
                            style: TextStyle(
                              letterSpacing: 8.0,
                              fontSize: 20.0,
                            )),
                        padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
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

  Widget myContainer({double size = 300, String text = ''}) {
    return Container(
      // color: color,
      width: size,
      height: size,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  showAlertDialog() {
    print("show dialog");
    showDialog<Null>(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text(
              "保存しますか？",
              style: TextStyle(fontSize: 15),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // ignore: deprecated_member_use
                  RaisedButton(
                      child: Text('保存しない'),
                      color: Colors.orangeAccent.shade100,
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    child: Text('保存します'),
                    color: Colors.orange,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )
            ],
          );
        });
    // Navigator.pop(this.context);
  }
}
