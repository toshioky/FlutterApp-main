import 'package:flutter/material.dart';
import 'package:smarting/pages/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:smarting/services/card_list.dart';

class BusinessDetailInfo extends StatefulWidget{
  final CardData item;
  const BusinessDetailInfo({Key? key, required this.item}) : super(key: key);

  @override
  _BusinessDetailInfoState createState() => _BusinessDetailInfoState();
}

class _BusinessDetailInfoState extends State<BusinessDetailInfo>{

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String _businessCard = widget.item.businessCard;
    String _companyName = widget.item.companyName;
    String _name = widget.item.name;
    String _phone = widget.item.phone;
    String _address = widget.item.address;
    String _station = widget.item.station;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          // onPressed: () => showAlertDialog(),
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_outlined),
        ),
        title: Text(
          '名刺変更',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600
          ),
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '写真正面',
              textAlign: TextAlign.start,
            ),
            InkWell(
              child: Container(
                child: Center(child: Image.asset(_businessCard),),
                height: 275,
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CameraApp())
              ),
            ),
            Text(
              '写真裏面',
              textAlign: TextAlign.right,
            ),
            InkWell(
              child: Container(
                child: Center(child: Image.asset(_businessCard),),
                height: 275,
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CameraApp())
              ),
            ),
            const Divider(
              height: 20,
              thickness: 2,
              indent: 10,
              endIndent: 10,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                initialValue: _companyName,
                keyboardType: TextInputType.multiline,
                maxLines: 1,
                minLines: 1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "会社名",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                initialValue: _name,
                keyboardType: TextInputType.multiline,
                maxLines: 1,
                minLines: 1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "お名前",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                initialValue: _phone,
                keyboardType: TextInputType.multiline,
                maxLines: 1,
                minLines: 1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "TEL/FAX",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                initialValue: _address,
                keyboardType: TextInputType.multiline,
                maxLines: 1,
                minLines: 1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "住所",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                initialValue: _station,
                keyboardType: TextInputType.multiline,
                maxLines: 1,
                minLines: 1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "最寄駅",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: CupertinoButton(
                      child: Text(
                          '初期化',
                          style: TextStyle(
                            letterSpacing: 8.0,
                            fontSize: 20.0,
                          )
                      ),
                      padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                      color: Colors.orangeAccent.shade100,
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    child: CupertinoButton(
                      child: Text(
                          '登録',
                          style: TextStyle(
                            letterSpacing: 8.0,
                            fontSize: 20.0,
                          )
                      ),
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
    );
  }
  Widget myContainer({double size = 300,  String text = ''}) {
    return Container(
      // color: color,
      width: size,
      height: size,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
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
                  ElevatedButton(
                      child: Text('保存しない'),
                      // color: Colors.red,
                      onPressed: () {
                        Navigator.of(context).pop();
                      }
                  ),

                  ElevatedButton(
                    child: Text('保存します'),
                    // color: Colors.blue,
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