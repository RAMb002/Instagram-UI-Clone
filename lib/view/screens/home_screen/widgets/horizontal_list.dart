import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/model/user_data/data.dart';
import 'package:instagram_clone/view/screens/constants.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      height: screenHeight * 0.14,
      // color: Colors.redAccent,
      child: ListView.builder(
          shrinkWrap: true,
          // physics: ClampingScrollPhysics(),
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Row(
              children: [
                index == 0 ? Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: screenHeight * 0.1,
                              width: screenWidth * 0.18,
                              // margin: EdgeInsets.all(2),
                              decoration:const BoxDecoration(
                                  color: Colors.grey, shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/myProfile.jpg"
                                      ),
                                      fit: BoxFit.cover
                                  )

                              ),
                            ),
                            Positioned(
                              bottom: screenWidth * 0.01,
                              right: 0,
                              child: Container(
                                height: 22,
                                width: 22,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white,width: 1.5),
                                  shape: BoxShape.circle,
                                  color: Colors.blue
                                ),
                                child: Center(child: Icon(Icons.add,color: Colors.white,size: 15,)),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AutoSizeText(
                          "Your story",
                          // "fsifsiofhsiofhsfioshfois",
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          // minFontSize: 8,
                          maxFontSize:13,
                          minFontSize:13 ,
                          // minFontSize: screenHeight * 0.00,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.black, fontSize: screenHeight * 0.022),
                        )
                      ],
                    ),
                    SizedBox(width: 10,)
                  ],
                ) : const SizedBox(),
                SizedBox(
                  // color: Colors.red,
                  width: screenWidth * 0.2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: screenHeight * 0.1,
                        // width: screenWidth * 0.18,
                        decoration:const BoxDecoration(
                          // color : Colors.red,
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                                colors: [Colors.yellow,Colors.orange,Colors.red,Colors.pink]
                            )
                        ),
                        padding : const EdgeInsets.all(2),
                        child: Container(
                          // height: screenHeight * 0.08,
                          // width: screenWidth * 0.18,
                          // margin: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white,width: 3),
                              color: kUnloadedColor,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      Data.horizontalList[index].imageUrl
                                  ),
                                  fit: BoxFit.cover
                              )

                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AutoSizeText(
                        Data.horizontalList[index].name,
                        // "fsifsiofhsiofhsfioshfois",
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        // minFontSize: 8,
                        maxFontSize:13,
                        minFontSize:13 ,
                        // minFontSize: screenHeight * 0.00,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.black, fontSize: screenHeight * 0.022),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            );
          }),
    );
  }
}
