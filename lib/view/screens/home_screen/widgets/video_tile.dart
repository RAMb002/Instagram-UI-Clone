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
    print('video');
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(padding:const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                height: screenHeight * 0.78,
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
              
              const Positioned(child: BigLikeAnimation())
              

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

  bool _status = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
        splashRadius: 0.1,
        constraints: const BoxConstraints(),
        onPressed: (){
        setState(() {
          _status = !_status;
        });
        }, icon: Icon(_status ?  Icons.bookmark_outlined :Icons.bookmark_border));
  }
}


