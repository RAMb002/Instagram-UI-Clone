import 'package:flutter/material.dart';
import 'package:instagram_clone/model/user_data/data.dart';
import 'package:instagram_clone/view/screens/home_screen/widgets/send_screen.dart';
import 'package:instagram_clone/view/screens/home_screen/widgets/video_tile.dart';
import 'package:instagram_clone/view_model/home_screen/likeDigit_provider.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

class LowerSection extends StatelessWidget {
  const LowerSection({
    super.key,
    required this.imageIndex,
  });

  final int imageIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HeartIconAnimation(index: imageIndex,isLike: true,reelScreen: false,),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 22,
                    width: 22,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                        "assets/images/comment.png",
                      )),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
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
                    child: Container(
                      height: 22,
                      width: 22,
                      decoration: const BoxDecoration(
                        // color: Colors.red,
                        image: DecorationImage(
                            image: AssetImage(
                          "assets/images/send.png",
                        )),
                      ),
                    ),
                  ),
                ],
              ),
               HeartIconAnimation(index: imageIndex,isLike: false,reelScreen: false,),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Consumer<LikeDigitProvider>(
            builder: (context,data,child){
              return Text(
                "${data.getLikeDigit(imageIndex,false)} likes",
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              );
            }

          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Text(
              Data.homeScreenBodyImages[imageIndex].comment,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "View all ${Data.homeScreenBodyImages[imageIndex].totalComments} comments",
            style: const TextStyle(color: Colors.black45, fontSize: 12, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            Data.homeScreenBodyImages[imageIndex].day,
            style: const TextStyle(
              color: Colors.black45,
              fontSize: 10,
            ),
          )
        ],
      ),
    );
  }
}

class HeartIconAnimation extends StatefulWidget {
  const HeartIconAnimation({Key? key,required this.index,required this.isLike,this.iconColor = Colors.black,this.iconSize=25,required this.reelScreen}) : super(key: key);

  final int index;
  final bool isLike;
  final Color iconColor;
  final double iconSize;
  final bool reelScreen;

  @override
  _HeartIconAnimationState createState() => _HeartIconAnimationState();
}

class _HeartIconAnimationState extends State<HeartIconAnimation> {

  double scale = 1;
  int durationMilliSeconds = 100;
  bool bookMarkIconStatus  = false;
  @override
  Widget build(BuildContext context) {

    final pLike =Provider.of<LikeDigitProvider>(context);
    bool status = pLike.getLikeStatus(widget.index,widget.reelScreen);



    GestureDetector gestureDetector = GestureDetector(
      onTap: ()async{

        setState(() {
          if(widget.isLike && !pLike.getBigLikeGestureStatus(widget.index,widget.reelScreen)){
            pLike.changeLikeDigit(widget.index,widget.reelScreen);
          }

          else{
            bookMarkIconStatus=!bookMarkIconStatus;
          }
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
          widget.isLike ? status ? Icons.favorite_outlined :Icons.favorite_outline_sharp
          : bookMarkIconStatus ? Icons.bookmark_outlined : Icons.bookmark_border,
          color: widget.isLike ? status ? Colors.red : widget.iconColor : Colors.black,
          size: widget.iconSize,
        ),
      ),
    );

    if(pLike.getBigLikeGestureStatus(widget.index,widget.reelScreen) && widget.isLike){
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        gestureDetector.onTap?.call();
          pLike.changeLikeGestureStatus(widget.index, false,widget.reelScreen);

      });

    }
    // gestureDetector.onTap?.call();

    return  gestureDetector;


  }
}
