import 'package:flutter/material.dart';
import 'package:instagram_clone/model/user_data/data.dart';
import 'package:instagram_clone/view/screens/constants.dart';

class CardRow extends StatelessWidget {
   CardRow({
  super.key,
  required this.cardIndex,
  this.color = Colors.white,
  });

  final int cardIndex;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0,vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 35,
                width: 35,
                // width: screenWidth * 0.18,
                decoration:const BoxDecoration(
                  // color : Colors.red,
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [Colors.yellow,Colors.orange,Colors.red,Colors.pink]
                    )
                ),
                padding : const EdgeInsets.all(1.5),
                child: Container(
                  // height: screenHeight * 0.08,
                  // width: screenWidth * 0.18,
                  // margin: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white,width: 1),
                      color: kUnloadedColor,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              Data.horizontalList[cardIndex].imageUrl
                          ),
                          fit: BoxFit.cover
                      )

                  ),
                ),
              ),
              const SizedBox(width: 15,),
              Text(
                Data.horizontalList[cardIndex].name,
                style:  TextStyle(
                    color: color
                ),
              ),
            ],
          ),
           Icon(Icons.more_vert,color:color,)
        ],
      ),
    );
  }
}
