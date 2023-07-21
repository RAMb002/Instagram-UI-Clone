import 'package:flutter/material.dart';
import 'package:instagram_clone/model/user_data/data.dart';
import 'package:instagram_clone/view/screens/constants.dart';
import 'package:instagram_clone/view/screens/home_screen/widgets/lower_section.dart';
import 'package:instagram_clone/view/screens/home_screen/widgets/send_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({Key? key,required this.index}) : super(key: key);

  final int index;

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: const Duration(seconds: 5),

    );

  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    _animation = Tween(begin: 0.0, end: screenWidth).animate(_controller,);
    _controller.forward();

    _controller.addListener(() {
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: screenHeight*0.86,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          Data.storyList[widget.index],
                      ),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                Container(
                  height: screenHeight*0.1,
                  // color: Colors.blue,
                ),
              ],
            ),
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Row(
              children: [
                Expanded(child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    // color: Colors.green,
                    borderRadius:const BorderRadius.all(Radius.circular(30)),
                    border: Border.all(color: Colors.grey),

                  ),
                  padding:const  EdgeInsets.only(left: 20),
                  child:const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Send message",
                      style: TextStyle(
                        color : Colors.white
                      ),
                    ),
                  ),
                )),
                const SizedBox(width: 15,),
                const HeartIconAnimation(index: 0, isLike: true, reelScreen: false,iconColor: Colors.white,),
                const SizedBox(width: 15,),
                GestureDetector(
                  onTap: (){
                    showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        isDismissible: true,
                        useRootNavigator: true,
                        context: context,
                        builder: (context) => SendScreen());
                  },
                  child: Image.asset("assets/images/send.png", height: 22,
      width: 22,color: Colors.white,),
                ),
                const SizedBox(width: 10,),


              ],
            ),),
            Positioned(
              top: 6,
              child: Stack(
                children: [
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return AnimatedContainer(duration:const Duration(
                        milliseconds: 10,
                      ),
                      width: _animation.value,
                      height: 1.5,
                      color: Colors.white,);
                    }),
                  Positioned(child: Container(
                    height: 1.5,
                    width: screenWidth,
                    color: Colors.white38,
                  ))
                ],
              ),),
            Positioned(
              top: 0,
                left: 4,
                right: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0,horizontal: 10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
              children: [
                    GestureDetector(
                      onTap: (){

                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: kUnloadedColor,
                          image: DecorationImage(
                            image: NetworkImage(
                              Data.horizontalList[widget.index].imageUrl,
                            ),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                    ),
                const SizedBox(width: 10,),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          Data.horizontalList[widget.index].name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10,),
                        const Text(
                          "54 m",
                          style:  TextStyle(
                            color: Colors.white60,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      ],
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      children: [
                        LoadingAnimationWidget.staggeredDotsWave(
                          color: Colors.white,
                          size: 15,
                        ),
                        const SizedBox(width: 10,),
                         Text(
                          "Chris Brown • Need your Right Here",
                          style: TextStyle(
                            color: Colors.white70.withOpacity(0.9),
                            fontSize: 12
                          ),
                        )
                      ],
                    )
                  ],
                )),
                const SizedBox(width: 20,),
                const Icon(Icons.more_vert,color: Colors.white,)
              ],
            ),
                  ),
                ))
          ],
        )
      ),
    );
  }
}
