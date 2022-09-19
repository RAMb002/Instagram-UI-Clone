import 'package:flutter/material.dart';
import 'package:instagram_clone/view_model/home_screen/likeDigit_provider.dart';
import 'package:provider/provider.dart';

class BigLikeAnimation extends StatefulWidget {
  const BigLikeAnimation({Key? key,required this.width,required this.index,required this.reelScreen}) : super(key: key);

  final double width;
  final int index;
  final bool reelScreen;

  @override
  _BigLikeAnimationState createState() => _BigLikeAnimationState();
}

class _BigLikeAnimationState extends State<BigLikeAnimation> {
  double scale = 0;
  // bool status = false;
  int durationMilliSeconds = 100;
  @override
  Widget build(BuildContext context) {



    final pLike = Provider.of<LikeDigitProvider>(context,listen: false);
    return  GestureDetector(
      onDoubleTap: ()async{
        pLike.changeLikeGestureStatus(widget.index, true,widget.reelScreen);

        setState(() {
          if(!pLike.getLikeStatus(widget.index,widget.reelScreen)){
            pLike.changeLikeDigit(widget.index,widget.reelScreen);
          }
          scale = 1;
        });
        await Future.delayed(const Duration(milliseconds: 200));

        setState(() {
          durationMilliSeconds = 200;

        });
        setState(() {
          scale = 1.2;
        });

        await Future.delayed(const Duration(milliseconds: 100));
        setState(() {
          scale = 0.9;
        });
        await Future.delayed(const Duration(milliseconds: 300));
        setState(() {
          scale = 1;
          durationMilliSeconds = 100;
        });
        await Future.delayed(const Duration(milliseconds: 500));

        setState(() {
          scale = 0;
        });
      },
      child:  Container(
        height: widget.width,
        width: double.infinity,
        color: Colors.transparent,
        child: AnimatedScale(
          scale: scale,
          duration:  Duration(milliseconds: durationMilliSeconds),
          child: const Icon(
            Icons.favorite_outlined ,
            color:  Colors.white,
            size: 105,
          ),
        ),
      ),
    );


  }
}
