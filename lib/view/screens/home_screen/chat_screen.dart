import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/model/user_data/data.dart';
import 'package:instagram_clone/view/screens/constants.dart';
import 'package:instagram_clone/view/screens/home_screen/widgets/horizontal_list.dart';
import 'package:instagram_clone/view/screens/widgets/fake_textfield.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key,required this.pageController}) : super(key: key);

  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.3,
        leading: IconButton(
          onPressed: () {
            pageController.animateToPage(0, duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
          },
          splashRadius: 0.1,
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
            size: 30,
          ),
        ),
        title: const Text(
          "Rambo",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              splashRadius: 0.1,
              padding: const EdgeInsets.only(right: 20),
              constraints: const BoxConstraints(),
              onPressed: () {},
              icon: const Icon(
                Icons.video_call_outlined,
                color: Colors.black,
                size: 30,
              )),
          IconButton(
              splashRadius: 0.1,
              padding: const EdgeInsets.only(right: 20),
              constraints: const BoxConstraints(),
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                size: 30,
                color: Colors.black,
              )),
        ],
      ),
      body: ListView(
        children: [
          const FakeTextField(),
          Container(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            height: screenHeight * 0.12,
            // color: Colors.redAccent,
            child: ListView.builder(
                shrinkWrap: true,
                // physics: ClampingScrollPhysics(),
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      index == 0
                          ? const SizedBox(
                              width: 8,
                            )
                          : const SizedBox(),
                      SizedBox(
                        // color: Colors.red,
                        width: screenWidth * 0.2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: screenHeight * 0.09,
                                  // height: screenHeight * 0.08,
                                  // width: screenWidth * 0.18,
                                  // margin: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      color: kUnloadedColor,
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(Data.horizontalList[index].imageUrl),
                                          fit: BoxFit.cover)
                                  ),
                                ),
                                Positioned(
                                  bottom: screenWidth * 0.01,
                                  right: screenWidth * 0.016,
                                  child: Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white, width: 1.5)),
                                  ),
                                )
                              ],
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
                              maxFontSize: 13,
                              minFontSize: 13,
                              // minFontSize: screenHeight * 0.00,
                              maxLines: 1,
                              style: TextStyle(color: Colors.black, fontSize: screenHeight * 0.022),
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
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 22, 18, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Messages",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Requests",
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              physics:const NeverScrollableScrollPhysics(),
              reverse: true,
              // padding: EdgeInsets.all(18),
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0,bottom: 12, right: 18,left: 14),
                      child: SizedBox(
                        // color: Colors.red,
                        height: 50,
                        child: Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: kUnloadedColor,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(Data.horizontalList[index].imageUrl),),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Data.horizontalList[index].name,
                                  style: TextStyle(color: Colors.black, fontSize: 15,
                                  fontWeight: Data.horizontalList[index].status ? FontWeight.bold : FontWeight.w400
                                  ),
                                ),
                               const  SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  Data.horizontalList[index].subMessage,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color:
                                          Data.horizontalList[index].status ? Colors.black : Colors.black54,
                                      fontWeight: Data.horizontalList[index].status
                                          ? FontWeight.bold
                                          : FontWeight.w400),
                                )
                              ],
                            )),
                            Data.horizontalList[index].status
                                ? Container(
                                    height: 10,
                                    width: 10,
                                    decoration:const  BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue,
                                    ),
                                  )
                                : const SizedBox(
                                    width: 5,
                                  ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Icon(Icons.camera_alt_outlined)
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      child: InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {},
                        child: Container(
                          height: 74,
                          // color: Colors.red,
                        ),
                      ),
                    )
                  ],
                );
              })
        ],
      ),
    );
  }
}

