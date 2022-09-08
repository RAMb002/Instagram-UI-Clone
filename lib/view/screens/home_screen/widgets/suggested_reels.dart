import 'package:flutter/material.dart';
import 'package:instagram_clone/model/user_data/data.dart';

class SuggestedReels extends StatelessWidget {
  const SuggestedReels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;


    return Column(
      children: [
        const SizedBox(height: 5,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Suggested reels",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              ),
              Row(
                children: const [
                  Icon(Icons.play_arrow,color: Colors.black,),
                   SizedBox(width: 5,),
                   Text(
                    "Watch All",
                    style: TextStyle(
                      color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: screenWidth * 0.54,
          width: screenWidth ,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: Data.suggestedReels.length,
              itemBuilder: (context,index)=>
                  Row(
                    children: [
                      index == 0? const SizedBox(width:8 ,) : const SizedBox(),
                      Container(
                        width: screenWidth * 0.32,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius:const BorderRadius.all(Radius.circular(4)),
                          image: DecorationImage(
                            image: AssetImage(
                                Data.suggestedReels[index].toString()
                            ),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                     const SizedBox(width: 8,)
                    ],
                  )
          ),

        ),
        const SizedBox(height: 5,)
      ],
    );
  }
}
