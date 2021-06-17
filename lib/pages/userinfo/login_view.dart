import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarting/pages/smarting_main.dart';
import 'package:smarting/provider/page_notifier.dart';

class LoginView extends StatefulWidget {
  static final String pageName = 'LoginView';

  LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  final String _compAt = '@smarting.jp';

  // インプットデータの結果を格納
  late String _email;
  late String _password;
  late String _renewPassEmail;
  late String _defPass;

  // テキストボックスが空である場合のテキスト
  static final String hintemail = "メールを入力してください。";
  static final String hintpassword = "パスワードを入力してください。";

  // イメージ格納先のパス
  static final String bglogin = 'assets/images/bglogin.png';
  static final String smtlogo2 = 'assets/images/smt_logo2.png';

  // テキストボックスに誤りがある場合の警告テキスト
  static final String erremail = '指定メール(@smarting.jp)を使用してください。';
  static final String errpassword = 'パスワードは8文字以上で入力してください。';

  // パスワード探しのタイトル
  static final String searchpassword = 'パスワードを忘れた方はこちらへ';

  // フラグ設定 (ログイン ・ 新規登録)
  bool _isSignUpFlag = false;
  static final String signup = '新規登録';
  static final String login = 'ログイン';

  // フラグ設定 (情報 ・ 警告)
  bool _isInfoFlag = false;
  static final String info = '情報';
  static final String warn = '警告';
  static final String close = '閉じる';

