import 'package:flutter/material.dart';
import 'package:instagram_clone/model/user_data/data.dart';
import 'package:instagram_clone/view/screens/home_screen/widgets/horizontal_list.dart';
import 'package:instagram_clone/view/screens/home_screen/widgets/image_tile.dart';
import 'package:instagram_clone/view/screens/home_screen/widgets/suggested_reels.dart';
import 'package:instagram_clone/view/screens/home_screen/widgets/video_tile.dart';
import 'package:instagram_clone/view/screens/home_screen/widgets/card_row.dart';


class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key,required this.pageController}) : super(key: key);

   final PageController pageController;

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

    return Scaffold(
      // body: ,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Container(
          height: 30,
          width: 100,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/images/Instagram_logo.png",
                  ),
                  fit: BoxFit.cover)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Container(
                height: 20,
                width: 20,
                decoration: const BoxDecoration(
                  image:
                  DecorationImage(image: AssetImage("assets/images/more.png"), fit: BoxFit.contain),
                )),
          ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Container(
                    height: 20,
                    width: 20,
                    decoration: const BoxDecoration(
                      // color: Colors.redAccent,
                      image: DecorationImage(
                          image: AssetImage("assets/images/images.png"), fit: BoxFit.contain),
                    )),
              ),
              Positioned(
                top: 13,
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.redAccent),
                  padding: const EdgeInsets.only(left: 1, top: 1.5),
                  child: const Center(
                    child: Text(
                      "9",
                      style: TextStyle(fontSize: 9),
                    ),
                  ),
                ),
              ),
              Positioned(
                  left: 0,
                  right: 0,
                  child: GestureDetector(
                      onTap: (){
                        pageController.animateToPage(2, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                      },
                      child: Container(height: 50,width: 20,color: Colors.transparent,)))
            ],
          ),
        ],
      ),

      body:ListView.builder(
        itemCount: widgetList.length,
          itemBuilder: (BuildContext context,index){
          return widgetList[index];
          }
      )
      );
  }
}




