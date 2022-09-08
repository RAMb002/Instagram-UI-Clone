import 'package:flutter/material.dart';
import 'package:instagram_clone/model/user_data/data.dart';
import 'package:instagram_clone/view/screens/home_screen/widgets/big_like_animation.dart';
import 'package:instagram_clone/view/screens/home_screen/widgets/card_row.dart';
import 'package:instagram_clone/view/screens/home_screen/widgets/lower_section.dart';
import 'package:instagram_clone/view/screens/home_screen/widgets/video_tile.dart';

class ImageTile extends StatelessWidget {
  const ImageTile({
  super.key,
  required this.imageIndex,
  required this.cardIndex
  });

  final int imageIndex;
  final int cardIndex;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: [
          CardRow(
            color: Colors.black,
            cardIndex:cardIndex ,
          ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                height: screenHeight * 0.5,
                width: screenWidth,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            Data.homeScreenBodyImages[imageIndex].image
                        ),
                        fit: BoxFit.cover
                    )
                ),
              ),
             const  Positioned(child: BigLikeAnimation())
            ],
          ),
          LowerSection(imageIndex: imageIndex)
        ],
      ),
    );
  }
}
