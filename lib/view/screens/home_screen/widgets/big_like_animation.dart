import 'package:flutter/material.dart';

class BigLikeAnimation extends StatefulWidget {
  const BigLikeAnimation({Key? key}) : super(key: key);

  @override
  _BigLikeAnimationState createState() => _BigLikeAnimationState();
}

class _BigLikeAnimationState extends State<BigLikeAnimation> {
  double scale = 0;
  bool status = false;
  int durationMilliSeconds = 100;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onDoubleTap: ()async{
        setState(() {
          status=!status;
        });
        setState(() {
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
        height: 300,
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
