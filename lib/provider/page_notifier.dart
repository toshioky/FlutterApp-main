import 'package:flutter/material.dart';
import 'package:smarting/pages/userinfo/login_view.dart';

class PageNotifier extends ChangeNotifier{
  String _currentPage = LoginView.pageName;

  String get currentPage=>_currentPage;

  void goToMain(){
    _currentPage = LoginView.pageName;
    notifyListeners();
  }

  void goToOtherPage(String otherPageName){
    _currentPage = otherPageName;
    notifyListeners();
  }
}