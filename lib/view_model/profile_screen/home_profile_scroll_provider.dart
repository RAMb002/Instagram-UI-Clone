import 'package:flutter/cupertino.dart';

class HomeProfileScrollProvider extends ChangeNotifier{
  double _offset=0;
  bool _expandStatus = true;

  bool get expandStatus =>_expandStatus;

  double offsetValue(){
    return _offset;
  }

  void changeExpandStatus(bool value){
    _expandStatus = value;
    notifyListeners();
  }

  void changeOffSetValue(double newOffset ){
    _offset = newOffset;
    notifyListeners();
  }
}