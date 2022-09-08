import 'package:flutter/material.dart';
import 'package:instagram_clone/model/user_data/data.dart';
import 'package:instagram_clone/view/screens/home_screen/widgets/horizontal_list.dart';
import 'package:instagram_clone/view/screens/home_screen/widgets/image_tile.dart';
import 'package:instagram_clone/view/screens/home_screen/widgets/suggested_reels.dart';
import 'package:instagram_clone/view/screens/home_screen/widgets/video_tile.dart';
import 'package:instagram_clone/view/screens/home_screen/widgets/card_row.dart';


class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  List widgetList = [
    const HorizontalList(),
    VideoTile(imageIndex: 0,cardIndex: Data.horizontalList.length-1,),
    ImageTile(imageIndex: 4,cardIndex: Data.horizontalList.length-2,),
    const SuggestedReels(),
    VideoTile(imageIndex: 1,cardIndex: Data.horizontalList.length-3,),
    VideoTile(imageIndex: 2,cardIndex: Data.horizontalList.length-4,),
    ImageTile(imageIndex: 3, cardIndex: Data.horizontalList.length-5),
    VideoTile(imageIndex: 5,cardIndex: Data.horizontalList.length-6,),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    print('home');

    return Scaffold(
      // body: ,
      body:ListView.builder(
        itemCount: widgetList.length,
          itemBuilder: (BuildContext context,index){
          return widgetList[index];
          }
      )
      );
  }
}




