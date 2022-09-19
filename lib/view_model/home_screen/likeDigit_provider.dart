import 'package:flutter/cupertino.dart';
import 'package:instagram_clone/model/user_data/data.dart';
import 'package:flutter/material.dart';

class LikeDigitProvider extends ChangeNotifier {
  int getLikeDigit(int index,bool reelScreen) =>reelScreen ? Data.suggestedReels[index].likes : Data.homeScreenBodyImages[index].likes;
  bool getLikeStatus(int index,bool reelScreen) =>reelScreen ? Data.suggestedReels[index].likeStatus : Data.homeScreenBodyImages[index].likeStatus;
  bool getBigLikeGestureStatus(int index, bool reelScreen) => reelScreen
      ? Data.suggestedReels[index].bigLikeGesture
      : Data.homeScreenBodyImages[index].bigLikeGesture;

  void changeLikeGestureStatus(int index, bool value,bool reelScreen) {
     reelScreen ? Data.suggestedReels[index].bigLikeGesture = value : Data.homeScreenBodyImages[index].bigLikeGesture = value;
    notifyListeners();
  }

  void changeLikeDigit(int index,reelScreen) {
    var data =reelScreen ? Data.suggestedReels[index] : Data.homeScreenBodyImages[index];
    if (data.likeStatus) {
      data.likes--;
      data.likeStatus = false;
    } else {
      data.likes++;
      data.likeStatus = true;
    }
    notifyListeners();
  }
}
