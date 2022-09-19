import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram_clone/model/user_data/data.dart';
import 'package:instagram_clone/view/screens/constants.dart';
import 'package:instagram_clone/view/screens/home_screen/widgets/big_like_animation.dart';
import 'package:instagram_clone/view/screens/home_screen/widgets/lower_section.dart';
import 'package:instagram_clone/view_model/home_screen/likeDigit_provider.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

const iconGap = 20.0;

class ReelScreen extends StatelessWidget {
  const ReelScreen({Key? key,required this.pageController}) : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
      ),
      child: SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0,
            title:const Text(
              "Reels",
              style:  TextStyle(
                color : Colors.white,
              ),
            ),
            actions: [
              IconButton(onPressed: (){},
                  splashRadius: 0.1,
                  icon: const Icon(
                Icons.camera_alt_outlined
              ))
            ],
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.black,
          body: PageView.builder(
          // physics:const NeverScrollableScrollPhysics(),
            controller: pageController,
            scrollDirection: Axis.vertical,
            itemCount: Data.suggestedReels.length,
              itemBuilder: (BuildContext context,index){
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          Data.suggestedReels[index].image
                        ),
                        fit: BoxFit.cover
                      ),
                    ),


                  ),
                ),
                Positioned(child: Stack(
                  children: [
                    Container(

                    ),
                    Positioned(child: BigLikeAnimation(width: MediaQuery.of(context).size.height,index: index,reelScreen: true,)),


                    Positioned(
                      bottom: 6,
                        right: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HeartIconAnimation(index: index,isLike: true,iconColor: Colors.white,iconSize: 30,reelScreen: true,),
                        const SizedBox(height: 10,),
                        Consumer<LikeDigitProvider>(
                            builder: (context,data,child)=>
                                Text(
                                  "${data.getLikeDigit(index, true)}",
                                  style: const TextStyle(
                                      color: Colors.white
                                  ),

                                )
                        ),
                        const SizedBox(height: iconGap,),

                        Image.asset("assets/images/comment.png",height: 30,width: 30,color: Colors.white,),
                        const SizedBox(height: 10,),
                        Text(
                          Data.suggestedReels[index].totalComments.toString(),
                          style: const TextStyle(
                              color: Colors.white
                          ),

                        ),
                        const SizedBox(height: iconGap,),
                        Image.asset("assets/images/send.png",height: 30,width: 30,color: Colors.white,),
                        const SizedBox(height: iconGap,),
                        const Icon(Icons.more_vert,color:Colors.white,),
                        const SizedBox(height: iconGap,),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white,width: 2),
                            borderRadius:const  BorderRadius.all(Radius.circular(8)),
                            image: DecorationImage(
                              image: AssetImage(
                                  Data.suggestedReels[Data.suggestedReels.length-1 -index].image
                              ),
                              fit: BoxFit.cover
                            )
                          ),
                        ),
                        const SizedBox(height: iconGap,),



                      ],
                    )),

                    Positioned(
                      left: 12,
                      bottom: 12,
                        child: SizedBox(
                          // color: Colors.red,
                      width: MediaQuery.of(context).size.width* 0.78,
                     child : Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Row(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: kUnloadedColor,
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            Data.suggestedReels[index].imageUrl
                                        ),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                             const SizedBox(width: 10,),
                              Text(Data.suggestedReels[index].name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),),
                              const SizedBox(width: 10,),
                               FollowButton(index: index,)

                            ],
                          ),
                         const SizedBox(
                           height: 20,
                         ),
                         Text(
                           Data.suggestedReels[index].comment,
                           style: const TextStyle(
                             color: Colors.white
                           ),
                         ),
                         const SizedBox(height: 10,),
                         Row(
                           children: [
                             LoadingAnimationWidget.staggeredDotsWave(
                               color: Colors.white,
                               size: 20,
                             ),
                             const SizedBox(width: 5,),
                             SizedBox(
                               height: 20,
                               width: MediaQuery.of(context).size.width * 0.45,
                               child: Marquee(
                                 text:
                                 "• Original audio   can we kiss forever...",
                                 // widget.title,
                                 // overflow : TextOverflow.ellipsis,
                                 style: const TextStyle(color: Colors.white, fontSize: 15),
                                 scrollAxis: Axis.horizontal,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 blankSpace: 20,
                                 velocity: 30.0,
                                 pauseAfterRound: const Duration(milliseconds: 0),
                                 showFadingOnlyWhenScrolling: true,
                                 fadingEdgeStartFraction: 0.1,
                                 fadingEdgeEndFraction: 0.1,
                                 // numberOfRounds: 3,
                                 startPadding: 0.0,
                                 accelerationDuration: const Duration(seconds: 6),
                                 accelerationCurve: Curves.linear,
                                 decelerationDuration: const Duration(milliseconds: 2000),
                                 decelerationCurve: Curves.easeOut,
                               ),
                             ),
                             const SizedBox(
                               width: 10,
                             ),
                             const Icon(Icons.person_outline,color: Colors.white,size: 18,),
                             const SizedBox(width: 5,),
                             SizedBox(
                               // color: Colors.red,
                               width: MediaQuery.of(context).size.width * 0.17,
                               child:const Text(
                                 "2 people",
                                 maxLines: 1,
                                 overflow: TextOverflow.ellipsis,
                                 style: TextStyle(
                                   color: Colors.white,
                                   overflow: TextOverflow.ellipsis,

                                 ),
                               ),
                             )
                           ],
                         )

                       ],
                     ),

                    ))
                  ],
                ))
              ],
            );
        }
          )
        ),
      ),
    );
  }
}

class FollowButton extends StatefulWidget {
  const FollowButton({Key? key,required this.index}) : super(key: key);

  final int index;

  @override
  _FollowButtonState createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: (){
        setState(() {
          Data.suggestedReels[widget.index].followingStatus = !Data.suggestedReels[widget.index].followingStatus;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: !Data.suggestedReels[widget.index].followingStatus ? screenWidth * 0.19 : screenWidth * 0.24,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white,width: 1),
            borderRadius:const BorderRadius.all(Radius.circular(10))
        ),
        padding: const EdgeInsets.symmetric(vertical: 7,horizontal: 14),
        child: Center(
          child:  Text(
            Data.suggestedReels[widget.index].followingStatus ? "Following" :"Follow",
            maxLines: 1,
            overflow: TextOverflow.clip,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

