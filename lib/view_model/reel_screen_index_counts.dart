import 'package:flutter/cupertino.dart';

class ReelScreenIndexCountProvider extends ChangeNotifier{
  int _reelScreenCount = 0;
  int get reelScreenCount => _reelScreenCount;
  void incrementOrDecrementReelScreenCount({required bool increment}){
    if(increment){
      _reelScreenCount++;
    }
    else{
      _reelScreenCount--;
    }
    notifyListeners();
  }
}