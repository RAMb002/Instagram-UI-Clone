import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram_clone/model/user_data/data.dart';
import 'package:instagram_clone/view/screens/widgets/fake_textfield.dart';
const double gap = 3;

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      ),
      child: Scaffold(
          body: SafeArea(
        child: NestedScrollView(
            scrollDirection: Axis.vertical,
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(top: 0.0),
                      child: FakeTextField(),
                    ),
                  )
                ],
            body: ListView.builder(
              itemCount: Data.searchGridTileData.length,
              itemBuilder: (BuildContext context,index)=>
                CustomGridTile(
                  list: Data.searchGridTileData[index],
                  positionLeft: index%2!=0,
                ),

            )),
      )),
    );
  }
}

class CustomGridTile extends StatelessWidget {
  const CustomGridTile({super.key, required this.positionLeft,required this.list});

  final bool positionLeft;
  final List list;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final double tileWidth = screenWidth * 0.7;
    return Column(
      children: [
        Row(
          children: [
            positionLeft
                ? Expanded(
                    child: imageLoadedContainer(list[4], tileWidth,true),)
                : const SizedBox(),
            SizedBox(width:  positionLeft ? gap : 0,),
            Expanded(
              child: SizedBox(
                height: tileWidth,
                width: screenWidth,
                child: Column(
                  children: [
                    Expanded(
                        child: imageLoadedContainer(list[0], tileWidth,false),),
                    const SizedBox(
                      height: gap,
                    ),
                    Expanded(
                        child: imageLoadedContainer(list[1], tileWidth,false),),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: gap,
            ),
            Expanded(
              child: SizedBox(
                height: tileWidth,
                // width: screenWidth,
                child: Column(
                  children: [
                    Expanded(
                        child: imageLoadedContainer(list[2], tileWidth,false),),
                    const SizedBox(
                      height: gap,
                    ),
                    Expanded(
                        child: imageLoadedContainer(list[3], tileWidth,false),),
                  ],
                ),
              ),
            ),
             SizedBox(
              width: positionLeft ? 0 : gap,
            ),
            !positionLeft
                ? Expanded(
                    child: imageLoadedContainer(list[4], tileWidth,true),)
                : const SizedBox(),
          ],
        ),
        const SizedBox(height: gap,)
      ],
    );
  }

  Widget imageLoadedContainer(String image,double tileWidth,bool bigReelStatus){
    return Stack(
      children: [
        Container(
          height: tileWidth,
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              image: DecorationImage(
              image: NetworkImage(
                image,
              ),
              fit: BoxFit.cover
            )
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Image.asset(
              'assets/images/reel2.png',
            height: bigReelStatus ? 25 : 20,
            width: bigReelStatus ? 25 : 20,
            color: Colors.white,
          )
        )
      ],
    );
  }
}
