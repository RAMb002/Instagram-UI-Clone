import 'package:flutter/material.dart';
import 'package:instagram_clone/model/user_data/data.dart';
import 'package:instagram_clone/view/screens/home_screen/widgets/video_tile.dart';

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
                  HeartIconAnimation(),
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
                  Container(
                    height: 22,
                    width: 22,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                        "assets/images/send.png",
                      )),
                    ),
                  ),
                ],
              ),
              const BookMarkIcon()
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            Data.homeScreenBodyImages[imageIndex].likes,
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
  const HeartIconAnimation({Key? key}) : super(key: key);

  @override
  _HeartIconAnimationState createState() => _HeartIconAnimationState();
}

class _HeartIconAnimationState extends State<HeartIconAnimation> {
  double scale = 1;
  bool status = false;
  int durationMilliSeconds = 100;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: ()async{
        setState(() {
          status=!status;
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
          status ? Icons.favorite_outlined :Icons.favorite_outline_sharp,
          color: status ? Colors.red : Colors.black,
          size: 25,
        ),
      ),
    );

    IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        splashRadius: 0.1,
        onPressed: () {},
        icon: const Icon(
          Icons.favorite_outline_sharp,
          color: Colors.black,
        ));
  }
}