  // ランダムパスワードを設定
  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString() => String.fromCharCodes(Iterable.generate(
      10, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(bglogin),
                  fit: BoxFit.fill,
                  colorFilter:
                      ColorFilter.mode(Colors.orangeAccent, BlendMode.color))),
          child: Column(children: <Widget>[
            Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.orange.shade300,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(255, 153, 0, 10),
                          blurRadius: 20.0,
                          offset: Offset(0, 10))
                    ])),
            Padding(
              padding: EdgeInsets.all(45),
              child: Column(
                children: <Widget>[
                  Container(
                      child: Column(
                    children: <Widget>[
                      ButtonBar(
                        children: [
                          // ignore: deprecated_member_use
                          FlatButton(
                              onPressed: () {
                                setState(() {
                                  _isSignUpFlag = false;
                                  _formKey.currentState!.reset();
                                });
                              },
                              child: Text(
                                login,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: _isSignUpFlag
                                      ? FontWeight.w300
                                      : FontWeight.w600,
                                  color: _isSignUpFlag
                                      ? Colors.orange.shade300
                                      : Colors.orange.shade800,
                                ),
                              )),
                          // ignore: deprecated_member_use
                          FlatButton(
                              onPressed: () {
                                setState(() {
                                  _isSignUpFlag = true;
                                  _formKey.currentState!.reset();
                                });
                              },
                              child: Text(
                                signup,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: _isSignUpFlag
                                      ? FontWeight.w600
                                      : FontWeight.w300,
                                  color: _isSignUpFlag
                                      ? Colors.orange.shade800
                                      : Colors.orange.shade300,
                                ),
                              ))
                        ],
                      ),
                    ],
                  )),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(255, 153, 0, 10),
                              blurRadius: 20.0,
                              offset: Offset(0, 10))
                        ]),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Container(
                              height: 50,
                              padding: EdgeInsets.all(2),
                              child: Center(child: Image.asset(smtlogo2)),
                              decoration: BoxDecoration(
                                  color: Colors.orange.shade200,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(255, 153, 0, 10),
                                        blurRadius: 20.0,
                                        offset: Offset(0, 10))
                                  ])),
                          SizedBox(height: 10),
                          Container(
                            height: 70,
                            decoration:
                                BoxDecoration(color: Colors.orange.shade50),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (emailtext) {
                                setState(() {
                                  _email = emailtext.trim();
                                });
                              },
                              validator: (emailtext) {
                                if (!emailtext!.contains(_compAt)) {
                                  return erremail;
                                }
                                return null;
                              },
                              decoration: buildTextInputDecoration(hintemail),
                              cursorColor: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 10),
                          AnimatedContainer(
                            height: _isSignUpFlag ? 0 : 70,
                            duration: Duration(milliseconds: 1500),
                            curve: Curves.fastLinearToSlowEaseIn,
                            decoration:
                                BoxDecoration(color: Colors.orange.shade50),
                            child: TextFormField(
                              obscureText: true,
                              onChanged: (passtext) {
                                setState(() {
                                  _password = passtext.trim();
                                });
                              },
                              validator: (passtext) {
                                if (!_isSignUpFlag) {
                                  if (passtext == null ||
                                      passtext.isEmpty ||
                                      passtext.length < 8) {
                                    return errpassword;
                                  }
                                }
                                return null;
                              },
                              decoration:
                                  buildTextInputDecoration(hintpassword),
                              cursorColor: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            height: 40,
                            width: 250,
                            // ignore: deprecated_member_use
                            child: RaisedButton(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                color: Colors.orange,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Text(_isSignUpFlag ? signup : login,
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    // ログイン情報の操作。
                                    if (!_isSignUpFlag) {
                                      final searchEmail = _email;
                                      final searchPassword = _password;

                                      try {
                                        // Firebase側に入力情報が存在する場合、authデータを格納する。
                                        await _auth.signInWithEmailAndPassword(
                                            email: searchEmail,
                                            password: searchPassword);
                                        // Firebase側から受け取ったauthデータが正しいのか判断する。
                                        Provider.of<PageNotifier>(context,
                                                listen: false)
                                            .goToOtherPage(
                                                SmartingMain.pageName);
                                        _formKey.currentState!.reset();
                                      } catch (e) {
                                        final textTitle = warn;
                                        final textContent =
                                            '入力情報が正しくありませんでした。\n\n恐れ入りますが、\n入力情報を確認してください。';
                                        final textBtn = close;
                                        //Firebase側から受け取ったデータが正しくないため、警告メッセージをだす。
                                        _infoDialog(context, textTitle,
                                            textContent, textBtn);
                                      }
                                    }
                                    // 新規登録の操作。
                                    if (_isSignUpFlag) {
                                      _defPass = getRandomString();

                                      final insertEmail = _email;
                                      final insertPassword = _defPass;

                                      // 会社メールであるのか確認する。
                                      if (insertEmail.contains(_compAt)) {
                                        try {
                                          // ユーザー側のメールアドレスとランダムのパスワードをaccountに書き込む。
                                          await _auth
                                              .createUserWithEmailAndPassword(
                                                  email: insertEmail,
                                                  password: insertPassword);
                                          // accountが正しいのか判断する。
                                          try {
                                            // メールにパスワードの設定をするリンクを送信。
                                            _auth.sendPasswordResetEmail(
                                                email: insertEmail);
                                            // リンク送信から不正なエラーが発生した場合
                                          } catch (e) {
                                            final textTitle = warn;
                                            final textContent =
                                                '不正なエラーが発生しています。\n\n恐れ入りますが、\n最初からやり直してください。';
                                            final textBtn = close;
                                            //Firebase側から受け取ったデータが正しくないため、警告メッセージをだす。
                                            _infoDialog(context, textTitle,
                                                textContent, textBtn);
                                          }
                                          final textTitle = info;
                                          final textContent =
                                              '入力してくださったメールアドレスに\nリンクを送信しました。\n\nメールからパスワードを設定後、\nログインしてください。';
                                          final textBtn = close;
                                          //Firebase側にauth情報を登録し、正常終了のメッセージをだす。
                                          _infoDialog(context, textTitle,
                                              textContent, textBtn);
                                          _formKey.currentState!.reset();
                                          // メールアドレスが既に登録されている、重複である場合
                                        } catch (e) {
                                          final textTitle = warn;
                                          final textContent =
                                              '入力してくださったメールアドレスは\n既に登録されています。\n\n恐れ入りますが、\nメールを確認してください。';
                                          final textBtn = close;
                                          //Firebase側から受け取ったデータが正しくないため、警告メッセージをだす。
                                          _infoDialog(context, textTitle,
                                              textContent, textBtn);
                                        }
                                        // メールの送信が正常ではないので警告メッセージを出す。
                                      } else {
                                        final textTitle = warn;
                                        final textContent =
                                            '指定メール(@smarting.jp)ではありません。\n\nメールアドレスを確認してください。';
                                        final textBtn = close;
                                        // メールの送信が正常に処理された情報メッセージを出す。
                                        _infoDialog(context, textTitle,
                                            textContent, textBtn);
                                      }
                                    }
                                  }
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // ignore: deprecated_member_use
                    child: FlatButton(
                        onPressed: () async {
                          //Firebase側から受け取ったデータが正しくないため、警告メッセージをだす。
                          _renewPasswordDialog(context);
                        },
                        child: Text(
                          searchpassword,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: Colors.orange.shade900,
                              decoration: TextDecoration.underline),
                        )),
                  ),
                ],
              ),
            ),
          ])),
    );
  }

  // パスワード再設定のダイアログ
  void _renewPasswordDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.orange.shade100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              height: 260,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                              image: AssetImage(smtlogo2), fit: BoxFit.fill)),
                    ),
                    Text(
                      'スマートアイエンジー株式会社',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black38,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 25),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (renewPassEmailtext) {
                        setState(() {
                          _renewPassEmail = renewPassEmailtext.trim();
                        });
                      },
                      decoration: buildTextInputDecoration(hintemail),
                      cursorColor: Colors.grey,
                    ),
                    SizedBox(height: 15),
                    Container(
                      height: 35,
                      width: 280,
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        child: Text(
                          '送信',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black38,
                              fontWeight: FontWeight.bold),
                        ),
                        color: Colors.orangeAccent,
                        onPressed: () async {
                          try {
                            // 会社メールである場合
                            if (_renewPassEmail.contains(_compAt)) {
                              // メールにパスワードの設定をするリンクを送信。
                              _auth.sendPasswordResetEmail(
                                  email: _renewPassEmail);
                              Navigator.of(context).pop();

                              final textTitle = info;
                              final textContent =
                                  '入力してくださったメールアドレスに\n「パスワード再設定」のリンクを送信致しました。\n\nメールを確認してください。';
                              final textBtn = close;
                              // メールの送信が正常に処理された情報メッセージを出す。
                              _infoDialog(
                                  context, textTitle, textContent, textBtn);

                              // 会社メールでない場合
                            } else {
                              Navigator.of(context).pop();

                              final textTitle = warn;
                              final textContent =
                                  '指定メール(@smarting.jp)ではありません。\n\nメールアドレスを確認してください。';
                              final textBtn = close;
                              // メールの送信が正常ではないので警告メッセージを出す。
                              _infoDialog(
                                  context, textTitle, textContent, textBtn);
                            }
                            //Firebase側にauth情報が存在しない場合
                          } catch (e) {
                            Navigator.of(context).pop();

                            final textTitle = warn;
                            final textContent =
                                '入力してくださったメールアドレスは\n存在しません。\n\nメールを確認してください。';
                            final textBtn = close;
                            // メールの送信情報が存在しないので警告メッセージを出す。
                            _infoDialog(
                                context, textTitle, textContent, textBtn);
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  // 情報・警告メッセージのダイアログ
  void _infoDialog(BuildContext context, String topText, String contentText,
      String botText) {
    if (topText == info) {
      setState(() {
        _isInfoFlag = true;
      });
    }
    if (topText == warn) {
      setState(() {
        _isInfoFlag = false;
      });
    }

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.orange.shade100,
            title: Text(topText,
                style: TextStyle(
                    fontSize: 16,
                    color: _isInfoFlag ? Colors.lightGreen : Colors.redAccent,
                    fontWeight: FontWeight.bold)),
            content: Text(contentText),
            actions: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    botText,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black38,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          );
        });
  }

  // テキストボックスのレイアウト設定
  InputDecoration buildTextInputDecoration(String hint) {
    return InputDecoration(
        hintText: hint,
        contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 20),
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        hintStyle: TextStyle(color: Colors.grey[500]));
  }

  // テキストボックスのレイアウト設定２
  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: Colors.orange, width: 1));
  }
}
