import 'package:flutter/cupertino.dart';

class ScreenIndexCountsProvider extends ChangeNotifier{
  int _homeScreenCount = 0;
  int _searchScreenCount = 0;
  int _likeScreenCount = 0;
  int _profileScreenCount = 0;

  int get likeScreenCount => _likeScreenCount;
  int get homeScreenCount => _homeScreenCount;

  void incrementOrDecrementLikeScreenCount({required bool increment}){
    if(increment){
      _likeScreenCount++;
    }
    else{
      _likeScreenCount--;
    }
  }
  void incrementOrDecrementHomeScreenCount({required bool increment}){
    if(increment){
      _homeScreenCount++;
    }
    else{
      _homeScreenCount--;
    }
  }


}