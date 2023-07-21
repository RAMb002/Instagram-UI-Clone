// import 'dart:html';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/model/user_data/data.dart';
import 'package:instagram_clone/view/screens/home_screen/widgets/big_like_animation.dart';
import 'package:instagram_clone/view/screens/home_screen/widgets/card_row.dart';
import 'package:instagram_clone/view/screens/home_screen/widgets/lower_section.dart';
class VideoTile extends StatelessWidget {
  const VideoTile({
  super.key,
  required this.imageIndex,
  required this.cardIndex

  });

  final int imageIndex;
  final int cardIndex;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final tileHeight = MediaQuery.of(context).size.height * 0.78 ;
    return Padding(padding:const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                height: tileHeight,
                width: screenWidth,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          Data.homeScreenBodyImages[imageIndex].image,
                        ),
                        fit: BoxFit.cover
                    )
                ),
              ),
               Positioned(
                 top: 0,
                   left: 0,
                   right: 0,
                   child: CardRow(cardIndex: cardIndex,)),

               Positioned(child: BigLikeAnimation(width: tileHeight * 0.8,index: imageIndex,reelScreen: false,))


            ],
          ),
          LowerSection(imageIndex: imageIndex)
        ],
      ),);
  }
}


class BookMarkIcon extends StatefulWidget {
  const BookMarkIcon({
    super.key,
  });

  @override
  State<BookMarkIcon> createState() => _BookMarkIconState();
}

class _BookMarkIconState extends State<BookMarkIcon> {

  double scale = 1;
  int durationMilliSeconds = 100;
  bool bookMarkIconStatus  = false;
  @override
  Widget build(BuildContext context) {




    GestureDetector gestureDetector = GestureDetector(
      onTap: ()async{

        setState(() {

            bookMarkIconStatus=!bookMarkIconStatus;

          // widget.isLike && !pLike.getBigLikeGestureStatus(widget.index) ? pLike.changeLikeDigit(widget.index) : bookMarkIconStatus=!bookMarkIconStatus;
        });
        setState(() {
          scale=0.7;
        });
        await Future.delayed(const Duration(milliseconds: 200));
        setState(() {
          scale = 1.1;
        });
        await Future.delayed(const Duration(milliseconds: 200));
        setState(() {
          scale = 0.9;
          durationMilliSeconds = 50;
        });
        await Future.delayed(const Duration(milliseconds: 100));
        setState(() {
          scale = 1;
        });

      },
      child:  AnimatedScale(
        scale: scale,
        duration:  Duration(milliseconds: durationMilliSeconds),
        child:  Icon(
           bookMarkIconStatus ? Icons.bookmark_outlined : Icons.bookmark_border,
          color:  Colors.black,
          size: 25,
        ),
      ),
    );

    // gestureDetector.onTap?.call();


    return  gestureDetector;


  }
}


