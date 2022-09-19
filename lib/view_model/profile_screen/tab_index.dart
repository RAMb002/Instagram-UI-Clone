import 'package:flutter/cupertino.dart';

class TabIndex extends ChangeNotifier{
  int _index=0;

  int get index => _index;

  void changeIndex(int index){
    _index = index;
    notifyListeners();
  }
}