import 'package:flutter/material.dart';
import 'package:instagram_clone/model/user_data/data.dart';
import 'package:instagram_clone/view/screens/constants.dart';
import 'package:instagram_clone/view/screens/profile_screen/profile_screen.dart';
import 'package:instagram_clone/view/screens/reel_screen/more_menu.dart';
import 'package:instagram_clone/view_model/profile_screen/home_profile_scroll_provider.dart';
import 'package:instagram_clone/view_model/screen_index_counts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

class CardRow extends StatelessWidget {
   CardRow({
  super.key,
  required this.cardIndex,
  this.color = Colors.white,
  });

  final int cardIndex;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0,vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              final pScrollProvider=Provider.of<HomeProfileScrollProvider>(context, listen: false);

              pScrollProvider.changeOffSetValue(0);

              final pScreenIndexCount = Provider.of<ScreenIndexCountsProvider>(context,listen: false);
              pScreenIndexCount.incrementOrDecrementHomeScreenCount(increment: true);
              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: ProfileScreen(
                  data: Data.horizontalList[cardIndex],
                  isHomeScreen: true,
                  isReelScreen: false,
                  isLikeScreen: false,
                  isMyProfile: false,
                ),
                withNavBar: true, // OPTIONAL VALUE. True by default.
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
            child: Container(
              color: Colors.transparent,
              child: Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    // width: screenWidth * 0.18,
                    decoration:const BoxDecoration(
                      // color : Colors.red,
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Colors.yellow,Colors.orange,Colors.red,Colors.pink]
                        )
                    ),
                    padding : const EdgeInsets.all(1.5),
                    child: Container(
                      // height: screenHeight * 0.08,
                      // width: screenWidth * 0.18,
                      // margin: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white,width: 1),
                          color: kUnloadedColor,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  Data.horizontalList[cardIndex].imageUrl
                              ),
                              fit: BoxFit.cover
                          )

                      ),
                    ),
                  ),
                  const SizedBox(width: 15,),
                  Text(
                    Data.horizontalList[cardIndex].name,
                    style:  TextStyle(
                        color: color
                    ),
                  ),
                ],
              ),
            ),
          ),
           IconButton(onPressed: (){
             showModalBottomSheet(
                 backgroundColor: Colors.white,
                 useRootNavigator: true,
                 shape: const RoundedRectangleBorder(
                     borderRadius: BorderRadius.all(Radius.circular(12))
                 ),
                 context: context, builder: (context)=>
             const MoreMenu(
               initialSize: 0.7,
               icon: Icons.info_outline,
               menuItemText: "Why you're seeing this post",
             ));
           }, icon: Icon(Icons.more_vert,color:color,))

        ],
      ),
    );
  }
}
